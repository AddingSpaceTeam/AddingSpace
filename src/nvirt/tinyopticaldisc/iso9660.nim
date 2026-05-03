# ECMA-119 spec is so bad...

import std/[streams, options, endians, strutils, tables, sets, hashes, unicode, sequtils]
import posixpaths

type
  PathAliasTable = Table[string, Table[string, int]]
  PrimaryPath = (string, string)

  Iso9660Reader* = object 
    logicalSectorSize: int
    logicalBlockSize: int
    volume: Volume
    volumeDescriptorSet: VolumeDescriptorSet
    rockRidgeAliases: Table[string, string]
    rockRidgeAliasesByDir: PathAliasTable
    rockRidgeSymlinks: Table[string, string]
    rockRidgeLinkKinds: Table[string, PathComponent]
    jolietAliases: Table[string, HashSet[string]]
    jolietAliasesByDir: PathAliasTable
  
  LogicalSector = distinct string # some seq of blocks

  VolumeDescriptorSet = object
    primary: Option[VolumeDescriptor] # one PrimaryVolumeDescriptor
    supplementary: seq[VolumeDescriptor] # zero or more SupplementaryVolumeDescriptor
    enchanced: seq[VolumeDescriptor] # zero or more EnchancedVolumeDescriptor
    partition: seq[VolumeDescriptor] # zero or more VolumePartitionDescriptor
    boot: seq[VolumeDescriptor] # zero or more BootRecord
    terminators: seq[VolumeDescriptor] # one or more 

  Volume = object
    systemArea: array[16, LogicalSector]
    dataArea: seq[LogicalSector]
  
  AChar = distinct char
  # TODO: implement char checking, but it will be future
  #[
  Table A.2 — a-characters

  SP (i.e. Space) ! " % & ' ( ) * + , - . /
  0 1 2 3 4 5 6 7 8 9
  : ; < = > ?
  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  _

  ]#

  DChar = distinct char
  #[
  Table A.1 — d-characters

  0 1 2 3 4 5 6 7 8 9
  A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  _

  = [0-9A-Z_]
  ]#

  VolumeDescriptorType {.size: 1.} = enum
    BootRecord = 0
    PrimaryVolumeDescriptor = 1
    SupplementaryVolumeDescriptor = 2
    VolumePartitionDescriptor = 3
    EnchancedVolumeDescriptor = 4
    VolumeDescriptorSetTerminator = 255

  VolumeFlag {.size: 1.} = enum
    NonStandardEscapeSequences
    ReservedVolumeFlag1
    ReservedVolumeFlag2
    ReservedVolumeFlag3
    ReservedVolumeFlag4
    ReservedVolumeFlag5
    ReservedVolumeFlag6
    ReservedVolumeFlag7
  
  FileFlag {.size: 1.} = enum
    Existence
    Directory
    AssociatedFile
    Record
    Protection
    ReservedFileFlag1
    ReservedFileFlag2
    MultiExtent

  RockRidgeNameFlag {.size: 1.} = enum
    NmContinue
    NmCurrent
    NmParent
    NmReserved

  RockRidgeSymlinkComponentFlag {.size: 1.} = enum
    SlContinue
    SlCurrent
    SlParent
    SlRoot
    SlVolumeRoot
    SlHost

  SystemUseEntry = object
    signature: array[2, char]
    version: byte
    source: string
    dataStart, dataEnd: int

  RockRidgeSymlinkComponent = object
    flags: set[RockRidgeSymlinkComponentFlag]
    source: string
    contentStart, contentEnd: int

  PathComponent* = enum
    pcFile
    pcLinkToFile
    pcDir
    pcLinkToDir
    pcRockRidgeAlias
    pcJolietAlias
  
  DirectoryRecord = object
    len: byte
    extendedAttributeRecordLen: byte
    extentLocation: uint64
    dataLen: uint64
    recordingDate: array[7, byte]
    fileFlags: set[FileFlag]
    fileUnitSize: byte
    interleaveGapSize: byte
    volumeSequenceNumber: uint32
    fileIdentifier: string # wtf: check for d-characters, d1-characters,
                           # separator 1, separator 2,
                           # (00) or (01) byte
    systemUse: string

  VolumeDescriptor = object
    # CD001
    version: byte
    systemIdentifier: array[32, AChar]
    case typ: VolumeDescriptorType
    of BootRecord:
      # bootSystemIdentifier: array[32, AChar]
      bootIdentifier: array[32, AChar]
      # bootSystemUse: seek to 2048
    of VolumeDescriptorSetTerminator: discard # seek to 2048, note that we don't care that it should be (00) bytes but it can be changed in future to be more strict
    of PrimaryVolumeDescriptor, SupplementaryVolumeDescriptor, EnchancedVolumeDescriptor:
      flags: set[VolumeFlag] # only for SupplementaryVolumeDescriptor, EnchancedVolumeDescriptor
      # skip byte
      # systemIdentifier: array[32, AChar]
      volumeIdentifier: array[32, DChar]
      # skip byte
      volumeSpaceSize: uint64
      # skip 32 bytes
      volumeSetSize: uint32
      volumeSequenceNumber: uint32
      logicalBlockSize: uint32
      pathTableSize: uint64
      # maybe merge it?
      mainLocLPathTable: uint32
      optLocLPathTable: uint32
      # maybe merge it?
      mainLocMPathTable: uint32
      optLocMPathTable: uint32
      directoryRecord: DirectoryRecord
      volumeSetIdentifier: array[128, DChar]
      publisherIdentifier: array[128, AChar]
      dataPreparerIdentifier: array[128, AChar]
      applicationIdentifier: array[128, AChar]
      # why is so hard? wtf is separator 1, separator 2, how code should capture it???? Maybe best way is make it via new type but it will in future
      # copyrightFileIdentifier: array[37, DChar, separator 1, separator 2]
      # abstractFileIdentifier: array[37, DChar, separator 1, separator 2]
      # bibliographicFileIdentifier: array[37, DChar, separator 1, separator 2]
      volumeCreationDate: array[17, byte]
      volumeModificationDate: array[17, byte]
      volumeExpirationDate: array[17, byte]
      volumeEffectiveDate: array[17, byte]
      fileStructureVersion: byte
      # skip byte, application use, reserve
      # i.e seek to 2048
    of VolumePartitionDescriptor:
      volumeDescriptorVersion: array[32, DChar]
      volumePartitionLocation: uint64
      volumePartitionSize: uint64
      # seek to 2048

    content: string

const
  currentDir = $char(0x00)
  parentDir = $char(0x01)

proc `$`(s: LogicalSector): string {.borrow.}

proc bitFloor[T: uint32 or uint64](x: T): T =
  if x == 0: return 0

  var x = x
  for i in [1, 2, 4, 8, 16]:
    x = x or (x shr i)

  if x is uint64:
    x = x or (x shr 32)

  x - (x shr 1)

proc init*(
  _: type Iso9660Reader,
  dataFieldSize: int = 0,
  logicalBlockSize: int = -1): Iso9660Reader =
  # dataFieldSize specific for storage, for .iso files it 2048,
  # for CD discs it can get it from datafield in physical sectors,
  # every sector 2352 bytes

  result = Iso9660Reader(
    logicalSectorSize: max(2048, int bitFloor(dataFieldSize.uint32)),
  )
  if logicalBlockSize > 0:
    assert logicalBlockSize <= result.logicalSectorSize
    result.logicalBlockSize = logicalBlockSize
  else:
    # ISO 9660, CD roms etc have same sizes
    result.logicalBlockSize = result.logicalSectorSize

proc readSector(reader: var Iso9660Reader, sector: var LogicalSector, s: Stream) =
  s.readStr(reader.logicalSectorSize, string sector)

proc `==`(a, b: DirectoryRecord): bool =
  a.extentLocation == b.extentLocation and
  a.dataLen == b.dataLen and
  a.volumeSequenceNumber == b.volumeSequenceNumber and
  a.fileFlags == b.fileFlags

proc hash(record: DirectoryRecord): Hash =
  var h: Hash = 0
  h = h !& hash(record.extentLocation)
  h = h !& hash(record.dataLen)
  h = h !& hash(record.volumeSequenceNumber)
  h = h !& hash(record.fileFlags)
  result = !$h

# Joliet decoder:

proc isJoliet(descriptor: VolumeDescriptor): bool =
  descriptor.content.len >= 91 and
  descriptor.content[88] == '%' and
  descriptor.content[89] == '/' and
  descriptor.content[90] in {'@', 'C', 'E'}

proc decodeJolietIdentifier(identifier: string): string =
  if identifier == currentDir or identifier == parentDir: return identifier # special paths

  result = ""
  for i in 0 ..< identifier.len div 2:
    let offset = i * 2
    result.add Rune(identifier[offset].ord shl 8 or identifier[offset + 1].ord)

# Rock ridge decoder:

iterator systemUseEntries(record: DirectoryRecord): SystemUseEntry =
  var i = 0
  while i + 4 <= record.systemUse.len:
    let entryLen = record.systemUse[i + 2].ord
    if entryLen < 4 or i + entryLen > record.systemUse.len: break

    yield SystemUseEntry(
      signature: [record.systemUse[i], record.systemUse[i + 1]],
      version: record.systemUse[i + 3].byte,
      source: record.systemUse,
      dataStart: i + 4,
      dataEnd: i + entryLen)

    inc i, entryLen

proc decodeRockRidgeIdentifier(record: DirectoryRecord): Option[string] =
  var name = ""

  for entry in record.systemUseEntries:
    let dataLen = entry.dataEnd - entry.dataStart
    if entry.signature != ['N', 'M'] or dataLen == 0:
      continue

    let flags = cast[set[RockRidgeNameFlag]](entry.source[entry.dataStart])
    if ({NmCurrent, NmParent, NmReserved} * flags).len == 0 and
        dataLen > 1:
      let oldLen = name.len
      name.setLen(oldLen + dataLen - 1)
      copyMem(
        addr name[oldLen],
        addr entry.source[entry.dataStart + 1],
        dataLen - 1)

  if name.len > 0: some(name)
  else: none(string)

iterator rockRidgeSymlinkComponents(entry: SystemUseEntry): RockRidgeSymlinkComponent =
  var i = entry.dataStart + 1
  while i + 2 <= entry.dataEnd:
    let next = i + 2 + entry.source[i + 1].ord
    if next > entry.dataEnd: break

    yield RockRidgeSymlinkComponent(
      flags: cast[set[RockRidgeSymlinkComponentFlag]](entry.source[i]),
      source: entry.source,
      contentStart: i + 2,
      contentEnd: next)

    i = next

proc decodeRockRidgeSymlinkTarget(record: DirectoryRecord): Option[string] =
  for entry in record.systemUseEntries:
    if entry.signature != ['S', 'L'] or entry.dataEnd == entry.dataStart:
      continue

    var
      target = ""
      pending = ""

    template flushPending() =
      if pending.len > 0:
        target = joinPosixPath(target, pending)
        pending.setLen(0)

    for component in entry.rockRidgeSymlinkComponents:
      if SlCurrent in component.flags:
        flushPending()
        target = joinPosixPath(target, ".")
      elif SlParent in component.flags:
        flushPending()
        target = joinPosixPath(target, "..")

      elif ({SlRoot, SlVolumeRoot} * component.flags).len > 0:
        pending.setLen(0)
        target = "/"
      elif SlHost in component.flags: discard
      else:
        let contentLen = component.contentEnd - component.contentStart
        if contentLen > 0:
          let oldLen = pending.len
          pending.setLen(oldLen + contentLen)
          copyMem(
            addr pending[oldLen],
            addr component.source[component.contentStart],
            contentLen)
        if SlContinue notin component.flags:
          flushPending()

    flushPending()
    return some(target)

  none(string)





proc parseDirectoryRecord(reader: var Iso9660Reader, stream: Stream, record: var DirectoryRecord): bool =
  result = true
  let start = stream.getPosition()
  var
    raw16: uint16 = 0
    raw32: uint32 = 0
    le16: uint16 = 0
    le32: uint32 = 0
  
  record.len = stream.readUint8()
  record.extendedAttributeRecordLen = stream.readUint8().byte
  
  raw32 = stream.readUint32()
  littleEndian32(addr le32, addr raw32)
  record.extentLocation = uint64(le32)
  stream.setPosition(stream.getPosition + 4) # skip big-endian copy
  
  raw32 = stream.readUint32()
  littleEndian32(addr le32, addr raw32)
  record.dataLen = uint64(le32)
  stream.setPosition(stream.getPosition + 4) # skip big-endian copy

  stream.read(record.recordingDate)
  record.fileFlags = cast[set[FileFlag]](stream.readUint8())
  record.fileUnitSize = stream.readUint8().byte
  record.interleaveGapSize = stream.readUint8().byte
  raw16 = stream.readUint16()
  littleEndian16(addr le16, addr raw16)
  record.volumeSequenceNumber = uint32(le16)
  stream.setPosition(stream.getPosition + 2) # skip big-endian copy

  let fileIdentifierLen = stream.readUint8().int
  record.fileIdentifier = stream.readStr(fileIdentifierLen)

  if fileIdentifierLen mod 2 == 0:
    stream.setPosition(stream.getPosition + 1)

  let systemUseLen = start + record.len.int - stream.getPosition()
  record.systemUse = 
    if systemUseLen > 0: stream.readStr(systemUseLen)
    else: ""

  stream.setPosition(start + record.len.int)

iterator directoryRecords(reader: var Iso9660Reader, s: Stream, dirRecord: DirectoryRecord): DirectoryRecord =
  let
    start = int64(dirRecord.extentLocation) * int64(reader.logicalBlockSize)
    finish = start + int64(dirRecord.dataLen)

  s.setPosition(start)

  while s.getPosition() < finish:
    let
      recordStart = s.getPosition()
      recordLen = s.readUint8()

    if recordLen == 0'u8:
      s.setPosition((recordStart div reader.logicalBlockSize + 1) * reader.logicalBlockSize)
      continue

    s.setPosition(recordStart)
    var record = DirectoryRecord()
    if not reader.parseDirectoryRecord(s, record): break

    yield record

proc isDirRockRidgeSymlink(
    targetPath: string,
    rockRidgePaths: Table[string, string],
    primaryKinds: Table[string, PathComponent],
    rockRidgeSymlinks: Table[string, string]): bool =
  result = false
  var
    stack = @[targetPath]
    seen = initHashSet[string]()

  while stack.len > 0:
    let path = joinPosixPath("/", stack.pop())
    if path notin rockRidgePaths: continue

    if rockRidgePaths[path] in seen: continue
    seen.incl rockRidgePaths[path]

    if
        rockRidgePaths[path] in primaryKinds and
        primaryKinds[rockRidgePaths[path]] == pcDir:

      return true

    if rockRidgePaths[path] in rockRidgeSymlinks:
      stack.add rockRidgeSymlinks[rockRidgePaths[path]]

proc scanPrimaryTree(
    reader: var Iso9660Reader,
    s: Stream,
    dirRecord: DirectoryRecord,
    isoDir, rrDir: string,
    primaryPaths: var Table[DirectoryRecord, seq[PrimaryPath]],
    primaryKinds: var Table[string, PathComponent],
    rockRidgePaths: var Table[string, string],
    rockRidgeAliases: var Table[string, string],
    rockRidgeAliasesByDir: var PathAliasTable,
    rockRidgeSymlinks: var Table[string, string]) =
  var stack = @[(dirRecord, isoDir, rrDir)]

  while stack.len > 0:
    let (dirRecord, isoDir, rrDir) = stack.pop()

    for record in reader.directoryRecords(s, dirRecord):
      if record.fileIdentifier == currentDir or record.fileIdentifier == parentDir:
        continue # special fileIdentifiers

      let isoPath = joinPosixPath(isoDir, record.fileIdentifier)

      primaryPaths.mgetOrPut(record, @[]).add (isoDir, isoPath)
      primaryKinds[isoPath] =
        if Directory in record.fileFlags: pcDir
        else: pcFile

      var rrName = record.decodeRockRidgeIdentifier()
      if rrName.isNone:
        rrName = some(record.fileIdentifier)

      let rrPath = joinPosixPath(rrDir, rrName.get)
      rockRidgePaths[rrPath] = isoPath

      if rrName.isSome and rrPath != isoPath:
        rockRidgeAliases[rrPath] = isoPath
        rockRidgeAliasesByDir.mgetOrPut(
          isoDir, initTable[string, int]())[rrPath] =
            rrPath.rfind('/') + 1

      let symlinkTarget = record.decodeRockRidgeSymlinkTarget()
      if symlinkTarget.isSome:
        rockRidgeSymlinks[isoPath] = resolvePosixPath(rrDir, symlinkTarget.get)

      if Directory in record.fileFlags:
        stack.add (record, isoPath, rrPath)

proc collectJolietAliases(
  reader: var Iso9660Reader,
  s: Stream,
  dirRecord: DirectoryRecord,
  jolietDir: string,
  primaryPaths: Table[DirectoryRecord, seq[PrimaryPath]],
  jolietAliases: var Table[string, HashSet[string]],
  jolietAliasesByDir: var PathAliasTable) =
  var stack = @[(dirRecord, jolietDir)]

  while stack.len > 0:
    let (dirRecord, jolietDir) = stack.pop()

    for record in reader.directoryRecords(s, dirRecord):
      if record.fileIdentifier == currentDir or record.fileIdentifier == parentDir:
        continue # special fileIdentifier

      let
        jolietName = record.fileIdentifier.decodeJolietIdentifier
        jolietPath = joinPosixPath(jolietDir, jolietName)

      if record in primaryPaths:
        for primaryPath in primaryPaths[record]:
          let (primaryDir, isoPath) = primaryPath
          jolietAliases.mgetOrPut(jolietPath, initHashSet[string]()).incl isoPath
          jolietAliasesByDir.mgetOrPut(primaryDir, initTable[string, int]())[jolietPath] =
              jolietPath.rfind('/') + 1

      if Directory in record.fileFlags:
        stack.add (record, jolietPath)

proc scanExtensions(reader: var Iso9660Reader, s: Stream) =
  var primaryPaths = initTable[DirectoryRecord, seq[PrimaryPath]]()
  var primaryKinds = initTable[string, PathComponent]()
  var rockRidgePaths = initTable[string, string]()

  reader.scanPrimaryTree(
    s, reader.volumeDescriptorSet.primary.get.directoryRecord,
    "/", "/",
    primaryPaths, primaryKinds,
    rockRidgePaths, reader.rockRidgeAliases,
    reader.rockRidgeAliasesByDir, reader.rockRidgeSymlinks)

  for isoPath, targetPath in reader.rockRidgeSymlinks:
    reader.rockRidgeLinkKinds[isoPath] =
      if isDirRockRidgeSymlink(
          targetPath, rockRidgePaths,
          primaryKinds, reader.rockRidgeSymlinks): pcLinkToDir
      else: pcLinkToFile

  for descriptor in reader.volumeDescriptorSet.supplementary:
    if descriptor.isJoliet:
      reader.collectJolietAliases(
        s, descriptor.directoryRecord, "/",
        primaryPaths, reader.jolietAliases, reader.jolietAliasesByDir)
      break

proc expandRockRidgeAlias*(reader: Iso9660Reader, path: string): Option[string] =
  let normalizedPath = joinPosixPath("/", path)
  if normalizedPath in reader.rockRidgeAliases:
    some(reader.rockRidgeAliases[normalizedPath])
  else: none(string)

proc expandJolietAlias*(reader: Iso9660Reader, path: string): seq[string] =
  let normalizedPath = joinPosixPath("/", path)
  if normalizedPath in reader.jolietAliases:
    reader.jolietAliases[normalizedPath].toSeq()
  else: @[]

proc expandSymlink*(reader: Iso9660Reader, symlinkPath: string): string =
  let normalizedPath = joinPosixPath("/", symlinkPath)
  if normalizedPath notin reader.rockRidgeSymlinks:
    raise newException(OSError, "No such symlink: " & symlinkPath)

  reader.rockRidgeSymlinks[normalizedPath]

proc pathComponentKind(
    reader: Iso9660Reader,
    isoPath: string,
    record: DirectoryRecord): PathComponent =

  if record.decodeRockRidgeSymlinkTarget.isSome:
    if isoPath in reader.rockRidgeLinkKinds:
      return reader.rockRidgeLinkKinds[isoPath]

    return pcLinkToFile

  if Directory in record.fileFlags: pcDir
  else: pcFile

iterator walkDir*(
    reader: var Iso9660Reader,
    s: Stream,
    dir: string,
    relative = false,
    checkDir = false,
    skipSpecial = false): tuple[kind: PathComponent, path: string] =
  # Highly co-authored with gpt 5.5
  var
    dirRecord = reader.volumeDescriptorSet.primary.get.directoryRecord
    dirPath = "/"
    componentIdx = 0
    start = int64(dirRecord.extentLocation) * int64(reader.logicalBlockSize)
    finish = start + int64(dirRecord.dataLen)

  let
    normalizedDir = joinPosixPath("/", dir).strip(chars = {'/'}) # should be normalized posix path after it...
    components =
      if normalizedDir.len == 0: newSeq[string]()
      else: normalizedDir.split('/')

  s.setPosition(start)

  while s.getPosition() < finish:
    let
      recordStart = s.getPosition()
      recordLen = s.readUint8()

    if recordLen == 0'u8:
      s.setPosition((recordStart div reader.logicalBlockSize + 1) * reader.logicalBlockSize)
      continue

    s.setPosition(recordStart)
    var record = DirectoryRecord()
    if not reader.parseDirectoryRecord(s, record): break

    if record.fileIdentifier == currentDir or record.fileIdentifier == parentDir: continue # special paths: 0x00, 0x01

    if componentIdx < components.len:
      # important: we not found target dir and need early continue untill target will reached

      if Directory in record.fileFlags and record.fileIdentifier == components[componentIdx]:
        # found dir!
        dirRecord = record
        dirPath = joinPosixPath(dirPath, components[componentIdx])
        inc componentIdx

        start = int64(dirRecord.extentLocation) * int64(reader.logicalBlockSize)
        finish = start + int64(dirRecord.dataLen)
        s.setPosition(start)

      continue

    if skipSpecial and ({AssociatedFile, Record, Protection, MultiExtent} * record.fileFlags).len > 0:
      continue

    let
      name = record.fileIdentifier
      isoPath = joinPosixPath(dirPath, name)
      kind = reader.pathComponentKind(isoPath, record)
      path =
        if relative: name
        else: isoPath

    yield (kind, path)

  if componentIdx < components.len and checkDir:
    raise newException(OSError, "No such directory: " & dir)

  if componentIdx >= components.len:
    if dirPath in reader.rockRidgeAliasesByDir:
      for aliasPath, nameStart in reader.rockRidgeAliasesByDir[dirPath]:
        yield (
          pcRockRidgeAlias,
          if relative: aliasPath[nameStart .. ^1] # allocation
          else: aliasPath)

    if dirPath in reader.jolietAliasesByDir:
      for aliasPath, nameStart in reader.jolietAliasesByDir[dirPath]:
        yield (
          pcJolietAlias,
          if relative: aliasPath[nameStart .. ^1]
          else: aliasPath)

iterator walkDirRec*(
    reader: var Iso9660Reader,
    s: Stream,
    dir: string,
    yieldFilter = {pcFile}, followFilter = {pcDir},
    relative = false, checkDir = false, skipSpecial = false): string =
  # I just make small fix to std impl of it but not tested it properly
  # but it should work correctly
  var stack = @[""]
  var checkDir = checkDir
  while stack.len > 0:
    let d = stack.pop()
    for k, p in walkDir(
        reader, s, joinPosixPath(dir, d), relative = true, checkDir = checkDir,
        skipSpecial = skipSpecial):

      let rel = joinPosixPath(d, p)
      if k == pcDir and k in followFilter:
        stack.add rel
      if k in yieldFilter:
        yield
          if relative: rel
          else: joinPosixPath(dir, rel)

    checkDir = false
      # We only check top-level dir, otherwise if a subdir is invalid (eg. wrong
      # permissions), it'll abort iteration and there would be no way to
      # continue iteration.
      # Future work can provide a way to customize this and do error reporting.

proc parseVolumeDescriptorSet(reader: var Iso9660Reader, s: LogicalSector): bool =
  result = false # need VolumeDescriptorSetTerminator to mark it as true (parsed)
  let data = string(s)
  if data.len < reader.logicalSectorSize: return

  var stream = newStringStream(data) # yes, it realy bad idea and we can skip
                                     # parsing LogicalSector into string,
                                     # we can just use seek ops and maybe mmap things but it for future
  # ai generated data type parser:
  let rawTyp = stream.readUint8()
  if stream.readStr(5) != "CD001": return
  let version = stream.readUint8()

  let typ =
    case rawTyp
    of 0'u8: BootRecord
    of 1'u8: PrimaryVolumeDescriptor
    of 2'u8:
      if version == 2: EnchancedVolumeDescriptor
      else: SupplementaryVolumeDescriptor
    of 3'u8: VolumePartitionDescriptor
    of 255'u8: VolumeDescriptorSetTerminator
    else: return

  var descriptor = VolumeDescriptor(
    typ: typ,
    version: byte(version),
    content: data)

  case typ
  of BootRecord:
    stream.read(descriptor.systemIdentifier)
    stream.read(descriptor.bootIdentifier)
    reader.volumeDescriptorSet.boot.add descriptor
  of VolumeDescriptorSetTerminator:
    reader.volumeDescriptorSet.terminators.add descriptor
    result = true
  of PrimaryVolumeDescriptor, SupplementaryVolumeDescriptor, EnchancedVolumeDescriptor:
    var flags = stream.readUint8()
    if typ != PrimaryVolumeDescriptor:
      descriptor.flags = cast[set[VolumeFlag]](flags)

    stream.read(descriptor.systemIdentifier)
    stream.read(descriptor.volumeIdentifier)
    stream.setPosition(80)

    var
      raw16: uint16 = 0
      raw32: uint32 = 0
      le16: uint16 = 0
      le32: uint32 = 0

    raw32 = stream.readUint32()
    littleEndian32(addr le32, addr raw32)
    descriptor.volumeSpaceSize = uint64(le32)
    stream.setPosition(120)

    raw16 = stream.readUint16()
    littleEndian16(addr le16, addr raw16)
    descriptor.volumeSetSize = uint32(le16)
    stream.setPosition(124)

    raw16 = stream.readUint16()
    littleEndian16(addr le16, addr raw16)
    descriptor.volumeSequenceNumber = uint32(le16)
    stream.setPosition(128)

    raw16 = stream.readUint16()
    littleEndian16(addr le16, addr raw16)
    descriptor.logicalBlockSize = uint32(le16)
    stream.setPosition(132)

    raw32 = stream.readUint32()
    littleEndian32(addr le32, addr raw32)
    descriptor.pathTableSize = uint64(le32)
    stream.setPosition(140)

    raw32 = stream.readUint32()
    littleEndian32(addr descriptor.mainLocLPathTable, addr raw32)
    raw32 = stream.readUint32()
    littleEndian32(addr descriptor.optLocLPathTable, addr raw32)
    raw32 = stream.readUint32()
    bigEndian32(addr descriptor.mainLocMPathTable, addr raw32)
    raw32 = stream.readUint32()
    bigEndian32(addr descriptor.optLocMPathTable, addr raw32)

    if not reader.parseDirectoryRecord(stream, descriptor.directoryRecord): return

    stream.read(descriptor.volumeSetIdentifier)
    stream.read(descriptor.publisherIdentifier)
    stream.read(descriptor.dataPreparerIdentifier)
    stream.read(descriptor.applicationIdentifier)
    stream.setPosition(813)
    stream.read(descriptor.volumeCreationDate)
    stream.read(descriptor.volumeModificationDate)
    stream.read(descriptor.volumeExpirationDate)
    stream.read(descriptor.volumeEffectiveDate)
    descriptor.fileStructureVersion = stream.readUint8().byte

    case typ
    of PrimaryVolumeDescriptor:
      reader.volumeDescriptorSet.primary = some descriptor
    of SupplementaryVolumeDescriptor:
      reader.volumeDescriptorSet.supplementary.add descriptor
    of EnchancedVolumeDescriptor:
      reader.volumeDescriptorSet.enchanced.add descriptor
    else: discard

  of VolumePartitionDescriptor:
    stream.setPosition(8)
    stream.read(descriptor.systemIdentifier)
    stream.read(descriptor.volumeDescriptorVersion)

    var
      raw32 = stream.readUint32()
      le32: uint32 = 0

    littleEndian32(addr le32, addr raw32)
    descriptor.volumePartitionLocation = uint64(le32)
    stream.setPosition(80)

    raw32 = stream.readUint32()
    littleEndian32(addr le32, addr raw32)
    descriptor.volumePartitionSize = uint64(le32)
    reader.volumeDescriptorSet.partition.add descriptor

proc read*(reader: var Iso9660Reader, s: Stream) =
  for i in 0..<reader.volume.systemArea.len:
    reader.readSector reader.volume.systemArea[i], s

  while not s.atEnd:
    var newSector = LogicalSector(newStringOfCap(reader.logicalSectorSize))
    reader.readSector newSector, s
    if reader.parseVolumeDescriptorSet(newSector): break

  reader.scanExtensions(s)

when isMainModule:
  var s = newFileStream("1mb.iso")
  var r = Iso9660Reader.init()
  r.read(s)

  for entry in r.walkDir(s, "/", relative = true):
    echo entry
