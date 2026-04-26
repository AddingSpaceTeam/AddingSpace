## Auto-generated QAPI bindings.
## Do not edit by hand

import std/[json, options, sequtils, tables]
import nvirt/qmp
export json, options, qmp

type
  QapiErrorClass* = enum
    GenericError = "GenericError"
    CommandNotFound = "CommandNotFound"
    DeviceNotActive = "DeviceNotActive"
    DeviceNotFound = "DeviceNotFound"
    KVMMissingCap = "KVMMissingCap"

  IoOperationType* = enum
    Read = "read"
    Write = "write"

  OnOffAuto* = enum
    Auto = "auto"
    On = "on"
    Off = "off"

  OnOffSplit* = enum
    On = "on"
    Off = "off"
    Split = "split"

  StrOrNullKind* = enum
    S = "s"
    N = "n"

  OffAutoPCIBAR* = enum
    Off = "off"
    Auto = "auto"
    Bar0 = "bar0"
    Bar1 = "bar1"
    Bar2 = "bar2"
    Bar3 = "bar3"
    Bar4 = "bar4"
    Bar5 = "bar5"

  PCIELinkSpeed* = enum
    V25 = "2_5"
    V5 = "5"
    V8 = "8"
    V16 = "16"
    V32 = "32"
    V64 = "64"

  PCIELinkWidth* = enum
    V1 = "1"
    V2 = "2"
    V4 = "4"
    V8 = "8"
    V12 = "12"
    V16 = "16"
    V32 = "32"

  HostMemPolicy* = enum
    Default = "default"
    Preferred = "preferred"
    Bind = "bind"
    Interleave = "interleave"

  NetFilterDirection* = enum
    All = "all"
    Rx = "rx"
    Tx = "tx"

  GrabToggleKeys* = enum
    CtrlCtrl = "ctrl-ctrl"
    AltAlt = "alt-alt"
    ShiftShift = "shift-shift"
    MetaMeta = "meta-meta"
    Scrolllock = "scrolllock"
    CtrlScrolllock = "ctrl-scrolllock"

  EndianMode* = enum
    Unspecified = "unspecified"
    Little = "little"
    Big = "big"

  NetworkAddressFamily* = enum
    Ipv4 = "ipv4"
    Ipv6 = "ipv6"
    Unix = "unix"
    Vsock = "vsock"
    Unknown = "unknown"


  SocketAddressType* = enum
    Inet = "inet"
    Unix = "unix"
    Vsock = "vsock"
    Fd = "fd"


  RunState* = enum
    Debug = "debug"
    Inmigrate = "inmigrate"
    InternalError = "internal-error"
    IoError = "io-error"
    Paused = "paused"
    Postmigrate = "postmigrate"
    Prelaunch = "prelaunch"
    FinishMigrate = "finish-migrate"
    RestoreVm = "restore-vm"
    Running = "running"
    SaveVm = "save-vm"
    Shutdown = "shutdown"
    Suspended = "suspended"
    Watchdog = "watchdog"
    GuestPanicked = "guest-panicked"
    Colo = "colo"

  ShutdownCause* = enum
    None = "none"
    HostError = "host-error"
    HostQmpQuit = "host-qmp-quit"
    HostQmpSystemReset = "host-qmp-system-reset"
    HostSignal = "host-signal"
    HostUi = "host-ui"
    GuestShutdown = "guest-shutdown"
    GuestReset = "guest-reset"
    GuestPanic = "guest-panic"
    SubsystemReset = "subsystem-reset"
    SnapshotLoad = "snapshot-load"

  WatchdogAction* = enum
    Reset = "reset"
    Shutdown = "shutdown"
    Poweroff = "poweroff"
    Pause = "pause"
    Debug = "debug"
    None = "none"
    InjectNmi = "inject-nmi"

  RebootAction* = enum
    Reset = "reset"
    Shutdown = "shutdown"

  ShutdownAction* = enum
    Poweroff = "poweroff"
    Pause = "pause"

  PanicAction* = enum
    Pause = "pause"
    Shutdown = "shutdown"
    ExitFailure = "exit-failure"
    None = "none"

  GuestPanicAction* = enum
    Pause = "pause"
    Poweroff = "poweroff"
    Run = "run"

  GuestPanicInformationType* = enum
    HyperV = "hyper-v"
    S390 = "s390"
    Tdx = "tdx"
    Sev = "sev"


  S390CrashReason* = enum
    Unknown = "unknown"
    DisabledWait = "disabled-wait"
    ExtintLoop = "extint-loop"
    PgmintLoop = "pgmint-loop"
    OpintLoop = "opint-loop"

  MemoryFailureRecipient* = enum
    Hypervisor = "hypervisor"
    Guest = "guest"

  MemoryFailureAction* = enum
    Ignore = "ignore"
    Inject = "inject"
    Fatal = "fatal"
    Reset = "reset"

  NotifyVmexitOption* = enum
    Run = "run"
    InternalError = "internal-error"
    Disable = "disable"

  QCryptoTLSCredsEndpoint* = enum
    Client = "client"
    Server = "server"

  QCryptoSecretFormat* = enum
    Raw = "raw"
    Base64 = "base64"

  QCryptoHashAlgo* = enum
    Md5 = "md5"
    Sha1 = "sha1"
    Sha224 = "sha224"
    Sha256 = "sha256"
    Sha384 = "sha384"
    Sha512 = "sha512"
    Ripemd160 = "ripemd160"
    Sm3 = "sm3"

  QCryptoCipherAlgo* = enum
    Aes128 = "aes-128"
    Aes192 = "aes-192"
    Aes256 = "aes-256"
    Des = "des"
    V3des = "3des"
    Cast5128 = "cast5-128"
    Serpent128 = "serpent-128"
    Serpent192 = "serpent-192"
    Serpent256 = "serpent-256"
    Twofish128 = "twofish-128"
    Twofish192 = "twofish-192"
    Twofish256 = "twofish-256"
    Sm4 = "sm4"

  QCryptoCipherMode* = enum
    Ecb = "ecb"
    Cbc = "cbc"
    Xts = "xts"
    Ctr = "ctr"

  QCryptoIVGenAlgo* = enum
    Plain = "plain"
    Plain64 = "plain64"
    Essiv = "essiv"

  QCryptoBlockFormat* = enum
    Qcow = "qcow"
    Luks = "luks"




  QCryptoBlockLUKSKeyslotState* = enum
    Active = "active"
    Inactive = "inactive"


  QCryptoAkCipherAlgo* = enum
    Rsa = "rsa"

  QCryptoAkCipherKeyType* = enum
    Public = "public"
    Private = "private"

  QCryptoRSAPaddingAlgo* = enum
    Raw = "raw"
    Pkcs1 = "pkcs1"


  JobType* = enum
    Commit = "commit"
    Stream = "stream"
    Mirror = "mirror"
    Backup = "backup"
    Create = "create"
    Amend = "amend"
    SnapshotLoad = "snapshot-load"
    SnapshotSave = "snapshot-save"
    SnapshotDelete = "snapshot-delete"

  JobStatus* = enum
    Undefined = "undefined"
    Created = "created"
    Running = "running"
    Paused = "paused"
    Ready = "ready"
    Standby = "standby"
    Waiting = "waiting"
    Pending = "pending"
    Aborting = "aborting"
    Concluded = "concluded"
    Null = "null"

  JobVerb* = enum
    Cancel = "cancel"
    Pause = "pause"
    Resume = "resume"
    SetSpeed = "set-speed"
    Complete = "complete"
    Dismiss = "dismiss"
    Finalize = "finalize"
    Change = "change"

  Accelerator* = enum
    Hvf = "hvf"
    Kvm = "kvm"
    Mshv = "mshv"
    Nvmm = "nvmm"
    Qtest = "qtest"
    Tcg = "tcg"
    Whpx = "whpx"
    Xen = "xen"


  ImageInfoSpecificKind* = enum
    Qcow2 = "qcow2"
    Vmdk = "vmdk"
    Luks = "luks"
    Rbd = "rbd"
    File = "file"


  BlockDeviceIoStatus* = enum
    Ok = "ok"
    Failed = "failed"
    Nospace = "nospace"

  Qcow2BitmapInfoFlags* = enum
    InUse = "in-use"
    Auto = "auto"


  BlockdevOnError* = enum
    Report = "report"
    Ignore = "ignore"
    Enospc = "enospc"
    Stop = "stop"
    Auto = "auto"

  MirrorSyncMode* = enum
    Top = "top"
    Full = "full"
    None = "none"
    Incremental = "incremental"
    Bitmap = "bitmap"

  BitmapSyncMode* = enum
    OnSuccess = "on-success"
    Never = "never"
    Always = "always"

  MirrorCopyMode* = enum
    Background = "background"
    WriteBlocking = "write-blocking"


  NewImageMode* = enum
    Existing = "existing"
    AbsolutePaths = "absolute-paths"

  XDbgBlockGraphNodeType* = enum
    BlockBackend = "block-backend"
    BlockJob = "block-job"
    BlockDriver = "block-driver"

  BlockPermission* = enum
    ConsistentRead = "consistent-read"
    Write = "write"
    WriteUnchanged = "write-unchanged"
    Resize = "resize"

  BlockDirtyBitmapOrStrKind* = enum
    Local = "local"
    External = "external"


  BlockdevDiscardOptions* = enum
    Ignore = "ignore"
    Unmap = "unmap"

  BlockdevDetectZeroesOptions* = enum
    Off = "off"
    On = "on"
    Unmap = "unmap"

  BlockdevAioOptions* = enum
    Threads = "threads"
    Native = "native"
    IoUring = "io_uring"

  BlockdevDriver* = enum
    Blkdebug = "blkdebug"
    Blklogwrites = "blklogwrites"
    Blkreplay = "blkreplay"
    Blkverify = "blkverify"
    Bochs = "bochs"
    Cloop = "cloop"
    Compress = "compress"
    CopyBeforeWrite = "copy-before-write"
    CopyOnRead = "copy-on-read"
    Dmg = "dmg"
    File = "file"
    SnapshotAccess = "snapshot-access"
    Ftp = "ftp"
    Ftps = "ftps"
    Gluster = "gluster"
    HostCdrom = "host_cdrom"
    HostDevice = "host_device"
    Http = "http"
    Https = "https"
    IoUring = "io_uring"
    Iscsi = "iscsi"
    Luks = "luks"
    Nbd = "nbd"
    Nfs = "nfs"
    NullAio = "null-aio"
    NullCo = "null-co"
    Nvme = "nvme"
    NvmeIoUring = "nvme-io_uring"
    Parallels = "parallels"
    Preallocate = "preallocate"
    Qcow = "qcow"
    Qcow2 = "qcow2"
    Qed = "qed"
    Quorum = "quorum"
    Raw = "raw"
    Rbd = "rbd"
    Replication = "replication"
    Ssh = "ssh"
    Throttle = "throttle"
    Vdi = "vdi"
    Vhdx = "vhdx"
    VirtioBlkVfioPci = "virtio-blk-vfio-pci"
    VirtioBlkVhostUser = "virtio-blk-vhost-user"
    VirtioBlkVhostVdpa = "virtio-blk-vhost-vdpa"
    Vmdk = "vmdk"
    Vpc = "vpc"
    Vvfat = "vvfat"

  Qcow2OverlapCheckMode* = enum
    None = "none"
    Constant = "constant"
    Cached = "cached"
    All = "all"

  Qcow2OverlapChecksKind* = enum
    Flags = "flags"
    Mode = "mode"

  BlockdevQcowEncryptionFormat* = enum
    Aes = "aes"


  BlockdevQcow2EncryptionFormat* = enum
    Aes = "aes"
    Luks = "luks"


  SshHostKeyCheckMode* = enum
    None = "none"
    Hash = "hash"
    KnownHosts = "known_hosts"

  SshHostKeyCheckHashType* = enum
    Md5 = "md5"
    Sha1 = "sha1"
    Sha256 = "sha256"


  BlkdebugEvent* = enum
    L1Update = "l1_update"
    L1GrowAllocTable = "l1_grow_alloc_table"
    L1GrowWriteTable = "l1_grow_write_table"
    L1GrowActivateTable = "l1_grow_activate_table"
    L2Load = "l2_load"
    L2Update = "l2_update"
    L2UpdateCompressed = "l2_update_compressed"
    L2AllocCowRead = "l2_alloc_cow_read"
    L2AllocWrite = "l2_alloc_write"
    ReadAio = "read_aio"
    ReadBackingAio = "read_backing_aio"
    ReadCompressed = "read_compressed"
    WriteAio = "write_aio"
    WriteCompressed = "write_compressed"
    VmstateLoad = "vmstate_load"
    VmstateSave = "vmstate_save"
    CowRead = "cow_read"
    CowWrite = "cow_write"
    ReftableLoad = "reftable_load"
    ReftableGrow = "reftable_grow"
    ReftableUpdate = "reftable_update"
    RefblockLoad = "refblock_load"
    RefblockUpdate = "refblock_update"
    RefblockUpdatePart = "refblock_update_part"
    RefblockAlloc = "refblock_alloc"
    RefblockAllocHookup = "refblock_alloc_hookup"
    RefblockAllocWrite = "refblock_alloc_write"
    RefblockAllocWriteBlocks = "refblock_alloc_write_blocks"
    RefblockAllocWriteTable = "refblock_alloc_write_table"
    RefblockAllocSwitchTable = "refblock_alloc_switch_table"
    ClusterAlloc = "cluster_alloc"
    ClusterAllocBytes = "cluster_alloc_bytes"
    ClusterFree = "cluster_free"
    FlushToOs = "flush_to_os"
    FlushToDisk = "flush_to_disk"
    PwritevRmwHead = "pwritev_rmw_head"
    PwritevRmwAfterHead = "pwritev_rmw_after_head"
    PwritevRmwTail = "pwritev_rmw_tail"
    PwritevRmwAfterTail = "pwritev_rmw_after_tail"
    Pwritev = "pwritev"
    PwritevZero = "pwritev_zero"
    PwritevDone = "pwritev_done"
    EmptyImagePrepare = "empty_image_prepare"
    L1ShrinkWriteTable = "l1_shrink_write_table"
    L1ShrinkFreeL2Clusters = "l1_shrink_free_l2_clusters"
    CorWrite = "cor_write"
    ClusterAllocSpace = "cluster_alloc_space"
    None = "none"

  BlkdebugIOType* = enum
    Read = "read"
    Write = "write"
    WriteZeroes = "write-zeroes"
    Discard = "discard"
    Flush = "flush"
    BlockStatus = "block-status"

  QuorumReadPattern* = enum
    Quorum = "quorum"
    Fifo = "fifo"

  IscsiTransport* = enum
    Tcp = "tcp"
    Iser = "iser"

  IscsiHeaderDigest* = enum
    Crc32c = "crc32c"
    None = "none"
    Crc32cNone = "crc32c-none"
    NoneCrc32c = "none-crc32c"

  RbdAuthMode* = enum
    Cephx = "cephx"
    None = "none"

  RbdImageEncryptionFormat* = enum
    Luks = "luks"
    Luks2 = "luks2"
    LuksAny = "luks-any"



  ReplicationMode* = enum
    Primary = "primary"
    Secondary = "secondary"

  NFSTransport* = enum
    Inet = "inet"

  OnCbwError* = enum
    BreakGuestWrite = "break-guest-write"
    BreakSnapshot = "break-snapshot"


  BlockdevRefKind* = enum
    Definition = "definition"
    Reference = "reference"

  BlockdevRefOrNullKind* = enum
    Definition = "definition"
    Reference = "reference"
    Null = "null"

  BlockdevQcow2Version* = enum
    V2 = "v2"
    V3 = "v3"

  Qcow2CompressionType* = enum
    Zlib = "zlib"
    Zstd = "zstd"

  BlockdevVmdkSubformat* = enum
    MonolithicSparse = "monolithicSparse"
    MonolithicFlat = "monolithicFlat"
    TwoGbMaxExtentSparse = "twoGbMaxExtentSparse"
    TwoGbMaxExtentFlat = "twoGbMaxExtentFlat"
    StreamOptimized = "streamOptimized"

  BlockdevVmdkAdapterType* = enum
    Ide = "ide"
    Buslogic = "buslogic"
    Lsilogic = "lsilogic"
    LegacyESX = "legacyESX"

  BlockdevVhdxSubformat* = enum
    Dynamic = "dynamic"
    Fixed = "fixed"

  BlockdevVpcSubformat* = enum
    Dynamic = "dynamic"
    Fixed = "fixed"



  BlockErrorAction* = enum
    Ignore = "ignore"
    Report = "report"
    Stop = "stop"

  PreallocMode* = enum
    Off = "off"
    Metadata = "metadata"
    Falloc = "falloc"
    Full = "full"

  QuorumOpType* = enum
    Read = "read"
    Write = "write"
    Flush = "flush"

  BiosAtaTranslation* = enum
    Auto = "auto"
    None = "none"
    Lba = "lba"
    Large = "large"
    Rechs = "rechs"

  FloppyDriveType* = enum
    V144 = "144"
    V288 = "288"
    V120 = "120"
    None = "none"
    Auto = "auto"

  BlockdevChangeReadOnlyMode* = enum
    Retain = "retain"
    ReadOnly = "read-only"
    ReadWrite = "read-write"

  FuseExportAllowOther* = enum
    Off = "off"
    On = "on"
    Auto = "auto"

  BlockExportRemoveMode* = enum
    Safe = "safe"
    Hard = "hard"

  BlockExportType* = enum
    Nbd = "nbd"
    VhostUserBlk = "vhost-user-blk"
    Fuse = "fuse"
    VduseBlk = "vduse-blk"


  BlockExportIothreadsKind* = enum
    Single = "single"
    Multi = "multi"

  DataFormat* = enum
    Utf8 = "utf8"
    Base64 = "base64"

  ChardevBackendKind* = enum
    File = "file"
    Serial = "serial"
    Parallel = "parallel"
    Pipe = "pipe"
    Socket = "socket"
    Udp = "udp"
    Pty = "pty"
    Null = "null"
    Mux = "mux"
    Hub = "hub"
    Msmouse = "msmouse"
    Wctablet = "wctablet"
    Braille = "braille"
    Testdev = "testdev"
    Stdio = "stdio"
    Console = "console"
    Spicevmc = "spicevmc"
    Spiceport = "spiceport"
    QemuVdagent = "qemu-vdagent"
    Dbus = "dbus"
    Vc = "vc"
    Ringbuf = "ringbuf"
    Memory = "memory"


  DumpGuestMemoryFormat* = enum
    Elf = "elf"
    KdumpZlib = "kdump-zlib"
    KdumpLzo = "kdump-lzo"
    KdumpSnappy = "kdump-snappy"
    KdumpRawZlib = "kdump-raw-zlib"
    KdumpRawLzo = "kdump-raw-lzo"
    KdumpRawSnappy = "kdump-raw-snappy"
    WinDmp = "win-dmp"

  DumpStatus* = enum
    None = "none"
    Active = "active"
    Completed = "completed"
    Failed = "failed"

  AFXDPMode* = enum
    Native = "native"
    Skb = "skb"

  NetClientDriver* = enum
    None = "none"
    Nic = "nic"
    User = "user"
    Tap = "tap"
    L2tpv3 = "l2tpv3"
    Socket = "socket"
    Stream = "stream"
    Dgram = "dgram"
    Vde = "vde"
    Bridge = "bridge"
    Hubport = "hubport"
    Netmap = "netmap"
    VhostUser = "vhost-user"
    VhostVdpa = "vhost-vdpa"
    Passt = "passt"
    AfXdp = "af-xdp"
    VmnetHost = "vmnet-host"
    VmnetShared = "vmnet-shared"
    VmnetBridged = "vmnet-bridged"


  RxState* = enum
    Normal = "normal"
    None = "none"
    All = "all"

  EbpfProgramID* = enum
    Rss = "rss"

  RockerPortDuplex* = enum
    Half = "half"
    Full = "full"

  RockerPortAutoneg* = enum
    Off = "off"
    On = "on"

  TpmModel* = enum
    TpmTis = "tpm-tis"
    TpmCrb = "tpm-crb"
    TpmSpapr = "tpm-spapr"

  TpmType* = enum
    Passthrough = "passthrough"
    Emulator = "emulator"


  DisplayProtocol* = enum
    Vnc = "vnc"
    Spice = "spice"

  SetPasswordAction* = enum
    Keep = "keep"
    Fail = "fail"
    Disconnect = "disconnect"



  ImageFormat* = enum
    Ppm = "ppm"
    Png = "png"

  SpiceQueryMouseMode* = enum
    Client = "client"
    Server = "server"
    Unknown = "unknown"

  VncPrimaryAuth* = enum
    None = "none"
    Vnc = "vnc"
    Ra2 = "ra2"
    Ra2ne = "ra2ne"
    Tight = "tight"
    Ultra = "ultra"
    Tls = "tls"
    Vencrypt = "vencrypt"
    Sasl = "sasl"

  VncVencryptSubAuth* = enum
    Plain = "plain"
    TlsNone = "tls-none"
    X509None = "x509-none"
    TlsVnc = "tls-vnc"
    X509Vnc = "x509-vnc"
    TlsPlain = "tls-plain"
    X509Plain = "x509-plain"
    TlsSasl = "tls-sasl"
    X509Sasl = "x509-sasl"

  QKeyCode* = enum
    Unmapped = "unmapped"
    Shift = "shift"
    ShiftR = "shift_r"
    Alt = "alt"
    AltR = "alt_r"
    Ctrl = "ctrl"
    CtrlR = "ctrl_r"
    Menu = "menu"
    Esc = "esc"
    V1 = "1"
    V2 = "2"
    V3 = "3"
    V4 = "4"
    V5 = "5"
    V6 = "6"
    V7 = "7"
    V8 = "8"
    V9 = "9"
    V0 = "0"
    Minus = "minus"
    Equal = "equal"
    Backspace = "backspace"
    Tab = "tab"
    Q = "q"
    W = "w"
    E = "e"
    R = "r"
    T = "t"
    Y = "y"
    U = "u"
    I = "i"
    O = "o"
    P = "p"
    BracketLeft = "bracket_left"
    BracketRight = "bracket_right"
    Ret = "ret"
    A = "a"
    S = "s"
    D = "d"
    F = "f"
    G = "g"
    H = "h"
    J = "j"
    K = "k"
    L = "l"
    Semicolon = "semicolon"
    Apostrophe = "apostrophe"
    GraveAccent = "grave_accent"
    Backslash = "backslash"
    Z = "z"
    X = "x"
    C = "c"
    V = "v"
    B = "b"
    N = "n"
    M = "m"
    Comma = "comma"
    Dot = "dot"
    Slash = "slash"
    Asterisk = "asterisk"
    Spc = "spc"
    CapsLock = "caps_lock"
    F1 = "f1"
    F2 = "f2"
    F3 = "f3"
    F4 = "f4"
    F5 = "f5"
    F6 = "f6"
    F7 = "f7"
    F8 = "f8"
    F9 = "f9"
    F10 = "f10"
    NumLock = "num_lock"
    ScrollLock = "scroll_lock"
    KpDivide = "kp_divide"
    KpMultiply = "kp_multiply"
    KpSubtract = "kp_subtract"
    KpAdd = "kp_add"
    KpEnter = "kp_enter"
    KpDecimal = "kp_decimal"
    Sysrq = "sysrq"
    Kp0 = "kp_0"
    Kp1 = "kp_1"
    Kp2 = "kp_2"
    Kp3 = "kp_3"
    Kp4 = "kp_4"
    Kp5 = "kp_5"
    Kp6 = "kp_6"
    Kp7 = "kp_7"
    Kp8 = "kp_8"
    Kp9 = "kp_9"
    Less = "less"
    F11 = "f11"
    F12 = "f12"
    Print = "print"
    Home = "home"
    Pgup = "pgup"
    Pgdn = "pgdn"
    End = "end"
    Left = "left"
    Up = "up"
    Down = "down"
    Right = "right"
    Insert = "insert"
    Delete = "delete"
    Stop = "stop"
    Again = "again"
    Props = "props"
    Undo = "undo"
    Front = "front"
    Copy = "copy"
    Open = "open"
    Paste = "paste"
    Find = "find"
    Cut = "cut"
    Lf = "lf"
    Help = "help"
    MetaL = "meta_l"
    MetaR = "meta_r"
    Compose = "compose"
    Pause = "pause"
    Ro = "ro"
    Hiragana = "hiragana"
    Henkan = "henkan"
    Yen = "yen"
    Muhenkan = "muhenkan"
    Katakanahiragana = "katakanahiragana"
    KpComma = "kp_comma"
    KpEquals = "kp_equals"
    Power = "power"
    Sleep = "sleep"
    Wake = "wake"
    Audionext = "audionext"
    Audioprev = "audioprev"
    Audiostop = "audiostop"
    Audioplay = "audioplay"
    Audiomute = "audiomute"
    Volumeup = "volumeup"
    Volumedown = "volumedown"
    Mediaselect = "mediaselect"
    Mail = "mail"
    Calculator = "calculator"
    Computer = "computer"
    AcHome = "ac_home"
    AcBack = "ac_back"
    AcForward = "ac_forward"
    AcRefresh = "ac_refresh"
    AcBookmarks = "ac_bookmarks"
    Lang1 = "lang1"
    Lang2 = "lang2"
    F13 = "f13"
    F14 = "f14"
    F15 = "f15"
    F16 = "f16"
    F17 = "f17"
    F18 = "f18"
    F19 = "f19"
    F20 = "f20"
    F21 = "f21"
    F22 = "f22"
    F23 = "f23"
    F24 = "f24"

  KeyValueKind* = enum
    Number = "number"
    Qcode = "qcode"


  InputButton* = enum
    Left = "left"
    Middle = "middle"
    Right = "right"
    WheelUp = "wheel-up"
    WheelDown = "wheel-down"
    Side = "side"
    Extra = "extra"
    WheelLeft = "wheel-left"
    WheelRight = "wheel-right"
    Touch = "touch"

  InputAxis* = enum
    X = "x"
    Y = "y"

  InputMultiTouchType* = enum
    Begin = "begin"
    Update = "update"
    End = "end"
    Cancel = "cancel"
    Data = "data"

  InputEventKind* = enum
    Key = "key"
    Btn = "btn"
    Rel = "rel"
    Abs = "abs"
    Mtt = "mtt"


  DisplayGLMode* = enum
    Off = "off"
    On = "on"
    Core = "core"
    Es = "es"

  HotKeyMod* = enum
    LctrlLalt = "lctrl-lalt"
    LshiftLctrlLalt = "lshift-lctrl-lalt"
    Rctrl = "rctrl"

  DisplayType* = enum
    Default = "default"
    None = "none"
    Gtk = "gtk"
    Sdl = "sdl"
    EglHeadless = "egl-headless"
    Curses = "curses"
    Cocoa = "cocoa"
    SpiceApp = "spice-app"
    Dbus = "dbus"


  DisplayReloadType* = enum
    Vnc = "vnc"


  DisplayUpdateType* = enum
    Vnc = "vnc"


  QAuthZListPolicy* = enum
    Deny = "deny"
    Allow = "allow"

  QAuthZListFormat* = enum
    Exact = "exact"
    Glob = "glob"

  MigrationStatus* = enum
    None = "none"
    Setup = "setup"
    Cancelling = "cancelling"
    Cancelled = "cancelled"
    Active = "active"
    PostcopyDevice = "postcopy-device"
    PostcopyActive = "postcopy-active"
    PostcopyPaused = "postcopy-paused"
    PostcopyRecoverSetup = "postcopy-recover-setup"
    PostcopyRecover = "postcopy-recover"
    Completed = "completed"
    Failing = "failing"
    Failed = "failed"
    Colo = "colo"
    PreSwitchover = "pre-switchover"
    Device = "device"
    WaitUnplug = "wait-unplug"

  MigrationCapability* = enum
    Xbzrle = "xbzrle"
    RdmaPinAll = "rdma-pin-all"
    AutoConverge = "auto-converge"
    Events = "events"
    PostcopyRam = "postcopy-ram"
    XColo = "x-colo"
    ReleaseRam = "release-ram"
    ReturnPath = "return-path"
    PauseBeforeSwitchover = "pause-before-switchover"
    Multifd = "multifd"
    DirtyBitmaps = "dirty-bitmaps"
    PostcopyBlocktime = "postcopy-blocktime"
    LateBlockActivate = "late-block-activate"
    XIgnoreShared = "x-ignore-shared"
    ValidateUuid = "validate-uuid"
    BackgroundSnapshot = "background-snapshot"
    ZeroCopySend = "zero-copy-send"
    PostcopyPreempt = "postcopy-preempt"
    SwitchoverAck = "switchover-ack"
    DirtyLimit = "dirty-limit"
    MappedRam = "mapped-ram"

  MultiFDCompression* = enum
    None = "none"
    Zlib = "zlib"
    Zstd = "zstd"
    Qatzip = "qatzip"
    Qpl = "qpl"
    Uadk = "uadk"

  MigMode* = enum
    Normal = "normal"
    CprReboot = "cpr-reboot"
    CprTransfer = "cpr-transfer"
    CprExec = "cpr-exec"

  ZeroPageDetection* = enum
    None = "none"
    Legacy = "legacy"
    Multifd = "multifd"

  MigrationParameter* {.pure.} = enum
    AnnounceInitial = "announce-initial"
    AnnounceMax = "announce-max"
    AnnounceRounds = "announce-rounds"
    AnnounceStep = "announce-step"
    ThrottleTriggerThreshold = "throttle-trigger-threshold"
    CpuThrottleInitial = "cpu-throttle-initial"
    CpuThrottleIncrement = "cpu-throttle-increment"
    CpuThrottleTailslow = "cpu-throttle-tailslow"
    TlsCreds = "tls-creds"
    TlsHostname = "tls-hostname"
    TlsAuthz = "tls-authz"
    MaxBandwidth = "max-bandwidth"
    AvailSwitchoverBandwidth = "avail-switchover-bandwidth"
    DowntimeLimit = "downtime-limit"
    XCheckpointDelay = "x-checkpoint-delay"
    MultifdChannels = "multifd-channels"
    XbzrleCacheSize = "xbzrle-cache-size"
    MaxPostcopyBandwidth = "max-postcopy-bandwidth"
    MaxCpuThrottle = "max-cpu-throttle"
    MultifdCompression = "multifd-compression"
    MultifdZlibLevel = "multifd-zlib-level"
    MultifdZstdLevel = "multifd-zstd-level"
    MultifdQatzipLevel = "multifd-qatzip-level"
    BlockBitmapMapping = "block-bitmap-mapping"
    XVcpuDirtyLimitPeriod = "x-vcpu-dirty-limit-period"
    VcpuDirtyLimit = "vcpu-dirty-limit"
    Mode = "mode"
    ZeroPageDetection = "zero-page-detection"
    DirectIo = "direct-io"
    CprExecCommand = "cpr-exec-command"

  COLOMessage* = enum
    CheckpointReady = "checkpoint-ready"
    CheckpointRequest = "checkpoint-request"
    CheckpointReply = "checkpoint-reply"
    VmstateSend = "vmstate-send"
    VmstateSize = "vmstate-size"
    VmstateReceived = "vmstate-received"
    VmstateLoaded = "vmstate-loaded"

  COLOMode* = enum
    None = "none"
    Primary = "primary"
    Secondary = "secondary"

  FailoverStatus* = enum
    None = "none"
    Require = "require"
    Active = "active"
    Completed = "completed"
    Relaunch = "relaunch"

  COLOExitReason* = enum
    None = "none"
    Request = "request"
    Error = "error"
    Processing = "processing"

  MigrationAddressType* = enum
    Socket = "socket"
    Exec = "exec"
    Rdma = "rdma"
    File = "file"


  MigrationChannelType* = enum
    Main = "main"
    Cpr = "cpr"

  DirtyRateStatus* = enum
    Unstarted = "unstarted"
    Measuring = "measuring"
    Measured = "measured"

  DirtyRateMeasureMode* = enum
    PageSampling = "page-sampling"
    DirtyRing = "dirty-ring"
    DirtyBitmap = "dirty-bitmap"

  TimeUnit* = enum
    Second = "second"
    Millisecond = "millisecond"

  ActionCompletionMode* = enum
    Individual = "individual"
    Grouped = "grouped"

  TransactionActionKind* {.pure.} = enum
    Abort = "abort"
    BlockDirtyBitmapAdd = "block-dirty-bitmap-add"
    BlockDirtyBitmapRemove = "block-dirty-bitmap-remove"
    BlockDirtyBitmapClear = "block-dirty-bitmap-clear"
    BlockDirtyBitmapEnable = "block-dirty-bitmap-enable"
    BlockDirtyBitmapDisable = "block-dirty-bitmap-disable"
    BlockDirtyBitmapMerge = "block-dirty-bitmap-merge"
    BlockdevBackup = "blockdev-backup"
    BlockdevSnapshot = "blockdev-snapshot"
    BlockdevSnapshotInternalSync = "blockdev-snapshot-internal-sync"
    BlockdevSnapshotSync = "blockdev-snapshot-sync"
    DriveBackup = "drive-backup"


  TraceEventState* = enum
    Unavailable = "unavailable"
    Disabled = "disabled"
    Enabled = "enabled"

  CompatPolicyInput* = enum
    Accept = "accept"
    Reject = "reject"
    Crash = "crash"

  CompatPolicyOutput* = enum
    Accept = "accept"
    Hide = "hide"

  QMPCapability* = enum
    Oob = "oob"

  MonitorMode* = enum
    Readline = "readline"
    Control = "control"

  SchemaMetaType* = enum
    Builtin = "builtin"
    Enum = "enum"
    Array = "array"
    Object = "object"
    Alternate = "alternate"
    Command = "command"
    Event = "event"


  JSONType* {.pure.} = enum
    String = "string"
    Number = "number"
    Int = "int"
    Boolean = "boolean"
    Null = "null"
    Object = "object"
    Array = "array"
    Value = "value"

  NetfilterInsert* = enum
    Before = "before"
    Behind = "behind"

  ObjectType* = enum
    AcpiGenericInitiator = "acpi-generic-initiator"
    AcpiGenericPort = "acpi-generic-port"
    AuthzList = "authz-list"
    AuthzListfile = "authz-listfile"
    AuthzPam = "authz-pam"
    AuthzSimple = "authz-simple"
    CanBus = "can-bus"
    CanHostSocketcan = "can-host-socketcan"
    ColoCompare = "colo-compare"
    CryptodevBackend = "cryptodev-backend"
    CryptodevBackendBuiltin = "cryptodev-backend-builtin"
    CryptodevBackendLkcf = "cryptodev-backend-lkcf"
    CryptodevVhostUser = "cryptodev-vhost-user"
    DbusVmstate = "dbus-vmstate"
    FilterBuffer = "filter-buffer"
    FilterDump = "filter-dump"
    FilterMirror = "filter-mirror"
    FilterRedirector = "filter-redirector"
    FilterReplay = "filter-replay"
    FilterRewriter = "filter-rewriter"
    IgvmCfg = "igvm-cfg"
    InputBarrier = "input-barrier"
    InputLinux = "input-linux"
    Iommufd = "iommufd"
    Iothread = "iothread"
    MainLoop = "main-loop"
    MemoryBackendEpc = "memory-backend-epc"
    MemoryBackendFile = "memory-backend-file"
    MemoryBackendMemfd = "memory-backend-memfd"
    MemoryBackendRam = "memory-backend-ram"
    MemoryBackendShm = "memory-backend-shm"
    PefGuest = "pef-guest"
    PrManagerHelper = "pr-manager-helper"
    Qtest = "qtest"
    RngBuiltin = "rng-builtin"
    RngEgd = "rng-egd"
    RngRandom = "rng-random"
    Secret = "secret"
    SecretKeyring = "secret_keyring"
    SevGuest = "sev-guest"
    SevSnpGuest = "sev-snp-guest"
    ThreadContext = "thread-context"
    S390PvGuest = "s390-pv-guest"
    TdxGuest = "tdx-guest"
    ThrottleGroup = "throttle-group"
    TlsCredsAnon = "tls-creds-anon"
    TlsCredsPsk = "tls-creds-psk"
    TlsCredsX509 = "tls-creds-x509"
    TlsCipherSuites = "tls-cipher-suites"
    XRemoteObject = "x-remote-object"
    XVfioUserServer = "x-vfio-user-server"


  S390CpuEntitlement* = enum
    Auto = "auto"
    Low = "low"
    Medium = "medium"
    High = "high"

  CpuTopologyLevel* = enum
    Thread = "thread"
    Core = "core"
    Module = "module"
    Cluster = "cluster"
    Die = "die"
    Socket = "socket"
    Book = "book"
    Drawer = "drawer"
    Default = "default"

  CacheLevelAndType* = enum
    L1d = "l1d"
    L1i = "l1i"
    L2 = "l2"
    L3 = "l3"

  SysEmuTarget* = enum
    Aarch64 = "aarch64"
    Alpha = "alpha"
    Arm = "arm"
    Avr = "avr"
    Hexagon = "hexagon"
    Hppa = "hppa"
    I386 = "i386"
    Loongarch64 = "loongarch64"
    M68k = "m68k"
    Microblaze = "microblaze"
    Mips = "mips"
    Mips64 = "mips64"
    Mips64el = "mips64el"
    Mipsel = "mipsel"
    Or1k = "or1k"
    Ppc = "ppc"
    Ppc64 = "ppc64"
    Riscv32 = "riscv32"
    Riscv64 = "riscv64"
    Rx = "rx"
    S390x = "s390x"
    Sh4 = "sh4"
    Sh4eb = "sh4eb"
    Sparc = "sparc"
    Sparc64 = "sparc64"
    Tricore = "tricore"
    X8664 = "x86_64"
    Xtensa = "xtensa"
    Xtensaeb = "xtensaeb"

  S390CpuState* = enum
    Uninitialized = "uninitialized"
    Stopped = "stopped"
    CheckStop = "check-stop"
    Operating = "operating"
    Load = "load"


  LostTickPolicy* = enum
    Discard = "discard"
    Delay = "delay"
    Slew = "slew"

  NumaOptionsType* = enum
    Node = "node"
    Dist = "dist"
    Cpu = "cpu"
    HmatLb = "hmat-lb"
    HmatCache = "hmat-cache"


  X86CPURegister32* = enum
    EAX = "EAX"
    EBX = "EBX"
    ECX = "ECX"
    EDX = "EDX"
    ESP = "ESP"
    EBP = "EBP"
    ESI = "ESI"
    EDI = "EDI"

  HmatLBMemoryHierarchy* = enum
    Memory = "memory"
    FirstLevel = "first-level"
    SecondLevel = "second-level"
    ThirdLevel = "third-level"

  HmatLBDataType* = enum
    AccessLatency = "access-latency"
    ReadLatency = "read-latency"
    WriteLatency = "write-latency"
    AccessBandwidth = "access-bandwidth"
    ReadBandwidth = "read-bandwidth"
    WriteBandwidth = "write-bandwidth"

  HmatCacheAssociativity* = enum
    None = "none"
    Direct = "direct"
    Complex = "complex"

  HmatCacheWritePolicy* = enum
    None = "none"
    WriteBack = "write-back"
    WriteThrough = "write-through"

  MemoryDeviceInfoKind* {.pure.} = enum
    Dimm = "dimm"
    Nvdimm = "nvdimm"
    VirtioPmem = "virtio-pmem"
    VirtioMem = "virtio-mem"
    SgxEpc = "sgx-epc"
    HvBalloon = "hv-balloon"


  SmbiosEntryPointType* = enum
    V32 = "32"
    V64 = "64"
    Auto = "auto"

  CpuModelExpansionType* = enum
    Static = "static"
    Full = "full"

  CpuModelCompareResult* = enum
    Incompatible = "incompatible"
    Identical = "identical"
    Superset = "superset"
    Subset = "subset"

  S390CpuPolarization* = enum
    Horizontal = "horizontal"
    Vertical = "vertical"

  ReplayMode* = enum
    None = "none"
    Record = "record"
    Play = "play"

  YankInstanceType* = enum
    BlockNode = "block-node"
    Chardev = "chardev"
    Migration = "migration"


  CommandLineParameterType* {.pure.} = enum
    String = "string"
    Boolean = "boolean"
    Number = "number"
    Size = "size"

  SsidSizeMode* = enum
    Auto = "auto"
    V0 = "0"
    V1 = "1"
    V2 = "2"
    V3 = "3"
    V4 = "4"
    V5 = "5"
    V6 = "6"
    V7 = "7"
    V8 = "8"
    V9 = "9"
    V10 = "10"
    V11 = "11"
    V12 = "12"
    V13 = "13"
    V14 = "14"
    V15 = "15"
    V16 = "16"
    V17 = "17"
    V18 = "18"
    V19 = "19"
    V20 = "20"

  OasMode* = enum
    Auto = "auto"
    V32 = "32"
    V36 = "36"
    V40 = "40"
    V42 = "42"
    V44 = "44"
    V48 = "48"
    V52 = "52"
    V56 = "56"

  SevState* = enum
    Uninit = "uninit"
    LaunchUpdate = "launch-update"
    LaunchSecret = "launch-secret"
    Running = "running"
    SendUpdate = "send-update"
    ReceiveUpdate = "receive-update"

  SevGuestType* = enum
    Sev = "sev"
    SevSnp = "sev-snp"


  EvtchnPortType* = enum
    Closed = "closed"
    Unbound = "unbound"
    Interdomain = "interdomain"
    Pirq = "pirq"
    Virq = "virq"
    Ipi = "ipi"

  AudioFormat* = enum
    U8 = "u8"
    S8 = "s8"
    U16 = "u16"
    S16 = "s16"
    U32 = "u32"
    S32 = "s32"
    F32 = "f32"

  AudiodevDriver* = enum
    None = "none"
    Alsa = "alsa"
    Coreaudio = "coreaudio"
    Dbus = "dbus"
    Dsound = "dsound"
    Jack = "jack"
    Oss = "oss"
    Pa = "pa"
    Pipewire = "pipewire"
    Sdl = "sdl"
    Sndio = "sndio"
    Spice = "spice"
    Wav = "wav"


  ACPISlotType* = enum
    DIMM = "DIMM"
    CPU = "CPU"

  StatsType* = enum
    Cumulative = "cumulative"
    Instant = "instant"
    Peak = "peak"
    LinearHistogram = "linear-histogram"
    Log2Histogram = "log2-histogram"

  StatsUnit* = enum
    Bytes = "bytes"
    Seconds = "seconds"
    Cycles = "cycles"
    Boolean = "boolean"

  StatsProvider* = enum
    Kvm = "kvm"
    Cryptodev = "cryptodev"

  StatsTarget* = enum
    Vm = "vm"
    Vcpu = "vcpu"
    Cryptodev = "cryptodev"


  StatsValueKind* = enum
    Scalar = "scalar"
    Boolean = "boolean"
    List = "list"

  GranuleMode* = enum
    V4k = "4k"
    V8k = "8k"
    V16k = "16k"
    V64k = "64k"
    Host = "host"

  VMAppleVirtioBlkVariant* = enum
    Unspecified = "unspecified"
    Root = "root"
    Aux = "aux"

  QapiVfioMigrationState* = enum
    Stop = "stop"
    Running = "running"
    StopCopy = "stop-copy"
    Resuming = "resuming"
    RunningP2p = "running-p2p"
    PreCopy = "pre-copy"
    PreCopyP2p = "pre-copy-p2p"
    PreCopyP2pPrepare = "pre-copy-p2p-prepare"

  QCryptodevBackendAlgoType* = enum
    Sym = "sym"
    Asym = "asym"

  QCryptodevBackendServiceType* = enum
    Cipher = "cipher"
    Hash = "hash"
    Mac = "mac"
    Aead = "aead"
    Akcipher = "akcipher"

  QCryptodevBackendType* = enum
    Builtin = "builtin"
    VhostUser = "vhost-user"
    Lkcf = "lkcf"

  CxlEventLog* = enum
    Informational = "informational"
    Warning = "warning"
    Failure = "failure"
    Fatal = "fatal"

  CxlUncorErrorType* = enum
    CacheDataParity = "cache-data-parity"
    CacheAddressParity = "cache-address-parity"
    CacheBeParity = "cache-be-parity"
    CacheDataEcc = "cache-data-ecc"
    MemDataParity = "mem-data-parity"
    MemAddressParity = "mem-address-parity"
    MemBeParity = "mem-be-parity"
    MemDataEcc = "mem-data-ecc"
    ReinitThreshold = "reinit-threshold"
    RsvdEncoding = "rsvd-encoding"
    PoisonReceived = "poison-received"
    ReceiverOverflow = "receiver-overflow"
    Internal = "internal"
    CxlIdeTx = "cxl-ide-tx"
    CxlIdeRx = "cxl-ide-rx"

  CxlCorErrorType* = enum
    CacheDataEcc = "cache-data-ecc"
    MemDataEcc = "mem-data-ecc"
    CrcThreshold = "crc-threshold"
    RetryThreshold = "retry-threshold"
    CachePoisonReceived = "cache-poison-received"
    MemPoisonReceived = "mem-poison-received"
    Physical = "physical"

  CxlExtentSelectionPolicy* = enum
    Free = "free"
    Contiguous = "contiguous"
    Prescriptive = "prescriptive"
    EnableSharedAccess = "enable-shared-access"

  CxlExtentRemovalPolicy* = enum
    TagBased = "tag-based"
    Prescriptive = "prescriptive"

  StrOrNull* = object
    case kind*: StrOrNullKind
    of StrOrNullKind.S:
      s*: string
    of StrOrNullKind.N:
      n*: JsonNode

  HumanReadableText* = object
    humanReadableText*: string

  InetSocketAddressBase* = object
    host*: string
    port*: string

  InetSocketAddress* = object
    host*: string
    port*: string
    numeric*: Option[bool]
    to*: Option[uint16]
    ipv4*: Option[bool]
    ipv6*: Option[bool]
    keepAlive*: Option[bool]
    keepAliveCount*: Option[uint32]
    keepAliveIdle*: Option[uint32]
    keepAliveInterval*: Option[uint32]
    mptcp*: Option[bool]

  UnixSocketAddress* = object
    path*: string
    abstract*: Option[bool]
    tight*: Option[bool]

  VsockSocketAddress* = object
    cid*: string
    port*: string

  FdSocketAddress* = object
    str*: string

  InetSocketAddressWrapper* = object
    data*: InetSocketAddress

  UnixSocketAddressWrapper* = object
    data*: UnixSocketAddress

  VsockSocketAddressWrapper* = object
    data*: VsockSocketAddress

  FdSocketAddressWrapper* = object
    data*: FdSocketAddress

  SocketAddressLegacy* = object
    case `type`*: SocketAddressType
    of SocketAddressType.Inet:
      inet*: InetSocketAddressWrapper
    of SocketAddressType.Unix:
      unix*: UnixSocketAddressWrapper
    of SocketAddressType.Vsock:
      vsock*: VsockSocketAddressWrapper
    of SocketAddressType.Fd:
      fd*: FdSocketAddressWrapper

  SocketAddress* = object
    case `type`*: SocketAddressType
    of SocketAddressType.Inet:
      inet*: InetSocketAddress
    of SocketAddressType.Unix:
      unix*: UnixSocketAddress
    of SocketAddressType.Vsock:
      vsock*: VsockSocketAddress
    of SocketAddressType.Fd:
      fd*: FdSocketAddress

  StatusInfo* = object
    running*: bool
    status*: RunState

  GuestPanicInformation* = object
    case `type`*: GuestPanicInformationType
    of GuestPanicInformationType.HyperV:
      hyperV*: GuestPanicInformationHyperV
    of GuestPanicInformationType.S390:
      s390*: GuestPanicInformationS390
    of GuestPanicInformationType.Tdx:
      tdx*: GuestPanicInformationTdx
    of GuestPanicInformationType.Sev:
      sev*: GuestPanicInformationSev

  GuestPanicInformationHyperV* = object
    arg1*: uint64
    arg2*: uint64
    arg3*: uint64
    arg4*: uint64
    arg5*: uint64

  GuestPanicInformationS390* = object
    core*: uint32
    pswMask*: uint64
    pswAddr*: uint64
    reason*: S390CrashReason

  GuestPanicInformationTdx* = object
    errorCode*: uint32
    message*: string
    gpa*: Option[uint64]

  GuestPanicInformationSev* = object
    set*: uint32
    code*: uint32

  MemoryFailureFlags* = object
    actionRequired*: bool
    recursive*: bool

  QCryptoBlockOptionsBase* = object
    format*: QCryptoBlockFormat

  QCryptoBlockOptionsQCow* = object
    keySecret*: Option[string]

  QCryptoBlockOptionsLUKS* = object
    keySecret*: Option[string]

  QCryptoBlockCreateOptionsLUKS* = object
    keySecret*: Option[string]
    cipherAlg*: Option[QCryptoCipherAlgo]
    cipherMode*: Option[QCryptoCipherMode]
    ivgenAlg*: Option[QCryptoIVGenAlgo]
    ivgenHashAlg*: Option[QCryptoHashAlgo]
    hashAlg*: Option[QCryptoHashAlgo]
    iterTime*: Option[int64]

  QCryptoBlockOpenOptions* = object
    case format*: QCryptoBlockFormat
    of QCryptoBlockFormat.Qcow:
      qcow*: QCryptoBlockOptionsQCow
    of QCryptoBlockFormat.Luks:
      luks*: QCryptoBlockOptionsLUKS

  QCryptoBlockCreateOptions* = object
    case format*: QCryptoBlockFormat
    of QCryptoBlockFormat.Qcow:
      qcow*: QCryptoBlockOptionsQCow
    of QCryptoBlockFormat.Luks:
      luks*: QCryptoBlockCreateOptionsLUKS

  QCryptoBlockInfoBase* = object
    format*: QCryptoBlockFormat

  QCryptoBlockInfoLUKSSlot* = object
    active*: bool
    iters*: Option[int64]
    stripes*: Option[int64]
    keyOffset*: int64

  QCryptoBlockInfoLUKS* = object
    cipherAlg*: QCryptoCipherAlgo
    cipherMode*: QCryptoCipherMode
    ivgenAlg*: QCryptoIVGenAlgo
    ivgenHashAlg*: Option[QCryptoHashAlgo]
    hashAlg*: QCryptoHashAlgo
    detachedHeader*: bool
    payloadOffset*: int64
    masterKeyIters*: int64
    uuid*: string
    slots*: seq[QCryptoBlockInfoLUKSSlot]

  QCryptoBlockInfo* = object
    case format*: QCryptoBlockFormat
    of QCryptoBlockFormat.Luks:
      luks*: QCryptoBlockInfoLUKS
    of QCryptoBlockFormat.Qcow: discard

  QCryptoBlockAmendOptionsLUKS* = object
    state*: QCryptoBlockLUKSKeyslotState
    newSecret*: Option[string]
    oldSecret*: Option[string]
    keyslot*: Option[int64]
    iterTime*: Option[int64]
    secret*: Option[string]

  QCryptoBlockAmendOptions* = object
    case format*: QCryptoBlockFormat
    of QCryptoBlockFormat.Luks:
      luks*: QCryptoBlockAmendOptionsLUKS
    of QCryptoBlockFormat.Qcow: discard

  SecretCommonProperties* = object
    format*: Option[QCryptoSecretFormat]
    keyid*: Option[string]
    iv*: Option[string]

  SecretProperties* = object
    format*: Option[QCryptoSecretFormat]
    keyid*: Option[string]
    iv*: Option[string]
    data*: Option[string]
    file*: Option[string]

  SecretKeyringProperties* = object
    format*: Option[QCryptoSecretFormat]
    keyid*: Option[string]
    iv*: Option[string]
    serial*: int32

  TlsCredsProperties* = object
    verifyPeer*: Option[bool]
    dir*: Option[string]
    endpoint*: Option[QCryptoTLSCredsEndpoint]
    priority*: Option[string]

  TlsCredsAnonProperties* = object
    verifyPeer*: Option[bool]
    dir*: Option[string]
    endpoint*: Option[QCryptoTLSCredsEndpoint]
    priority*: Option[string]

  TlsCredsPskProperties* = object
    verifyPeer*: Option[bool]
    dir*: Option[string]
    endpoint*: Option[QCryptoTLSCredsEndpoint]
    priority*: Option[string]
    username*: Option[string]

  TlsCredsX509Properties* = object
    verifyPeer*: Option[bool]
    dir*: Option[string]
    endpoint*: Option[QCryptoTLSCredsEndpoint]
    priority*: Option[string]
    sanityCheck*: Option[bool]
    passwordid*: Option[string]

  QCryptoAkCipherOptionsRSA* = object
    hashAlg*: QCryptoHashAlgo
    paddingAlg*: QCryptoRSAPaddingAlgo

  QCryptoAkCipherOptions* = object
    case alg*: QCryptoAkCipherAlgo
    of QCryptoAkCipherAlgo.Rsa:
      rsa*: QCryptoAkCipherOptionsRSA

  JobInfo* = object
    id*: string
    `type`*: JobType
    status*: JobStatus
    currentProgress*: int64
    totalProgress*: int64
    error*: Option[string]

  KvmInfo* = object
    enabled*: bool
    present*: bool

  AcceleratorInfo* = object
    enabled*: Accelerator
    present*: seq[Accelerator]

  SnapshotInfo* = object
    id*: string
    name*: string
    vmStateSize*: int64
    dateSec*: int64
    dateNsec*: int64
    vmClockSec*: int64
    vmClockNsec*: int64
    icount*: Option[int64]

  ImageInfoSpecificQCow2EncryptionBase* = object
    format*: BlockdevQcow2EncryptionFormat

  ImageInfoSpecificQCow2Encryption* = object
    case format*: BlockdevQcow2EncryptionFormat
    of BlockdevQcow2EncryptionFormat.Luks:
      luks*: QCryptoBlockInfoLUKS
    of BlockdevQcow2EncryptionFormat.Aes: discard

  ImageInfoSpecificQCow2* = object
    compat*: string
    dataFile*: Option[string]
    dataFileRaw*: Option[bool]
    extendedL2*: Option[bool]
    lazyRefcounts*: Option[bool]
    corrupt*: Option[bool]
    refcountBits*: int64
    encrypt*: Option[ImageInfoSpecificQCow2Encryption]
    bitmaps*: Option[seq[Qcow2BitmapInfo]]
    compressionType*: Qcow2CompressionType

  ImageInfoSpecificVmdk* = object
    createType*: string
    cid*: int64
    parentCid*: int64
    extents*: seq[VmdkExtentInfo]

  VmdkExtentInfo* = object
    filename*: string
    format*: string
    virtualSize*: int64
    clusterSize*: Option[int64]
    compressed*: Option[bool]

  ImageInfoSpecificRbd* = object
    encryptionFormat*: Option[RbdImageEncryptionFormat]

  ImageInfoSpecificFile* = object
    extentSizeHint*: Option[uint64]

  ImageInfoSpecificQCow2Wrapper* = object
    data*: ImageInfoSpecificQCow2

  ImageInfoSpecificVmdkWrapper* = object
    data*: ImageInfoSpecificVmdk

  ImageInfoSpecificLUKSWrapper* = object
    data*: QCryptoBlockInfoLUKS

  ImageInfoSpecificRbdWrapper* = object
    data*: ImageInfoSpecificRbd

  ImageInfoSpecificFileWrapper* = object
    data*: ImageInfoSpecificFile

  ImageInfoSpecific* = object
    case `type`*: ImageInfoSpecificKind
    of ImageInfoSpecificKind.Qcow2:
      qcow2*: ImageInfoSpecificQCow2Wrapper
    of ImageInfoSpecificKind.Vmdk:
      vmdk*: ImageInfoSpecificVmdkWrapper
    of ImageInfoSpecificKind.Luks:
      luks*: ImageInfoSpecificLUKSWrapper
    of ImageInfoSpecificKind.Rbd:
      rbd*: ImageInfoSpecificRbdWrapper
    of ImageInfoSpecificKind.File:
      file*: ImageInfoSpecificFileWrapper

  BlockLimitsInfo* = object
    requestAlignment*: uint32
    maxDiscard*: Option[uint64]
    discardAlignment*: Option[uint32]
    maxWriteZeroes*: Option[uint64]
    writeZeroesAlignment*: Option[uint32]
    optTransfer*: Option[uint32]
    maxTransfer*: Option[uint32]
    maxHwTransfer*: Option[uint32]
    maxIov*: int64
    maxHwIov*: Option[int64]
    minMemAlignment*: uint64
    optMemAlignment*: uint64

  BlockNodeInfo* = object
    filename*: string
    format*: string
    dirtyFlag*: Option[bool]
    actualSize*: Option[int64]
    virtualSize*: int64
    clusterSize*: Option[int64]
    encrypted*: Option[bool]
    compressed*: Option[bool]
    backingFilename*: Option[string]
    fullBackingFilename*: Option[string]
    backingFilenameFormat*: Option[string]
    snapshots*: Option[seq[SnapshotInfo]]
    limits*: Option[BlockLimitsInfo]
    formatSpecific*: Option[ImageInfoSpecific]

  ImageInfo* = ref object
    filename*: string
    format*: string
    dirtyFlag*: Option[bool]
    actualSize*: Option[int64]
    virtualSize*: int64
    clusterSize*: Option[int64]
    encrypted*: Option[bool]
    compressed*: Option[bool]
    backingFilename*: Option[string]
    fullBackingFilename*: Option[string]
    backingFilenameFormat*: Option[string]
    snapshots*: Option[seq[SnapshotInfo]]
    limits*: Option[BlockLimitsInfo]
    formatSpecific*: Option[ImageInfoSpecific]
    backingImage*: Option[ImageInfo]

  BlockChildInfo* = ref object
    name*: string
    info*: BlockGraphInfo

  BlockGraphInfo* = ref object
    filename*: string
    format*: string
    dirtyFlag*: Option[bool]
    actualSize*: Option[int64]
    virtualSize*: int64
    clusterSize*: Option[int64]
    encrypted*: Option[bool]
    compressed*: Option[bool]
    backingFilename*: Option[string]
    fullBackingFilename*: Option[string]
    backingFilenameFormat*: Option[string]
    snapshots*: Option[seq[SnapshotInfo]]
    limits*: Option[BlockLimitsInfo]
    formatSpecific*: Option[ImageInfoSpecific]
    children*: seq[BlockChildInfo]

  ImageCheck* = object
    filename*: string
    format*: string
    checkErrors*: int64
    imageEndOffset*: Option[int64]
    corruptions*: Option[int64]
    leaks*: Option[int64]
    corruptionsFixed*: Option[int64]
    leaksFixed*: Option[int64]
    totalClusters*: Option[int64]
    allocatedClusters*: Option[int64]
    fragmentedClusters*: Option[int64]
    compressedClusters*: Option[int64]

  MapEntry* = object
    start*: int64
    length*: int64
    data*: bool
    zero*: bool
    compressed*: bool
    depth*: int64
    present*: bool
    offset*: Option[int64]
    filename*: Option[string]

  BlockdevCacheInfo* = object
    writeback*: bool
    direct*: bool
    noFlush*: bool

  BlockdevChild* = object
    child*: string
    nodeName*: string

  BlockDeviceInfo* = object
    file*: string
    nodeName*: string
    ro*: bool
    drv*: string
    backingFile*: Option[string]
    backingFileDepth*: int64
    children*: seq[BlockdevChild]
    active*: bool
    encrypted*: bool
    detectZeroes*: BlockdevDetectZeroesOptions
    bps*: int64
    bpsRd*: int64
    bpsWr*: int64
    iops*: int64
    iopsRd*: int64
    iopsWr*: int64
    image*: ImageInfo
    bpsMax*: Option[int64]
    bpsRdMax*: Option[int64]
    bpsWrMax*: Option[int64]
    iopsMax*: Option[int64]
    iopsRdMax*: Option[int64]
    iopsWrMax*: Option[int64]
    bpsMaxLength*: Option[int64]
    bpsRdMaxLength*: Option[int64]
    bpsWrMaxLength*: Option[int64]
    iopsMaxLength*: Option[int64]
    iopsRdMaxLength*: Option[int64]
    iopsWrMaxLength*: Option[int64]
    iopsSize*: Option[int64]
    group*: Option[string]
    cache*: BlockdevCacheInfo
    writeThreshold*: int64
    dirtyBitmaps*: Option[seq[BlockDirtyInfo]]

  BlockDirtyInfo* = object
    name*: Option[string]
    count*: int64
    granularity*: uint32
    recording*: bool
    busy*: bool
    persistent*: bool
    inconsistent*: Option[bool]

  Qcow2BitmapInfo* = object
    name*: string
    granularity*: uint32
    flags*: seq[Qcow2BitmapInfoFlags]

  BlockLatencyHistogramInfo* = object
    boundaries*: seq[uint64]
    bins*: seq[uint64]

  BlockInfo* = object
    device*: string
    qdev*: Option[string]
    `type`*: string
    removable*: bool
    locked*: bool
    inserted*: Option[BlockDeviceInfo]
    trayOpen*: Option[bool]
    ioStatus*: Option[BlockDeviceIoStatus]

  BlockMeasureInfo* = object
    required*: int64
    fullyAllocated*: int64
    bitmaps*: Option[int64]

  BlockDeviceTimedStats* = object
    intervalLength*: int64
    minRdLatencyNs*: int64
    maxRdLatencyNs*: int64
    avgRdLatencyNs*: int64
    minWrLatencyNs*: int64
    maxWrLatencyNs*: int64
    avgWrLatencyNs*: int64
    minZoneAppendLatencyNs*: int64
    maxZoneAppendLatencyNs*: int64
    avgZoneAppendLatencyNs*: int64
    minFlushLatencyNs*: int64
    maxFlushLatencyNs*: int64
    avgFlushLatencyNs*: int64
    avgRdQueueDepth*: float64
    avgWrQueueDepth*: float64
    avgZoneAppendQueueDepth*: float64

  BlockDeviceStats* = object
    rdBytes*: int64
    wrBytes*: int64
    zoneAppendBytes*: int64
    unmapBytes*: int64
    rdOperations*: int64
    wrOperations*: int64
    zoneAppendOperations*: int64
    flushOperations*: int64
    unmapOperations*: int64
    rdTotalTimeNs*: int64
    wrTotalTimeNs*: int64
    zoneAppendTotalTimeNs*: int64
    flushTotalTimeNs*: int64
    unmapTotalTimeNs*: int64
    wrHighestOffset*: int64
    rdMerged*: int64
    wrMerged*: int64
    zoneAppendMerged*: int64
    unmapMerged*: int64
    idleTimeNs*: Option[int64]
    failedRdOperations*: int64
    failedWrOperations*: int64
    failedZoneAppendOperations*: int64
    failedFlushOperations*: int64
    failedUnmapOperations*: int64
    invalidRdOperations*: int64
    invalidWrOperations*: int64
    invalidZoneAppendOperations*: int64
    invalidFlushOperations*: int64
    invalidUnmapOperations*: int64
    accountInvalid*: bool
    accountFailed*: bool
    timedStats*: seq[BlockDeviceTimedStats]
    rdLatencyHistogram*: Option[BlockLatencyHistogramInfo]
    wrLatencyHistogram*: Option[BlockLatencyHistogramInfo]
    zoneAppendLatencyHistogram*: Option[BlockLatencyHistogramInfo]
    flushLatencyHistogram*: Option[BlockLatencyHistogramInfo]

  BlockStatsSpecificFile* = object
    discardNbOk*: uint64
    discardNbFailed*: uint64
    discardBytesOk*: uint64

  BlockStatsSpecificNvme* = object
    completionErrors*: uint64
    alignedAccesses*: uint64
    unalignedAccesses*: uint64

  BlockStatsSpecific* = object
    case driver*: BlockdevDriver
    of BlockdevDriver.File:
      file*: BlockStatsSpecificFile
    of BlockdevDriver.HostDevice:
      hostDevice*: BlockStatsSpecificFile
    of BlockdevDriver.Nvme:
      nvme*: BlockStatsSpecificNvme
    of BlockdevDriver.Blkdebug: discard
    of BlockdevDriver.Blklogwrites: discard
    of BlockdevDriver.Blkreplay: discard
    of BlockdevDriver.Blkverify: discard
    of BlockdevDriver.Bochs: discard
    of BlockdevDriver.Cloop: discard
    of BlockdevDriver.Compress: discard
    of BlockdevDriver.CopyBeforeWrite: discard
    of BlockdevDriver.CopyOnRead: discard
    of BlockdevDriver.Dmg: discard
    of BlockdevDriver.SnapshotAccess: discard
    of BlockdevDriver.Ftp: discard
    of BlockdevDriver.Ftps: discard
    of BlockdevDriver.Gluster: discard
    of BlockdevDriver.HostCdrom: discard
    of BlockdevDriver.Http: discard
    of BlockdevDriver.Https: discard
    of BlockdevDriver.IoUring: discard
    of BlockdevDriver.Iscsi: discard
    of BlockdevDriver.Luks: discard
    of BlockdevDriver.Nbd: discard
    of BlockdevDriver.Nfs: discard
    of BlockdevDriver.NullAio: discard
    of BlockdevDriver.NullCo: discard
    of BlockdevDriver.NvmeIoUring: discard
    of BlockdevDriver.Parallels: discard
    of BlockdevDriver.Preallocate: discard
    of BlockdevDriver.Qcow: discard
    of BlockdevDriver.Qcow2: discard
    of BlockdevDriver.Qed: discard
    of BlockdevDriver.Quorum: discard
    of BlockdevDriver.Raw: discard
    of BlockdevDriver.Rbd: discard
    of BlockdevDriver.Replication: discard
    of BlockdevDriver.Ssh: discard
    of BlockdevDriver.Throttle: discard
    of BlockdevDriver.Vdi: discard
    of BlockdevDriver.Vhdx: discard
    of BlockdevDriver.VirtioBlkVfioPci: discard
    of BlockdevDriver.VirtioBlkVhostUser: discard
    of BlockdevDriver.VirtioBlkVhostVdpa: discard
    of BlockdevDriver.Vmdk: discard
    of BlockdevDriver.Vpc: discard
    of BlockdevDriver.Vvfat: discard

  BlockStats* = ref object
    device*: Option[string]
    qdev*: Option[string]
    nodeName*: Option[string]
    stats*: BlockDeviceStats
    driverSpecific*: Option[BlockStatsSpecific]
    parent*: Option[BlockStats]
    backing*: Option[BlockStats]

  BlockJobInfoMirror* = object
    activelySynced*: bool

  BlockJobInfo* = object
    device*: string
    len*: int64
    offset*: int64
    busy*: bool
    paused*: bool
    speed*: int64
    ioStatus*: BlockDeviceIoStatus
    ready*: bool
    status*: JobStatus
    autoFinalize*: bool
    autoDismiss*: bool
    error*: Option[string]
    case `type`*: JobType
    of JobType.Mirror:
      mirror*: BlockJobInfoMirror
    of JobType.Commit: discard
    of JobType.Stream: discard
    of JobType.Backup: discard
    of JobType.Create: discard
    of JobType.Amend: discard
    of JobType.SnapshotLoad: discard
    of JobType.SnapshotSave: discard
    of JobType.SnapshotDelete: discard

  BlockdevSnapshotSync* = object
    device*: Option[string]
    nodeName*: Option[string]
    snapshotFile*: string
    snapshotNodeName*: Option[string]
    format*: Option[string]
    mode*: Option[NewImageMode]

  BlockdevSnapshot* = object
    node*: string
    overlay*: string

  BackupPerf* = object
    useCopyRange*: Option[bool]
    maxWorkers*: Option[int64]
    maxChunk*: Option[int64]
    minClusterSize*: Option[uint64]

  BackupCommon* = object
    jobId*: Option[string]
    device*: string
    sync*: MirrorSyncMode
    speed*: Option[int64]
    bitmap*: Option[string]
    bitmapMode*: Option[BitmapSyncMode]
    compress*: Option[bool]
    onSourceError*: Option[BlockdevOnError]
    onTargetError*: Option[BlockdevOnError]
    onCbwError*: Option[OnCbwError]
    autoFinalize*: Option[bool]
    autoDismiss*: Option[bool]
    filterNodeName*: Option[string]
    discardSource*: Option[bool]
    xPerf*: Option[BackupPerf]

  DriveBackup* = object
    jobId*: Option[string]
    device*: string
    sync*: MirrorSyncMode
    speed*: Option[int64]
    bitmap*: Option[string]
    bitmapMode*: Option[BitmapSyncMode]
    compress*: Option[bool]
    onSourceError*: Option[BlockdevOnError]
    onTargetError*: Option[BlockdevOnError]
    onCbwError*: Option[OnCbwError]
    autoFinalize*: Option[bool]
    autoDismiss*: Option[bool]
    filterNodeName*: Option[string]
    discardSource*: Option[bool]
    xPerf*: Option[BackupPerf]
    target*: string
    format*: Option[string]
    mode*: Option[NewImageMode]

  BlockdevBackup* = object
    jobId*: Option[string]
    device*: string
    sync*: MirrorSyncMode
    speed*: Option[int64]
    bitmap*: Option[string]
    bitmapMode*: Option[BitmapSyncMode]
    compress*: Option[bool]
    onSourceError*: Option[BlockdevOnError]
    onTargetError*: Option[BlockdevOnError]
    onCbwError*: Option[OnCbwError]
    autoFinalize*: Option[bool]
    autoDismiss*: Option[bool]
    filterNodeName*: Option[string]
    discardSource*: Option[bool]
    xPerf*: Option[BackupPerf]
    target*: string

  XDbgBlockGraphNode* = object
    id*: uint64
    `type`*: XDbgBlockGraphNodeType
    name*: string

  XDbgBlockGraphEdge* = object
    parent*: uint64
    child*: uint64
    name*: string
    perm*: seq[BlockPermission]
    sharedPerm*: seq[BlockPermission]

  XDbgBlockGraph* = object
    nodes*: seq[XDbgBlockGraphNode]
    edges*: seq[XDbgBlockGraphEdge]

  DriveMirror* = object
    jobId*: Option[string]
    device*: string
    target*: string
    format*: Option[string]
    nodeName*: Option[string]
    replaces*: Option[string]
    sync*: MirrorSyncMode
    mode*: Option[NewImageMode]
    speed*: Option[int64]
    granularity*: Option[uint32]
    bufSize*: Option[int64]
    onSourceError*: Option[BlockdevOnError]
    onTargetError*: Option[BlockdevOnError]
    unmap*: Option[bool]
    copyMode*: Option[MirrorCopyMode]
    autoFinalize*: Option[bool]
    autoDismiss*: Option[bool]

  BlockDirtyBitmap* = object
    node*: string
    name*: string

  BlockDirtyBitmapAdd* = object
    node*: string
    name*: string
    granularity*: Option[uint32]
    persistent*: Option[bool]
    disabled*: Option[bool]

  BlockDirtyBitmapOrStr* = object
    case kind*: BlockDirtyBitmapOrStrKind
    of BlockDirtyBitmapOrStrKind.Local:
      local*: string
    of BlockDirtyBitmapOrStrKind.External:
      external*: BlockDirtyBitmap

  BlockDirtyBitmapMerge* = object
    node*: string
    target*: string
    bitmaps*: seq[BlockDirtyBitmapOrStr]

  BlockDirtyBitmapSha256* = object
    sha256*: string

  BlockIOThrottle* = object
    device*: Option[string]
    id*: Option[string]
    bps*: int64
    bpsRd*: int64
    bpsWr*: int64
    iops*: int64
    iopsRd*: int64
    iopsWr*: int64
    bpsMax*: Option[int64]
    bpsRdMax*: Option[int64]
    bpsWrMax*: Option[int64]
    iopsMax*: Option[int64]
    iopsRdMax*: Option[int64]
    iopsWrMax*: Option[int64]
    bpsMaxLength*: Option[int64]
    bpsRdMaxLength*: Option[int64]
    bpsWrMaxLength*: Option[int64]
    iopsMaxLength*: Option[int64]
    iopsRdMaxLength*: Option[int64]
    iopsWrMaxLength*: Option[int64]
    iopsSize*: Option[int64]
    group*: Option[string]

  ThrottleLimits* = object
    iopsTotal*: Option[int64]
    iopsTotalMax*: Option[int64]
    iopsTotalMaxLength*: Option[int64]
    iopsRead*: Option[int64]
    iopsReadMax*: Option[int64]
    iopsReadMaxLength*: Option[int64]
    iopsWrite*: Option[int64]
    iopsWriteMax*: Option[int64]
    iopsWriteMaxLength*: Option[int64]
    bpsTotal*: Option[int64]
    bpsTotalMax*: Option[int64]
    bpsTotalMaxLength*: Option[int64]
    bpsRead*: Option[int64]
    bpsReadMax*: Option[int64]
    bpsReadMaxLength*: Option[int64]
    bpsWrite*: Option[int64]
    bpsWriteMax*: Option[int64]
    bpsWriteMaxLength*: Option[int64]
    iopsSize*: Option[int64]

  ThrottleGroupProperties* = object
    limits*: Option[ThrottleLimits]
    xIopsTotal*: Option[int64]
    xIopsTotalMax*: Option[int64]
    xIopsTotalMaxLength*: Option[int64]
    xIopsRead*: Option[int64]
    xIopsReadMax*: Option[int64]
    xIopsReadMaxLength*: Option[int64]
    xIopsWrite*: Option[int64]
    xIopsWriteMax*: Option[int64]
    xIopsWriteMaxLength*: Option[int64]
    xBpsTotal*: Option[int64]
    xBpsTotalMax*: Option[int64]
    xBpsTotalMaxLength*: Option[int64]
    xBpsRead*: Option[int64]
    xBpsReadMax*: Option[int64]
    xBpsReadMaxLength*: Option[int64]
    xBpsWrite*: Option[int64]
    xBpsWriteMax*: Option[int64]
    xBpsWriteMaxLength*: Option[int64]
    xIopsSize*: Option[int64]

  BlockJobChangeOptionsMirror* = object
    copyMode*: MirrorCopyMode

  BlockJobChangeOptions* = object
    id*: string
    case `type`*: JobType
    of JobType.Mirror:
      mirror*: BlockJobChangeOptionsMirror
    of JobType.Commit: discard
    of JobType.Stream: discard
    of JobType.Backup: discard
    of JobType.Create: discard
    of JobType.Amend: discard
    of JobType.SnapshotLoad: discard
    of JobType.SnapshotSave: discard
    of JobType.SnapshotDelete: discard

  BlockdevCacheOptions* = object
    direct*: Option[bool]
    noFlush*: Option[bool]

  BlockdevOptionsFile* = object
    filename*: string
    prManager*: Option[string]
    locking*: Option[OnOffAuto]
    aio*: Option[BlockdevAioOptions]
    aioMaxBatch*: Option[int64]
    dropCache*: Option[bool]
    xCheckCacheDropped*: Option[bool]

  BlockdevOptionsNull* = object
    size*: Option[int64]
    latencyNs*: Option[uint64]
    readZeroes*: Option[bool]

  BlockdevOptionsNVMe* = object
    device*: string
    namespace*: int64

  BlockdevOptionsVVFAT* = object
    dir*: string
    fatType*: Option[int64]
    floppy*: Option[bool]
    label*: Option[string]
    rw*: Option[bool]

  BlockdevOptionsGenericFormat* = ref object
    file*: BlockdevRef

  BlockdevOptionsLUKS* = ref object
    file*: BlockdevRef
    keySecret*: Option[string]
    header*: Option[BlockdevRef]

  BlockdevOptionsGenericCOWFormat* = ref object
    file*: BlockdevRef
    backing*: Option[BlockdevRefOrNull]

  Qcow2OverlapCheckFlags* = object
    `template`*: Option[Qcow2OverlapCheckMode]
    mainHeader*: Option[bool]
    activeL1*: Option[bool]
    activeL2*: Option[bool]
    refcountTable*: Option[bool]
    refcountBlock*: Option[bool]
    snapshotTable*: Option[bool]
    inactiveL1*: Option[bool]
    inactiveL2*: Option[bool]
    bitmapDirectory*: Option[bool]

  Qcow2OverlapChecks* = object
    case kind*: Qcow2OverlapChecksKind
    of Qcow2OverlapChecksKind.Flags:
      flags*: Qcow2OverlapCheckFlags
    of Qcow2OverlapChecksKind.Mode:
      mode*: Qcow2OverlapCheckMode

  BlockdevQcowEncryption* = object
    case format*: BlockdevQcowEncryptionFormat
    of BlockdevQcowEncryptionFormat.Aes:
      aes*: QCryptoBlockOptionsQCow

  BlockdevOptionsQcow* = ref object
    file*: BlockdevRef
    backing*: Option[BlockdevRefOrNull]
    encrypt*: Option[BlockdevQcowEncryption]

  BlockdevQcow2Encryption* = object
    case format*: BlockdevQcow2EncryptionFormat
    of BlockdevQcow2EncryptionFormat.Aes:
      aes*: QCryptoBlockOptionsQCow
    of BlockdevQcow2EncryptionFormat.Luks:
      luks*: QCryptoBlockOptionsLUKS

  BlockdevOptionsPreallocate* = ref object
    file*: BlockdevRef
    preallocAlign*: Option[int64]
    preallocSize*: Option[int64]

  BlockdevOptionsQcow2* = ref object
    file*: BlockdevRef
    backing*: Option[BlockdevRefOrNull]
    lazyRefcounts*: Option[bool]
    passDiscardRequest*: Option[bool]
    passDiscardSnapshot*: Option[bool]
    passDiscardOther*: Option[bool]
    discardNoUnref*: Option[bool]
    overlapCheck*: Option[Qcow2OverlapChecks]
    cacheSize*: Option[int64]
    l2CacheSize*: Option[int64]
    l2CacheEntrySize*: Option[int64]
    refcountCacheSize*: Option[int64]
    cacheCleanInterval*: Option[int64]
    encrypt*: Option[BlockdevQcow2Encryption]
    dataFile*: Option[BlockdevRef]

  SshHostKeyHash* = object
    `type`*: SshHostKeyCheckHashType
    hash*: string

  SshHostKeyCheck* = object
    case mode*: SshHostKeyCheckMode
    of SshHostKeyCheckMode.Hash:
      hash*: SshHostKeyHash
    of SshHostKeyCheckMode.None: discard
    of SshHostKeyCheckMode.KnownHosts: discard

  BlockdevOptionsSsh* = object
    server*: InetSocketAddress
    path*: string
    user*: Option[string]
    hostKeyCheck*: Option[SshHostKeyCheck]

  BlkdebugInjectErrorOptions* = object
    event*: BlkdebugEvent
    state*: Option[int64]
    iotype*: Option[BlkdebugIOType]
    errno*: Option[int64]
    sector*: Option[int64]
    once*: Option[bool]
    immediately*: Option[bool]

  BlkdebugSetStateOptions* = object
    event*: BlkdebugEvent
    state*: Option[int64]
    newState*: int64

  BlockdevOptionsBlkdebug* = ref object
    image*: BlockdevRef
    config*: Option[string]
    align*: Option[int64]
    maxTransfer*: Option[int32]
    optWriteZero*: Option[int32]
    maxWriteZero*: Option[int32]
    optDiscard*: Option[int32]
    maxDiscard*: Option[int32]
    injectError*: Option[seq[BlkdebugInjectErrorOptions]]
    setState*: Option[seq[BlkdebugSetStateOptions]]
    takeChildPerms*: Option[seq[BlockPermission]]
    unshareChildPerms*: Option[seq[BlockPermission]]

  BlockdevOptionsBlklogwrites* = ref object
    file*: BlockdevRef
    log*: BlockdevRef
    logSectorSize*: Option[uint32]
    logAppend*: Option[bool]
    logSuperUpdateInterval*: Option[uint64]

  BlockdevOptionsBlkverify* = ref object
    test*: BlockdevRef
    raw*: BlockdevRef

  BlockdevOptionsBlkreplay* = ref object
    image*: BlockdevRef

  BlockdevOptionsQuorum* = ref object
    blkverify*: Option[bool]
    children*: seq[BlockdevRef]
    voteThreshold*: int64
    rewriteCorrupted*: Option[bool]
    readPattern*: Option[QuorumReadPattern]

  BlockdevOptionsGluster* = object
    volume*: string
    path*: string
    server*: seq[SocketAddress]
    debug*: Option[int64]
    logfile*: Option[string]

  BlockdevOptionsIoUring* = object
    filename*: string

  BlockdevOptionsNvmeIoUring* = object
    path*: string

  BlockdevOptionsVirtioBlkVfioPci* = object
    path*: string

  BlockdevOptionsVirtioBlkVhostUser* = object
    path*: string

  BlockdevOptionsVirtioBlkVhostVdpa* = object
    path*: string

  BlockdevOptionsIscsi* = object
    transport*: IscsiTransport
    portal*: string
    target*: string
    lun*: Option[int64]
    user*: Option[string]
    passwordSecret*: Option[string]
    initiatorName*: Option[string]
    headerDigest*: Option[IscsiHeaderDigest]
    timeout*: Option[int64]

  RbdEncryptionOptionsLUKSBase* = object
    keySecret*: string

  RbdEncryptionCreateOptionsLUKSBase* = object
    keySecret*: string
    cipherAlg*: Option[QCryptoCipherAlgo]

  RbdEncryptionOptionsLUKS* = object
    keySecret*: string

  RbdEncryptionOptionsLUKS2* = object
    keySecret*: string

  RbdEncryptionOptionsLUKSAny* = object
    keySecret*: string

  RbdEncryptionCreateOptionsLUKS* = object
    keySecret*: string
    cipherAlg*: Option[QCryptoCipherAlgo]

  RbdEncryptionCreateOptionsLUKS2* = object
    keySecret*: string
    cipherAlg*: Option[QCryptoCipherAlgo]

  RbdEncryptionOptions* = ref object
    parent*: Option[RbdEncryptionOptions]
    case format*: RbdImageEncryptionFormat
    of RbdImageEncryptionFormat.Luks:
      luks*: RbdEncryptionOptionsLUKS
    of RbdImageEncryptionFormat.Luks2:
      luks2*: RbdEncryptionOptionsLUKS2
    of RbdImageEncryptionFormat.LuksAny:
      luksAny*: RbdEncryptionOptionsLUKSAny

  RbdEncryptionCreateOptions* = object
    case format*: RbdImageEncryptionFormat
    of RbdImageEncryptionFormat.Luks:
      luks*: RbdEncryptionCreateOptionsLUKS
    of RbdImageEncryptionFormat.Luks2:
      luks2*: RbdEncryptionCreateOptionsLUKS2
    of RbdImageEncryptionFormat.LuksAny: discard

  BlockdevOptionsRbd* = object
    pool*: string
    namespace*: Option[string]
    image*: string
    conf*: Option[string]
    snapshot*: Option[string]
    encrypt*: Option[RbdEncryptionOptions]
    user*: Option[string]
    authClientRequired*: Option[seq[RbdAuthMode]]
    keySecret*: Option[string]
    server*: Option[seq[InetSocketAddressBase]]

  BlockdevOptionsReplication* = ref object
    file*: BlockdevRef
    mode*: ReplicationMode
    topId*: Option[string]

  NFSServer* = object
    `type`*: NFSTransport
    host*: string

  BlockdevOptionsNfs* = object
    server*: NFSServer
    path*: string
    user*: Option[int64]
    group*: Option[int64]
    tcpSynCount*: Option[int64]
    readaheadSize*: Option[int64]
    pageCacheSize*: Option[int64]
    debug*: Option[int64]

  BlockdevOptionsCurlBase* = object
    url*: string
    readahead*: Option[int64]
    timeout*: Option[int64]
    username*: Option[string]
    passwordSecret*: Option[string]
    proxyUsername*: Option[string]
    proxyPasswordSecret*: Option[string]

  BlockdevOptionsCurlHttp* = object
    url*: string
    readahead*: Option[int64]
    timeout*: Option[int64]
    username*: Option[string]
    passwordSecret*: Option[string]
    proxyUsername*: Option[string]
    proxyPasswordSecret*: Option[string]
    cookie*: Option[string]
    cookieSecret*: Option[string]
    forceRange*: Option[bool]

  BlockdevOptionsCurlHttps* = object
    url*: string
    readahead*: Option[int64]
    timeout*: Option[int64]
    username*: Option[string]
    passwordSecret*: Option[string]
    proxyUsername*: Option[string]
    proxyPasswordSecret*: Option[string]
    cookie*: Option[string]
    cookieSecret*: Option[string]
    forceRange*: Option[bool]
    sslverify*: Option[bool]

  BlockdevOptionsCurlFtp* = object
    url*: string
    readahead*: Option[int64]
    timeout*: Option[int64]
    username*: Option[string]
    passwordSecret*: Option[string]
    proxyUsername*: Option[string]
    proxyPasswordSecret*: Option[string]

  BlockdevOptionsCurlFtps* = object
    url*: string
    readahead*: Option[int64]
    timeout*: Option[int64]
    username*: Option[string]
    passwordSecret*: Option[string]
    proxyUsername*: Option[string]
    proxyPasswordSecret*: Option[string]
    sslverify*: Option[bool]

  BlockdevOptionsNbd* = object
    server*: SocketAddress
    `export`*: Option[string]
    tlsCreds*: Option[string]
    tlsHostname*: Option[string]
    xDirtyBitmap*: Option[string]
    reconnectDelay*: Option[uint32]
    openTimeout*: Option[uint32]

  BlockdevOptionsRaw* = ref object
    file*: BlockdevRef
    offset*: Option[int64]
    size*: Option[int64]

  BlockdevOptionsThrottle* = ref object
    throttleGroup*: string
    file*: BlockdevRef

  BlockdevOptionsCor* = ref object
    file*: BlockdevRef
    bottom*: Option[string]

  BlockdevOptionsCbw* = ref object
    file*: BlockdevRef
    target*: BlockdevRef
    bitmap*: Option[BlockDirtyBitmap]
    onCbwError*: Option[OnCbwError]
    cbwTimeout*: Option[uint32]
    minClusterSize*: Option[uint64]

  BlockdevOptions* = ref object
    nodeName*: Option[string]
    `discard`*: Option[BlockdevDiscardOptions]
    cache*: Option[BlockdevCacheOptions]
    active*: Option[bool]
    readOnly*: Option[bool]
    autoReadOnly*: Option[bool]
    forceShare*: Option[bool]
    detectZeroes*: Option[BlockdevDetectZeroesOptions]
    case driver*: BlockdevDriver
    of BlockdevDriver.Blkdebug:
      blkdebug*: BlockdevOptionsBlkdebug
    of BlockdevDriver.Blklogwrites:
      blklogwrites*: BlockdevOptionsBlklogwrites
    of BlockdevDriver.Blkverify:
      blkverify*: BlockdevOptionsBlkverify
    of BlockdevDriver.Blkreplay:
      blkreplay*: BlockdevOptionsBlkreplay
    of BlockdevDriver.Bochs:
      bochs*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Cloop:
      cloop*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Compress:
      compress*: BlockdevOptionsGenericFormat
    of BlockdevDriver.CopyBeforeWrite:
      copyBeforeWrite*: BlockdevOptionsCbw
    of BlockdevDriver.CopyOnRead:
      copyOnRead*: BlockdevOptionsCor
    of BlockdevDriver.Dmg:
      dmg*: BlockdevOptionsGenericFormat
    of BlockdevDriver.File:
      file*: BlockdevOptionsFile
    of BlockdevDriver.Ftp:
      ftp*: BlockdevOptionsCurlFtp
    of BlockdevDriver.Ftps:
      ftps*: BlockdevOptionsCurlFtps
    of BlockdevDriver.Gluster:
      gluster*: BlockdevOptionsGluster
    of BlockdevDriver.HostCdrom:
      hostCdrom*: BlockdevOptionsFile
    of BlockdevDriver.HostDevice:
      hostDevice*: BlockdevOptionsFile
    of BlockdevDriver.Http:
      http*: BlockdevOptionsCurlHttp
    of BlockdevDriver.Https:
      https*: BlockdevOptionsCurlHttps
    of BlockdevDriver.IoUring:
      ioUring*: BlockdevOptionsIoUring
    of BlockdevDriver.Iscsi:
      iscsi*: BlockdevOptionsIscsi
    of BlockdevDriver.Luks:
      luks*: BlockdevOptionsLUKS
    of BlockdevDriver.Nbd:
      nbd*: BlockdevOptionsNbd
    of BlockdevDriver.Nfs:
      nfs*: BlockdevOptionsNfs
    of BlockdevDriver.NullAio:
      nullAio*: BlockdevOptionsNull
    of BlockdevDriver.NullCo:
      nullCo*: BlockdevOptionsNull
    of BlockdevDriver.Nvme:
      nvme*: BlockdevOptionsNVMe
    of BlockdevDriver.NvmeIoUring:
      nvmeIoUring*: BlockdevOptionsNvmeIoUring
    of BlockdevDriver.Parallels:
      parallels*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Preallocate:
      preallocate*: BlockdevOptionsPreallocate
    of BlockdevDriver.Qcow2:
      qcow2*: BlockdevOptionsQcow2
    of BlockdevDriver.Qcow:
      qcow*: BlockdevOptionsQcow
    of BlockdevDriver.Qed:
      qed*: BlockdevOptionsGenericCOWFormat
    of BlockdevDriver.Quorum:
      quorum*: BlockdevOptionsQuorum
    of BlockdevDriver.Raw:
      raw*: BlockdevOptionsRaw
    of BlockdevDriver.Rbd:
      rbd*: BlockdevOptionsRbd
    of BlockdevDriver.Replication:
      replication*: BlockdevOptionsReplication
    of BlockdevDriver.SnapshotAccess:
      snapshotAccess*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Ssh:
      ssh*: BlockdevOptionsSsh
    of BlockdevDriver.Throttle:
      throttle*: BlockdevOptionsThrottle
    of BlockdevDriver.Vdi:
      vdi*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Vhdx:
      vhdx*: BlockdevOptionsGenericFormat
    of BlockdevDriver.VirtioBlkVfioPci:
      virtioBlkVfioPci*: BlockdevOptionsVirtioBlkVfioPci
    of BlockdevDriver.VirtioBlkVhostUser:
      virtioBlkVhostUser*: BlockdevOptionsVirtioBlkVhostUser
    of BlockdevDriver.VirtioBlkVhostVdpa:
      virtioBlkVhostVdpa*: BlockdevOptionsVirtioBlkVhostVdpa
    of BlockdevDriver.Vmdk:
      vmdk*: BlockdevOptionsGenericCOWFormat
    of BlockdevDriver.Vpc:
      vpc*: BlockdevOptionsGenericFormat
    of BlockdevDriver.Vvfat:
      vvfat*: BlockdevOptionsVVFAT

  BlockdevRef* = ref object
    case kind*: BlockdevRefKind
    of BlockdevRefKind.Definition:
      definition*: BlockdevOptions
    of BlockdevRefKind.Reference:
      reference*: string

  BlockdevRefOrNull* = ref object
    case kind*: BlockdevRefOrNullKind
    of BlockdevRefOrNullKind.Definition:
      definition*: BlockdevOptions
    of BlockdevRefOrNullKind.Reference:
      reference*: string
    of BlockdevRefOrNullKind.Null:
      null*: JsonNode

  BlockdevCreateOptionsFile* = object
    filename*: string
    size*: uint64
    preallocation*: Option[PreallocMode]
    nocow*: Option[bool]
    extentSizeHint*: Option[uint64]

  BlockdevCreateOptionsGluster* = object
    location*: BlockdevOptionsGluster
    size*: uint64
    preallocation*: Option[PreallocMode]

  BlockdevCreateOptionsLUKS* = object
    keySecret*: Option[string]
    cipherAlg*: Option[QCryptoCipherAlgo]
    cipherMode*: Option[QCryptoCipherMode]
    ivgenAlg*: Option[QCryptoIVGenAlgo]
    ivgenHashAlg*: Option[QCryptoHashAlgo]
    hashAlg*: Option[QCryptoHashAlgo]
    iterTime*: Option[int64]
    file*: Option[BlockdevRef]
    header*: Option[BlockdevRef]
    size*: uint64
    preallocation*: Option[PreallocMode]

  BlockdevCreateOptionsNfs* = object
    location*: BlockdevOptionsNfs
    size*: uint64

  BlockdevCreateOptionsParallels* = object
    file*: BlockdevRef
    size*: uint64
    clusterSize*: Option[uint64]

  BlockdevCreateOptionsQcow* = object
    file*: BlockdevRef
    size*: uint64
    backingFile*: Option[string]
    encrypt*: Option[QCryptoBlockCreateOptions]

  BlockdevCreateOptionsQcow2* = object
    file*: BlockdevRef
    dataFile*: Option[BlockdevRef]
    dataFileRaw*: Option[bool]
    extendedL2*: Option[bool]
    size*: uint64
    version*: Option[BlockdevQcow2Version]
    backingFile*: Option[string]
    backingFmt*: Option[BlockdevDriver]
    encrypt*: Option[QCryptoBlockCreateOptions]
    clusterSize*: Option[uint64]
    preallocation*: Option[PreallocMode]
    lazyRefcounts*: Option[bool]
    refcountBits*: Option[int64]
    compressionType*: Option[Qcow2CompressionType]

  BlockdevCreateOptionsQed* = object
    file*: BlockdevRef
    size*: uint64
    backingFile*: Option[string]
    backingFmt*: Option[BlockdevDriver]
    clusterSize*: Option[uint64]
    tableSize*: Option[int64]

  BlockdevCreateOptionsRbd* = object
    location*: BlockdevOptionsRbd
    size*: uint64
    clusterSize*: Option[uint64]
    encrypt*: Option[RbdEncryptionCreateOptions]

  BlockdevCreateOptionsVmdk* = object
    file*: BlockdevRef
    size*: uint64
    extents*: Option[seq[BlockdevRef]]
    subformat*: Option[BlockdevVmdkSubformat]
    backingFile*: Option[string]
    adapterType*: Option[BlockdevVmdkAdapterType]
    hwversion*: Option[string]
    toolsversion*: Option[string]
    zeroedGrain*: Option[bool]

  BlockdevCreateOptionsSsh* = object
    location*: BlockdevOptionsSsh
    size*: uint64

  BlockdevCreateOptionsVdi* = object
    file*: BlockdevRef
    size*: uint64
    preallocation*: Option[PreallocMode]

  BlockdevCreateOptionsVhdx* = object
    file*: BlockdevRef
    size*: uint64
    logSize*: Option[uint64]
    blockSize*: Option[uint64]
    subformat*: Option[BlockdevVhdxSubformat]
    blockStateZero*: Option[bool]

  BlockdevCreateOptionsVpc* = object
    file*: BlockdevRef
    size*: uint64
    subformat*: Option[BlockdevVpcSubformat]
    forceSize*: Option[bool]

  BlockdevCreateOptions* = object
    case driver*: BlockdevDriver
    of BlockdevDriver.File:
      file*: BlockdevCreateOptionsFile
    of BlockdevDriver.Gluster:
      gluster*: BlockdevCreateOptionsGluster
    of BlockdevDriver.Luks:
      luks*: BlockdevCreateOptionsLUKS
    of BlockdevDriver.Nfs:
      nfs*: BlockdevCreateOptionsNfs
    of BlockdevDriver.Parallels:
      parallels*: BlockdevCreateOptionsParallels
    of BlockdevDriver.Qcow:
      qcow*: BlockdevCreateOptionsQcow
    of BlockdevDriver.Qcow2:
      qcow2*: BlockdevCreateOptionsQcow2
    of BlockdevDriver.Qed:
      qed*: BlockdevCreateOptionsQed
    of BlockdevDriver.Rbd:
      rbd*: BlockdevCreateOptionsRbd
    of BlockdevDriver.Ssh:
      ssh*: BlockdevCreateOptionsSsh
    of BlockdevDriver.Vdi:
      vdi*: BlockdevCreateOptionsVdi
    of BlockdevDriver.Vhdx:
      vhdx*: BlockdevCreateOptionsVhdx
    of BlockdevDriver.Vmdk:
      vmdk*: BlockdevCreateOptionsVmdk
    of BlockdevDriver.Vpc:
      vpc*: BlockdevCreateOptionsVpc
    of BlockdevDriver.Blkdebug: discard
    of BlockdevDriver.Blklogwrites: discard
    of BlockdevDriver.Blkreplay: discard
    of BlockdevDriver.Blkverify: discard
    of BlockdevDriver.Bochs: discard
    of BlockdevDriver.Cloop: discard
    of BlockdevDriver.Compress: discard
    of BlockdevDriver.CopyBeforeWrite: discard
    of BlockdevDriver.CopyOnRead: discard
    of BlockdevDriver.Dmg: discard
    of BlockdevDriver.SnapshotAccess: discard
    of BlockdevDriver.Ftp: discard
    of BlockdevDriver.Ftps: discard
    of BlockdevDriver.HostCdrom: discard
    of BlockdevDriver.HostDevice: discard
    of BlockdevDriver.Http: discard
    of BlockdevDriver.Https: discard
    of BlockdevDriver.IoUring: discard
    of BlockdevDriver.Iscsi: discard
    of BlockdevDriver.Nbd: discard
    of BlockdevDriver.NullAio: discard
    of BlockdevDriver.NullCo: discard
    of BlockdevDriver.Nvme: discard
    of BlockdevDriver.NvmeIoUring: discard
    of BlockdevDriver.Preallocate: discard
    of BlockdevDriver.Quorum: discard
    of BlockdevDriver.Raw: discard
    of BlockdevDriver.Replication: discard
    of BlockdevDriver.Throttle: discard
    of BlockdevDriver.VirtioBlkVfioPci: discard
    of BlockdevDriver.VirtioBlkVhostUser: discard
    of BlockdevDriver.VirtioBlkVhostVdpa: discard
    of BlockdevDriver.Vvfat: discard

  BlockdevAmendOptionsLUKS* = object
    state*: QCryptoBlockLUKSKeyslotState
    newSecret*: Option[string]
    oldSecret*: Option[string]
    keyslot*: Option[int64]
    iterTime*: Option[int64]
    secret*: Option[string]

  BlockdevAmendOptionsQcow2* = object
    encrypt*: Option[QCryptoBlockAmendOptions]

  BlockdevAmendOptions* = object
    case driver*: BlockdevDriver
    of BlockdevDriver.Luks:
      luks*: BlockdevAmendOptionsLUKS
    of BlockdevDriver.Qcow2:
      qcow2*: BlockdevAmendOptionsQcow2
    of BlockdevDriver.Blkdebug: discard
    of BlockdevDriver.Blklogwrites: discard
    of BlockdevDriver.Blkreplay: discard
    of BlockdevDriver.Blkverify: discard
    of BlockdevDriver.Bochs: discard
    of BlockdevDriver.Cloop: discard
    of BlockdevDriver.Compress: discard
    of BlockdevDriver.CopyBeforeWrite: discard
    of BlockdevDriver.CopyOnRead: discard
    of BlockdevDriver.Dmg: discard
    of BlockdevDriver.File: discard
    of BlockdevDriver.SnapshotAccess: discard
    of BlockdevDriver.Ftp: discard
    of BlockdevDriver.Ftps: discard
    of BlockdevDriver.Gluster: discard
    of BlockdevDriver.HostCdrom: discard
    of BlockdevDriver.HostDevice: discard
    of BlockdevDriver.Http: discard
    of BlockdevDriver.Https: discard
    of BlockdevDriver.IoUring: discard
    of BlockdevDriver.Iscsi: discard
    of BlockdevDriver.Nbd: discard
    of BlockdevDriver.Nfs: discard
    of BlockdevDriver.NullAio: discard
    of BlockdevDriver.NullCo: discard
    of BlockdevDriver.Nvme: discard
    of BlockdevDriver.NvmeIoUring: discard
    of BlockdevDriver.Parallels: discard
    of BlockdevDriver.Preallocate: discard
    of BlockdevDriver.Qcow: discard
    of BlockdevDriver.Qed: discard
    of BlockdevDriver.Quorum: discard
    of BlockdevDriver.Raw: discard
    of BlockdevDriver.Rbd: discard
    of BlockdevDriver.Replication: discard
    of BlockdevDriver.Ssh: discard
    of BlockdevDriver.Throttle: discard
    of BlockdevDriver.Vdi: discard
    of BlockdevDriver.Vhdx: discard
    of BlockdevDriver.VirtioBlkVfioPci: discard
    of BlockdevDriver.VirtioBlkVhostUser: discard
    of BlockdevDriver.VirtioBlkVhostVdpa: discard
    of BlockdevDriver.Vmdk: discard
    of BlockdevDriver.Vpc: discard
    of BlockdevDriver.Vvfat: discard

  BlockdevSnapshotInternal* = object
    device*: string
    name*: string

  DummyBlockCoreForceArrays* = object
    unusedBlockGraphInfo*: seq[BlockGraphInfo]

  PRManagerInfo* = object
    id*: string
    connected*: bool

  NbdServerOptionsBase* = object
    handshakeMaxSeconds*: Option[uint32]
    tlsCreds*: Option[string]
    tlsAuthz*: Option[string]
    maxConnections*: Option[uint32]

  NbdServerOptions* = object
    handshakeMaxSeconds*: Option[uint32]
    tlsCreds*: Option[string]
    tlsAuthz*: Option[string]
    maxConnections*: Option[uint32]
    `addr`*: SocketAddress

  NbdServerOptionsLegacy* = object
    handshakeMaxSeconds*: Option[uint32]
    tlsCreds*: Option[string]
    tlsAuthz*: Option[string]
    maxConnections*: Option[uint32]
    `addr`*: SocketAddressLegacy

  BlockExportOptionsNbdBase* = object
    name*: Option[string]
    description*: Option[string]

  BlockExportOptionsNbd* = object
    name*: Option[string]
    description*: Option[string]
    bitmaps*: Option[seq[BlockDirtyBitmapOrStr]]
    allocationDepth*: Option[bool]

  BlockExportOptionsVhostUserBlk* = object
    `addr`*: SocketAddress
    logicalBlockSize*: Option[uint64]
    numQueues*: Option[uint16]

  BlockExportOptionsFuse* = object
    mountpoint*: string
    growable*: Option[bool]
    allowOther*: Option[FuseExportAllowOther]

  BlockExportOptionsVduseBlk* = object
    name*: string
    numQueues*: Option[uint16]
    queueSize*: Option[uint16]
    logicalBlockSize*: Option[uint64]
    serial*: Option[string]

  NbdServerAddOptions* = object
    name*: Option[string]
    description*: Option[string]
    device*: string
    writable*: Option[bool]
    bitmap*: Option[string]

  BlockExportOptions* = object
    id*: string
    fixedIothread*: Option[bool]
    iothread*: Option[BlockExportIothreads]
    nodeName*: string
    writable*: Option[bool]
    writethrough*: Option[bool]
    allowInactive*: Option[bool]
    case `type`*: BlockExportType
    of BlockExportType.Nbd:
      nbd*: BlockExportOptionsNbd
    of BlockExportType.VhostUserBlk:
      vhostUserBlk*: BlockExportOptionsVhostUserBlk
    of BlockExportType.Fuse:
      fuse*: BlockExportOptionsFuse
    of BlockExportType.VduseBlk:
      vduseBlk*: BlockExportOptionsVduseBlk

  BlockExportIothreads* = object
    case kind*: BlockExportIothreadsKind
    of BlockExportIothreadsKind.Single:
      single*: string
    of BlockExportIothreadsKind.Multi:
      multi*: seq[string]

  BlockExportInfo* = object
    id*: string
    `type`*: BlockExportType
    nodeName*: string
    shuttingDown*: bool

  ChardevInfo* = object
    label*: string
    filename*: string
    frontendOpen*: bool

  ChardevBackendInfo* = object
    name*: string

  ChardevCommon* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]

  ChardevFile* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    `in`*: Option[string]
    `out`*: string
    append*: Option[bool]

  ChardevHostdev* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    device*: string

  ChardevSocket* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    `addr`*: SocketAddressLegacy
    tlsCreds*: Option[string]
    tlsAuthz*: Option[string]
    server*: Option[bool]
    wait*: Option[bool]
    nodelay*: Option[bool]
    telnet*: Option[bool]
    tn3270*: Option[bool]
    websocket*: Option[bool]
    reconnectMs*: Option[int64]

  ChardevUdp* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    remote*: SocketAddressLegacy
    local*: Option[SocketAddressLegacy]

  ChardevMux* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    chardev*: string

  ChardevHub* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    chardevs*: seq[string]

  ChardevStdio* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    signal*: Option[bool]

  ChardevSpiceChannel* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    `type`*: string

  ChardevSpicePort* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    fqdn*: string

  ChardevDBus* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    name*: string

  ChardevVC* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    width*: Option[int64]
    height*: Option[int64]
    cols*: Option[int64]
    rows*: Option[int64]

  ChardevRingbuf* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    size*: Option[int64]

  ChardevQemuVDAgent* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    mouse*: Option[bool]
    clipboard*: Option[bool]

  ChardevPty* = object
    logfile*: Option[string]
    logappend*: Option[bool]
    logtimestamp*: Option[bool]
    path*: Option[string]

  ChardevFileWrapper* = object
    data*: ChardevFile

  ChardevHostdevWrapper* = object
    data*: ChardevHostdev

  ChardevSocketWrapper* = object
    data*: ChardevSocket

  ChardevUdpWrapper* = object
    data*: ChardevUdp

  ChardevCommonWrapper* = object
    data*: ChardevCommon

  ChardevMuxWrapper* = object
    data*: ChardevMux

  ChardevHubWrapper* = object
    data*: ChardevHub

  ChardevStdioWrapper* = object
    data*: ChardevStdio

  ChardevSpiceChannelWrapper* = object
    data*: ChardevSpiceChannel

  ChardevSpicePortWrapper* = object
    data*: ChardevSpicePort

  ChardevQemuVDAgentWrapper* = object
    data*: ChardevQemuVDAgent

  ChardevDBusWrapper* = object
    data*: ChardevDBus

  ChardevVCWrapper* = object
    data*: ChardevVC

  ChardevRingbufWrapper* = object
    data*: ChardevRingbuf

  ChardevPtyWrapper* = object
    data*: ChardevPty

  ChardevBackend* = object
    case `type`*: ChardevBackendKind
    of ChardevBackendKind.File:
      file*: ChardevFileWrapper
    of ChardevBackendKind.Serial:
      serial*: ChardevHostdevWrapper
    of ChardevBackendKind.Parallel:
      parallel*: ChardevHostdevWrapper
    of ChardevBackendKind.Pipe:
      pipe*: ChardevHostdevWrapper
    of ChardevBackendKind.Socket:
      socket*: ChardevSocketWrapper
    of ChardevBackendKind.Udp:
      udp*: ChardevUdpWrapper
    of ChardevBackendKind.Pty:
      pty*: ChardevPtyWrapper
    of ChardevBackendKind.Null:
      null*: ChardevCommonWrapper
    of ChardevBackendKind.Mux:
      mux*: ChardevMuxWrapper
    of ChardevBackendKind.Hub:
      hub*: ChardevHubWrapper
    of ChardevBackendKind.Msmouse:
      msmouse*: ChardevCommonWrapper
    of ChardevBackendKind.Wctablet:
      wctablet*: ChardevCommonWrapper
    of ChardevBackendKind.Braille:
      braille*: ChardevCommonWrapper
    of ChardevBackendKind.Testdev:
      testdev*: ChardevCommonWrapper
    of ChardevBackendKind.Stdio:
      stdio*: ChardevStdioWrapper
    of ChardevBackendKind.Console:
      console*: ChardevCommonWrapper
    of ChardevBackendKind.Spicevmc:
      spicevmc*: ChardevSpiceChannelWrapper
    of ChardevBackendKind.Spiceport:
      spiceport*: ChardevSpicePortWrapper
    of ChardevBackendKind.QemuVdagent:
      qemuVdagent*: ChardevQemuVDAgentWrapper
    of ChardevBackendKind.Dbus:
      dbus*: ChardevDBusWrapper
    of ChardevBackendKind.Vc:
      vc*: ChardevVCWrapper
    of ChardevBackendKind.Ringbuf:
      ringbuf*: ChardevRingbufWrapper
    of ChardevBackendKind.Memory:
      memory*: ChardevRingbufWrapper

  ChardevReturn* = object
    pty*: Option[string]

  DumpQueryResult* = object
    status*: DumpStatus
    completed*: int64
    total*: int64

  DumpGuestMemoryCapability* = object
    formats*: seq[DumpGuestMemoryFormat]

  NetLegacyNicOptions* = object
    netdev*: Option[string]
    macaddr*: Option[string]
    model*: Option[string]
    `addr`*: Option[string]
    vectors*: Option[uint32]

  String* = object
    str*: string

  NetDevPasstOptions* = object
    path*: Option[string]
    quiet*: Option[bool]
    vhostUser*: Option[bool]
    mtu*: Option[int64]
    address*: Option[string]
    netmask*: Option[string]
    mac*: Option[string]
    gateway*: Option[string]
    `interface`*: Option[string]
    outbound*: Option[string]
    outboundIf4*: Option[string]
    outboundIf6*: Option[string]
    dns*: Option[string]
    search*: Option[seq[String]]
    fqdn*: Option[string]
    dhcpDns*: Option[bool]
    dhcpSearch*: Option[bool]
    mapHostLoopback*: Option[string]
    mapGuestAddr*: Option[string]
    dnsForward*: Option[string]
    dnsHost*: Option[string]
    tcp*: Option[bool]
    udp*: Option[bool]
    icmp*: Option[bool]
    dhcp*: Option[bool]
    ndp*: Option[bool]
    dhcpv6*: Option[bool]
    ra*: Option[bool]
    freebind*: Option[bool]
    ipv4*: Option[bool]
    ipv6*: Option[bool]
    tcpPorts*: Option[seq[String]]
    udpPorts*: Option[seq[String]]
    param*: Option[seq[String]]

  NetdevUserOptions* = object
    hostname*: Option[string]
    restrict*: Option[bool]
    ipv4*: Option[bool]
    ipv6*: Option[bool]
    ip*: Option[string]
    net*: Option[string]
    host*: Option[string]
    tftp*: Option[string]
    bootfile*: Option[string]
    dhcpstart*: Option[string]
    dns*: Option[string]
    dnssearch*: Option[seq[String]]
    domainname*: Option[string]
    ipv6Prefix*: Option[string]
    ipv6Prefixlen*: Option[int64]
    ipv6Host*: Option[string]
    ipv6Dns*: Option[string]
    smb*: Option[string]
    smbserver*: Option[string]
    hostfwd*: Option[seq[String]]
    guestfwd*: Option[seq[String]]
    tftpServerName*: Option[string]

  NetdevTapOptions* = object
    ifname*: Option[string]
    fd*: Option[string]
    fds*: Option[string]
    script*: Option[string]
    downscript*: Option[string]
    br*: Option[string]
    helper*: Option[string]
    sndbuf*: Option[uint64]
    vnetHdr*: Option[bool]
    vhost*: Option[bool]
    vhostfd*: Option[string]
    vhostfds*: Option[string]
    vhostforce*: Option[bool]
    queues*: Option[uint32]
    pollUs*: Option[uint32]

  NetdevSocketOptions* = object
    fd*: Option[string]
    listen*: Option[string]
    connect*: Option[string]
    mcast*: Option[string]
    localaddr*: Option[string]
    udp*: Option[string]

  NetdevL2TPv3Options* = object
    src*: string
    dst*: string
    srcport*: Option[string]
    dstport*: Option[string]
    ipv6*: Option[bool]
    udp*: Option[bool]
    cookie64*: Option[bool]
    counter*: Option[bool]
    pincounter*: Option[bool]
    txcookie*: Option[uint64]
    rxcookie*: Option[uint64]
    txsession*: uint32
    rxsession*: Option[uint32]
    offset*: Option[uint32]

  NetdevVdeOptions* = object
    sock*: Option[string]
    port*: Option[uint16]
    group*: Option[string]
    mode*: Option[uint16]

  NetdevBridgeOptions* = object
    br*: Option[string]
    helper*: Option[string]

  NetdevHubPortOptions* = object
    hubid*: int32
    netdev*: Option[string]

  NetdevNetmapOptions* = object
    ifname*: string
    devname*: Option[string]

  NetdevAFXDPOptions* = object
    ifname*: string
    mode*: Option[AFXDPMode]
    forceCopy*: Option[bool]
    queues*: Option[int64]
    startQueue*: Option[int64]
    inhibit*: Option[bool]
    sockFds*: Option[string]
    mapPath*: Option[string]
    mapStartIndex*: Option[int32]

  NetdevVhostUserOptions* = object
    chardev*: string
    vhostforce*: Option[bool]
    queues*: Option[int64]

  NetdevVhostVDPAOptions* = object
    vhostdev*: Option[string]
    vhostfd*: Option[string]
    queues*: Option[int64]
    xSvq*: Option[bool]

  NetdevVmnetHostOptions* = object
    startAddress*: Option[string]
    endAddress*: Option[string]
    subnetMask*: Option[string]
    isolated*: Option[bool]
    netUuid*: Option[string]

  NetdevVmnetSharedOptions* = object
    startAddress*: Option[string]
    endAddress*: Option[string]
    subnetMask*: Option[string]
    isolated*: Option[bool]
    nat66Prefix*: Option[string]

  NetdevVmnetBridgedOptions* = object
    ifname*: string
    isolated*: Option[bool]

  NetdevStreamOptions* = object
    `addr`*: SocketAddress
    server*: Option[bool]
    reconnectMs*: Option[int64]

  NetdevDgramOptions* = object
    local*: Option[SocketAddress]
    remote*: Option[SocketAddress]

  Netdev* = object
    id*: string
    case `type`*: NetClientDriver
    of NetClientDriver.Nic:
      nic*: NetLegacyNicOptions
    of NetClientDriver.Passt:
      passt*: NetDevPasstOptions
    of NetClientDriver.User:
      user*: NetdevUserOptions
    of NetClientDriver.Tap:
      tap*: NetdevTapOptions
    of NetClientDriver.L2tpv3:
      l2tpv3*: NetdevL2TPv3Options
    of NetClientDriver.Socket:
      socket*: NetdevSocketOptions
    of NetClientDriver.Stream:
      stream*: NetdevStreamOptions
    of NetClientDriver.Dgram:
      dgram*: NetdevDgramOptions
    of NetClientDriver.Vde:
      vde*: NetdevVdeOptions
    of NetClientDriver.Bridge:
      bridge*: NetdevBridgeOptions
    of NetClientDriver.Hubport:
      hubport*: NetdevHubPortOptions
    of NetClientDriver.Netmap:
      netmap*: NetdevNetmapOptions
    of NetClientDriver.AfXdp:
      afXdp*: NetdevAFXDPOptions
    of NetClientDriver.VhostUser:
      vhostUser*: NetdevVhostUserOptions
    of NetClientDriver.VhostVdpa:
      vhostVdpa*: NetdevVhostVDPAOptions
    of NetClientDriver.VmnetHost:
      vmnetHost*: NetdevVmnetHostOptions
    of NetClientDriver.VmnetShared:
      vmnetShared*: NetdevVmnetSharedOptions
    of NetClientDriver.VmnetBridged:
      vmnetBridged*: NetdevVmnetBridgedOptions
    of NetClientDriver.None: discard

  RxFilterInfo* = object
    name*: string
    promiscuous*: bool
    multicast*: RxState
    unicast*: RxState
    vlan*: RxState
    broadcastAllowed*: bool
    multicastOverflow*: bool
    unicastOverflow*: bool
    mainMac*: string
    vlanTable*: seq[int64]
    unicastTable*: seq[string]
    multicastTable*: seq[string]

  AnnounceParameters* = object
    initial*: int64
    max*: int64
    rounds*: int64
    step*: int64
    interfaces*: Option[seq[string]]
    id*: Option[string]

  EbpfObject* = object
    `object`*: string

  RockerSwitch* = object
    name*: string
    id*: uint64
    ports*: uint32

  RockerPort* = object
    name*: string
    enabled*: bool
    linkUp*: bool
    speed*: uint32
    duplex*: RockerPortDuplex
    autoneg*: RockerPortAutoneg

  RockerOfDpaFlowKey* = object
    priority*: uint32
    tblId*: uint32
    inPport*: Option[uint32]
    tunnelId*: Option[uint32]
    vlanId*: Option[uint16]
    ethType*: Option[uint16]
    ethSrc*: Option[string]
    ethDst*: Option[string]
    ipProto*: Option[uint8]
    ipTos*: Option[uint8]
    ipDst*: Option[string]

  RockerOfDpaFlowMask* = object
    inPport*: Option[uint32]
    tunnelId*: Option[uint32]
    vlanId*: Option[uint16]
    ethSrc*: Option[string]
    ethDst*: Option[string]
    ipProto*: Option[uint8]
    ipTos*: Option[uint8]

  RockerOfDpaFlowAction* = object
    gotoTbl*: Option[uint32]
    groupId*: Option[uint32]
    tunnelLport*: Option[uint32]
    vlanId*: Option[uint16]
    newVlanId*: Option[uint16]
    outPport*: Option[uint32]

  RockerOfDpaFlow* = object
    cookie*: uint64
    hits*: uint64
    key*: RockerOfDpaFlowKey
    mask*: RockerOfDpaFlowMask
    action*: RockerOfDpaFlowAction

  RockerOfDpaGroup* = object
    id*: uint32
    `type`*: uint8
    vlanId*: Option[uint16]
    pport*: Option[uint32]
    index*: Option[uint32]
    outPport*: Option[uint32]
    groupId*: Option[uint32]
    setVlanId*: Option[uint16]
    popVlan*: Option[uint8]
    groupIds*: Option[seq[uint32]]
    setEthSrc*: Option[string]
    setEthDst*: Option[string]
    ttlCheck*: Option[uint8]

  TPMPassthroughOptions* = object
    path*: Option[string]
    cancelPath*: Option[string]

  TPMEmulatorOptions* = object
    chardev*: string

  TPMPassthroughOptionsWrapper* = object
    data*: TPMPassthroughOptions

  TPMEmulatorOptionsWrapper* = object
    data*: TPMEmulatorOptions

  TpmTypeOptions* = object
    case `type`*: TpmType
    of TpmType.Passthrough:
      passthrough*: TPMPassthroughOptionsWrapper
    of TpmType.Emulator:
      emulator*: TPMEmulatorOptionsWrapper

  TPMInfo* = object
    id*: string
    model*: TpmModel
    options*: TpmTypeOptions

  SetPasswordOptions* = object
    password*: string
    connected*: Option[SetPasswordAction]
    case protocol*: DisplayProtocol
    of DisplayProtocol.Vnc:
      vnc*: SetPasswordOptionsVnc
    of DisplayProtocol.Spice: discard

  SetPasswordOptionsVnc* = object
    display*: Option[string]

  ExpirePasswordOptions* = object
    time*: string
    case protocol*: DisplayProtocol
    of DisplayProtocol.Vnc:
      vnc*: ExpirePasswordOptionsVnc
    of DisplayProtocol.Spice: discard

  ExpirePasswordOptionsVnc* = object
    display*: Option[string]

  SpiceBasicInfo* = object
    host*: string
    port*: string
    family*: NetworkAddressFamily

  SpiceServerInfo* = object
    host*: string
    port*: string
    family*: NetworkAddressFamily
    auth*: Option[string]

  SpiceChannel* = object
    host*: string
    port*: string
    family*: NetworkAddressFamily
    connectionId*: int64
    channelType*: int64
    channelId*: int64
    tls*: bool

  SpiceInfo* = object
    enabled*: bool
    migrated*: bool
    host*: Option[string]
    port*: Option[int64]
    tlsPort*: Option[int64]
    auth*: Option[string]
    compiledVersion*: Option[string]
    mouseMode*: SpiceQueryMouseMode
    channels*: Option[seq[SpiceChannel]]

  VncBasicInfo* = object
    host*: string
    service*: string
    family*: NetworkAddressFamily
    websocket*: bool

  VncServerInfo* = object
    host*: string
    service*: string
    family*: NetworkAddressFamily
    websocket*: bool
    auth*: Option[string]

  VncClientInfo* = object
    host*: string
    service*: string
    family*: NetworkAddressFamily
    websocket*: bool
    x509Dname*: Option[string]
    saslUsername*: Option[string]

  VncInfo* = object
    enabled*: bool
    host*: Option[string]
    family*: Option[NetworkAddressFamily]
    service*: Option[string]
    auth*: Option[string]
    clients*: Option[seq[VncClientInfo]]

  VncServerInfo2* = object
    host*: string
    service*: string
    family*: NetworkAddressFamily
    websocket*: bool
    auth*: VncPrimaryAuth
    vencrypt*: Option[VncVencryptSubAuth]

  VncInfo2* = object
    id*: string
    server*: seq[VncServerInfo2]
    clients*: seq[VncClientInfo]
    auth*: VncPrimaryAuth
    vencrypt*: Option[VncVencryptSubAuth]
    display*: Option[string]

  MouseInfo* = object
    name*: string
    index*: int64
    current*: bool
    absolute*: bool

  IntWrapper* = object
    data*: int64

  QKeyCodeWrapper* = object
    data*: QKeyCode

  KeyValue* = object
    case `type`*: KeyValueKind
    of KeyValueKind.Number:
      number*: IntWrapper
    of KeyValueKind.Qcode:
      qcode*: QKeyCodeWrapper

  InputKeyEvent* = object
    key*: KeyValue
    down*: bool

  InputBtnEvent* = object
    button*: InputButton
    down*: bool

  InputMoveEvent* = object
    axis*: InputAxis
    value*: int64

  InputMultiTouchEvent* = object
    `type`*: InputMultiTouchType
    slot*: int64
    trackingId*: int64
    axis*: InputAxis
    value*: int64

  InputKeyEventWrapper* = object
    data*: InputKeyEvent

  InputBtnEventWrapper* = object
    data*: InputBtnEvent

  InputMoveEventWrapper* = object
    data*: InputMoveEvent

  InputMultiTouchEventWrapper* = object
    data*: InputMultiTouchEvent

  InputEvent* = object
    case `type`*: InputEventKind
    of InputEventKind.Key:
      key*: InputKeyEventWrapper
    of InputEventKind.Btn:
      btn*: InputBtnEventWrapper
    of InputEventKind.Rel:
      rel*: InputMoveEventWrapper
    of InputEventKind.Abs:
      abs*: InputMoveEventWrapper
    of InputEventKind.Mtt:
      mtt*: InputMultiTouchEventWrapper

  DisplayGTK* = object
    grabOnHover*: Option[bool]
    zoomToFit*: Option[bool]
    showTabs*: Option[bool]
    showMenubar*: Option[bool]
    keepAspectRatio*: Option[bool]
    scale*: Option[float64]

  DisplayEGLHeadless* = object
    rendernode*: Option[string]

  DisplayDBus* = object
    rendernode*: Option[string]
    `addr`*: Option[string]
    p2p*: Option[bool]
    audiodev*: Option[string]

  DisplayCurses* = object
    charset*: Option[string]

  DisplayCocoa* = object
    leftCommandKey*: Option[bool]
    fullGrab*: Option[bool]
    swapOptCmd*: Option[bool]
    zoomToFit*: Option[bool]
    zoomInterpolation*: Option[bool]

  DisplaySDL* = object
    grabMod*: Option[HotKeyMod]

  DisplayOptions* = object
    fullScreen*: Option[bool]
    windowClose*: Option[bool]
    showCursor*: Option[bool]
    gl*: Option[DisplayGLMode]
    case `type`*: DisplayType
    of DisplayType.Gtk:
      gtk*: DisplayGTK
    of DisplayType.Cocoa:
      cocoa*: DisplayCocoa
    of DisplayType.Curses:
      curses*: DisplayCurses
    of DisplayType.EglHeadless:
      eglHeadless*: DisplayEGLHeadless
    of DisplayType.Dbus:
      dbus*: DisplayDBus
    of DisplayType.Sdl:
      sdl*: DisplaySDL
    of DisplayType.Default: discard
    of DisplayType.None: discard
    of DisplayType.SpiceApp: discard

  DisplayReloadOptionsVNC* = object
    tlsCerts*: Option[bool]

  DisplayReloadOptions* = object
    case `type`*: DisplayReloadType
    of DisplayReloadType.Vnc:
      vnc*: DisplayReloadOptionsVNC

  DisplayUpdateOptionsVNC* = object
    addresses*: Option[seq[SocketAddress]]

  DisplayUpdateOptions* = object
    case `type`*: DisplayUpdateType
    of DisplayUpdateType.Vnc:
      vnc*: DisplayUpdateOptionsVNC

  QAuthZListRule* = object
    match*: string
    policy*: QAuthZListPolicy
    format*: Option[QAuthZListFormat]

  AuthZListProperties* = object
    policy*: Option[QAuthZListPolicy]
    rules*: Option[seq[QAuthZListRule]]

  AuthZListFileProperties* = object
    filename*: string
    refresh*: Option[bool]

  AuthZPAMProperties* = object
    service*: string

  AuthZSimpleProperties* = object
    identity*: string

  MigrationStats* = object
    transferred*: int64
    remaining*: int64
    total*: int64
    duplicate*: int64
    normal*: int64
    normalBytes*: int64
    dirtyPagesRate*: int64
    mbps*: float64
    dirtySyncCount*: int64
    postcopyRequests*: int64
    pageSize*: int64
    multifdBytes*: uint64
    pagesPerSecond*: uint64
    precopyBytes*: uint64
    downtimeBytes*: uint64
    postcopyBytes*: uint64
    dirtySyncMissedZeroCopy*: uint64

  XBZRLECacheStats* = object
    cacheSize*: uint64
    bytes*: int64
    pages*: int64
    cacheMiss*: int64
    cacheMissRate*: float64
    encodingRate*: float64
    overflow*: int64

  CompressionStats* = object
    pages*: int64
    busy*: int64
    busyRate*: float64
    compressedSize*: int64
    compressionRate*: float64

  VfioStats* = object
    transferred*: int64

  MigrationInfo* = object
    status*: Option[MigrationStatus]
    ram*: Option[MigrationStats]
    vfio*: Option[VfioStats]
    xbzrleCache*: Option[XBZRLECacheStats]
    totalTime*: Option[int64]
    expectedDowntime*: Option[int64]
    downtime*: Option[int64]
    setupTime*: Option[int64]
    cpuThrottlePercentage*: Option[int64]
    errorDesc*: Option[string]
    blockedReasons*: Option[seq[string]]
    postcopyBlocktime*: Option[uint32]
    postcopyVcpuBlocktime*: Option[seq[uint32]]
    postcopyLatency*: Option[uint64]
    postcopyLatencyDist*: Option[seq[uint64]]
    postcopyVcpuLatency*: Option[seq[uint64]]
    postcopyNonVcpuLatency*: Option[uint64]
    socketAddress*: Option[seq[SocketAddress]]
    dirtyLimitThrottleTimePerRound*: Option[uint64]
    dirtyLimitRingFullTime*: Option[uint64]

  MigrationCapabilityStatus* = object
    capability*: MigrationCapability
    state*: bool

  BitmapMigrationBitmapAliasTransform* = object
    persistent*: Option[bool]

  BitmapMigrationBitmapAlias* = object
    name*: string
    alias*: string
    transform*: Option[BitmapMigrationBitmapAliasTransform]

  BitmapMigrationNodeAlias* = object
    nodeName*: string
    alias*: string
    bitmaps*: seq[BitmapMigrationBitmapAlias]

  MigrationParameters* = object
    announceInitial*: Option[uint64]
    announceMax*: Option[uint64]
    announceRounds*: Option[uint64]
    announceStep*: Option[uint64]
    throttleTriggerThreshold*: Option[uint8]
    cpuThrottleInitial*: Option[uint8]
    cpuThrottleIncrement*: Option[uint8]
    cpuThrottleTailslow*: Option[bool]
    tlsCreds*: Option[StrOrNull]
    tlsHostname*: Option[StrOrNull]
    tlsAuthz*: Option[StrOrNull]
    maxBandwidth*: Option[uint64]
    availSwitchoverBandwidth*: Option[uint64]
    downtimeLimit*: Option[uint64]
    xCheckpointDelay*: Option[uint32]
    multifdChannels*: Option[uint8]
    xbzrleCacheSize*: Option[uint64]
    maxPostcopyBandwidth*: Option[uint64]
    maxCpuThrottle*: Option[uint8]
    multifdCompression*: Option[MultiFDCompression]
    multifdZlibLevel*: Option[uint8]
    multifdQatzipLevel*: Option[uint8]
    multifdZstdLevel*: Option[uint8]
    blockBitmapMapping*: Option[seq[BitmapMigrationNodeAlias]]
    xVcpuDirtyLimitPeriod*: Option[uint64]
    vcpuDirtyLimit*: Option[uint64]
    mode*: Option[MigMode]
    zeroPageDetection*: Option[ZeroPageDetection]
    directIo*: Option[bool]
    cprExecCommand*: Option[seq[string]]

  FileMigrationArgs* = object
    filename*: string
    offset*: uint64

  MigrationExecCommand* = object
    args*: seq[string]

  MigrationAddress* = object
    case transport*: MigrationAddressType
    of MigrationAddressType.Socket:
      socket*: SocketAddress
    of MigrationAddressType.Exec:
      exec*: MigrationExecCommand
    of MigrationAddressType.Rdma:
      rdma*: InetSocketAddress
    of MigrationAddressType.File:
      file*: FileMigrationArgs

  MigrationChannel* = object
    channelType*: MigrationChannelType
    `addr`*: MigrationAddress

  ReplicationStatus* = object
    error*: bool
    desc*: Option[string]

  COLOStatus* = object
    mode*: COLOMode
    lastMode*: COLOMode
    reason*: COLOExitReason

  DirtyRateVcpu* = object
    id*: int64
    dirtyRate*: int64

  DirtyRateInfo* = object
    dirtyRate*: Option[int64]
    status*: DirtyRateStatus
    startTime*: int64
    calcTime*: int64
    calcTimeUnit*: TimeUnit
    samplePages*: uint64
    mode*: DirtyRateMeasureMode
    vcpuDirtyRate*: Option[seq[DirtyRateVcpu]]

  DirtyLimitInfo* = object
    cpuIndex*: int64
    limitRate*: uint64
    currentRate*: uint64

  Abort* = object
    discard

  AbortWrapper* = object
    data*: Abort

  BlockDirtyBitmapAddWrapper* = object
    data*: BlockDirtyBitmapAdd

  BlockDirtyBitmapWrapper* = object
    data*: BlockDirtyBitmap

  BlockDirtyBitmapMergeWrapper* = object
    data*: BlockDirtyBitmapMerge

  BlockdevBackupWrapper* = object
    data*: BlockdevBackup

  BlockdevSnapshotWrapper* = object
    data*: BlockdevSnapshot

  BlockdevSnapshotInternalWrapper* = object
    data*: BlockdevSnapshotInternal

  BlockdevSnapshotSyncWrapper* = object
    data*: BlockdevSnapshotSync

  DriveBackupWrapper* = object
    data*: DriveBackup

  TransactionAction* = object
    case `type`*: TransactionActionKind
    of TransactionActionKind.Abort:
      abort*: AbortWrapper
    of TransactionActionKind.BlockDirtyBitmapAdd:
      blockDirtyBitmapAdd*: BlockDirtyBitmapAddWrapper
    of TransactionActionKind.BlockDirtyBitmapRemove:
      blockDirtyBitmapRemove*: BlockDirtyBitmapWrapper
    of TransactionActionKind.BlockDirtyBitmapClear:
      blockDirtyBitmapClear*: BlockDirtyBitmapWrapper
    of TransactionActionKind.BlockDirtyBitmapEnable:
      blockDirtyBitmapEnable*: BlockDirtyBitmapWrapper
    of TransactionActionKind.BlockDirtyBitmapDisable:
      blockDirtyBitmapDisable*: BlockDirtyBitmapWrapper
    of TransactionActionKind.BlockDirtyBitmapMerge:
      blockDirtyBitmapMerge*: BlockDirtyBitmapMergeWrapper
    of TransactionActionKind.BlockdevBackup:
      blockdevBackup*: BlockdevBackupWrapper
    of TransactionActionKind.BlockdevSnapshot:
      blockdevSnapshot*: BlockdevSnapshotWrapper
    of TransactionActionKind.BlockdevSnapshotInternalSync:
      blockdevSnapshotInternalSync*: BlockdevSnapshotInternalWrapper
    of TransactionActionKind.BlockdevSnapshotSync:
      blockdevSnapshotSync*: BlockdevSnapshotSyncWrapper
    of TransactionActionKind.DriveBackup:
      driveBackup*: DriveBackupWrapper

  TransactionProperties* = object
    completionMode*: Option[ActionCompletionMode]

  TraceEventInfo* = object
    name*: string
    state*: TraceEventState

  CompatPolicy* = object
    deprecatedInput*: Option[CompatPolicyInput]
    deprecatedOutput*: Option[CompatPolicyOutput]
    unstableInput*: Option[CompatPolicyInput]
    unstableOutput*: Option[CompatPolicyOutput]

  VersionTriple* = object
    major*: int64
    minor*: int64
    micro*: int64

  VersionInfo* = object
    qemu*: VersionTriple
    package*: string

  CommandInfo* = object
    name*: string

  MonitorOptions* = object
    id*: Option[string]
    mode*: Option[MonitorMode]
    pretty*: Option[bool]
    chardev*: string

  SchemaInfo* = object
    name*: string
    features*: Option[seq[string]]
    case metaType*: SchemaMetaType
    of SchemaMetaType.Builtin:
      builtin*: SchemaInfoBuiltin
    of SchemaMetaType.Enum:
      `enum`*: SchemaInfoEnum
    of SchemaMetaType.Array:
      array*: SchemaInfoArray
    of SchemaMetaType.Object:
      `object`*: SchemaInfoObject
    of SchemaMetaType.Alternate:
      alternate*: SchemaInfoAlternate
    of SchemaMetaType.Command:
      command*: SchemaInfoCommand
    of SchemaMetaType.Event:
      event*: SchemaInfoEvent

  SchemaInfoBuiltin* = object
    jsonType*: JSONType

  SchemaInfoEnum* = object
    members*: seq[SchemaInfoEnumMember]
    values*: seq[string]

  SchemaInfoEnumMember* = object
    name*: string
    features*: Option[seq[string]]

  SchemaInfoArray* = object
    elementType*: string

  SchemaInfoObject* = object
    members*: seq[SchemaInfoObjectMember]
    tag*: Option[string]
    variants*: Option[seq[SchemaInfoObjectVariant]]

  SchemaInfoObjectMember* = object
    name*: string
    `type`*: string
    default*: Option[JsonNode]
    features*: Option[seq[string]]

  SchemaInfoObjectVariant* = object
    `case`*: string
    `type`*: string

  SchemaInfoAlternate* = object
    members*: seq[SchemaInfoAlternateMember]

  SchemaInfoAlternateMember* = object
    `type`*: string

  SchemaInfoCommand* = object
    argType*: string
    retType*: string
    allowOob*: Option[bool]

  SchemaInfoEvent* = object
    argType*: string

  ObjectPropertyInfo* = object
    name*: string
    `type`*: string
    description*: Option[string]
    defaultValue*: Option[JsonNode]

  ObjectPropertyValue* = object
    name*: string
    `type`*: string
    value*: Option[JsonNode]

  ObjectPropertiesValues* = object
    properties*: seq[ObjectPropertyValue]

  ObjectTypeInfo* = object
    name*: string
    abstract*: Option[bool]
    parent*: Option[string]

  CanHostSocketcanProperties* = object
    `if`*: string
    canbus*: string

  ColoCompareProperties* = object
    primaryIn*: string
    secondaryIn*: string
    outdev*: string
    iothread*: string
    notifyDev*: Option[string]
    compareTimeout*: Option[uint64]
    expiredScanCycle*: Option[uint32]
    maxQueueSize*: Option[uint32]
    vnetHdrSupport*: Option[bool]

  CryptodevBackendProperties* = object
    queues*: Option[uint32]
    throttleBps*: Option[uint64]
    throttleOps*: Option[uint64]

  CryptodevVhostUserProperties* = object
    queues*: Option[uint32]
    throttleBps*: Option[uint64]
    throttleOps*: Option[uint64]
    chardev*: string

  DBusVMStateProperties* = object
    `addr`*: string
    idList*: Option[string]

  NetfilterProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]

  FilterBufferProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]
    interval*: uint32

  FilterDumpProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]
    file*: string
    maxlen*: Option[uint32]

  FilterMirrorProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]
    outdev*: string
    vnetHdrSupport*: Option[bool]

  FilterRedirectorProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]
    indev*: Option[string]
    outdev*: Option[string]
    vnetHdrSupport*: Option[bool]

  FilterRewriterProperties* = object
    netdev*: string
    queue*: Option[NetFilterDirection]
    status*: Option[string]
    position*: Option[string]
    insert*: Option[NetfilterInsert]
    vnetHdrSupport*: Option[bool]

  InputBarrierProperties* = object
    name*: string
    server*: Option[string]
    port*: Option[string]
    xOrigin*: Option[string]
    yOrigin*: Option[string]
    width*: Option[string]
    height*: Option[string]

  InputLinuxProperties* = object
    evdev*: string
    grabAll*: Option[bool]
    repeat*: Option[bool]
    grabToggle*: Option[GrabToggleKeys]

  EventLoopBaseProperties* = object
    aioMaxBatch*: Option[int64]
    threadPoolMin*: Option[int64]
    threadPoolMax*: Option[int64]

  IothreadProperties* = object
    aioMaxBatch*: Option[int64]
    threadPoolMin*: Option[int64]
    threadPoolMax*: Option[int64]
    pollMaxNs*: Option[int64]
    pollGrow*: Option[int64]
    pollShrink*: Option[int64]

  MainLoopProperties* = object
    aioMaxBatch*: Option[int64]
    threadPoolMin*: Option[int64]
    threadPoolMax*: Option[int64]

  MemoryBackendProperties* = object
    dump*: Option[bool]
    hostNodes*: Option[seq[uint16]]
    merge*: Option[bool]
    policy*: Option[HostMemPolicy]
    prealloc*: Option[bool]
    preallocThreads*: Option[uint32]
    preallocContext*: Option[string]
    share*: Option[bool]
    reserve*: Option[bool]
    size*: uint64
    xUseCanonicalPathForRamblockId*: Option[bool]

  MemoryBackendFileProperties* = object
    dump*: Option[bool]
    hostNodes*: Option[seq[uint16]]
    merge*: Option[bool]
    policy*: Option[HostMemPolicy]
    prealloc*: Option[bool]
    preallocThreads*: Option[uint32]
    preallocContext*: Option[string]
    share*: Option[bool]
    reserve*: Option[bool]
    size*: uint64
    xUseCanonicalPathForRamblockId*: Option[bool]
    align*: Option[uint64]
    offset*: Option[uint64]
    discardData*: Option[bool]
    memPath*: string
    pmem*: Option[bool]
    readonly*: Option[bool]
    rom*: Option[OnOffAuto]

  MemoryBackendMemfdProperties* = object
    dump*: Option[bool]
    hostNodes*: Option[seq[uint16]]
    merge*: Option[bool]
    policy*: Option[HostMemPolicy]
    prealloc*: Option[bool]
    preallocThreads*: Option[uint32]
    preallocContext*: Option[string]
    share*: Option[bool]
    reserve*: Option[bool]
    size*: uint64
    xUseCanonicalPathForRamblockId*: Option[bool]
    hugetlb*: Option[bool]
    hugetlbsize*: Option[uint64]
    seal*: Option[bool]

  MemoryBackendShmProperties* = object
    dump*: Option[bool]
    hostNodes*: Option[seq[uint16]]
    merge*: Option[bool]
    policy*: Option[HostMemPolicy]
    prealloc*: Option[bool]
    preallocThreads*: Option[uint32]
    preallocContext*: Option[string]
    share*: Option[bool]
    reserve*: Option[bool]
    size*: uint64
    xUseCanonicalPathForRamblockId*: Option[bool]

  MemoryBackendEpcProperties* = object
    dump*: Option[bool]
    hostNodes*: Option[seq[uint16]]
    merge*: Option[bool]
    policy*: Option[HostMemPolicy]
    prealloc*: Option[bool]
    preallocThreads*: Option[uint32]
    preallocContext*: Option[string]
    share*: Option[bool]
    reserve*: Option[bool]
    size*: uint64
    xUseCanonicalPathForRamblockId*: Option[bool]

  PrManagerHelperProperties* = object
    path*: string

  QtestProperties* = object
    chardev*: string
    log*: Option[string]

  RemoteObjectProperties* = object
    fd*: string
    devid*: string

  VfioUserServerProperties* = object
    socket*: SocketAddress
    device*: string

  IOMMUFDProperties* = object
    fd*: Option[string]

  AcpiGenericInitiatorProperties* = object
    pciDev*: string
    node*: uint32

  AcpiGenericPortProperties* = object
    pciBus*: string
    node*: uint32

  RngProperties* = object
    opened*: Option[bool]

  RngEgdProperties* = object
    opened*: Option[bool]
    chardev*: string

  RngRandomProperties* = object
    opened*: Option[bool]
    filename*: Option[string]

  IgvmCfgProperties* = object
    file*: string

  SevCommonProperties* = object
    sevDevice*: Option[string]
    cbitpos*: Option[uint32]
    reducedPhysBits*: uint32
    kernelHashes*: Option[bool]

  SevGuestProperties* = object
    sevDevice*: Option[string]
    cbitpos*: Option[uint32]
    reducedPhysBits*: uint32
    kernelHashes*: Option[bool]
    dhCertFile*: Option[string]
    sessionFile*: Option[string]
    policy*: Option[uint32]
    handle*: Option[uint32]
    legacyVmType*: Option[OnOffAuto]

  SevSnpGuestProperties* = object
    sevDevice*: Option[string]
    cbitpos*: Option[uint32]
    reducedPhysBits*: uint32
    kernelHashes*: Option[bool]
    policy*: Option[uint64]
    guestVisibleWorkarounds*: Option[string]
    idBlock*: Option[string]
    idAuth*: Option[string]
    authorKeyEnabled*: Option[bool]
    hostData*: Option[string]
    vcekDisabled*: Option[bool]

  TdxGuestProperties* = object
    attributes*: Option[uint64]
    septVeDisable*: Option[bool]
    mrconfigid*: Option[string]
    mrowner*: Option[string]
    mrownerconfig*: Option[string]
    quoteGenerationSocket*: Option[SocketAddress]

  ThreadContextProperties* = object
    cpuAffinity*: Option[seq[uint16]]
    nodeAffinity*: Option[seq[uint16]]

  ObjectOptions* = object
    id*: string
    case qomType*: ObjectType
    of ObjectType.AcpiGenericInitiator:
      acpiGenericInitiator*: AcpiGenericInitiatorProperties
    of ObjectType.AcpiGenericPort:
      acpiGenericPort*: AcpiGenericPortProperties
    of ObjectType.AuthzList:
      authzList*: AuthZListProperties
    of ObjectType.AuthzListfile:
      authzListfile*: AuthZListFileProperties
    of ObjectType.AuthzPam:
      authzPam*: AuthZPAMProperties
    of ObjectType.AuthzSimple:
      authzSimple*: AuthZSimpleProperties
    of ObjectType.CanHostSocketcan:
      canHostSocketcan*: CanHostSocketcanProperties
    of ObjectType.ColoCompare:
      coloCompare*: ColoCompareProperties
    of ObjectType.CryptodevBackend:
      cryptodevBackend*: CryptodevBackendProperties
    of ObjectType.CryptodevBackendBuiltin:
      cryptodevBackendBuiltin*: CryptodevBackendProperties
    of ObjectType.CryptodevBackendLkcf:
      cryptodevBackendLkcf*: CryptodevBackendProperties
    of ObjectType.CryptodevVhostUser:
      cryptodevVhostUser*: CryptodevVhostUserProperties
    of ObjectType.DbusVmstate:
      dbusVmstate*: DBusVMStateProperties
    of ObjectType.FilterBuffer:
      filterBuffer*: FilterBufferProperties
    of ObjectType.FilterDump:
      filterDump*: FilterDumpProperties
    of ObjectType.FilterMirror:
      filterMirror*: FilterMirrorProperties
    of ObjectType.FilterRedirector:
      filterRedirector*: FilterRedirectorProperties
    of ObjectType.FilterReplay:
      filterReplay*: NetfilterProperties
    of ObjectType.FilterRewriter:
      filterRewriter*: FilterRewriterProperties
    of ObjectType.IgvmCfg:
      igvmCfg*: IgvmCfgProperties
    of ObjectType.InputBarrier:
      inputBarrier*: InputBarrierProperties
    of ObjectType.InputLinux:
      inputLinux*: InputLinuxProperties
    of ObjectType.Iommufd:
      iommufd*: IOMMUFDProperties
    of ObjectType.Iothread:
      iothread*: IothreadProperties
    of ObjectType.MainLoop:
      mainLoop*: MainLoopProperties
    of ObjectType.MemoryBackendEpc:
      memoryBackendEpc*: MemoryBackendEpcProperties
    of ObjectType.MemoryBackendFile:
      memoryBackendFile*: MemoryBackendFileProperties
    of ObjectType.MemoryBackendMemfd:
      memoryBackendMemfd*: MemoryBackendMemfdProperties
    of ObjectType.MemoryBackendRam:
      memoryBackendRam*: MemoryBackendProperties
    of ObjectType.MemoryBackendShm:
      memoryBackendShm*: MemoryBackendShmProperties
    of ObjectType.PrManagerHelper:
      prManagerHelper*: PrManagerHelperProperties
    of ObjectType.Qtest:
      qtest*: QtestProperties
    of ObjectType.RngBuiltin:
      rngBuiltin*: RngProperties
    of ObjectType.RngEgd:
      rngEgd*: RngEgdProperties
    of ObjectType.RngRandom:
      rngRandom*: RngRandomProperties
    of ObjectType.Secret:
      secret*: SecretProperties
    of ObjectType.SecretKeyring:
      secretKeyring*: SecretKeyringProperties
    of ObjectType.SevGuest:
      sevGuest*: SevGuestProperties
    of ObjectType.SevSnpGuest:
      sevSnpGuest*: SevSnpGuestProperties
    of ObjectType.TdxGuest:
      tdxGuest*: TdxGuestProperties
    of ObjectType.ThreadContext:
      threadContext*: ThreadContextProperties
    of ObjectType.ThrottleGroup:
      throttleGroup*: ThrottleGroupProperties
    of ObjectType.TlsCredsAnon:
      tlsCredsAnon*: TlsCredsAnonProperties
    of ObjectType.TlsCredsPsk:
      tlsCredsPsk*: TlsCredsPskProperties
    of ObjectType.TlsCredsX509:
      tlsCredsX509*: TlsCredsX509Properties
    of ObjectType.TlsCipherSuites:
      tlsCipherSuites*: TlsCredsProperties
    of ObjectType.XRemoteObject:
      xRemoteObject*: RemoteObjectProperties
    of ObjectType.XVfioUserServer:
      xVfioUserServer*: VfioUserServerProperties
    of ObjectType.CanBus: discard
    of ObjectType.PefGuest: discard
    of ObjectType.S390PvGuest: discard

  SmpCacheProperties* = object
    cache*: CacheLevelAndType
    topology*: CpuTopologyLevel

  SmpCachePropertiesWrapper* = object
    caches*: seq[SmpCacheProperties]

  CpuInfoS390* = object
    cpuState*: S390CpuState
    dedicated*: Option[bool]
    entitlement*: Option[S390CpuEntitlement]

  CpuInfoFast* = object
    cpuIndex*: int64
    qomType*: string
    qomPath*: string
    threadId*: int64
    props*: Option[CpuInstanceProperties]
    case target*: SysEmuTarget
    of SysEmuTarget.S390x:
      s390x*: CpuInfoS390
    of SysEmuTarget.Aarch64: discard
    of SysEmuTarget.Alpha: discard
    of SysEmuTarget.Arm: discard
    of SysEmuTarget.Avr: discard
    of SysEmuTarget.Hexagon: discard
    of SysEmuTarget.Hppa: discard
    of SysEmuTarget.I386: discard
    of SysEmuTarget.Loongarch64: discard
    of SysEmuTarget.M68k: discard
    of SysEmuTarget.Microblaze: discard
    of SysEmuTarget.Mips: discard
    of SysEmuTarget.Mips64: discard
    of SysEmuTarget.Mips64el: discard
    of SysEmuTarget.Mipsel: discard
    of SysEmuTarget.Or1k: discard
    of SysEmuTarget.Ppc: discard
    of SysEmuTarget.Ppc64: discard
    of SysEmuTarget.Riscv32: discard
    of SysEmuTarget.Riscv64: discard
    of SysEmuTarget.Rx: discard
    of SysEmuTarget.Sh4: discard
    of SysEmuTarget.Sh4eb: discard
    of SysEmuTarget.Sparc: discard
    of SysEmuTarget.Sparc64: discard
    of SysEmuTarget.Tricore: discard
    of SysEmuTarget.X8664: discard
    of SysEmuTarget.Xtensa: discard
    of SysEmuTarget.Xtensaeb: discard

  CompatProperty* = object
    qomType*: string
    property*: string
    value*: string

  MachineInfo* = object
    name*: string
    alias*: Option[string]
    isDefault*: Option[bool]
    cpuMax*: int64
    hotpluggableCpus*: bool
    numaMemSupported*: bool
    deprecated*: bool
    defaultCpuType*: Option[string]
    defaultRamId*: Option[string]
    acpi*: bool
    compatProps*: Option[seq[CompatProperty]]

  CurrentMachineParams* = object
    wakeupSuspendSupport*: bool

  QemuTargetInfo* = object
    arch*: SysEmuTarget

  UuidInfo* = object
    UUID*: string

  GuidInfo* = object
    guid*: string

  NumaOptions* = object
    case `type`*: NumaOptionsType
    of NumaOptionsType.Node:
      node*: NumaNodeOptions
    of NumaOptionsType.Dist:
      dist*: NumaDistOptions
    of NumaOptionsType.Cpu:
      cpu*: NumaCpuOptions
    of NumaOptionsType.HmatLb:
      hmatLb*: NumaHmatLBOptions
    of NumaOptionsType.HmatCache:
      hmatCache*: NumaHmatCacheOptions

  NumaNodeOptions* = object
    nodeid*: Option[uint16]
    cpus*: Option[seq[uint16]]
    mem*: Option[uint64]
    memdev*: Option[string]
    initiator*: Option[uint16]

  NumaDistOptions* = object
    src*: uint16
    dst*: uint16
    val*: uint8

  CXLFixedMemoryWindowOptions* = object
    size*: uint64
    interleaveGranularity*: Option[uint64]
    targets*: seq[string]

  CXLFMWProperties* = object
    cxlFmw*: seq[CXLFixedMemoryWindowOptions]

  X86CPUFeatureWordInfo* = object
    cpuidInputEax*: int64
    cpuidInputEcx*: Option[int64]
    cpuidRegister*: X86CPURegister32
    features*: int64

  DummyForceArrays* = object
    unused*: seq[X86CPUFeatureWordInfo]

  NumaCpuOptions* = object
    nodeId*: Option[int64]
    drawerId*: Option[int64]
    bookId*: Option[int64]
    socketId*: Option[int64]
    dieId*: Option[int64]
    clusterId*: Option[int64]
    moduleId*: Option[int64]
    coreId*: Option[int64]
    threadId*: Option[int64]

  NumaHmatLBOptions* = object
    initiator*: uint16
    target*: uint16
    hierarchy*: HmatLBMemoryHierarchy
    dataType*: HmatLBDataType
    latency*: Option[uint64]
    bandwidth*: Option[uint64]

  NumaHmatCacheOptions* = object
    nodeId*: uint32
    size*: uint64
    level*: uint8
    associativity*: HmatCacheAssociativity
    policy*: HmatCacheWritePolicy
    line*: uint16

  Memdev* = object
    id*: Option[string]
    size*: uint64
    merge*: bool
    dump*: bool
    prealloc*: bool
    share*: bool
    reserve*: Option[bool]
    hostNodes*: seq[uint16]
    policy*: HostMemPolicy

  CpuInstanceProperties* = object
    nodeId*: Option[int64]
    drawerId*: Option[int64]
    bookId*: Option[int64]
    socketId*: Option[int64]
    dieId*: Option[int64]
    clusterId*: Option[int64]
    moduleId*: Option[int64]
    coreId*: Option[int64]
    threadId*: Option[int64]

  HotpluggableCPU* = object
    `type`*: string
    vcpusCount*: int64
    props*: CpuInstanceProperties
    qomPath*: Option[string]

  BalloonInfo* = object
    actual*: int64

  HvBalloonInfo* = object
    committed*: uint64
    available*: uint64

  MemoryInfo* = object
    baseMemory*: uint64
    pluggedMemory*: Option[uint64]

  PCDIMMDeviceInfo* = object
    id*: Option[string]
    `addr`*: int64
    size*: int64
    slot*: int64
    node*: int64
    memdev*: string
    hotplugged*: bool
    hotpluggable*: bool

  VirtioPMEMDeviceInfo* = object
    id*: Option[string]
    memaddr*: uint64
    size*: uint64
    memdev*: string

  VirtioMEMDeviceInfo* = object
    id*: Option[string]
    memaddr*: uint64
    requestedSize*: uint64
    size*: uint64
    maxSize*: uint64
    blockSize*: uint64
    node*: int64
    memdev*: string

  SgxEPCDeviceInfo* = object
    id*: Option[string]
    memaddr*: uint64
    size*: uint64
    node*: int64
    memdev*: string

  HvBalloonDeviceInfo* = object
    id*: Option[string]
    memaddr*: Option[uint64]
    maxSize*: uint64
    memdev*: Option[string]

  PCDIMMDeviceInfoWrapper* = object
    data*: PCDIMMDeviceInfo

  VirtioPMEMDeviceInfoWrapper* = object
    data*: VirtioPMEMDeviceInfo

  VirtioMEMDeviceInfoWrapper* = object
    data*: VirtioMEMDeviceInfo

  SgxEPCDeviceInfoWrapper* = object
    data*: SgxEPCDeviceInfo

  HvBalloonDeviceInfoWrapper* = object
    data*: HvBalloonDeviceInfo

  MemoryDeviceInfo* = object
    case `type`*: MemoryDeviceInfoKind
    of MemoryDeviceInfoKind.Dimm:
      dimm*: PCDIMMDeviceInfoWrapper
    of MemoryDeviceInfoKind.Nvdimm:
      nvdimm*: PCDIMMDeviceInfoWrapper
    of MemoryDeviceInfoKind.VirtioPmem:
      virtioPmem*: VirtioPMEMDeviceInfoWrapper
    of MemoryDeviceInfoKind.VirtioMem:
      virtioMem*: VirtioMEMDeviceInfoWrapper
    of MemoryDeviceInfoKind.SgxEpc:
      sgxEpc*: SgxEPCDeviceInfoWrapper
    of MemoryDeviceInfoKind.HvBalloon:
      hvBalloon*: HvBalloonDeviceInfoWrapper

  SgxEPC* = object
    memdev*: string
    node*: int64

  SgxEPCProperties* = object
    sgxEpc*: seq[SgxEPC]

  BootConfiguration* = object
    order*: Option[string]
    once*: Option[string]
    menu*: Option[bool]
    splash*: Option[string]
    splashTime*: Option[int64]
    rebootTimeout*: Option[int64]
    strict*: Option[bool]

  SMPConfiguration* = object
    cpus*: Option[int64]
    drawers*: Option[int64]
    books*: Option[int64]
    sockets*: Option[int64]
    dies*: Option[int64]
    clusters*: Option[int64]
    modules*: Option[int64]
    cores*: Option[int64]
    threads*: Option[int64]
    maxcpus*: Option[int64]

  MemorySizeConfiguration* = object
    size*: Option[uint64]
    maxSize*: Option[uint64]
    slots*: Option[uint64]

  FirmwareLog* = object
    version*: Option[string]
    log*: string

  CpuModelInfo* = object
    name*: string
    props*: Option[JsonNode]

  CpuModelBaselineInfo* = object
    model*: CpuModelInfo

  CpuModelCompareInfo* = object
    result*: CpuModelCompareResult
    responsibleProperties*: seq[string]

  CpuModelExpansionInfo* = object
    model*: CpuModelInfo
    deprecatedProps*: Option[seq[string]]

  CpuDefinitionInfo* = object
    name*: string
    migrationSafe*: Option[bool]
    `static`*: bool
    unavailableFeatures*: Option[seq[string]]
    typename*: string
    aliasOf*: Option[string]
    deprecated*: bool

  CpuPolarizationInfo* = object
    polarization*: S390CpuPolarization

  ReplayInfo* = object
    mode*: ReplayMode
    filename*: Option[string]
    icount*: int64

  YankInstanceBlockNode* = object
    nodeName*: string

  YankInstanceChardev* = object
    id*: string

  YankInstance* = object
    case `type`*: YankInstanceType
    of YankInstanceType.BlockNode:
      blockNode*: YankInstanceBlockNode
    of YankInstanceType.Chardev:
      chardev*: YankInstanceChardev
    of YankInstanceType.Migration: discard

  NameInfo* = object
    name*: Option[string]

  IOThreadInfo* = object
    id*: string
    threadId*: int64
    pollMaxNs*: int64
    pollGrow*: int64
    pollShrink*: int64
    aioMaxBatch*: int64

  AddfdInfo* = object
    fdsetId*: int64
    fd*: int64

  FdsetFdInfo* = object
    fd*: int64
    opaque*: Option[string]

  FdsetInfo* = object
    fdsetId*: int64
    fds*: seq[FdsetFdInfo]

  CommandLineParameterInfo* = object
    name*: string
    `type`*: CommandLineParameterType
    help*: Option[string]
    default*: Option[string]

  CommandLineOptionInfo* = object
    option*: string
    parameters*: seq[CommandLineParameterInfo]

  GICCapability* = object
    version*: int64
    emulated*: bool
    kernel*: bool

  SevGuestInfo* = object
    policy*: uint32
    handle*: uint32

  SevSnpGuestInfo* = object
    snpPolicy*: uint64

  SevInfo* = object
    enabled*: bool
    apiMajor*: uint8
    apiMinor*: uint8
    buildId*: uint8
    state*: SevState
    case sevType*: SevGuestType
    of SevGuestType.Sev:
      sev*: SevGuestInfo
    of SevGuestType.SevSnp:
      sevSnp*: SevSnpGuestInfo

  SevLaunchMeasureInfo* = object
    data*: string

  SevCapability* = object
    pdh*: string
    certChain*: string
    cpu0Id*: string
    cbitpos*: int64
    reducedPhysBits*: int64

  SevAttestationReport* = object
    data*: string

  SgxEpcSection* = object
    node*: int64
    size*: uint64

  SgxInfo* = object
    sgx*: bool
    sgx1*: bool
    sgx2*: bool
    flc*: bool
    sections*: seq[SgxEpcSection]

  EvtchnInfo* = object
    port*: uint16
    vcpu*: uint32
    `type`*: EvtchnPortType
    remoteDomain*: string
    target*: uint16
    pending*: bool
    masked*: bool

  AudiodevPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]

  AudiodevGenericOptions* = object
    `in`*: Option[AudiodevPerDirectionOptions]
    `out`*: Option[AudiodevPerDirectionOptions]

  AudiodevDBusOptions* = object
    `in`*: Option[AudiodevPerDirectionOptions]
    `out`*: Option[AudiodevPerDirectionOptions]
    nsamples*: Option[uint32]

  AudiodevAlsaPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    dev*: Option[string]
    periodLength*: Option[uint32]
    tryPoll*: Option[bool]

  AudiodevAlsaOptions* = object
    `in`*: Option[AudiodevAlsaPerDirectionOptions]
    `out`*: Option[AudiodevAlsaPerDirectionOptions]
    threshold*: Option[uint32]

  AudiodevSndioOptions* = object
    `in`*: Option[AudiodevPerDirectionOptions]
    `out`*: Option[AudiodevPerDirectionOptions]
    dev*: Option[string]
    latency*: Option[uint32]

  AudiodevCoreaudioPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    bufferCount*: Option[uint32]

  AudiodevCoreaudioOptions* = object
    `in`*: Option[AudiodevCoreaudioPerDirectionOptions]
    `out`*: Option[AudiodevCoreaudioPerDirectionOptions]

  AudiodevDsoundOptions* = object
    `in`*: Option[AudiodevPerDirectionOptions]
    `out`*: Option[AudiodevPerDirectionOptions]
    latency*: Option[uint32]

  AudiodevJackPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    serverName*: Option[string]
    clientName*: Option[string]
    connectPorts*: Option[string]
    startServer*: Option[bool]
    exactName*: Option[bool]

  AudiodevJackOptions* = object
    `in`*: Option[AudiodevJackPerDirectionOptions]
    `out`*: Option[AudiodevJackPerDirectionOptions]

  AudiodevOssPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    dev*: Option[string]
    bufferCount*: Option[uint32]
    tryPoll*: Option[bool]

  AudiodevOssOptions* = object
    `in`*: Option[AudiodevOssPerDirectionOptions]
    `out`*: Option[AudiodevOssPerDirectionOptions]
    tryMmap*: Option[bool]
    exclusive*: Option[bool]
    dspPolicy*: Option[uint32]

  AudiodevPaPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    name*: Option[string]
    streamName*: Option[string]
    latency*: Option[uint32]

  AudiodevPaOptions* = object
    `in`*: Option[AudiodevPaPerDirectionOptions]
    `out`*: Option[AudiodevPaPerDirectionOptions]
    server*: Option[string]

  AudiodevPipewirePerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    name*: Option[string]
    streamName*: Option[string]
    latency*: Option[uint32]

  AudiodevPipewireOptions* = object
    `in`*: Option[AudiodevPipewirePerDirectionOptions]
    `out`*: Option[AudiodevPipewirePerDirectionOptions]

  AudiodevSdlPerDirectionOptions* = object
    mixingEngine*: Option[bool]
    fixedSettings*: Option[bool]
    frequency*: Option[uint32]
    channels*: Option[uint32]
    voices*: Option[uint32]
    format*: Option[AudioFormat]
    bufferLength*: Option[uint32]
    bufferCount*: Option[uint32]

  AudiodevSdlOptions* = object
    `in`*: Option[AudiodevSdlPerDirectionOptions]
    `out`*: Option[AudiodevSdlPerDirectionOptions]

  AudiodevWavOptions* = object
    `in`*: Option[AudiodevPerDirectionOptions]
    `out`*: Option[AudiodevPerDirectionOptions]
    path*: Option[string]

  Audiodev* = object
    id*: string
    timerPeriod*: Option[uint32]
    case driver*: AudiodevDriver
    of AudiodevDriver.None:
      none*: AudiodevGenericOptions
    of AudiodevDriver.Alsa:
      alsa*: AudiodevAlsaOptions
    of AudiodevDriver.Coreaudio:
      coreaudio*: AudiodevCoreaudioOptions
    of AudiodevDriver.Dbus:
      dbus*: AudiodevDBusOptions
    of AudiodevDriver.Dsound:
      dsound*: AudiodevDsoundOptions
    of AudiodevDriver.Jack:
      jack*: AudiodevJackOptions
    of AudiodevDriver.Oss:
      oss*: AudiodevOssOptions
    of AudiodevDriver.Pa:
      pa*: AudiodevPaOptions
    of AudiodevDriver.Pipewire:
      pipewire*: AudiodevPipewireOptions
    of AudiodevDriver.Sdl:
      sdl*: AudiodevSdlOptions
    of AudiodevDriver.Sndio:
      sndio*: AudiodevSndioOptions
    of AudiodevDriver.Spice:
      spice*: AudiodevGenericOptions
    of AudiodevDriver.Wav:
      wav*: AudiodevWavOptions

  AcpiTableOptions* = object
    sig*: Option[string]
    rev*: Option[uint8]
    oemId*: Option[string]
    oemTableId*: Option[string]
    oemRev*: Option[uint32]
    aslCompilerId*: Option[string]
    aslCompilerRev*: Option[uint32]
    file*: Option[string]
    data*: Option[string]

  ACPIOSTInfo* = object
    device*: Option[string]
    slot*: string
    slotType*: ACPISlotType
    source*: int64
    status*: int64

  PciMemoryRange* = object
    base*: int64
    limit*: int64

  PciMemoryRegion* = object
    bar*: int64
    `type`*: string
    address*: int64
    size*: int64
    prefetch*: Option[bool]
    memType64*: Option[bool]

  PciBusInfo* = object
    number*: int64
    secondary*: int64
    subordinate*: int64
    ioRange*: PciMemoryRange
    memoryRange*: PciMemoryRange
    prefetchableRange*: PciMemoryRange

  PciBridgeInfo* = ref object
    bus*: PciBusInfo
    devices*: Option[seq[PciDeviceInfo]]

  PciDeviceClass* = object
    desc*: Option[string]
    class*: int64

  PciDeviceId* = object
    device*: int64
    vendor*: int64
    subsystem*: Option[int64]
    subsystemVendor*: Option[int64]

  PciDeviceInfo* = ref object
    bus*: int64
    slot*: int64
    function*: int64
    classInfo*: PciDeviceClass
    id*: PciDeviceId
    irq*: Option[int64]
    irqPin*: int64
    qdevId*: string
    pciBridge*: Option[PciBridgeInfo]
    regions*: seq[PciMemoryRegion]

  PciInfo* = object
    bus*: int64
    devices*: seq[PciDeviceInfo]

  StatsRequest* = object
    provider*: StatsProvider
    names*: Option[seq[string]]

  StatsVCPUFilter* = object
    vcpus*: Option[seq[string]]

  StatsFilter* = object
    providers*: Option[seq[StatsRequest]]
    case target*: StatsTarget
    of StatsTarget.Vcpu:
      vcpu*: StatsVCPUFilter
    of StatsTarget.Vm: discard
    of StatsTarget.Cryptodev: discard

  StatsValue* = object
    case kind*: StatsValueKind
    of StatsValueKind.Scalar:
      scalar*: uint64
    of StatsValueKind.Boolean:
      boolean*: bool
    of StatsValueKind.List:
      list*: seq[uint64]

  Stats* = object
    name*: string
    value*: StatsValue

  StatsResult* = object
    provider*: StatsProvider
    qomPath*: Option[string]
    stats*: seq[Stats]

  StatsSchemaValue* = object
    name*: string
    `type`*: StatsType
    unit*: Option[StatsUnit]
    base*: Option[int8]
    exponent*: int16
    bucketSize*: Option[uint32]

  StatsSchema* = object
    provider*: StatsProvider
    target*: StatsTarget
    stats*: seq[StatsSchemaValue]

  VirtioInfo* = object
    path*: string
    name*: string

  VhostStatus* = object
    nMemSections*: int64
    nTmpSections*: int64
    nvqs*: uint32
    vqIndex*: int64
    features*: VirtioDeviceFeatures
    ackedFeatures*: VirtioDeviceFeatures
    backendFeatures*: VirtioDeviceFeatures
    protocolFeatures*: VhostDeviceProtocols
    maxQueues*: uint64
    backendCap*: uint64
    logEnabled*: bool
    logSize*: uint64

  VirtioStatus* = object
    name*: string
    deviceId*: uint16
    vhostStarted*: bool
    deviceEndian*: string
    guestFeatures*: VirtioDeviceFeatures
    hostFeatures*: VirtioDeviceFeatures
    backendFeatures*: VirtioDeviceFeatures
    numVqs*: int64
    status*: VirtioDeviceStatus
    isr*: uint8
    queueSel*: uint16
    vmRunning*: bool
    broken*: bool
    disabled*: bool
    useStarted*: bool
    started*: bool
    startOnKick*: bool
    disableLegacyCheck*: bool
    busName*: string
    useGuestNotifierMask*: bool
    vhostDev*: Option[VhostStatus]

  VirtioDeviceStatus* = object
    statuses*: seq[string]
    unknownStatuses*: Option[uint8]

  VhostDeviceProtocols* = object
    protocols*: seq[string]
    unknownProtocols*: Option[uint64]

  VirtioDeviceFeatures* = object
    transports*: seq[string]
    devFeatures*: Option[seq[string]]
    unknownDevFeatures*: Option[uint64]
    unknownDevFeatures2*: Option[uint64]

  VirtQueueStatus* = object
    name*: string
    queueIndex*: uint16
    inuse*: uint32
    vringNum*: uint32
    vringNumDefault*: uint32
    vringAlign*: uint32
    vringDesc*: uint64
    vringAvail*: uint64
    vringUsed*: uint64
    lastAvailIdx*: Option[uint16]
    shadowAvailIdx*: Option[uint16]
    usedIdx*: uint16
    signalledUsed*: uint16
    signalledUsedValid*: bool

  VirtVhostQueueStatus* = object
    name*: string
    kick*: int64
    call*: int64
    desc*: uint64
    avail*: uint64
    used*: uint64
    num*: int64
    descPhys*: uint64
    descSize*: uint32
    availPhys*: uint64
    availSize*: uint32
    usedPhys*: uint64
    usedSize*: uint32

  VirtioRingDesc* = object
    `addr`*: uint64
    len*: uint32
    flags*: seq[string]

  VirtioRingAvail* = object
    flags*: uint16
    idx*: uint16
    ring*: uint16

  VirtioRingUsed* = object
    flags*: uint16
    idx*: uint16

  VirtioQueueElement* = object
    name*: string
    index*: uint32
    descs*: seq[VirtioRingDesc]
    avail*: VirtioRingAvail
    used*: VirtioRingUsed

  IOThreadVirtQueueMapping* = object
    iothread*: string
    vqs*: Option[seq[uint16]]

  VirtIOGPUOutput* = object
    name*: string
    xres*: Option[uint16]
    yres*: Option[uint16]

  DummyVirtioForceArrays* = object
    unusedIothreadVqMapping*: seq[IOThreadVirtQueueMapping]
    unusedVirtioGpuOutput*: seq[VirtIOGPUOutput]

  QCryptodevBackendClient* = object
    queue*: uint32
    `type`*: QCryptodevBackendType

  QCryptodevInfo* = object
    id*: string
    service*: seq[QCryptodevBackendServiceType]
    client*: seq[QCryptodevBackendClient]

  CXLCommonEventBase* = object
    path*: string
    log*: CxlEventLog
    flags*: uint32
    maintOpClass*: Option[uint8]
    maintOpSubclass*: Option[uint8]
    ldId*: Option[uint16]
    headId*: Option[uint8]

  CXLGeneralMediaEvent* = object
    path*: string
    log*: CxlEventLog
    flags*: uint32
    maintOpClass*: Option[uint8]
    maintOpSubclass*: Option[uint8]
    ldId*: Option[uint16]
    headId*: Option[uint8]
    dpa*: uint64
    descriptor*: uint8
    `type`*: uint8
    transactionType*: uint8
    channel*: Option[uint8]
    rank*: Option[uint8]
    device*: Option[uint32]
    componentId*: Option[string]
    isCompIdPldm*: Option[bool]
    cmeEvFlags*: Option[uint8]
    cmeCount*: Option[uint32]
    subType*: uint8

  CXLDRAMEvent* = object
    path*: string
    log*: CxlEventLog
    flags*: uint32
    maintOpClass*: Option[uint8]
    maintOpSubclass*: Option[uint8]
    ldId*: Option[uint16]
    headId*: Option[uint8]
    dpa*: uint64
    descriptor*: uint8
    `type`*: uint8
    transactionType*: uint8
    channel*: Option[uint8]
    rank*: Option[uint8]
    nibbleMask*: Option[uint32]
    bankGroup*: Option[uint8]
    bank*: Option[uint8]
    row*: Option[uint32]
    column*: Option[uint16]
    correctionMask*: Option[seq[uint64]]
    componentId*: Option[string]
    isCompIdPldm*: Option[bool]
    subChannel*: Option[uint8]
    cmeEvFlags*: Option[uint8]
    cvmeCount*: Option[uint32]
    subType*: uint8

  CXLMemModuleEvent* = object
    path*: string
    log*: CxlEventLog
    flags*: uint32
    maintOpClass*: Option[uint8]
    maintOpSubclass*: Option[uint8]
    ldId*: Option[uint16]
    headId*: Option[uint8]
    `type`*: uint8
    healthStatus*: uint8
    mediaStatus*: uint8
    additionalStatus*: uint8
    lifeUsed*: uint8
    temperature*: int16
    dirtyShutdownCount*: uint32
    correctedVolatileErrorCount*: uint32
    correctedPersistentErrorCount*: uint32
    componentId*: Option[string]
    isCompIdPldm*: Option[bool]
    subType*: uint8

  CXLUncorErrorRecord* = object
    `type`*: CxlUncorErrorType
    header*: seq[uint32]

  CxlDynamicCapacityExtent* = object
    offset*: uint64
    len*: uint64

  UefiVariable* = object
    guid*: string
    name*: string
    attr*: int64
    data*: string
    time*: Option[string]
    digest*: Option[string]

  UefiVarStore* = object
    version*: int64
    variables*: seq[UefiVariable]


proc `%`*(x: QapiErrorClass): JsonNode
proc parse*(_: typedesc[QapiErrorClass], n: JsonNode): QapiErrorClass
proc `%`*(x: IoOperationType): JsonNode
proc parse*(_: typedesc[IoOperationType], n: JsonNode): IoOperationType
proc `%`*(x: OnOffAuto): JsonNode
proc parse*(_: typedesc[OnOffAuto], n: JsonNode): OnOffAuto
proc `%`*(x: OnOffSplit): JsonNode
proc parse*(_: typedesc[OnOffSplit], n: JsonNode): OnOffSplit
proc `%`*(x: StrOrNull): JsonNode
proc parse*(_: typedesc[StrOrNull], n: JsonNode): StrOrNull
proc `%`*(x: OffAutoPCIBAR): JsonNode
proc parse*(_: typedesc[OffAutoPCIBAR], n: JsonNode): OffAutoPCIBAR
proc `%`*(x: PCIELinkSpeed): JsonNode
proc parse*(_: typedesc[PCIELinkSpeed], n: JsonNode): PCIELinkSpeed
proc `%`*(x: PCIELinkWidth): JsonNode
proc parse*(_: typedesc[PCIELinkWidth], n: JsonNode): PCIELinkWidth
proc `%`*(x: HostMemPolicy): JsonNode
proc parse*(_: typedesc[HostMemPolicy], n: JsonNode): HostMemPolicy
proc `%`*(x: NetFilterDirection): JsonNode
proc parse*(_: typedesc[NetFilterDirection], n: JsonNode): NetFilterDirection
proc `%`*(x: GrabToggleKeys): JsonNode
proc parse*(_: typedesc[GrabToggleKeys], n: JsonNode): GrabToggleKeys
proc `%`*(x: HumanReadableText): JsonNode
proc parse*(_: typedesc[HumanReadableText], n: JsonNode): HumanReadableText
proc `%`*(x: EndianMode): JsonNode
proc parse*(_: typedesc[EndianMode], n: JsonNode): EndianMode
proc `%`*(x: NetworkAddressFamily): JsonNode
proc parse*(_: typedesc[NetworkAddressFamily], n: JsonNode): NetworkAddressFamily
proc `%`*(x: InetSocketAddressBase): JsonNode
proc parse*(_: typedesc[InetSocketAddressBase], n: JsonNode): InetSocketAddressBase
proc `%`*(x: InetSocketAddress): JsonNode
proc parse*(_: typedesc[InetSocketAddress], n: JsonNode): InetSocketAddress
proc `%`*(x: UnixSocketAddress): JsonNode
proc parse*(_: typedesc[UnixSocketAddress], n: JsonNode): UnixSocketAddress
proc `%`*(x: VsockSocketAddress): JsonNode
proc parse*(_: typedesc[VsockSocketAddress], n: JsonNode): VsockSocketAddress
proc `%`*(x: FdSocketAddress): JsonNode
proc parse*(_: typedesc[FdSocketAddress], n: JsonNode): FdSocketAddress
proc `%`*(x: InetSocketAddressWrapper): JsonNode
proc parse*(_: typedesc[InetSocketAddressWrapper], n: JsonNode): InetSocketAddressWrapper
proc `%`*(x: UnixSocketAddressWrapper): JsonNode
proc parse*(_: typedesc[UnixSocketAddressWrapper], n: JsonNode): UnixSocketAddressWrapper
proc `%`*(x: VsockSocketAddressWrapper): JsonNode
proc parse*(_: typedesc[VsockSocketAddressWrapper], n: JsonNode): VsockSocketAddressWrapper
proc `%`*(x: FdSocketAddressWrapper): JsonNode
proc parse*(_: typedesc[FdSocketAddressWrapper], n: JsonNode): FdSocketAddressWrapper
proc `%`*(x: SocketAddressLegacy): JsonNode
proc parse*(_: typedesc[SocketAddressLegacy], n: JsonNode): SocketAddressLegacy
proc `%`*(x: SocketAddressType): JsonNode
proc parse*(_: typedesc[SocketAddressType], n: JsonNode): SocketAddressType
proc `%`*(x: SocketAddress): JsonNode
proc parse*(_: typedesc[SocketAddress], n: JsonNode): SocketAddress
proc `%`*(x: RunState): JsonNode
proc parse*(_: typedesc[RunState], n: JsonNode): RunState
proc `%`*(x: ShutdownCause): JsonNode
proc parse*(_: typedesc[ShutdownCause], n: JsonNode): ShutdownCause
proc `%`*(x: StatusInfo): JsonNode
proc parse*(_: typedesc[StatusInfo], n: JsonNode): StatusInfo
proc `%`*(x: WatchdogAction): JsonNode
proc parse*(_: typedesc[WatchdogAction], n: JsonNode): WatchdogAction
proc `%`*(x: RebootAction): JsonNode
proc parse*(_: typedesc[RebootAction], n: JsonNode): RebootAction
proc `%`*(x: ShutdownAction): JsonNode
proc parse*(_: typedesc[ShutdownAction], n: JsonNode): ShutdownAction
proc `%`*(x: PanicAction): JsonNode
proc parse*(_: typedesc[PanicAction], n: JsonNode): PanicAction
proc `%`*(x: GuestPanicAction): JsonNode
proc parse*(_: typedesc[GuestPanicAction], n: JsonNode): GuestPanicAction
proc `%`*(x: GuestPanicInformationType): JsonNode
proc parse*(_: typedesc[GuestPanicInformationType], n: JsonNode): GuestPanicInformationType
proc `%`*(x: GuestPanicInformation): JsonNode
proc parse*(_: typedesc[GuestPanicInformation], n: JsonNode): GuestPanicInformation
proc `%`*(x: GuestPanicInformationHyperV): JsonNode
proc parse*(_: typedesc[GuestPanicInformationHyperV], n: JsonNode): GuestPanicInformationHyperV
proc `%`*(x: S390CrashReason): JsonNode
proc parse*(_: typedesc[S390CrashReason], n: JsonNode): S390CrashReason
proc `%`*(x: GuestPanicInformationS390): JsonNode
proc parse*(_: typedesc[GuestPanicInformationS390], n: JsonNode): GuestPanicInformationS390
proc `%`*(x: GuestPanicInformationTdx): JsonNode
proc parse*(_: typedesc[GuestPanicInformationTdx], n: JsonNode): GuestPanicInformationTdx
proc `%`*(x: GuestPanicInformationSev): JsonNode
proc parse*(_: typedesc[GuestPanicInformationSev], n: JsonNode): GuestPanicInformationSev
proc `%`*(x: MemoryFailureRecipient): JsonNode
proc parse*(_: typedesc[MemoryFailureRecipient], n: JsonNode): MemoryFailureRecipient
proc `%`*(x: MemoryFailureAction): JsonNode
proc parse*(_: typedesc[MemoryFailureAction], n: JsonNode): MemoryFailureAction
proc `%`*(x: MemoryFailureFlags): JsonNode
proc parse*(_: typedesc[MemoryFailureFlags], n: JsonNode): MemoryFailureFlags
proc `%`*(x: NotifyVmexitOption): JsonNode
proc parse*(_: typedesc[NotifyVmexitOption], n: JsonNode): NotifyVmexitOption
proc `%`*(x: QCryptoTLSCredsEndpoint): JsonNode
proc parse*(_: typedesc[QCryptoTLSCredsEndpoint], n: JsonNode): QCryptoTLSCredsEndpoint
proc `%`*(x: QCryptoSecretFormat): JsonNode
proc parse*(_: typedesc[QCryptoSecretFormat], n: JsonNode): QCryptoSecretFormat
proc `%`*(x: QCryptoHashAlgo): JsonNode
proc parse*(_: typedesc[QCryptoHashAlgo], n: JsonNode): QCryptoHashAlgo
proc `%`*(x: QCryptoCipherAlgo): JsonNode
proc parse*(_: typedesc[QCryptoCipherAlgo], n: JsonNode): QCryptoCipherAlgo
proc `%`*(x: QCryptoCipherMode): JsonNode
proc parse*(_: typedesc[QCryptoCipherMode], n: JsonNode): QCryptoCipherMode
proc `%`*(x: QCryptoIVGenAlgo): JsonNode
proc parse*(_: typedesc[QCryptoIVGenAlgo], n: JsonNode): QCryptoIVGenAlgo
proc `%`*(x: QCryptoBlockFormat): JsonNode
proc parse*(_: typedesc[QCryptoBlockFormat], n: JsonNode): QCryptoBlockFormat
proc `%`*(x: QCryptoBlockOptionsBase): JsonNode
proc parse*(_: typedesc[QCryptoBlockOptionsBase], n: JsonNode): QCryptoBlockOptionsBase
proc `%`*(x: QCryptoBlockOptionsQCow): JsonNode
proc parse*(_: typedesc[QCryptoBlockOptionsQCow], n: JsonNode): QCryptoBlockOptionsQCow
proc `%`*(x: QCryptoBlockOptionsLUKS): JsonNode
proc parse*(_: typedesc[QCryptoBlockOptionsLUKS], n: JsonNode): QCryptoBlockOptionsLUKS
proc `%`*(x: QCryptoBlockCreateOptionsLUKS): JsonNode
proc parse*(_: typedesc[QCryptoBlockCreateOptionsLUKS], n: JsonNode): QCryptoBlockCreateOptionsLUKS
proc `%`*(x: QCryptoBlockOpenOptions): JsonNode
proc parse*(_: typedesc[QCryptoBlockOpenOptions], n: JsonNode): QCryptoBlockOpenOptions
proc `%`*(x: QCryptoBlockCreateOptions): JsonNode
proc parse*(_: typedesc[QCryptoBlockCreateOptions], n: JsonNode): QCryptoBlockCreateOptions
proc `%`*(x: QCryptoBlockInfoBase): JsonNode
proc parse*(_: typedesc[QCryptoBlockInfoBase], n: JsonNode): QCryptoBlockInfoBase
proc `%`*(x: QCryptoBlockInfoLUKSSlot): JsonNode
proc parse*(_: typedesc[QCryptoBlockInfoLUKSSlot], n: JsonNode): QCryptoBlockInfoLUKSSlot
proc `%`*(x: QCryptoBlockInfoLUKS): JsonNode
proc parse*(_: typedesc[QCryptoBlockInfoLUKS], n: JsonNode): QCryptoBlockInfoLUKS
proc `%`*(x: QCryptoBlockInfo): JsonNode
proc parse*(_: typedesc[QCryptoBlockInfo], n: JsonNode): QCryptoBlockInfo
proc `%`*(x: QCryptoBlockLUKSKeyslotState): JsonNode
proc parse*(_: typedesc[QCryptoBlockLUKSKeyslotState], n: JsonNode): QCryptoBlockLUKSKeyslotState
proc `%`*(x: QCryptoBlockAmendOptionsLUKS): JsonNode
proc parse*(_: typedesc[QCryptoBlockAmendOptionsLUKS], n: JsonNode): QCryptoBlockAmendOptionsLUKS
proc `%`*(x: QCryptoBlockAmendOptions): JsonNode
proc parse*(_: typedesc[QCryptoBlockAmendOptions], n: JsonNode): QCryptoBlockAmendOptions
proc `%`*(x: SecretCommonProperties): JsonNode
proc parse*(_: typedesc[SecretCommonProperties], n: JsonNode): SecretCommonProperties
proc `%`*(x: SecretProperties): JsonNode
proc parse*(_: typedesc[SecretProperties], n: JsonNode): SecretProperties
proc `%`*(x: SecretKeyringProperties): JsonNode
proc parse*(_: typedesc[SecretKeyringProperties], n: JsonNode): SecretKeyringProperties
proc `%`*(x: TlsCredsProperties): JsonNode
proc parse*(_: typedesc[TlsCredsProperties], n: JsonNode): TlsCredsProperties
proc `%`*(x: TlsCredsAnonProperties): JsonNode
proc parse*(_: typedesc[TlsCredsAnonProperties], n: JsonNode): TlsCredsAnonProperties
proc `%`*(x: TlsCredsPskProperties): JsonNode
proc parse*(_: typedesc[TlsCredsPskProperties], n: JsonNode): TlsCredsPskProperties
proc `%`*(x: TlsCredsX509Properties): JsonNode
proc parse*(_: typedesc[TlsCredsX509Properties], n: JsonNode): TlsCredsX509Properties
proc `%`*(x: QCryptoAkCipherAlgo): JsonNode
proc parse*(_: typedesc[QCryptoAkCipherAlgo], n: JsonNode): QCryptoAkCipherAlgo
proc `%`*(x: QCryptoAkCipherKeyType): JsonNode
proc parse*(_: typedesc[QCryptoAkCipherKeyType], n: JsonNode): QCryptoAkCipherKeyType
proc `%`*(x: QCryptoRSAPaddingAlgo): JsonNode
proc parse*(_: typedesc[QCryptoRSAPaddingAlgo], n: JsonNode): QCryptoRSAPaddingAlgo
proc `%`*(x: QCryptoAkCipherOptionsRSA): JsonNode
proc parse*(_: typedesc[QCryptoAkCipherOptionsRSA], n: JsonNode): QCryptoAkCipherOptionsRSA
proc `%`*(x: QCryptoAkCipherOptions): JsonNode
proc parse*(_: typedesc[QCryptoAkCipherOptions], n: JsonNode): QCryptoAkCipherOptions
proc `%`*(x: JobType): JsonNode
proc parse*(_: typedesc[JobType], n: JsonNode): JobType
proc `%`*(x: JobStatus): JsonNode
proc parse*(_: typedesc[JobStatus], n: JsonNode): JobStatus
proc `%`*(x: JobVerb): JsonNode
proc parse*(_: typedesc[JobVerb], n: JsonNode): JobVerb
proc `%`*(x: JobInfo): JsonNode
proc parse*(_: typedesc[JobInfo], n: JsonNode): JobInfo
proc `%`*(x: KvmInfo): JsonNode
proc parse*(_: typedesc[KvmInfo], n: JsonNode): KvmInfo
proc `%`*(x: Accelerator): JsonNode
proc parse*(_: typedesc[Accelerator], n: JsonNode): Accelerator
proc `%`*(x: AcceleratorInfo): JsonNode
proc parse*(_: typedesc[AcceleratorInfo], n: JsonNode): AcceleratorInfo
proc `%`*(x: SnapshotInfo): JsonNode
proc parse*(_: typedesc[SnapshotInfo], n: JsonNode): SnapshotInfo
proc `%`*(x: ImageInfoSpecificQCow2EncryptionBase): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificQCow2EncryptionBase], n: JsonNode): ImageInfoSpecificQCow2EncryptionBase
proc `%`*(x: ImageInfoSpecificQCow2Encryption): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificQCow2Encryption], n: JsonNode): ImageInfoSpecificQCow2Encryption
proc `%`*(x: ImageInfoSpecificQCow2): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificQCow2], n: JsonNode): ImageInfoSpecificQCow2
proc `%`*(x: ImageInfoSpecificVmdk): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificVmdk], n: JsonNode): ImageInfoSpecificVmdk
proc `%`*(x: VmdkExtentInfo): JsonNode
proc parse*(_: typedesc[VmdkExtentInfo], n: JsonNode): VmdkExtentInfo
proc `%`*(x: ImageInfoSpecificRbd): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificRbd], n: JsonNode): ImageInfoSpecificRbd
proc `%`*(x: ImageInfoSpecificFile): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificFile], n: JsonNode): ImageInfoSpecificFile
proc `%`*(x: ImageInfoSpecificKind): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificKind], n: JsonNode): ImageInfoSpecificKind
proc `%`*(x: ImageInfoSpecificQCow2Wrapper): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificQCow2Wrapper], n: JsonNode): ImageInfoSpecificQCow2Wrapper
proc `%`*(x: ImageInfoSpecificVmdkWrapper): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificVmdkWrapper], n: JsonNode): ImageInfoSpecificVmdkWrapper
proc `%`*(x: ImageInfoSpecificLUKSWrapper): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificLUKSWrapper], n: JsonNode): ImageInfoSpecificLUKSWrapper
proc `%`*(x: ImageInfoSpecificRbdWrapper): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificRbdWrapper], n: JsonNode): ImageInfoSpecificRbdWrapper
proc `%`*(x: ImageInfoSpecificFileWrapper): JsonNode
proc parse*(_: typedesc[ImageInfoSpecificFileWrapper], n: JsonNode): ImageInfoSpecificFileWrapper
proc `%`*(x: ImageInfoSpecific): JsonNode
proc parse*(_: typedesc[ImageInfoSpecific], n: JsonNode): ImageInfoSpecific
proc `%`*(x: BlockLimitsInfo): JsonNode
proc parse*(_: typedesc[BlockLimitsInfo], n: JsonNode): BlockLimitsInfo
proc `%`*(x: BlockNodeInfo): JsonNode
proc parse*(_: typedesc[BlockNodeInfo], n: JsonNode): BlockNodeInfo
proc `%`*(x: ImageInfo): JsonNode
proc parse*(_: typedesc[ImageInfo], n: JsonNode): ImageInfo
proc `%`*(x: BlockChildInfo): JsonNode
proc parse*(_: typedesc[BlockChildInfo], n: JsonNode): BlockChildInfo
proc `%`*(x: BlockGraphInfo): JsonNode
proc parse*(_: typedesc[BlockGraphInfo], n: JsonNode): BlockGraphInfo
proc `%`*(x: ImageCheck): JsonNode
proc parse*(_: typedesc[ImageCheck], n: JsonNode): ImageCheck
proc `%`*(x: MapEntry): JsonNode
proc parse*(_: typedesc[MapEntry], n: JsonNode): MapEntry
proc `%`*(x: BlockdevCacheInfo): JsonNode
proc parse*(_: typedesc[BlockdevCacheInfo], n: JsonNode): BlockdevCacheInfo
proc `%`*(x: BlockdevChild): JsonNode
proc parse*(_: typedesc[BlockdevChild], n: JsonNode): BlockdevChild
proc `%`*(x: BlockDeviceInfo): JsonNode
proc parse*(_: typedesc[BlockDeviceInfo], n: JsonNode): BlockDeviceInfo
proc `%`*(x: BlockDeviceIoStatus): JsonNode
proc parse*(_: typedesc[BlockDeviceIoStatus], n: JsonNode): BlockDeviceIoStatus
proc `%`*(x: BlockDirtyInfo): JsonNode
proc parse*(_: typedesc[BlockDirtyInfo], n: JsonNode): BlockDirtyInfo
proc `%`*(x: Qcow2BitmapInfoFlags): JsonNode
proc parse*(_: typedesc[Qcow2BitmapInfoFlags], n: JsonNode): Qcow2BitmapInfoFlags
proc `%`*(x: Qcow2BitmapInfo): JsonNode
proc parse*(_: typedesc[Qcow2BitmapInfo], n: JsonNode): Qcow2BitmapInfo
proc `%`*(x: BlockLatencyHistogramInfo): JsonNode
proc parse*(_: typedesc[BlockLatencyHistogramInfo], n: JsonNode): BlockLatencyHistogramInfo
proc `%`*(x: BlockInfo): JsonNode
proc parse*(_: typedesc[BlockInfo], n: JsonNode): BlockInfo
proc `%`*(x: BlockMeasureInfo): JsonNode
proc parse*(_: typedesc[BlockMeasureInfo], n: JsonNode): BlockMeasureInfo
proc `%`*(x: BlockDeviceTimedStats): JsonNode
proc parse*(_: typedesc[BlockDeviceTimedStats], n: JsonNode): BlockDeviceTimedStats
proc `%`*(x: BlockDeviceStats): JsonNode
proc parse*(_: typedesc[BlockDeviceStats], n: JsonNode): BlockDeviceStats
proc `%`*(x: BlockStatsSpecificFile): JsonNode
proc parse*(_: typedesc[BlockStatsSpecificFile], n: JsonNode): BlockStatsSpecificFile
proc `%`*(x: BlockStatsSpecificNvme): JsonNode
proc parse*(_: typedesc[BlockStatsSpecificNvme], n: JsonNode): BlockStatsSpecificNvme
proc `%`*(x: BlockStatsSpecific): JsonNode
proc parse*(_: typedesc[BlockStatsSpecific], n: JsonNode): BlockStatsSpecific
proc `%`*(x: BlockStats): JsonNode
proc parse*(_: typedesc[BlockStats], n: JsonNode): BlockStats
proc `%`*(x: BlockdevOnError): JsonNode
proc parse*(_: typedesc[BlockdevOnError], n: JsonNode): BlockdevOnError
proc `%`*(x: MirrorSyncMode): JsonNode
proc parse*(_: typedesc[MirrorSyncMode], n: JsonNode): MirrorSyncMode
proc `%`*(x: BitmapSyncMode): JsonNode
proc parse*(_: typedesc[BitmapSyncMode], n: JsonNode): BitmapSyncMode
proc `%`*(x: MirrorCopyMode): JsonNode
proc parse*(_: typedesc[MirrorCopyMode], n: JsonNode): MirrorCopyMode
proc `%`*(x: BlockJobInfoMirror): JsonNode
proc parse*(_: typedesc[BlockJobInfoMirror], n: JsonNode): BlockJobInfoMirror
proc `%`*(x: BlockJobInfo): JsonNode
proc parse*(_: typedesc[BlockJobInfo], n: JsonNode): BlockJobInfo
proc `%`*(x: NewImageMode): JsonNode
proc parse*(_: typedesc[NewImageMode], n: JsonNode): NewImageMode
proc `%`*(x: BlockdevSnapshotSync): JsonNode
proc parse*(_: typedesc[BlockdevSnapshotSync], n: JsonNode): BlockdevSnapshotSync
proc `%`*(x: BlockdevSnapshot): JsonNode
proc parse*(_: typedesc[BlockdevSnapshot], n: JsonNode): BlockdevSnapshot
proc `%`*(x: BackupPerf): JsonNode
proc parse*(_: typedesc[BackupPerf], n: JsonNode): BackupPerf
proc `%`*(x: BackupCommon): JsonNode
proc parse*(_: typedesc[BackupCommon], n: JsonNode): BackupCommon
proc `%`*(x: DriveBackup): JsonNode
proc parse*(_: typedesc[DriveBackup], n: JsonNode): DriveBackup
proc `%`*(x: BlockdevBackup): JsonNode
proc parse*(_: typedesc[BlockdevBackup], n: JsonNode): BlockdevBackup
proc `%`*(x: XDbgBlockGraphNodeType): JsonNode
proc parse*(_: typedesc[XDbgBlockGraphNodeType], n: JsonNode): XDbgBlockGraphNodeType
proc `%`*(x: XDbgBlockGraphNode): JsonNode
proc parse*(_: typedesc[XDbgBlockGraphNode], n: JsonNode): XDbgBlockGraphNode
proc `%`*(x: BlockPermission): JsonNode
proc parse*(_: typedesc[BlockPermission], n: JsonNode): BlockPermission
proc `%`*(x: XDbgBlockGraphEdge): JsonNode
proc parse*(_: typedesc[XDbgBlockGraphEdge], n: JsonNode): XDbgBlockGraphEdge
proc `%`*(x: XDbgBlockGraph): JsonNode
proc parse*(_: typedesc[XDbgBlockGraph], n: JsonNode): XDbgBlockGraph
proc `%`*(x: DriveMirror): JsonNode
proc parse*(_: typedesc[DriveMirror], n: JsonNode): DriveMirror
proc `%`*(x: BlockDirtyBitmap): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmap], n: JsonNode): BlockDirtyBitmap
proc `%`*(x: BlockDirtyBitmapAdd): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapAdd], n: JsonNode): BlockDirtyBitmapAdd
proc `%`*(x: BlockDirtyBitmapOrStr): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapOrStr], n: JsonNode): BlockDirtyBitmapOrStr
proc `%`*(x: BlockDirtyBitmapMerge): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapMerge], n: JsonNode): BlockDirtyBitmapMerge
proc `%`*(x: BlockDirtyBitmapSha256): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapSha256], n: JsonNode): BlockDirtyBitmapSha256
proc `%`*(x: BlockIOThrottle): JsonNode
proc parse*(_: typedesc[BlockIOThrottle], n: JsonNode): BlockIOThrottle
proc `%`*(x: ThrottleLimits): JsonNode
proc parse*(_: typedesc[ThrottleLimits], n: JsonNode): ThrottleLimits
proc `%`*(x: ThrottleGroupProperties): JsonNode
proc parse*(_: typedesc[ThrottleGroupProperties], n: JsonNode): ThrottleGroupProperties
proc `%`*(x: BlockJobChangeOptionsMirror): JsonNode
proc parse*(_: typedesc[BlockJobChangeOptionsMirror], n: JsonNode): BlockJobChangeOptionsMirror
proc `%`*(x: BlockJobChangeOptions): JsonNode
proc parse*(_: typedesc[BlockJobChangeOptions], n: JsonNode): BlockJobChangeOptions
proc `%`*(x: BlockdevDiscardOptions): JsonNode
proc parse*(_: typedesc[BlockdevDiscardOptions], n: JsonNode): BlockdevDiscardOptions
proc `%`*(x: BlockdevDetectZeroesOptions): JsonNode
proc parse*(_: typedesc[BlockdevDetectZeroesOptions], n: JsonNode): BlockdevDetectZeroesOptions
proc `%`*(x: BlockdevAioOptions): JsonNode
proc parse*(_: typedesc[BlockdevAioOptions], n: JsonNode): BlockdevAioOptions
proc `%`*(x: BlockdevCacheOptions): JsonNode
proc parse*(_: typedesc[BlockdevCacheOptions], n: JsonNode): BlockdevCacheOptions
proc `%`*(x: BlockdevDriver): JsonNode
proc parse*(_: typedesc[BlockdevDriver], n: JsonNode): BlockdevDriver
proc `%`*(x: BlockdevOptionsFile): JsonNode
proc parse*(_: typedesc[BlockdevOptionsFile], n: JsonNode): BlockdevOptionsFile
proc `%`*(x: BlockdevOptionsNull): JsonNode
proc parse*(_: typedesc[BlockdevOptionsNull], n: JsonNode): BlockdevOptionsNull
proc `%`*(x: BlockdevOptionsNVMe): JsonNode
proc parse*(_: typedesc[BlockdevOptionsNVMe], n: JsonNode): BlockdevOptionsNVMe
proc `%`*(x: BlockdevOptionsVVFAT): JsonNode
proc parse*(_: typedesc[BlockdevOptionsVVFAT], n: JsonNode): BlockdevOptionsVVFAT
proc `%`*(x: BlockdevOptionsGenericFormat): JsonNode
proc parse*(_: typedesc[BlockdevOptionsGenericFormat], n: JsonNode): BlockdevOptionsGenericFormat
proc `%`*(x: BlockdevOptionsLUKS): JsonNode
proc parse*(_: typedesc[BlockdevOptionsLUKS], n: JsonNode): BlockdevOptionsLUKS
proc `%`*(x: BlockdevOptionsGenericCOWFormat): JsonNode
proc parse*(_: typedesc[BlockdevOptionsGenericCOWFormat], n: JsonNode): BlockdevOptionsGenericCOWFormat
proc `%`*(x: Qcow2OverlapCheckMode): JsonNode
proc parse*(_: typedesc[Qcow2OverlapCheckMode], n: JsonNode): Qcow2OverlapCheckMode
proc `%`*(x: Qcow2OverlapCheckFlags): JsonNode
proc parse*(_: typedesc[Qcow2OverlapCheckFlags], n: JsonNode): Qcow2OverlapCheckFlags
proc `%`*(x: Qcow2OverlapChecks): JsonNode
proc parse*(_: typedesc[Qcow2OverlapChecks], n: JsonNode): Qcow2OverlapChecks
proc `%`*(x: BlockdevQcowEncryptionFormat): JsonNode
proc parse*(_: typedesc[BlockdevQcowEncryptionFormat], n: JsonNode): BlockdevQcowEncryptionFormat
proc `%`*(x: BlockdevQcowEncryption): JsonNode
proc parse*(_: typedesc[BlockdevQcowEncryption], n: JsonNode): BlockdevQcowEncryption
proc `%`*(x: BlockdevOptionsQcow): JsonNode
proc parse*(_: typedesc[BlockdevOptionsQcow], n: JsonNode): BlockdevOptionsQcow
proc `%`*(x: BlockdevQcow2EncryptionFormat): JsonNode
proc parse*(_: typedesc[BlockdevQcow2EncryptionFormat], n: JsonNode): BlockdevQcow2EncryptionFormat
proc `%`*(x: BlockdevQcow2Encryption): JsonNode
proc parse*(_: typedesc[BlockdevQcow2Encryption], n: JsonNode): BlockdevQcow2Encryption
proc `%`*(x: BlockdevOptionsPreallocate): JsonNode
proc parse*(_: typedesc[BlockdevOptionsPreallocate], n: JsonNode): BlockdevOptionsPreallocate
proc `%`*(x: BlockdevOptionsQcow2): JsonNode
proc parse*(_: typedesc[BlockdevOptionsQcow2], n: JsonNode): BlockdevOptionsQcow2
proc `%`*(x: SshHostKeyCheckMode): JsonNode
proc parse*(_: typedesc[SshHostKeyCheckMode], n: JsonNode): SshHostKeyCheckMode
proc `%`*(x: SshHostKeyCheckHashType): JsonNode
proc parse*(_: typedesc[SshHostKeyCheckHashType], n: JsonNode): SshHostKeyCheckHashType
proc `%`*(x: SshHostKeyHash): JsonNode
proc parse*(_: typedesc[SshHostKeyHash], n: JsonNode): SshHostKeyHash
proc `%`*(x: SshHostKeyCheck): JsonNode
proc parse*(_: typedesc[SshHostKeyCheck], n: JsonNode): SshHostKeyCheck
proc `%`*(x: BlockdevOptionsSsh): JsonNode
proc parse*(_: typedesc[BlockdevOptionsSsh], n: JsonNode): BlockdevOptionsSsh
proc `%`*(x: BlkdebugEvent): JsonNode
proc parse*(_: typedesc[BlkdebugEvent], n: JsonNode): BlkdebugEvent
proc `%`*(x: BlkdebugIOType): JsonNode
proc parse*(_: typedesc[BlkdebugIOType], n: JsonNode): BlkdebugIOType
proc `%`*(x: BlkdebugInjectErrorOptions): JsonNode
proc parse*(_: typedesc[BlkdebugInjectErrorOptions], n: JsonNode): BlkdebugInjectErrorOptions
proc `%`*(x: BlkdebugSetStateOptions): JsonNode
proc parse*(_: typedesc[BlkdebugSetStateOptions], n: JsonNode): BlkdebugSetStateOptions
proc `%`*(x: BlockdevOptionsBlkdebug): JsonNode
proc parse*(_: typedesc[BlockdevOptionsBlkdebug], n: JsonNode): BlockdevOptionsBlkdebug
proc `%`*(x: BlockdevOptionsBlklogwrites): JsonNode
proc parse*(_: typedesc[BlockdevOptionsBlklogwrites], n: JsonNode): BlockdevOptionsBlklogwrites
proc `%`*(x: BlockdevOptionsBlkverify): JsonNode
proc parse*(_: typedesc[BlockdevOptionsBlkverify], n: JsonNode): BlockdevOptionsBlkverify
proc `%`*(x: BlockdevOptionsBlkreplay): JsonNode
proc parse*(_: typedesc[BlockdevOptionsBlkreplay], n: JsonNode): BlockdevOptionsBlkreplay
proc `%`*(x: QuorumReadPattern): JsonNode
proc parse*(_: typedesc[QuorumReadPattern], n: JsonNode): QuorumReadPattern
proc `%`*(x: BlockdevOptionsQuorum): JsonNode
proc parse*(_: typedesc[BlockdevOptionsQuorum], n: JsonNode): BlockdevOptionsQuorum
proc `%`*(x: BlockdevOptionsGluster): JsonNode
proc parse*(_: typedesc[BlockdevOptionsGluster], n: JsonNode): BlockdevOptionsGluster
proc `%`*(x: BlockdevOptionsIoUring): JsonNode
proc parse*(_: typedesc[BlockdevOptionsIoUring], n: JsonNode): BlockdevOptionsIoUring
proc `%`*(x: BlockdevOptionsNvmeIoUring): JsonNode
proc parse*(_: typedesc[BlockdevOptionsNvmeIoUring], n: JsonNode): BlockdevOptionsNvmeIoUring
proc `%`*(x: BlockdevOptionsVirtioBlkVfioPci): JsonNode
proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVfioPci], n: JsonNode): BlockdevOptionsVirtioBlkVfioPci
proc `%`*(x: BlockdevOptionsVirtioBlkVhostUser): JsonNode
proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVhostUser], n: JsonNode): BlockdevOptionsVirtioBlkVhostUser
proc `%`*(x: BlockdevOptionsVirtioBlkVhostVdpa): JsonNode
proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVhostVdpa], n: JsonNode): BlockdevOptionsVirtioBlkVhostVdpa
proc `%`*(x: IscsiTransport): JsonNode
proc parse*(_: typedesc[IscsiTransport], n: JsonNode): IscsiTransport
proc `%`*(x: IscsiHeaderDigest): JsonNode
proc parse*(_: typedesc[IscsiHeaderDigest], n: JsonNode): IscsiHeaderDigest
proc `%`*(x: BlockdevOptionsIscsi): JsonNode
proc parse*(_: typedesc[BlockdevOptionsIscsi], n: JsonNode): BlockdevOptionsIscsi
proc `%`*(x: RbdAuthMode): JsonNode
proc parse*(_: typedesc[RbdAuthMode], n: JsonNode): RbdAuthMode
proc `%`*(x: RbdImageEncryptionFormat): JsonNode
proc parse*(_: typedesc[RbdImageEncryptionFormat], n: JsonNode): RbdImageEncryptionFormat
proc `%`*(x: RbdEncryptionOptionsLUKSBase): JsonNode
proc parse*(_: typedesc[RbdEncryptionOptionsLUKSBase], n: JsonNode): RbdEncryptionOptionsLUKSBase
proc `%`*(x: RbdEncryptionCreateOptionsLUKSBase): JsonNode
proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKSBase], n: JsonNode): RbdEncryptionCreateOptionsLUKSBase
proc `%`*(x: RbdEncryptionOptionsLUKS): JsonNode
proc parse*(_: typedesc[RbdEncryptionOptionsLUKS], n: JsonNode): RbdEncryptionOptionsLUKS
proc `%`*(x: RbdEncryptionOptionsLUKS2): JsonNode
proc parse*(_: typedesc[RbdEncryptionOptionsLUKS2], n: JsonNode): RbdEncryptionOptionsLUKS2
proc `%`*(x: RbdEncryptionOptionsLUKSAny): JsonNode
proc parse*(_: typedesc[RbdEncryptionOptionsLUKSAny], n: JsonNode): RbdEncryptionOptionsLUKSAny
proc `%`*(x: RbdEncryptionCreateOptionsLUKS): JsonNode
proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKS], n: JsonNode): RbdEncryptionCreateOptionsLUKS
proc `%`*(x: RbdEncryptionCreateOptionsLUKS2): JsonNode
proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKS2], n: JsonNode): RbdEncryptionCreateOptionsLUKS2
proc `%`*(x: RbdEncryptionOptions): JsonNode
proc parse*(_: typedesc[RbdEncryptionOptions], n: JsonNode): RbdEncryptionOptions
proc `%`*(x: RbdEncryptionCreateOptions): JsonNode
proc parse*(_: typedesc[RbdEncryptionCreateOptions], n: JsonNode): RbdEncryptionCreateOptions
proc `%`*(x: BlockdevOptionsRbd): JsonNode
proc parse*(_: typedesc[BlockdevOptionsRbd], n: JsonNode): BlockdevOptionsRbd
proc `%`*(x: ReplicationMode): JsonNode
proc parse*(_: typedesc[ReplicationMode], n: JsonNode): ReplicationMode
proc `%`*(x: BlockdevOptionsReplication): JsonNode
proc parse*(_: typedesc[BlockdevOptionsReplication], n: JsonNode): BlockdevOptionsReplication
proc `%`*(x: NFSTransport): JsonNode
proc parse*(_: typedesc[NFSTransport], n: JsonNode): NFSTransport
proc `%`*(x: NFSServer): JsonNode
proc parse*(_: typedesc[NFSServer], n: JsonNode): NFSServer
proc `%`*(x: BlockdevOptionsNfs): JsonNode
proc parse*(_: typedesc[BlockdevOptionsNfs], n: JsonNode): BlockdevOptionsNfs
proc `%`*(x: BlockdevOptionsCurlBase): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCurlBase], n: JsonNode): BlockdevOptionsCurlBase
proc `%`*(x: BlockdevOptionsCurlHttp): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCurlHttp], n: JsonNode): BlockdevOptionsCurlHttp
proc `%`*(x: BlockdevOptionsCurlHttps): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCurlHttps], n: JsonNode): BlockdevOptionsCurlHttps
proc `%`*(x: BlockdevOptionsCurlFtp): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCurlFtp], n: JsonNode): BlockdevOptionsCurlFtp
proc `%`*(x: BlockdevOptionsCurlFtps): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCurlFtps], n: JsonNode): BlockdevOptionsCurlFtps
proc `%`*(x: BlockdevOptionsNbd): JsonNode
proc parse*(_: typedesc[BlockdevOptionsNbd], n: JsonNode): BlockdevOptionsNbd
proc `%`*(x: BlockdevOptionsRaw): JsonNode
proc parse*(_: typedesc[BlockdevOptionsRaw], n: JsonNode): BlockdevOptionsRaw
proc `%`*(x: BlockdevOptionsThrottle): JsonNode
proc parse*(_: typedesc[BlockdevOptionsThrottle], n: JsonNode): BlockdevOptionsThrottle
proc `%`*(x: BlockdevOptionsCor): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCor], n: JsonNode): BlockdevOptionsCor
proc `%`*(x: OnCbwError): JsonNode
proc parse*(_: typedesc[OnCbwError], n: JsonNode): OnCbwError
proc `%`*(x: BlockdevOptionsCbw): JsonNode
proc parse*(_: typedesc[BlockdevOptionsCbw], n: JsonNode): BlockdevOptionsCbw
proc `%`*(x: BlockdevOptions): JsonNode
proc parse*(_: typedesc[BlockdevOptions], n: JsonNode): BlockdevOptions
proc `%`*(x: BlockdevRef): JsonNode
proc parse*(_: typedesc[BlockdevRef], n: JsonNode): BlockdevRef
proc `%`*(x: BlockdevRefOrNull): JsonNode
proc parse*(_: typedesc[BlockdevRefOrNull], n: JsonNode): BlockdevRefOrNull
proc `%`*(x: BlockdevCreateOptionsFile): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsFile], n: JsonNode): BlockdevCreateOptionsFile
proc `%`*(x: BlockdevCreateOptionsGluster): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsGluster], n: JsonNode): BlockdevCreateOptionsGluster
proc `%`*(x: BlockdevCreateOptionsLUKS): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsLUKS], n: JsonNode): BlockdevCreateOptionsLUKS
proc `%`*(x: BlockdevCreateOptionsNfs): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsNfs], n: JsonNode): BlockdevCreateOptionsNfs
proc `%`*(x: BlockdevCreateOptionsParallels): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsParallels], n: JsonNode): BlockdevCreateOptionsParallels
proc `%`*(x: BlockdevCreateOptionsQcow): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsQcow], n: JsonNode): BlockdevCreateOptionsQcow
proc `%`*(x: BlockdevQcow2Version): JsonNode
proc parse*(_: typedesc[BlockdevQcow2Version], n: JsonNode): BlockdevQcow2Version
proc `%`*(x: Qcow2CompressionType): JsonNode
proc parse*(_: typedesc[Qcow2CompressionType], n: JsonNode): Qcow2CompressionType
proc `%`*(x: BlockdevCreateOptionsQcow2): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsQcow2], n: JsonNode): BlockdevCreateOptionsQcow2
proc `%`*(x: BlockdevCreateOptionsQed): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsQed], n: JsonNode): BlockdevCreateOptionsQed
proc `%`*(x: BlockdevCreateOptionsRbd): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsRbd], n: JsonNode): BlockdevCreateOptionsRbd
proc `%`*(x: BlockdevVmdkSubformat): JsonNode
proc parse*(_: typedesc[BlockdevVmdkSubformat], n: JsonNode): BlockdevVmdkSubformat
proc `%`*(x: BlockdevVmdkAdapterType): JsonNode
proc parse*(_: typedesc[BlockdevVmdkAdapterType], n: JsonNode): BlockdevVmdkAdapterType
proc `%`*(x: BlockdevCreateOptionsVmdk): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsVmdk], n: JsonNode): BlockdevCreateOptionsVmdk
proc `%`*(x: BlockdevCreateOptionsSsh): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsSsh], n: JsonNode): BlockdevCreateOptionsSsh
proc `%`*(x: BlockdevCreateOptionsVdi): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsVdi], n: JsonNode): BlockdevCreateOptionsVdi
proc `%`*(x: BlockdevVhdxSubformat): JsonNode
proc parse*(_: typedesc[BlockdevVhdxSubformat], n: JsonNode): BlockdevVhdxSubformat
proc `%`*(x: BlockdevCreateOptionsVhdx): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsVhdx], n: JsonNode): BlockdevCreateOptionsVhdx
proc `%`*(x: BlockdevVpcSubformat): JsonNode
proc parse*(_: typedesc[BlockdevVpcSubformat], n: JsonNode): BlockdevVpcSubformat
proc `%`*(x: BlockdevCreateOptionsVpc): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptionsVpc], n: JsonNode): BlockdevCreateOptionsVpc
proc `%`*(x: BlockdevCreateOptions): JsonNode
proc parse*(_: typedesc[BlockdevCreateOptions], n: JsonNode): BlockdevCreateOptions
proc `%`*(x: BlockdevAmendOptionsLUKS): JsonNode
proc parse*(_: typedesc[BlockdevAmendOptionsLUKS], n: JsonNode): BlockdevAmendOptionsLUKS
proc `%`*(x: BlockdevAmendOptionsQcow2): JsonNode
proc parse*(_: typedesc[BlockdevAmendOptionsQcow2], n: JsonNode): BlockdevAmendOptionsQcow2
proc `%`*(x: BlockdevAmendOptions): JsonNode
proc parse*(_: typedesc[BlockdevAmendOptions], n: JsonNode): BlockdevAmendOptions
proc `%`*(x: BlockErrorAction): JsonNode
proc parse*(_: typedesc[BlockErrorAction], n: JsonNode): BlockErrorAction
proc `%`*(x: PreallocMode): JsonNode
proc parse*(_: typedesc[PreallocMode], n: JsonNode): PreallocMode
proc `%`*(x: QuorumOpType): JsonNode
proc parse*(_: typedesc[QuorumOpType], n: JsonNode): QuorumOpType
proc `%`*(x: BlockdevSnapshotInternal): JsonNode
proc parse*(_: typedesc[BlockdevSnapshotInternal], n: JsonNode): BlockdevSnapshotInternal
proc `%`*(x: DummyBlockCoreForceArrays): JsonNode
proc parse*(_: typedesc[DummyBlockCoreForceArrays], n: JsonNode): DummyBlockCoreForceArrays
proc `%`*(x: BiosAtaTranslation): JsonNode
proc parse*(_: typedesc[BiosAtaTranslation], n: JsonNode): BiosAtaTranslation
proc `%`*(x: FloppyDriveType): JsonNode
proc parse*(_: typedesc[FloppyDriveType], n: JsonNode): FloppyDriveType
proc `%`*(x: PRManagerInfo): JsonNode
proc parse*(_: typedesc[PRManagerInfo], n: JsonNode): PRManagerInfo
proc `%`*(x: BlockdevChangeReadOnlyMode): JsonNode
proc parse*(_: typedesc[BlockdevChangeReadOnlyMode], n: JsonNode): BlockdevChangeReadOnlyMode
proc `%`*(x: NbdServerOptionsBase): JsonNode
proc parse*(_: typedesc[NbdServerOptionsBase], n: JsonNode): NbdServerOptionsBase
proc `%`*(x: NbdServerOptions): JsonNode
proc parse*(_: typedesc[NbdServerOptions], n: JsonNode): NbdServerOptions
proc `%`*(x: NbdServerOptionsLegacy): JsonNode
proc parse*(_: typedesc[NbdServerOptionsLegacy], n: JsonNode): NbdServerOptionsLegacy
proc `%`*(x: BlockExportOptionsNbdBase): JsonNode
proc parse*(_: typedesc[BlockExportOptionsNbdBase], n: JsonNode): BlockExportOptionsNbdBase
proc `%`*(x: BlockExportOptionsNbd): JsonNode
proc parse*(_: typedesc[BlockExportOptionsNbd], n: JsonNode): BlockExportOptionsNbd
proc `%`*(x: BlockExportOptionsVhostUserBlk): JsonNode
proc parse*(_: typedesc[BlockExportOptionsVhostUserBlk], n: JsonNode): BlockExportOptionsVhostUserBlk
proc `%`*(x: FuseExportAllowOther): JsonNode
proc parse*(_: typedesc[FuseExportAllowOther], n: JsonNode): FuseExportAllowOther
proc `%`*(x: BlockExportOptionsFuse): JsonNode
proc parse*(_: typedesc[BlockExportOptionsFuse], n: JsonNode): BlockExportOptionsFuse
proc `%`*(x: BlockExportOptionsVduseBlk): JsonNode
proc parse*(_: typedesc[BlockExportOptionsVduseBlk], n: JsonNode): BlockExportOptionsVduseBlk
proc `%`*(x: NbdServerAddOptions): JsonNode
proc parse*(_: typedesc[NbdServerAddOptions], n: JsonNode): NbdServerAddOptions
proc `%`*(x: BlockExportRemoveMode): JsonNode
proc parse*(_: typedesc[BlockExportRemoveMode], n: JsonNode): BlockExportRemoveMode
proc `%`*(x: BlockExportType): JsonNode
proc parse*(_: typedesc[BlockExportType], n: JsonNode): BlockExportType
proc `%`*(x: BlockExportOptions): JsonNode
proc parse*(_: typedesc[BlockExportOptions], n: JsonNode): BlockExportOptions
proc `%`*(x: BlockExportIothreads): JsonNode
proc parse*(_: typedesc[BlockExportIothreads], n: JsonNode): BlockExportIothreads
proc `%`*(x: BlockExportInfo): JsonNode
proc parse*(_: typedesc[BlockExportInfo], n: JsonNode): BlockExportInfo
proc `%`*(x: ChardevInfo): JsonNode
proc parse*(_: typedesc[ChardevInfo], n: JsonNode): ChardevInfo
proc `%`*(x: ChardevBackendInfo): JsonNode
proc parse*(_: typedesc[ChardevBackendInfo], n: JsonNode): ChardevBackendInfo
proc `%`*(x: DataFormat): JsonNode
proc parse*(_: typedesc[DataFormat], n: JsonNode): DataFormat
proc `%`*(x: ChardevCommon): JsonNode
proc parse*(_: typedesc[ChardevCommon], n: JsonNode): ChardevCommon
proc `%`*(x: ChardevFile): JsonNode
proc parse*(_: typedesc[ChardevFile], n: JsonNode): ChardevFile
proc `%`*(x: ChardevHostdev): JsonNode
proc parse*(_: typedesc[ChardevHostdev], n: JsonNode): ChardevHostdev
proc `%`*(x: ChardevSocket): JsonNode
proc parse*(_: typedesc[ChardevSocket], n: JsonNode): ChardevSocket
proc `%`*(x: ChardevUdp): JsonNode
proc parse*(_: typedesc[ChardevUdp], n: JsonNode): ChardevUdp
proc `%`*(x: ChardevMux): JsonNode
proc parse*(_: typedesc[ChardevMux], n: JsonNode): ChardevMux
proc `%`*(x: ChardevHub): JsonNode
proc parse*(_: typedesc[ChardevHub], n: JsonNode): ChardevHub
proc `%`*(x: ChardevStdio): JsonNode
proc parse*(_: typedesc[ChardevStdio], n: JsonNode): ChardevStdio
proc `%`*(x: ChardevSpiceChannel): JsonNode
proc parse*(_: typedesc[ChardevSpiceChannel], n: JsonNode): ChardevSpiceChannel
proc `%`*(x: ChardevSpicePort): JsonNode
proc parse*(_: typedesc[ChardevSpicePort], n: JsonNode): ChardevSpicePort
proc `%`*(x: ChardevDBus): JsonNode
proc parse*(_: typedesc[ChardevDBus], n: JsonNode): ChardevDBus
proc `%`*(x: ChardevVC): JsonNode
proc parse*(_: typedesc[ChardevVC], n: JsonNode): ChardevVC
proc `%`*(x: ChardevRingbuf): JsonNode
proc parse*(_: typedesc[ChardevRingbuf], n: JsonNode): ChardevRingbuf
proc `%`*(x: ChardevQemuVDAgent): JsonNode
proc parse*(_: typedesc[ChardevQemuVDAgent], n: JsonNode): ChardevQemuVDAgent
proc `%`*(x: ChardevPty): JsonNode
proc parse*(_: typedesc[ChardevPty], n: JsonNode): ChardevPty
proc `%`*(x: ChardevBackendKind): JsonNode
proc parse*(_: typedesc[ChardevBackendKind], n: JsonNode): ChardevBackendKind
proc `%`*(x: ChardevFileWrapper): JsonNode
proc parse*(_: typedesc[ChardevFileWrapper], n: JsonNode): ChardevFileWrapper
proc `%`*(x: ChardevHostdevWrapper): JsonNode
proc parse*(_: typedesc[ChardevHostdevWrapper], n: JsonNode): ChardevHostdevWrapper
proc `%`*(x: ChardevSocketWrapper): JsonNode
proc parse*(_: typedesc[ChardevSocketWrapper], n: JsonNode): ChardevSocketWrapper
proc `%`*(x: ChardevUdpWrapper): JsonNode
proc parse*(_: typedesc[ChardevUdpWrapper], n: JsonNode): ChardevUdpWrapper
proc `%`*(x: ChardevCommonWrapper): JsonNode
proc parse*(_: typedesc[ChardevCommonWrapper], n: JsonNode): ChardevCommonWrapper
proc `%`*(x: ChardevMuxWrapper): JsonNode
proc parse*(_: typedesc[ChardevMuxWrapper], n: JsonNode): ChardevMuxWrapper
proc `%`*(x: ChardevHubWrapper): JsonNode
proc parse*(_: typedesc[ChardevHubWrapper], n: JsonNode): ChardevHubWrapper
proc `%`*(x: ChardevStdioWrapper): JsonNode
proc parse*(_: typedesc[ChardevStdioWrapper], n: JsonNode): ChardevStdioWrapper
proc `%`*(x: ChardevSpiceChannelWrapper): JsonNode
proc parse*(_: typedesc[ChardevSpiceChannelWrapper], n: JsonNode): ChardevSpiceChannelWrapper
proc `%`*(x: ChardevSpicePortWrapper): JsonNode
proc parse*(_: typedesc[ChardevSpicePortWrapper], n: JsonNode): ChardevSpicePortWrapper
proc `%`*(x: ChardevQemuVDAgentWrapper): JsonNode
proc parse*(_: typedesc[ChardevQemuVDAgentWrapper], n: JsonNode): ChardevQemuVDAgentWrapper
proc `%`*(x: ChardevDBusWrapper): JsonNode
proc parse*(_: typedesc[ChardevDBusWrapper], n: JsonNode): ChardevDBusWrapper
proc `%`*(x: ChardevVCWrapper): JsonNode
proc parse*(_: typedesc[ChardevVCWrapper], n: JsonNode): ChardevVCWrapper
proc `%`*(x: ChardevRingbufWrapper): JsonNode
proc parse*(_: typedesc[ChardevRingbufWrapper], n: JsonNode): ChardevRingbufWrapper
proc `%`*(x: ChardevPtyWrapper): JsonNode
proc parse*(_: typedesc[ChardevPtyWrapper], n: JsonNode): ChardevPtyWrapper
proc `%`*(x: ChardevBackend): JsonNode
proc parse*(_: typedesc[ChardevBackend], n: JsonNode): ChardevBackend
proc `%`*(x: ChardevReturn): JsonNode
proc parse*(_: typedesc[ChardevReturn], n: JsonNode): ChardevReturn
proc `%`*(x: DumpGuestMemoryFormat): JsonNode
proc parse*(_: typedesc[DumpGuestMemoryFormat], n: JsonNode): DumpGuestMemoryFormat
proc `%`*(x: DumpStatus): JsonNode
proc parse*(_: typedesc[DumpStatus], n: JsonNode): DumpStatus
proc `%`*(x: DumpQueryResult): JsonNode
proc parse*(_: typedesc[DumpQueryResult], n: JsonNode): DumpQueryResult
proc `%`*(x: DumpGuestMemoryCapability): JsonNode
proc parse*(_: typedesc[DumpGuestMemoryCapability], n: JsonNode): DumpGuestMemoryCapability
proc `%`*(x: NetLegacyNicOptions): JsonNode
proc parse*(_: typedesc[NetLegacyNicOptions], n: JsonNode): NetLegacyNicOptions
proc `%`*(x: String): JsonNode
proc parse*(_: typedesc[String], n: JsonNode): String
proc `%`*(x: NetDevPasstOptions): JsonNode
proc parse*(_: typedesc[NetDevPasstOptions], n: JsonNode): NetDevPasstOptions
proc `%`*(x: NetdevUserOptions): JsonNode
proc parse*(_: typedesc[NetdevUserOptions], n: JsonNode): NetdevUserOptions
proc `%`*(x: NetdevTapOptions): JsonNode
proc parse*(_: typedesc[NetdevTapOptions], n: JsonNode): NetdevTapOptions
proc `%`*(x: NetdevSocketOptions): JsonNode
proc parse*(_: typedesc[NetdevSocketOptions], n: JsonNode): NetdevSocketOptions
proc `%`*(x: NetdevL2TPv3Options): JsonNode
proc parse*(_: typedesc[NetdevL2TPv3Options], n: JsonNode): NetdevL2TPv3Options
proc `%`*(x: NetdevVdeOptions): JsonNode
proc parse*(_: typedesc[NetdevVdeOptions], n: JsonNode): NetdevVdeOptions
proc `%`*(x: NetdevBridgeOptions): JsonNode
proc parse*(_: typedesc[NetdevBridgeOptions], n: JsonNode): NetdevBridgeOptions
proc `%`*(x: NetdevHubPortOptions): JsonNode
proc parse*(_: typedesc[NetdevHubPortOptions], n: JsonNode): NetdevHubPortOptions
proc `%`*(x: NetdevNetmapOptions): JsonNode
proc parse*(_: typedesc[NetdevNetmapOptions], n: JsonNode): NetdevNetmapOptions
proc `%`*(x: AFXDPMode): JsonNode
proc parse*(_: typedesc[AFXDPMode], n: JsonNode): AFXDPMode
proc `%`*(x: NetdevAFXDPOptions): JsonNode
proc parse*(_: typedesc[NetdevAFXDPOptions], n: JsonNode): NetdevAFXDPOptions
proc `%`*(x: NetdevVhostUserOptions): JsonNode
proc parse*(_: typedesc[NetdevVhostUserOptions], n: JsonNode): NetdevVhostUserOptions
proc `%`*(x: NetdevVhostVDPAOptions): JsonNode
proc parse*(_: typedesc[NetdevVhostVDPAOptions], n: JsonNode): NetdevVhostVDPAOptions
proc `%`*(x: NetdevVmnetHostOptions): JsonNode
proc parse*(_: typedesc[NetdevVmnetHostOptions], n: JsonNode): NetdevVmnetHostOptions
proc `%`*(x: NetdevVmnetSharedOptions): JsonNode
proc parse*(_: typedesc[NetdevVmnetSharedOptions], n: JsonNode): NetdevVmnetSharedOptions
proc `%`*(x: NetdevVmnetBridgedOptions): JsonNode
proc parse*(_: typedesc[NetdevVmnetBridgedOptions], n: JsonNode): NetdevVmnetBridgedOptions
proc `%`*(x: NetdevStreamOptions): JsonNode
proc parse*(_: typedesc[NetdevStreamOptions], n: JsonNode): NetdevStreamOptions
proc `%`*(x: NetdevDgramOptions): JsonNode
proc parse*(_: typedesc[NetdevDgramOptions], n: JsonNode): NetdevDgramOptions
proc `%`*(x: NetClientDriver): JsonNode
proc parse*(_: typedesc[NetClientDriver], n: JsonNode): NetClientDriver
proc `%`*(x: Netdev): JsonNode
proc parse*(_: typedesc[Netdev], n: JsonNode): Netdev
proc `%`*(x: RxState): JsonNode
proc parse*(_: typedesc[RxState], n: JsonNode): RxState
proc `%`*(x: RxFilterInfo): JsonNode
proc parse*(_: typedesc[RxFilterInfo], n: JsonNode): RxFilterInfo
proc `%`*(x: AnnounceParameters): JsonNode
proc parse*(_: typedesc[AnnounceParameters], n: JsonNode): AnnounceParameters
proc `%`*(x: EbpfObject): JsonNode
proc parse*(_: typedesc[EbpfObject], n: JsonNode): EbpfObject
proc `%`*(x: EbpfProgramID): JsonNode
proc parse*(_: typedesc[EbpfProgramID], n: JsonNode): EbpfProgramID
proc `%`*(x: RockerSwitch): JsonNode
proc parse*(_: typedesc[RockerSwitch], n: JsonNode): RockerSwitch
proc `%`*(x: RockerPortDuplex): JsonNode
proc parse*(_: typedesc[RockerPortDuplex], n: JsonNode): RockerPortDuplex
proc `%`*(x: RockerPortAutoneg): JsonNode
proc parse*(_: typedesc[RockerPortAutoneg], n: JsonNode): RockerPortAutoneg
proc `%`*(x: RockerPort): JsonNode
proc parse*(_: typedesc[RockerPort], n: JsonNode): RockerPort
proc `%`*(x: RockerOfDpaFlowKey): JsonNode
proc parse*(_: typedesc[RockerOfDpaFlowKey], n: JsonNode): RockerOfDpaFlowKey
proc `%`*(x: RockerOfDpaFlowMask): JsonNode
proc parse*(_: typedesc[RockerOfDpaFlowMask], n: JsonNode): RockerOfDpaFlowMask
proc `%`*(x: RockerOfDpaFlowAction): JsonNode
proc parse*(_: typedesc[RockerOfDpaFlowAction], n: JsonNode): RockerOfDpaFlowAction
proc `%`*(x: RockerOfDpaFlow): JsonNode
proc parse*(_: typedesc[RockerOfDpaFlow], n: JsonNode): RockerOfDpaFlow
proc `%`*(x: RockerOfDpaGroup): JsonNode
proc parse*(_: typedesc[RockerOfDpaGroup], n: JsonNode): RockerOfDpaGroup
proc `%`*(x: TpmModel): JsonNode
proc parse*(_: typedesc[TpmModel], n: JsonNode): TpmModel
proc `%`*(x: TpmType): JsonNode
proc parse*(_: typedesc[TpmType], n: JsonNode): TpmType
proc `%`*(x: TPMPassthroughOptions): JsonNode
proc parse*(_: typedesc[TPMPassthroughOptions], n: JsonNode): TPMPassthroughOptions
proc `%`*(x: TPMEmulatorOptions): JsonNode
proc parse*(_: typedesc[TPMEmulatorOptions], n: JsonNode): TPMEmulatorOptions
proc `%`*(x: TPMPassthroughOptionsWrapper): JsonNode
proc parse*(_: typedesc[TPMPassthroughOptionsWrapper], n: JsonNode): TPMPassthroughOptionsWrapper
proc `%`*(x: TPMEmulatorOptionsWrapper): JsonNode
proc parse*(_: typedesc[TPMEmulatorOptionsWrapper], n: JsonNode): TPMEmulatorOptionsWrapper
proc `%`*(x: TpmTypeOptions): JsonNode
proc parse*(_: typedesc[TpmTypeOptions], n: JsonNode): TpmTypeOptions
proc `%`*(x: TPMInfo): JsonNode
proc parse*(_: typedesc[TPMInfo], n: JsonNode): TPMInfo
proc `%`*(x: DisplayProtocol): JsonNode
proc parse*(_: typedesc[DisplayProtocol], n: JsonNode): DisplayProtocol
proc `%`*(x: SetPasswordAction): JsonNode
proc parse*(_: typedesc[SetPasswordAction], n: JsonNode): SetPasswordAction
proc `%`*(x: SetPasswordOptions): JsonNode
proc parse*(_: typedesc[SetPasswordOptions], n: JsonNode): SetPasswordOptions
proc `%`*(x: SetPasswordOptionsVnc): JsonNode
proc parse*(_: typedesc[SetPasswordOptionsVnc], n: JsonNode): SetPasswordOptionsVnc
proc `%`*(x: ExpirePasswordOptions): JsonNode
proc parse*(_: typedesc[ExpirePasswordOptions], n: JsonNode): ExpirePasswordOptions
proc `%`*(x: ExpirePasswordOptionsVnc): JsonNode
proc parse*(_: typedesc[ExpirePasswordOptionsVnc], n: JsonNode): ExpirePasswordOptionsVnc
proc `%`*(x: ImageFormat): JsonNode
proc parse*(_: typedesc[ImageFormat], n: JsonNode): ImageFormat
proc `%`*(x: SpiceBasicInfo): JsonNode
proc parse*(_: typedesc[SpiceBasicInfo], n: JsonNode): SpiceBasicInfo
proc `%`*(x: SpiceServerInfo): JsonNode
proc parse*(_: typedesc[SpiceServerInfo], n: JsonNode): SpiceServerInfo
proc `%`*(x: SpiceChannel): JsonNode
proc parse*(_: typedesc[SpiceChannel], n: JsonNode): SpiceChannel
proc `%`*(x: SpiceQueryMouseMode): JsonNode
proc parse*(_: typedesc[SpiceQueryMouseMode], n: JsonNode): SpiceQueryMouseMode
proc `%`*(x: SpiceInfo): JsonNode
proc parse*(_: typedesc[SpiceInfo], n: JsonNode): SpiceInfo
proc `%`*(x: VncBasicInfo): JsonNode
proc parse*(_: typedesc[VncBasicInfo], n: JsonNode): VncBasicInfo
proc `%`*(x: VncServerInfo): JsonNode
proc parse*(_: typedesc[VncServerInfo], n: JsonNode): VncServerInfo
proc `%`*(x: VncClientInfo): JsonNode
proc parse*(_: typedesc[VncClientInfo], n: JsonNode): VncClientInfo
proc `%`*(x: VncInfo): JsonNode
proc parse*(_: typedesc[VncInfo], n: JsonNode): VncInfo
proc `%`*(x: VncPrimaryAuth): JsonNode
proc parse*(_: typedesc[VncPrimaryAuth], n: JsonNode): VncPrimaryAuth
proc `%`*(x: VncVencryptSubAuth): JsonNode
proc parse*(_: typedesc[VncVencryptSubAuth], n: JsonNode): VncVencryptSubAuth
proc `%`*(x: VncServerInfo2): JsonNode
proc parse*(_: typedesc[VncServerInfo2], n: JsonNode): VncServerInfo2
proc `%`*(x: VncInfo2): JsonNode
proc parse*(_: typedesc[VncInfo2], n: JsonNode): VncInfo2
proc `%`*(x: MouseInfo): JsonNode
proc parse*(_: typedesc[MouseInfo], n: JsonNode): MouseInfo
proc `%`*(x: QKeyCode): JsonNode
proc parse*(_: typedesc[QKeyCode], n: JsonNode): QKeyCode
proc `%`*(x: KeyValueKind): JsonNode
proc parse*(_: typedesc[KeyValueKind], n: JsonNode): KeyValueKind
proc `%`*(x: IntWrapper): JsonNode
proc parse*(_: typedesc[IntWrapper], n: JsonNode): IntWrapper
proc `%`*(x: QKeyCodeWrapper): JsonNode
proc parse*(_: typedesc[QKeyCodeWrapper], n: JsonNode): QKeyCodeWrapper
proc `%`*(x: KeyValue): JsonNode
proc parse*(_: typedesc[KeyValue], n: JsonNode): KeyValue
proc `%`*(x: InputButton): JsonNode
proc parse*(_: typedesc[InputButton], n: JsonNode): InputButton
proc `%`*(x: InputAxis): JsonNode
proc parse*(_: typedesc[InputAxis], n: JsonNode): InputAxis
proc `%`*(x: InputMultiTouchType): JsonNode
proc parse*(_: typedesc[InputMultiTouchType], n: JsonNode): InputMultiTouchType
proc `%`*(x: InputKeyEvent): JsonNode
proc parse*(_: typedesc[InputKeyEvent], n: JsonNode): InputKeyEvent
proc `%`*(x: InputBtnEvent): JsonNode
proc parse*(_: typedesc[InputBtnEvent], n: JsonNode): InputBtnEvent
proc `%`*(x: InputMoveEvent): JsonNode
proc parse*(_: typedesc[InputMoveEvent], n: JsonNode): InputMoveEvent
proc `%`*(x: InputMultiTouchEvent): JsonNode
proc parse*(_: typedesc[InputMultiTouchEvent], n: JsonNode): InputMultiTouchEvent
proc `%`*(x: InputEventKind): JsonNode
proc parse*(_: typedesc[InputEventKind], n: JsonNode): InputEventKind
proc `%`*(x: InputKeyEventWrapper): JsonNode
proc parse*(_: typedesc[InputKeyEventWrapper], n: JsonNode): InputKeyEventWrapper
proc `%`*(x: InputBtnEventWrapper): JsonNode
proc parse*(_: typedesc[InputBtnEventWrapper], n: JsonNode): InputBtnEventWrapper
proc `%`*(x: InputMoveEventWrapper): JsonNode
proc parse*(_: typedesc[InputMoveEventWrapper], n: JsonNode): InputMoveEventWrapper
proc `%`*(x: InputMultiTouchEventWrapper): JsonNode
proc parse*(_: typedesc[InputMultiTouchEventWrapper], n: JsonNode): InputMultiTouchEventWrapper
proc `%`*(x: InputEvent): JsonNode
proc parse*(_: typedesc[InputEvent], n: JsonNode): InputEvent
proc `%`*(x: DisplayGTK): JsonNode
proc parse*(_: typedesc[DisplayGTK], n: JsonNode): DisplayGTK
proc `%`*(x: DisplayEGLHeadless): JsonNode
proc parse*(_: typedesc[DisplayEGLHeadless], n: JsonNode): DisplayEGLHeadless
proc `%`*(x: DisplayDBus): JsonNode
proc parse*(_: typedesc[DisplayDBus], n: JsonNode): DisplayDBus
proc `%`*(x: DisplayGLMode): JsonNode
proc parse*(_: typedesc[DisplayGLMode], n: JsonNode): DisplayGLMode
proc `%`*(x: DisplayCurses): JsonNode
proc parse*(_: typedesc[DisplayCurses], n: JsonNode): DisplayCurses
proc `%`*(x: DisplayCocoa): JsonNode
proc parse*(_: typedesc[DisplayCocoa], n: JsonNode): DisplayCocoa
proc `%`*(x: HotKeyMod): JsonNode
proc parse*(_: typedesc[HotKeyMod], n: JsonNode): HotKeyMod
proc `%`*(x: DisplaySDL): JsonNode
proc parse*(_: typedesc[DisplaySDL], n: JsonNode): DisplaySDL
proc `%`*(x: DisplayType): JsonNode
proc parse*(_: typedesc[DisplayType], n: JsonNode): DisplayType
proc `%`*(x: DisplayOptions): JsonNode
proc parse*(_: typedesc[DisplayOptions], n: JsonNode): DisplayOptions
proc `%`*(x: DisplayReloadType): JsonNode
proc parse*(_: typedesc[DisplayReloadType], n: JsonNode): DisplayReloadType
proc `%`*(x: DisplayReloadOptionsVNC): JsonNode
proc parse*(_: typedesc[DisplayReloadOptionsVNC], n: JsonNode): DisplayReloadOptionsVNC
proc `%`*(x: DisplayReloadOptions): JsonNode
proc parse*(_: typedesc[DisplayReloadOptions], n: JsonNode): DisplayReloadOptions
proc `%`*(x: DisplayUpdateType): JsonNode
proc parse*(_: typedesc[DisplayUpdateType], n: JsonNode): DisplayUpdateType
proc `%`*(x: DisplayUpdateOptionsVNC): JsonNode
proc parse*(_: typedesc[DisplayUpdateOptionsVNC], n: JsonNode): DisplayUpdateOptionsVNC
proc `%`*(x: DisplayUpdateOptions): JsonNode
proc parse*(_: typedesc[DisplayUpdateOptions], n: JsonNode): DisplayUpdateOptions
proc `%`*(x: QAuthZListPolicy): JsonNode
proc parse*(_: typedesc[QAuthZListPolicy], n: JsonNode): QAuthZListPolicy
proc `%`*(x: QAuthZListFormat): JsonNode
proc parse*(_: typedesc[QAuthZListFormat], n: JsonNode): QAuthZListFormat
proc `%`*(x: QAuthZListRule): JsonNode
proc parse*(_: typedesc[QAuthZListRule], n: JsonNode): QAuthZListRule
proc `%`*(x: AuthZListProperties): JsonNode
proc parse*(_: typedesc[AuthZListProperties], n: JsonNode): AuthZListProperties
proc `%`*(x: AuthZListFileProperties): JsonNode
proc parse*(_: typedesc[AuthZListFileProperties], n: JsonNode): AuthZListFileProperties
proc `%`*(x: AuthZPAMProperties): JsonNode
proc parse*(_: typedesc[AuthZPAMProperties], n: JsonNode): AuthZPAMProperties
proc `%`*(x: AuthZSimpleProperties): JsonNode
proc parse*(_: typedesc[AuthZSimpleProperties], n: JsonNode): AuthZSimpleProperties
proc `%`*(x: MigrationStats): JsonNode
proc parse*(_: typedesc[MigrationStats], n: JsonNode): MigrationStats
proc `%`*(x: XBZRLECacheStats): JsonNode
proc parse*(_: typedesc[XBZRLECacheStats], n: JsonNode): XBZRLECacheStats
proc `%`*(x: CompressionStats): JsonNode
proc parse*(_: typedesc[CompressionStats], n: JsonNode): CompressionStats
proc `%`*(x: MigrationStatus): JsonNode
proc parse*(_: typedesc[MigrationStatus], n: JsonNode): MigrationStatus
proc `%`*(x: VfioStats): JsonNode
proc parse*(_: typedesc[VfioStats], n: JsonNode): VfioStats
proc `%`*(x: MigrationInfo): JsonNode
proc parse*(_: typedesc[MigrationInfo], n: JsonNode): MigrationInfo
proc `%`*(x: MigrationCapability): JsonNode
proc parse*(_: typedesc[MigrationCapability], n: JsonNode): MigrationCapability
proc `%`*(x: MigrationCapabilityStatus): JsonNode
proc parse*(_: typedesc[MigrationCapabilityStatus], n: JsonNode): MigrationCapabilityStatus
proc `%`*(x: MultiFDCompression): JsonNode
proc parse*(_: typedesc[MultiFDCompression], n: JsonNode): MultiFDCompression
proc `%`*(x: MigMode): JsonNode
proc parse*(_: typedesc[MigMode], n: JsonNode): MigMode
proc `%`*(x: ZeroPageDetection): JsonNode
proc parse*(_: typedesc[ZeroPageDetection], n: JsonNode): ZeroPageDetection
proc `%`*(x: BitmapMigrationBitmapAliasTransform): JsonNode
proc parse*(_: typedesc[BitmapMigrationBitmapAliasTransform], n: JsonNode): BitmapMigrationBitmapAliasTransform
proc `%`*(x: BitmapMigrationBitmapAlias): JsonNode
proc parse*(_: typedesc[BitmapMigrationBitmapAlias], n: JsonNode): BitmapMigrationBitmapAlias
proc `%`*(x: BitmapMigrationNodeAlias): JsonNode
proc parse*(_: typedesc[BitmapMigrationNodeAlias], n: JsonNode): BitmapMigrationNodeAlias
proc `%`*(x: MigrationParameter): JsonNode
proc parse*(_: typedesc[MigrationParameter], n: JsonNode): MigrationParameter
proc `%`*(x: MigrationParameters): JsonNode
proc parse*(_: typedesc[MigrationParameters], n: JsonNode): MigrationParameters
proc `%`*(x: COLOMessage): JsonNode
proc parse*(_: typedesc[COLOMessage], n: JsonNode): COLOMessage
proc `%`*(x: COLOMode): JsonNode
proc parse*(_: typedesc[COLOMode], n: JsonNode): COLOMode
proc `%`*(x: FailoverStatus): JsonNode
proc parse*(_: typedesc[FailoverStatus], n: JsonNode): FailoverStatus
proc `%`*(x: COLOExitReason): JsonNode
proc parse*(_: typedesc[COLOExitReason], n: JsonNode): COLOExitReason
proc `%`*(x: MigrationAddressType): JsonNode
proc parse*(_: typedesc[MigrationAddressType], n: JsonNode): MigrationAddressType
proc `%`*(x: FileMigrationArgs): JsonNode
proc parse*(_: typedesc[FileMigrationArgs], n: JsonNode): FileMigrationArgs
proc `%`*(x: MigrationExecCommand): JsonNode
proc parse*(_: typedesc[MigrationExecCommand], n: JsonNode): MigrationExecCommand
proc `%`*(x: MigrationAddress): JsonNode
proc parse*(_: typedesc[MigrationAddress], n: JsonNode): MigrationAddress
proc `%`*(x: MigrationChannelType): JsonNode
proc parse*(_: typedesc[MigrationChannelType], n: JsonNode): MigrationChannelType
proc `%`*(x: MigrationChannel): JsonNode
proc parse*(_: typedesc[MigrationChannel], n: JsonNode): MigrationChannel
proc `%`*(x: ReplicationStatus): JsonNode
proc parse*(_: typedesc[ReplicationStatus], n: JsonNode): ReplicationStatus
proc `%`*(x: COLOStatus): JsonNode
proc parse*(_: typedesc[COLOStatus], n: JsonNode): COLOStatus
proc `%`*(x: DirtyRateVcpu): JsonNode
proc parse*(_: typedesc[DirtyRateVcpu], n: JsonNode): DirtyRateVcpu
proc `%`*(x: DirtyRateStatus): JsonNode
proc parse*(_: typedesc[DirtyRateStatus], n: JsonNode): DirtyRateStatus
proc `%`*(x: DirtyRateMeasureMode): JsonNode
proc parse*(_: typedesc[DirtyRateMeasureMode], n: JsonNode): DirtyRateMeasureMode
proc `%`*(x: TimeUnit): JsonNode
proc parse*(_: typedesc[TimeUnit], n: JsonNode): TimeUnit
proc `%`*(x: DirtyRateInfo): JsonNode
proc parse*(_: typedesc[DirtyRateInfo], n: JsonNode): DirtyRateInfo
proc `%`*(x: DirtyLimitInfo): JsonNode
proc parse*(_: typedesc[DirtyLimitInfo], n: JsonNode): DirtyLimitInfo
proc `%`*(x: Abort): JsonNode
proc parse*(_: typedesc[Abort], n: JsonNode): Abort
proc `%`*(x: ActionCompletionMode): JsonNode
proc parse*(_: typedesc[ActionCompletionMode], n: JsonNode): ActionCompletionMode
proc `%`*(x: TransactionActionKind): JsonNode
proc parse*(_: typedesc[TransactionActionKind], n: JsonNode): TransactionActionKind
proc `%`*(x: AbortWrapper): JsonNode
proc parse*(_: typedesc[AbortWrapper], n: JsonNode): AbortWrapper
proc `%`*(x: BlockDirtyBitmapAddWrapper): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapAddWrapper], n: JsonNode): BlockDirtyBitmapAddWrapper
proc `%`*(x: BlockDirtyBitmapWrapper): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapWrapper], n: JsonNode): BlockDirtyBitmapWrapper
proc `%`*(x: BlockDirtyBitmapMergeWrapper): JsonNode
proc parse*(_: typedesc[BlockDirtyBitmapMergeWrapper], n: JsonNode): BlockDirtyBitmapMergeWrapper
proc `%`*(x: BlockdevBackupWrapper): JsonNode
proc parse*(_: typedesc[BlockdevBackupWrapper], n: JsonNode): BlockdevBackupWrapper
proc `%`*(x: BlockdevSnapshotWrapper): JsonNode
proc parse*(_: typedesc[BlockdevSnapshotWrapper], n: JsonNode): BlockdevSnapshotWrapper
proc `%`*(x: BlockdevSnapshotInternalWrapper): JsonNode
proc parse*(_: typedesc[BlockdevSnapshotInternalWrapper], n: JsonNode): BlockdevSnapshotInternalWrapper
proc `%`*(x: BlockdevSnapshotSyncWrapper): JsonNode
proc parse*(_: typedesc[BlockdevSnapshotSyncWrapper], n: JsonNode): BlockdevSnapshotSyncWrapper
proc `%`*(x: DriveBackupWrapper): JsonNode
proc parse*(_: typedesc[DriveBackupWrapper], n: JsonNode): DriveBackupWrapper
proc `%`*(x: TransactionAction): JsonNode
proc parse*(_: typedesc[TransactionAction], n: JsonNode): TransactionAction
proc `%`*(x: TransactionProperties): JsonNode
proc parse*(_: typedesc[TransactionProperties], n: JsonNode): TransactionProperties
proc `%`*(x: TraceEventState): JsonNode
proc parse*(_: typedesc[TraceEventState], n: JsonNode): TraceEventState
proc `%`*(x: TraceEventInfo): JsonNode
proc parse*(_: typedesc[TraceEventInfo], n: JsonNode): TraceEventInfo
proc `%`*(x: CompatPolicyInput): JsonNode
proc parse*(_: typedesc[CompatPolicyInput], n: JsonNode): CompatPolicyInput
proc `%`*(x: CompatPolicyOutput): JsonNode
proc parse*(_: typedesc[CompatPolicyOutput], n: JsonNode): CompatPolicyOutput
proc `%`*(x: CompatPolicy): JsonNode
proc parse*(_: typedesc[CompatPolicy], n: JsonNode): CompatPolicy
proc `%`*(x: QMPCapability): JsonNode
proc parse*(_: typedesc[QMPCapability], n: JsonNode): QMPCapability
proc `%`*(x: VersionTriple): JsonNode
proc parse*(_: typedesc[VersionTriple], n: JsonNode): VersionTriple
proc `%`*(x: VersionInfo): JsonNode
proc parse*(_: typedesc[VersionInfo], n: JsonNode): VersionInfo
proc `%`*(x: CommandInfo): JsonNode
proc parse*(_: typedesc[CommandInfo], n: JsonNode): CommandInfo
proc `%`*(x: MonitorMode): JsonNode
proc parse*(_: typedesc[MonitorMode], n: JsonNode): MonitorMode
proc `%`*(x: MonitorOptions): JsonNode
proc parse*(_: typedesc[MonitorOptions], n: JsonNode): MonitorOptions
proc `%`*(x: SchemaMetaType): JsonNode
proc parse*(_: typedesc[SchemaMetaType], n: JsonNode): SchemaMetaType
proc `%`*(x: SchemaInfo): JsonNode
proc parse*(_: typedesc[SchemaInfo], n: JsonNode): SchemaInfo
proc `%`*(x: SchemaInfoBuiltin): JsonNode
proc parse*(_: typedesc[SchemaInfoBuiltin], n: JsonNode): SchemaInfoBuiltin
proc `%`*(x: JSONType): JsonNode
proc parse*(_: typedesc[JSONType], n: JsonNode): JSONType
proc `%`*(x: SchemaInfoEnum): JsonNode
proc parse*(_: typedesc[SchemaInfoEnum], n: JsonNode): SchemaInfoEnum
proc `%`*(x: SchemaInfoEnumMember): JsonNode
proc parse*(_: typedesc[SchemaInfoEnumMember], n: JsonNode): SchemaInfoEnumMember
proc `%`*(x: SchemaInfoArray): JsonNode
proc parse*(_: typedesc[SchemaInfoArray], n: JsonNode): SchemaInfoArray
proc `%`*(x: SchemaInfoObject): JsonNode
proc parse*(_: typedesc[SchemaInfoObject], n: JsonNode): SchemaInfoObject
proc `%`*(x: SchemaInfoObjectMember): JsonNode
proc parse*(_: typedesc[SchemaInfoObjectMember], n: JsonNode): SchemaInfoObjectMember
proc `%`*(x: SchemaInfoObjectVariant): JsonNode
proc parse*(_: typedesc[SchemaInfoObjectVariant], n: JsonNode): SchemaInfoObjectVariant
proc `%`*(x: SchemaInfoAlternate): JsonNode
proc parse*(_: typedesc[SchemaInfoAlternate], n: JsonNode): SchemaInfoAlternate
proc `%`*(x: SchemaInfoAlternateMember): JsonNode
proc parse*(_: typedesc[SchemaInfoAlternateMember], n: JsonNode): SchemaInfoAlternateMember
proc `%`*(x: SchemaInfoCommand): JsonNode
proc parse*(_: typedesc[SchemaInfoCommand], n: JsonNode): SchemaInfoCommand
proc `%`*(x: SchemaInfoEvent): JsonNode
proc parse*(_: typedesc[SchemaInfoEvent], n: JsonNode): SchemaInfoEvent
proc `%`*(x: ObjectPropertyInfo): JsonNode
proc parse*(_: typedesc[ObjectPropertyInfo], n: JsonNode): ObjectPropertyInfo
proc `%`*(x: ObjectPropertyValue): JsonNode
proc parse*(_: typedesc[ObjectPropertyValue], n: JsonNode): ObjectPropertyValue
proc `%`*(x: ObjectPropertiesValues): JsonNode
proc parse*(_: typedesc[ObjectPropertiesValues], n: JsonNode): ObjectPropertiesValues
proc `%`*(x: ObjectTypeInfo): JsonNode
proc parse*(_: typedesc[ObjectTypeInfo], n: JsonNode): ObjectTypeInfo
proc `%`*(x: CanHostSocketcanProperties): JsonNode
proc parse*(_: typedesc[CanHostSocketcanProperties], n: JsonNode): CanHostSocketcanProperties
proc `%`*(x: ColoCompareProperties): JsonNode
proc parse*(_: typedesc[ColoCompareProperties], n: JsonNode): ColoCompareProperties
proc `%`*(x: CryptodevBackendProperties): JsonNode
proc parse*(_: typedesc[CryptodevBackendProperties], n: JsonNode): CryptodevBackendProperties
proc `%`*(x: CryptodevVhostUserProperties): JsonNode
proc parse*(_: typedesc[CryptodevVhostUserProperties], n: JsonNode): CryptodevVhostUserProperties
proc `%`*(x: DBusVMStateProperties): JsonNode
proc parse*(_: typedesc[DBusVMStateProperties], n: JsonNode): DBusVMStateProperties
proc `%`*(x: NetfilterInsert): JsonNode
proc parse*(_: typedesc[NetfilterInsert], n: JsonNode): NetfilterInsert
proc `%`*(x: NetfilterProperties): JsonNode
proc parse*(_: typedesc[NetfilterProperties], n: JsonNode): NetfilterProperties
proc `%`*(x: FilterBufferProperties): JsonNode
proc parse*(_: typedesc[FilterBufferProperties], n: JsonNode): FilterBufferProperties
proc `%`*(x: FilterDumpProperties): JsonNode
proc parse*(_: typedesc[FilterDumpProperties], n: JsonNode): FilterDumpProperties
proc `%`*(x: FilterMirrorProperties): JsonNode
proc parse*(_: typedesc[FilterMirrorProperties], n: JsonNode): FilterMirrorProperties
proc `%`*(x: FilterRedirectorProperties): JsonNode
proc parse*(_: typedesc[FilterRedirectorProperties], n: JsonNode): FilterRedirectorProperties
proc `%`*(x: FilterRewriterProperties): JsonNode
proc parse*(_: typedesc[FilterRewriterProperties], n: JsonNode): FilterRewriterProperties
proc `%`*(x: InputBarrierProperties): JsonNode
proc parse*(_: typedesc[InputBarrierProperties], n: JsonNode): InputBarrierProperties
proc `%`*(x: InputLinuxProperties): JsonNode
proc parse*(_: typedesc[InputLinuxProperties], n: JsonNode): InputLinuxProperties
proc `%`*(x: EventLoopBaseProperties): JsonNode
proc parse*(_: typedesc[EventLoopBaseProperties], n: JsonNode): EventLoopBaseProperties
proc `%`*(x: IothreadProperties): JsonNode
proc parse*(_: typedesc[IothreadProperties], n: JsonNode): IothreadProperties
proc `%`*(x: MainLoopProperties): JsonNode
proc parse*(_: typedesc[MainLoopProperties], n: JsonNode): MainLoopProperties
proc `%`*(x: MemoryBackendProperties): JsonNode
proc parse*(_: typedesc[MemoryBackendProperties], n: JsonNode): MemoryBackendProperties
proc `%`*(x: MemoryBackendFileProperties): JsonNode
proc parse*(_: typedesc[MemoryBackendFileProperties], n: JsonNode): MemoryBackendFileProperties
proc `%`*(x: MemoryBackendMemfdProperties): JsonNode
proc parse*(_: typedesc[MemoryBackendMemfdProperties], n: JsonNode): MemoryBackendMemfdProperties
proc `%`*(x: MemoryBackendShmProperties): JsonNode
proc parse*(_: typedesc[MemoryBackendShmProperties], n: JsonNode): MemoryBackendShmProperties
proc `%`*(x: MemoryBackendEpcProperties): JsonNode
proc parse*(_: typedesc[MemoryBackendEpcProperties], n: JsonNode): MemoryBackendEpcProperties
proc `%`*(x: PrManagerHelperProperties): JsonNode
proc parse*(_: typedesc[PrManagerHelperProperties], n: JsonNode): PrManagerHelperProperties
proc `%`*(x: QtestProperties): JsonNode
proc parse*(_: typedesc[QtestProperties], n: JsonNode): QtestProperties
proc `%`*(x: RemoteObjectProperties): JsonNode
proc parse*(_: typedesc[RemoteObjectProperties], n: JsonNode): RemoteObjectProperties
proc `%`*(x: VfioUserServerProperties): JsonNode
proc parse*(_: typedesc[VfioUserServerProperties], n: JsonNode): VfioUserServerProperties
proc `%`*(x: IOMMUFDProperties): JsonNode
proc parse*(_: typedesc[IOMMUFDProperties], n: JsonNode): IOMMUFDProperties
proc `%`*(x: AcpiGenericInitiatorProperties): JsonNode
proc parse*(_: typedesc[AcpiGenericInitiatorProperties], n: JsonNode): AcpiGenericInitiatorProperties
proc `%`*(x: AcpiGenericPortProperties): JsonNode
proc parse*(_: typedesc[AcpiGenericPortProperties], n: JsonNode): AcpiGenericPortProperties
proc `%`*(x: RngProperties): JsonNode
proc parse*(_: typedesc[RngProperties], n: JsonNode): RngProperties
proc `%`*(x: RngEgdProperties): JsonNode
proc parse*(_: typedesc[RngEgdProperties], n: JsonNode): RngEgdProperties
proc `%`*(x: RngRandomProperties): JsonNode
proc parse*(_: typedesc[RngRandomProperties], n: JsonNode): RngRandomProperties
proc `%`*(x: IgvmCfgProperties): JsonNode
proc parse*(_: typedesc[IgvmCfgProperties], n: JsonNode): IgvmCfgProperties
proc `%`*(x: SevCommonProperties): JsonNode
proc parse*(_: typedesc[SevCommonProperties], n: JsonNode): SevCommonProperties
proc `%`*(x: SevGuestProperties): JsonNode
proc parse*(_: typedesc[SevGuestProperties], n: JsonNode): SevGuestProperties
proc `%`*(x: SevSnpGuestProperties): JsonNode
proc parse*(_: typedesc[SevSnpGuestProperties], n: JsonNode): SevSnpGuestProperties
proc `%`*(x: TdxGuestProperties): JsonNode
proc parse*(_: typedesc[TdxGuestProperties], n: JsonNode): TdxGuestProperties
proc `%`*(x: ThreadContextProperties): JsonNode
proc parse*(_: typedesc[ThreadContextProperties], n: JsonNode): ThreadContextProperties
proc `%`*(x: ObjectType): JsonNode
proc parse*(_: typedesc[ObjectType], n: JsonNode): ObjectType
proc `%`*(x: ObjectOptions): JsonNode
proc parse*(_: typedesc[ObjectOptions], n: JsonNode): ObjectOptions
proc `%`*(x: S390CpuEntitlement): JsonNode
proc parse*(_: typedesc[S390CpuEntitlement], n: JsonNode): S390CpuEntitlement
proc `%`*(x: CpuTopologyLevel): JsonNode
proc parse*(_: typedesc[CpuTopologyLevel], n: JsonNode): CpuTopologyLevel
proc `%`*(x: CacheLevelAndType): JsonNode
proc parse*(_: typedesc[CacheLevelAndType], n: JsonNode): CacheLevelAndType
proc `%`*(x: SmpCacheProperties): JsonNode
proc parse*(_: typedesc[SmpCacheProperties], n: JsonNode): SmpCacheProperties
proc `%`*(x: SmpCachePropertiesWrapper): JsonNode
proc parse*(_: typedesc[SmpCachePropertiesWrapper], n: JsonNode): SmpCachePropertiesWrapper
proc `%`*(x: SysEmuTarget): JsonNode
proc parse*(_: typedesc[SysEmuTarget], n: JsonNode): SysEmuTarget
proc `%`*(x: S390CpuState): JsonNode
proc parse*(_: typedesc[S390CpuState], n: JsonNode): S390CpuState
proc `%`*(x: CpuInfoS390): JsonNode
proc parse*(_: typedesc[CpuInfoS390], n: JsonNode): CpuInfoS390
proc `%`*(x: CpuInfoFast): JsonNode
proc parse*(_: typedesc[CpuInfoFast], n: JsonNode): CpuInfoFast
proc `%`*(x: CompatProperty): JsonNode
proc parse*(_: typedesc[CompatProperty], n: JsonNode): CompatProperty
proc `%`*(x: MachineInfo): JsonNode
proc parse*(_: typedesc[MachineInfo], n: JsonNode): MachineInfo
proc `%`*(x: CurrentMachineParams): JsonNode
proc parse*(_: typedesc[CurrentMachineParams], n: JsonNode): CurrentMachineParams
proc `%`*(x: QemuTargetInfo): JsonNode
proc parse*(_: typedesc[QemuTargetInfo], n: JsonNode): QemuTargetInfo
proc `%`*(x: UuidInfo): JsonNode
proc parse*(_: typedesc[UuidInfo], n: JsonNode): UuidInfo
proc `%`*(x: GuidInfo): JsonNode
proc parse*(_: typedesc[GuidInfo], n: JsonNode): GuidInfo
proc `%`*(x: LostTickPolicy): JsonNode
proc parse*(_: typedesc[LostTickPolicy], n: JsonNode): LostTickPolicy
proc `%`*(x: NumaOptionsType): JsonNode
proc parse*(_: typedesc[NumaOptionsType], n: JsonNode): NumaOptionsType
proc `%`*(x: NumaOptions): JsonNode
proc parse*(_: typedesc[NumaOptions], n: JsonNode): NumaOptions
proc `%`*(x: NumaNodeOptions): JsonNode
proc parse*(_: typedesc[NumaNodeOptions], n: JsonNode): NumaNodeOptions
proc `%`*(x: NumaDistOptions): JsonNode
proc parse*(_: typedesc[NumaDistOptions], n: JsonNode): NumaDistOptions
proc `%`*(x: CXLFixedMemoryWindowOptions): JsonNode
proc parse*(_: typedesc[CXLFixedMemoryWindowOptions], n: JsonNode): CXLFixedMemoryWindowOptions
proc `%`*(x: CXLFMWProperties): JsonNode
proc parse*(_: typedesc[CXLFMWProperties], n: JsonNode): CXLFMWProperties
proc `%`*(x: X86CPURegister32): JsonNode
proc parse*(_: typedesc[X86CPURegister32], n: JsonNode): X86CPURegister32
proc `%`*(x: X86CPUFeatureWordInfo): JsonNode
proc parse*(_: typedesc[X86CPUFeatureWordInfo], n: JsonNode): X86CPUFeatureWordInfo
proc `%`*(x: DummyForceArrays): JsonNode
proc parse*(_: typedesc[DummyForceArrays], n: JsonNode): DummyForceArrays
proc `%`*(x: NumaCpuOptions): JsonNode
proc parse*(_: typedesc[NumaCpuOptions], n: JsonNode): NumaCpuOptions
proc `%`*(x: HmatLBMemoryHierarchy): JsonNode
proc parse*(_: typedesc[HmatLBMemoryHierarchy], n: JsonNode): HmatLBMemoryHierarchy
proc `%`*(x: HmatLBDataType): JsonNode
proc parse*(_: typedesc[HmatLBDataType], n: JsonNode): HmatLBDataType
proc `%`*(x: NumaHmatLBOptions): JsonNode
proc parse*(_: typedesc[NumaHmatLBOptions], n: JsonNode): NumaHmatLBOptions
proc `%`*(x: HmatCacheAssociativity): JsonNode
proc parse*(_: typedesc[HmatCacheAssociativity], n: JsonNode): HmatCacheAssociativity
proc `%`*(x: HmatCacheWritePolicy): JsonNode
proc parse*(_: typedesc[HmatCacheWritePolicy], n: JsonNode): HmatCacheWritePolicy
proc `%`*(x: NumaHmatCacheOptions): JsonNode
proc parse*(_: typedesc[NumaHmatCacheOptions], n: JsonNode): NumaHmatCacheOptions
proc `%`*(x: Memdev): JsonNode
proc parse*(_: typedesc[Memdev], n: JsonNode): Memdev
proc `%`*(x: CpuInstanceProperties): JsonNode
proc parse*(_: typedesc[CpuInstanceProperties], n: JsonNode): CpuInstanceProperties
proc `%`*(x: HotpluggableCPU): JsonNode
proc parse*(_: typedesc[HotpluggableCPU], n: JsonNode): HotpluggableCPU
proc `%`*(x: BalloonInfo): JsonNode
proc parse*(_: typedesc[BalloonInfo], n: JsonNode): BalloonInfo
proc `%`*(x: HvBalloonInfo): JsonNode
proc parse*(_: typedesc[HvBalloonInfo], n: JsonNode): HvBalloonInfo
proc `%`*(x: MemoryInfo): JsonNode
proc parse*(_: typedesc[MemoryInfo], n: JsonNode): MemoryInfo
proc `%`*(x: PCDIMMDeviceInfo): JsonNode
proc parse*(_: typedesc[PCDIMMDeviceInfo], n: JsonNode): PCDIMMDeviceInfo
proc `%`*(x: VirtioPMEMDeviceInfo): JsonNode
proc parse*(_: typedesc[VirtioPMEMDeviceInfo], n: JsonNode): VirtioPMEMDeviceInfo
proc `%`*(x: VirtioMEMDeviceInfo): JsonNode
proc parse*(_: typedesc[VirtioMEMDeviceInfo], n: JsonNode): VirtioMEMDeviceInfo
proc `%`*(x: SgxEPCDeviceInfo): JsonNode
proc parse*(_: typedesc[SgxEPCDeviceInfo], n: JsonNode): SgxEPCDeviceInfo
proc `%`*(x: HvBalloonDeviceInfo): JsonNode
proc parse*(_: typedesc[HvBalloonDeviceInfo], n: JsonNode): HvBalloonDeviceInfo
proc `%`*(x: MemoryDeviceInfoKind): JsonNode
proc parse*(_: typedesc[MemoryDeviceInfoKind], n: JsonNode): MemoryDeviceInfoKind
proc `%`*(x: PCDIMMDeviceInfoWrapper): JsonNode
proc parse*(_: typedesc[PCDIMMDeviceInfoWrapper], n: JsonNode): PCDIMMDeviceInfoWrapper
proc `%`*(x: VirtioPMEMDeviceInfoWrapper): JsonNode
proc parse*(_: typedesc[VirtioPMEMDeviceInfoWrapper], n: JsonNode): VirtioPMEMDeviceInfoWrapper
proc `%`*(x: VirtioMEMDeviceInfoWrapper): JsonNode
proc parse*(_: typedesc[VirtioMEMDeviceInfoWrapper], n: JsonNode): VirtioMEMDeviceInfoWrapper
proc `%`*(x: SgxEPCDeviceInfoWrapper): JsonNode
proc parse*(_: typedesc[SgxEPCDeviceInfoWrapper], n: JsonNode): SgxEPCDeviceInfoWrapper
proc `%`*(x: HvBalloonDeviceInfoWrapper): JsonNode
proc parse*(_: typedesc[HvBalloonDeviceInfoWrapper], n: JsonNode): HvBalloonDeviceInfoWrapper
proc `%`*(x: MemoryDeviceInfo): JsonNode
proc parse*(_: typedesc[MemoryDeviceInfo], n: JsonNode): MemoryDeviceInfo
proc `%`*(x: SgxEPC): JsonNode
proc parse*(_: typedesc[SgxEPC], n: JsonNode): SgxEPC
proc `%`*(x: SgxEPCProperties): JsonNode
proc parse*(_: typedesc[SgxEPCProperties], n: JsonNode): SgxEPCProperties
proc `%`*(x: BootConfiguration): JsonNode
proc parse*(_: typedesc[BootConfiguration], n: JsonNode): BootConfiguration
proc `%`*(x: SMPConfiguration): JsonNode
proc parse*(_: typedesc[SMPConfiguration], n: JsonNode): SMPConfiguration
proc `%`*(x: SmbiosEntryPointType): JsonNode
proc parse*(_: typedesc[SmbiosEntryPointType], n: JsonNode): SmbiosEntryPointType
proc `%`*(x: MemorySizeConfiguration): JsonNode
proc parse*(_: typedesc[MemorySizeConfiguration], n: JsonNode): MemorySizeConfiguration
proc `%`*(x: FirmwareLog): JsonNode
proc parse*(_: typedesc[FirmwareLog], n: JsonNode): FirmwareLog
proc `%`*(x: CpuModelInfo): JsonNode
proc parse*(_: typedesc[CpuModelInfo], n: JsonNode): CpuModelInfo
proc `%`*(x: CpuModelExpansionType): JsonNode
proc parse*(_: typedesc[CpuModelExpansionType], n: JsonNode): CpuModelExpansionType
proc `%`*(x: CpuModelCompareResult): JsonNode
proc parse*(_: typedesc[CpuModelCompareResult], n: JsonNode): CpuModelCompareResult
proc `%`*(x: CpuModelBaselineInfo): JsonNode
proc parse*(_: typedesc[CpuModelBaselineInfo], n: JsonNode): CpuModelBaselineInfo
proc `%`*(x: CpuModelCompareInfo): JsonNode
proc parse*(_: typedesc[CpuModelCompareInfo], n: JsonNode): CpuModelCompareInfo
proc `%`*(x: CpuModelExpansionInfo): JsonNode
proc parse*(_: typedesc[CpuModelExpansionInfo], n: JsonNode): CpuModelExpansionInfo
proc `%`*(x: CpuDefinitionInfo): JsonNode
proc parse*(_: typedesc[CpuDefinitionInfo], n: JsonNode): CpuDefinitionInfo
proc `%`*(x: S390CpuPolarization): JsonNode
proc parse*(_: typedesc[S390CpuPolarization], n: JsonNode): S390CpuPolarization
proc `%`*(x: CpuPolarizationInfo): JsonNode
proc parse*(_: typedesc[CpuPolarizationInfo], n: JsonNode): CpuPolarizationInfo
proc `%`*(x: ReplayMode): JsonNode
proc parse*(_: typedesc[ReplayMode], n: JsonNode): ReplayMode
proc `%`*(x: ReplayInfo): JsonNode
proc parse*(_: typedesc[ReplayInfo], n: JsonNode): ReplayInfo
proc `%`*(x: YankInstanceType): JsonNode
proc parse*(_: typedesc[YankInstanceType], n: JsonNode): YankInstanceType
proc `%`*(x: YankInstanceBlockNode): JsonNode
proc parse*(_: typedesc[YankInstanceBlockNode], n: JsonNode): YankInstanceBlockNode
proc `%`*(x: YankInstanceChardev): JsonNode
proc parse*(_: typedesc[YankInstanceChardev], n: JsonNode): YankInstanceChardev
proc `%`*(x: YankInstance): JsonNode
proc parse*(_: typedesc[YankInstance], n: JsonNode): YankInstance
proc `%`*(x: NameInfo): JsonNode
proc parse*(_: typedesc[NameInfo], n: JsonNode): NameInfo
proc `%`*(x: IOThreadInfo): JsonNode
proc parse*(_: typedesc[IOThreadInfo], n: JsonNode): IOThreadInfo
proc `%`*(x: AddfdInfo): JsonNode
proc parse*(_: typedesc[AddfdInfo], n: JsonNode): AddfdInfo
proc `%`*(x: FdsetFdInfo): JsonNode
proc parse*(_: typedesc[FdsetFdInfo], n: JsonNode): FdsetFdInfo
proc `%`*(x: FdsetInfo): JsonNode
proc parse*(_: typedesc[FdsetInfo], n: JsonNode): FdsetInfo
proc `%`*(x: CommandLineParameterType): JsonNode
proc parse*(_: typedesc[CommandLineParameterType], n: JsonNode): CommandLineParameterType
proc `%`*(x: CommandLineParameterInfo): JsonNode
proc parse*(_: typedesc[CommandLineParameterInfo], n: JsonNode): CommandLineParameterInfo
proc `%`*(x: CommandLineOptionInfo): JsonNode
proc parse*(_: typedesc[CommandLineOptionInfo], n: JsonNode): CommandLineOptionInfo
proc `%`*(x: GICCapability): JsonNode
proc parse*(_: typedesc[GICCapability], n: JsonNode): GICCapability
proc `%`*(x: SsidSizeMode): JsonNode
proc parse*(_: typedesc[SsidSizeMode], n: JsonNode): SsidSizeMode
proc `%`*(x: OasMode): JsonNode
proc parse*(_: typedesc[OasMode], n: JsonNode): OasMode
proc `%`*(x: SevState): JsonNode
proc parse*(_: typedesc[SevState], n: JsonNode): SevState
proc `%`*(x: SevGuestType): JsonNode
proc parse*(_: typedesc[SevGuestType], n: JsonNode): SevGuestType
proc `%`*(x: SevGuestInfo): JsonNode
proc parse*(_: typedesc[SevGuestInfo], n: JsonNode): SevGuestInfo
proc `%`*(x: SevSnpGuestInfo): JsonNode
proc parse*(_: typedesc[SevSnpGuestInfo], n: JsonNode): SevSnpGuestInfo
proc `%`*(x: SevInfo): JsonNode
proc parse*(_: typedesc[SevInfo], n: JsonNode): SevInfo
proc `%`*(x: SevLaunchMeasureInfo): JsonNode
proc parse*(_: typedesc[SevLaunchMeasureInfo], n: JsonNode): SevLaunchMeasureInfo
proc `%`*(x: SevCapability): JsonNode
proc parse*(_: typedesc[SevCapability], n: JsonNode): SevCapability
proc `%`*(x: SevAttestationReport): JsonNode
proc parse*(_: typedesc[SevAttestationReport], n: JsonNode): SevAttestationReport
proc `%`*(x: SgxEpcSection): JsonNode
proc parse*(_: typedesc[SgxEpcSection], n: JsonNode): SgxEpcSection
proc `%`*(x: SgxInfo): JsonNode
proc parse*(_: typedesc[SgxInfo], n: JsonNode): SgxInfo
proc `%`*(x: EvtchnPortType): JsonNode
proc parse*(_: typedesc[EvtchnPortType], n: JsonNode): EvtchnPortType
proc `%`*(x: EvtchnInfo): JsonNode
proc parse*(_: typedesc[EvtchnInfo], n: JsonNode): EvtchnInfo
proc `%`*(x: AudiodevPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevPerDirectionOptions], n: JsonNode): AudiodevPerDirectionOptions
proc `%`*(x: AudiodevGenericOptions): JsonNode
proc parse*(_: typedesc[AudiodevGenericOptions], n: JsonNode): AudiodevGenericOptions
proc `%`*(x: AudiodevDBusOptions): JsonNode
proc parse*(_: typedesc[AudiodevDBusOptions], n: JsonNode): AudiodevDBusOptions
proc `%`*(x: AudiodevAlsaPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevAlsaPerDirectionOptions], n: JsonNode): AudiodevAlsaPerDirectionOptions
proc `%`*(x: AudiodevAlsaOptions): JsonNode
proc parse*(_: typedesc[AudiodevAlsaOptions], n: JsonNode): AudiodevAlsaOptions
proc `%`*(x: AudiodevSndioOptions): JsonNode
proc parse*(_: typedesc[AudiodevSndioOptions], n: JsonNode): AudiodevSndioOptions
proc `%`*(x: AudiodevCoreaudioPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevCoreaudioPerDirectionOptions], n: JsonNode): AudiodevCoreaudioPerDirectionOptions
proc `%`*(x: AudiodevCoreaudioOptions): JsonNode
proc parse*(_: typedesc[AudiodevCoreaudioOptions], n: JsonNode): AudiodevCoreaudioOptions
proc `%`*(x: AudiodevDsoundOptions): JsonNode
proc parse*(_: typedesc[AudiodevDsoundOptions], n: JsonNode): AudiodevDsoundOptions
proc `%`*(x: AudiodevJackPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevJackPerDirectionOptions], n: JsonNode): AudiodevJackPerDirectionOptions
proc `%`*(x: AudiodevJackOptions): JsonNode
proc parse*(_: typedesc[AudiodevJackOptions], n: JsonNode): AudiodevJackOptions
proc `%`*(x: AudiodevOssPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevOssPerDirectionOptions], n: JsonNode): AudiodevOssPerDirectionOptions
proc `%`*(x: AudiodevOssOptions): JsonNode
proc parse*(_: typedesc[AudiodevOssOptions], n: JsonNode): AudiodevOssOptions
proc `%`*(x: AudiodevPaPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevPaPerDirectionOptions], n: JsonNode): AudiodevPaPerDirectionOptions
proc `%`*(x: AudiodevPaOptions): JsonNode
proc parse*(_: typedesc[AudiodevPaOptions], n: JsonNode): AudiodevPaOptions
proc `%`*(x: AudiodevPipewirePerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevPipewirePerDirectionOptions], n: JsonNode): AudiodevPipewirePerDirectionOptions
proc `%`*(x: AudiodevPipewireOptions): JsonNode
proc parse*(_: typedesc[AudiodevPipewireOptions], n: JsonNode): AudiodevPipewireOptions
proc `%`*(x: AudiodevSdlPerDirectionOptions): JsonNode
proc parse*(_: typedesc[AudiodevSdlPerDirectionOptions], n: JsonNode): AudiodevSdlPerDirectionOptions
proc `%`*(x: AudiodevSdlOptions): JsonNode
proc parse*(_: typedesc[AudiodevSdlOptions], n: JsonNode): AudiodevSdlOptions
proc `%`*(x: AudiodevWavOptions): JsonNode
proc parse*(_: typedesc[AudiodevWavOptions], n: JsonNode): AudiodevWavOptions
proc `%`*(x: AudioFormat): JsonNode
proc parse*(_: typedesc[AudioFormat], n: JsonNode): AudioFormat
proc `%`*(x: AudiodevDriver): JsonNode
proc parse*(_: typedesc[AudiodevDriver], n: JsonNode): AudiodevDriver
proc `%`*(x: Audiodev): JsonNode
proc parse*(_: typedesc[Audiodev], n: JsonNode): Audiodev
proc `%`*(x: AcpiTableOptions): JsonNode
proc parse*(_: typedesc[AcpiTableOptions], n: JsonNode): AcpiTableOptions
proc `%`*(x: ACPISlotType): JsonNode
proc parse*(_: typedesc[ACPISlotType], n: JsonNode): ACPISlotType
proc `%`*(x: ACPIOSTInfo): JsonNode
proc parse*(_: typedesc[ACPIOSTInfo], n: JsonNode): ACPIOSTInfo
proc `%`*(x: PciMemoryRange): JsonNode
proc parse*(_: typedesc[PciMemoryRange], n: JsonNode): PciMemoryRange
proc `%`*(x: PciMemoryRegion): JsonNode
proc parse*(_: typedesc[PciMemoryRegion], n: JsonNode): PciMemoryRegion
proc `%`*(x: PciBusInfo): JsonNode
proc parse*(_: typedesc[PciBusInfo], n: JsonNode): PciBusInfo
proc `%`*(x: PciBridgeInfo): JsonNode
proc parse*(_: typedesc[PciBridgeInfo], n: JsonNode): PciBridgeInfo
proc `%`*(x: PciDeviceClass): JsonNode
proc parse*(_: typedesc[PciDeviceClass], n: JsonNode): PciDeviceClass
proc `%`*(x: PciDeviceId): JsonNode
proc parse*(_: typedesc[PciDeviceId], n: JsonNode): PciDeviceId
proc `%`*(x: PciDeviceInfo): JsonNode
proc parse*(_: typedesc[PciDeviceInfo], n: JsonNode): PciDeviceInfo
proc `%`*(x: PciInfo): JsonNode
proc parse*(_: typedesc[PciInfo], n: JsonNode): PciInfo
proc `%`*(x: StatsType): JsonNode
proc parse*(_: typedesc[StatsType], n: JsonNode): StatsType
proc `%`*(x: StatsUnit): JsonNode
proc parse*(_: typedesc[StatsUnit], n: JsonNode): StatsUnit
proc `%`*(x: StatsProvider): JsonNode
proc parse*(_: typedesc[StatsProvider], n: JsonNode): StatsProvider
proc `%`*(x: StatsTarget): JsonNode
proc parse*(_: typedesc[StatsTarget], n: JsonNode): StatsTarget
proc `%`*(x: StatsRequest): JsonNode
proc parse*(_: typedesc[StatsRequest], n: JsonNode): StatsRequest
proc `%`*(x: StatsVCPUFilter): JsonNode
proc parse*(_: typedesc[StatsVCPUFilter], n: JsonNode): StatsVCPUFilter
proc `%`*(x: StatsFilter): JsonNode
proc parse*(_: typedesc[StatsFilter], n: JsonNode): StatsFilter
proc `%`*(x: StatsValue): JsonNode
proc parse*(_: typedesc[StatsValue], n: JsonNode): StatsValue
proc `%`*(x: Stats): JsonNode
proc parse*(_: typedesc[Stats], n: JsonNode): Stats
proc `%`*(x: StatsResult): JsonNode
proc parse*(_: typedesc[StatsResult], n: JsonNode): StatsResult
proc `%`*(x: StatsSchemaValue): JsonNode
proc parse*(_: typedesc[StatsSchemaValue], n: JsonNode): StatsSchemaValue
proc `%`*(x: StatsSchema): JsonNode
proc parse*(_: typedesc[StatsSchema], n: JsonNode): StatsSchema
proc `%`*(x: VirtioInfo): JsonNode
proc parse*(_: typedesc[VirtioInfo], n: JsonNode): VirtioInfo
proc `%`*(x: VhostStatus): JsonNode
proc parse*(_: typedesc[VhostStatus], n: JsonNode): VhostStatus
proc `%`*(x: VirtioStatus): JsonNode
proc parse*(_: typedesc[VirtioStatus], n: JsonNode): VirtioStatus
proc `%`*(x: VirtioDeviceStatus): JsonNode
proc parse*(_: typedesc[VirtioDeviceStatus], n: JsonNode): VirtioDeviceStatus
proc `%`*(x: VhostDeviceProtocols): JsonNode
proc parse*(_: typedesc[VhostDeviceProtocols], n: JsonNode): VhostDeviceProtocols
proc `%`*(x: VirtioDeviceFeatures): JsonNode
proc parse*(_: typedesc[VirtioDeviceFeatures], n: JsonNode): VirtioDeviceFeatures
proc `%`*(x: VirtQueueStatus): JsonNode
proc parse*(_: typedesc[VirtQueueStatus], n: JsonNode): VirtQueueStatus
proc `%`*(x: VirtVhostQueueStatus): JsonNode
proc parse*(_: typedesc[VirtVhostQueueStatus], n: JsonNode): VirtVhostQueueStatus
proc `%`*(x: VirtioRingDesc): JsonNode
proc parse*(_: typedesc[VirtioRingDesc], n: JsonNode): VirtioRingDesc
proc `%`*(x: VirtioRingAvail): JsonNode
proc parse*(_: typedesc[VirtioRingAvail], n: JsonNode): VirtioRingAvail
proc `%`*(x: VirtioRingUsed): JsonNode
proc parse*(_: typedesc[VirtioRingUsed], n: JsonNode): VirtioRingUsed
proc `%`*(x: VirtioQueueElement): JsonNode
proc parse*(_: typedesc[VirtioQueueElement], n: JsonNode): VirtioQueueElement
proc `%`*(x: IOThreadVirtQueueMapping): JsonNode
proc parse*(_: typedesc[IOThreadVirtQueueMapping], n: JsonNode): IOThreadVirtQueueMapping
proc `%`*(x: VirtIOGPUOutput): JsonNode
proc parse*(_: typedesc[VirtIOGPUOutput], n: JsonNode): VirtIOGPUOutput
proc `%`*(x: DummyVirtioForceArrays): JsonNode
proc parse*(_: typedesc[DummyVirtioForceArrays], n: JsonNode): DummyVirtioForceArrays
proc `%`*(x: GranuleMode): JsonNode
proc parse*(_: typedesc[GranuleMode], n: JsonNode): GranuleMode
proc `%`*(x: VMAppleVirtioBlkVariant): JsonNode
proc parse*(_: typedesc[VMAppleVirtioBlkVariant], n: JsonNode): VMAppleVirtioBlkVariant
proc `%`*(x: QapiVfioMigrationState): JsonNode
proc parse*(_: typedesc[QapiVfioMigrationState], n: JsonNode): QapiVfioMigrationState
proc `%`*(x: QCryptodevBackendAlgoType): JsonNode
proc parse*(_: typedesc[QCryptodevBackendAlgoType], n: JsonNode): QCryptodevBackendAlgoType
proc `%`*(x: QCryptodevBackendServiceType): JsonNode
proc parse*(_: typedesc[QCryptodevBackendServiceType], n: JsonNode): QCryptodevBackendServiceType
proc `%`*(x: QCryptodevBackendType): JsonNode
proc parse*(_: typedesc[QCryptodevBackendType], n: JsonNode): QCryptodevBackendType
proc `%`*(x: QCryptodevBackendClient): JsonNode
proc parse*(_: typedesc[QCryptodevBackendClient], n: JsonNode): QCryptodevBackendClient
proc `%`*(x: QCryptodevInfo): JsonNode
proc parse*(_: typedesc[QCryptodevInfo], n: JsonNode): QCryptodevInfo
proc `%`*(x: CxlEventLog): JsonNode
proc parse*(_: typedesc[CxlEventLog], n: JsonNode): CxlEventLog
proc `%`*(x: CXLCommonEventBase): JsonNode
proc parse*(_: typedesc[CXLCommonEventBase], n: JsonNode): CXLCommonEventBase
proc `%`*(x: CXLGeneralMediaEvent): JsonNode
proc parse*(_: typedesc[CXLGeneralMediaEvent], n: JsonNode): CXLGeneralMediaEvent
proc `%`*(x: CXLDRAMEvent): JsonNode
proc parse*(_: typedesc[CXLDRAMEvent], n: JsonNode): CXLDRAMEvent
proc `%`*(x: CXLMemModuleEvent): JsonNode
proc parse*(_: typedesc[CXLMemModuleEvent], n: JsonNode): CXLMemModuleEvent
proc `%`*(x: CxlUncorErrorType): JsonNode
proc parse*(_: typedesc[CxlUncorErrorType], n: JsonNode): CxlUncorErrorType
proc `%`*(x: CXLUncorErrorRecord): JsonNode
proc parse*(_: typedesc[CXLUncorErrorRecord], n: JsonNode): CXLUncorErrorRecord
proc `%`*(x: CxlCorErrorType): JsonNode
proc parse*(_: typedesc[CxlCorErrorType], n: JsonNode): CxlCorErrorType
proc `%`*(x: CxlDynamicCapacityExtent): JsonNode
proc parse*(_: typedesc[CxlDynamicCapacityExtent], n: JsonNode): CxlDynamicCapacityExtent
proc `%`*(x: CxlExtentSelectionPolicy): JsonNode
proc parse*(_: typedesc[CxlExtentSelectionPolicy], n: JsonNode): CxlExtentSelectionPolicy
proc `%`*(x: CxlExtentRemovalPolicy): JsonNode
proc parse*(_: typedesc[CxlExtentRemovalPolicy], n: JsonNode): CxlExtentRemovalPolicy
proc `%`*(x: UefiVariable): JsonNode
proc parse*(_: typedesc[UefiVariable], n: JsonNode): UefiVariable
proc `%`*(x: UefiVarStore): JsonNode
proc parse*(_: typedesc[UefiVarStore], n: JsonNode): UefiVarStore

proc `%`*(x: QapiErrorClass): JsonNode = %($x)
proc parse*(_: typedesc[QapiErrorClass], n: JsonNode): QapiErrorClass =
  let s = n.getStr
  case s
  of "GenericError": QapiErrorClass.GenericError
  of "CommandNotFound": QapiErrorClass.CommandNotFound
  of "DeviceNotActive": QapiErrorClass.DeviceNotActive
  of "DeviceNotFound": QapiErrorClass.DeviceNotFound
  of "KVMMissingCap": QapiErrorClass.KVMMissingCap
  else: raise newException(ValueError, "unknown QapiErrorClass: " & s)

proc `%`*(x: IoOperationType): JsonNode = %($x)
proc parse*(_: typedesc[IoOperationType], n: JsonNode): IoOperationType =
  let s = n.getStr
  case s
  of "read": IoOperationType.Read
  of "write": IoOperationType.Write
  else: raise newException(ValueError, "unknown IoOperationType: " & s)

proc `%`*(x: OnOffAuto): JsonNode = %($x)
proc parse*(_: typedesc[OnOffAuto], n: JsonNode): OnOffAuto =
  let s = n.getStr
  case s
  of "auto": OnOffAuto.Auto
  of "on": OnOffAuto.On
  of "off": OnOffAuto.Off
  else: raise newException(ValueError, "unknown OnOffAuto: " & s)

proc `%`*(x: OnOffSplit): JsonNode = %($x)
proc parse*(_: typedesc[OnOffSplit], n: JsonNode): OnOffSplit =
  let s = n.getStr
  case s
  of "on": OnOffSplit.On
  of "off": OnOffSplit.Off
  of "split": OnOffSplit.Split
  else: raise newException(ValueError, "unknown OnOffSplit: " & s)

proc `%`*(x: StrOrNull): JsonNode =
  case x.kind
  of StrOrNullKind.S: %(x.s)
  of StrOrNullKind.N: %(x.n)

proc parse*(_: typedesc[StrOrNull], n: JsonNode): StrOrNull =
  result = default(StrOrNull)
  if n.kind == JString:
    result = StrOrNull(kind: StrOrNullKind.S, s: n.getStr)
  elif n.kind == JNull:
    result = StrOrNull(kind: StrOrNullKind.N, n: n)
  else: raise newException(ValueError,
      "cannot decode StrOrNull from JSON")

proc `%`*(x: OffAutoPCIBAR): JsonNode = %($x)
proc parse*(_: typedesc[OffAutoPCIBAR], n: JsonNode): OffAutoPCIBAR =
  let s = n.getStr
  case s
  of "off": OffAutoPCIBAR.Off
  of "auto": OffAutoPCIBAR.Auto
  of "bar0": OffAutoPCIBAR.Bar0
  of "bar1": OffAutoPCIBAR.Bar1
  of "bar2": OffAutoPCIBAR.Bar2
  of "bar3": OffAutoPCIBAR.Bar3
  of "bar4": OffAutoPCIBAR.Bar4
  of "bar5": OffAutoPCIBAR.Bar5
  else: raise newException(ValueError, "unknown OffAutoPCIBAR: " & s)

proc `%`*(x: PCIELinkSpeed): JsonNode = %($x)
proc parse*(_: typedesc[PCIELinkSpeed], n: JsonNode): PCIELinkSpeed =
  let s = n.getStr
  case s
  of "2_5": PCIELinkSpeed.V25
  of "5": PCIELinkSpeed.V5
  of "8": PCIELinkSpeed.V8
  of "16": PCIELinkSpeed.V16
  of "32": PCIELinkSpeed.V32
  of "64": PCIELinkSpeed.V64
  else: raise newException(ValueError, "unknown PCIELinkSpeed: " & s)

proc `%`*(x: PCIELinkWidth): JsonNode = %($x)
proc parse*(_: typedesc[PCIELinkWidth], n: JsonNode): PCIELinkWidth =
  let s = n.getStr
  case s
  of "1": PCIELinkWidth.V1
  of "2": PCIELinkWidth.V2
  of "4": PCIELinkWidth.V4
  of "8": PCIELinkWidth.V8
  of "12": PCIELinkWidth.V12
  of "16": PCIELinkWidth.V16
  of "32": PCIELinkWidth.V32
  else: raise newException(ValueError, "unknown PCIELinkWidth: " & s)

proc `%`*(x: HostMemPolicy): JsonNode = %($x)
proc parse*(_: typedesc[HostMemPolicy], n: JsonNode): HostMemPolicy =
  let s = n.getStr
  case s
  of "default": HostMemPolicy.Default
  of "preferred": HostMemPolicy.Preferred
  of "bind": HostMemPolicy.Bind
  of "interleave": HostMemPolicy.Interleave
  else: raise newException(ValueError, "unknown HostMemPolicy: " & s)

proc `%`*(x: NetFilterDirection): JsonNode = %($x)
proc parse*(_: typedesc[NetFilterDirection], n: JsonNode): NetFilterDirection =
  let s = n.getStr
  case s
  of "all": NetFilterDirection.All
  of "rx": NetFilterDirection.Rx
  of "tx": NetFilterDirection.Tx
  else: raise newException(ValueError, "unknown NetFilterDirection: " & s)

proc `%`*(x: GrabToggleKeys): JsonNode = %($x)
proc parse*(_: typedesc[GrabToggleKeys], n: JsonNode): GrabToggleKeys =
  let s = n.getStr
  case s
  of "ctrl-ctrl": GrabToggleKeys.CtrlCtrl
  of "alt-alt": GrabToggleKeys.AltAlt
  of "shift-shift": GrabToggleKeys.ShiftShift
  of "meta-meta": GrabToggleKeys.MetaMeta
  of "scrolllock": GrabToggleKeys.Scrolllock
  of "ctrl-scrolllock": GrabToggleKeys.CtrlScrolllock
  else: raise newException(ValueError, "unknown GrabToggleKeys: " & s)

proc `%`*(x: HumanReadableText): JsonNode =
  result = newJObject()
  result["human-readable-text"] = %(x.humanReadableText)

proc parse*(_: typedesc[HumanReadableText], n: JsonNode): HumanReadableText =
  result = default(HumanReadableText)
  result.humanReadableText = n["human-readable-text"].getStr

proc `%`*(x: EndianMode): JsonNode = %($x)
proc parse*(_: typedesc[EndianMode], n: JsonNode): EndianMode =
  let s = n.getStr
  case s
  of "unspecified": EndianMode.Unspecified
  of "little": EndianMode.Little
  of "big": EndianMode.Big
  else: raise newException(ValueError, "unknown EndianMode: " & s)

proc `%`*(x: NetworkAddressFamily): JsonNode = %($x)
proc parse*(_: typedesc[NetworkAddressFamily], n: JsonNode): NetworkAddressFamily =
  let s = n.getStr
  case s
  of "ipv4": NetworkAddressFamily.Ipv4
  of "ipv6": NetworkAddressFamily.Ipv6
  of "unix": NetworkAddressFamily.Unix
  of "vsock": NetworkAddressFamily.Vsock
  of "unknown": NetworkAddressFamily.Unknown
  else: raise newException(ValueError, "unknown NetworkAddressFamily: " & s)

proc `%`*(x: InetSocketAddressBase): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["port"] = %(x.port)

proc parse*(_: typedesc[InetSocketAddressBase], n: JsonNode): InetSocketAddressBase =
  result = default(InetSocketAddressBase)
  result.host = n["host"].getStr
  result.port = n["port"].getStr

proc `%`*(x: InetSocketAddress): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["port"] = %(x.port)
  if x.numeric.isSome: result["numeric"] = %(x.numeric.get)
  if x.to.isSome: result["to"] = %(x.to.get)
  if x.ipv4.isSome: result["ipv4"] = %(x.ipv4.get)
  if x.ipv6.isSome: result["ipv6"] = %(x.ipv6.get)
  if x.keepAlive.isSome: result["keep-alive"] = %(x.keepAlive.get)
  if x.keepAliveCount.isSome: result["keep-alive-count"] = %(x.keepAliveCount.get)
  if x.keepAliveIdle.isSome: result["keep-alive-idle"] = %(x.keepAliveIdle.get)
  if x.keepAliveInterval.isSome: result["keep-alive-interval"] = %(x.keepAliveInterval.get)
  if x.mptcp.isSome: result["mptcp"] = %(x.mptcp.get)

proc parse*(_: typedesc[InetSocketAddress], n: JsonNode): InetSocketAddress =
  result = default(InetSocketAddress)
  result.host = n["host"].getStr
  result.port = n["port"].getStr
  if n.hasKey("numeric") and n["numeric"].kind != JNull:
    result.numeric = some(n["numeric"].getBool)
  if n.hasKey("to") and n["to"].kind != JNull:
    result.to = some(uint16(n["to"].getBiggestInt))
  if n.hasKey("ipv4") and n["ipv4"].kind != JNull:
    result.ipv4 = some(n["ipv4"].getBool)
  if n.hasKey("ipv6") and n["ipv6"].kind != JNull:
    result.ipv6 = some(n["ipv6"].getBool)
  if n.hasKey("keep-alive") and n["keep-alive"].kind != JNull:
    result.keepAlive = some(n["keep-alive"].getBool)
  if n.hasKey("keep-alive-count") and n["keep-alive-count"].kind != JNull:
    result.keepAliveCount = some(uint32(n["keep-alive-count"].getBiggestInt))
  if n.hasKey("keep-alive-idle") and n["keep-alive-idle"].kind != JNull:
    result.keepAliveIdle = some(uint32(n["keep-alive-idle"].getBiggestInt))
  if n.hasKey("keep-alive-interval") and n["keep-alive-interval"].kind != JNull:
    result.keepAliveInterval = some(uint32(n["keep-alive-interval"].getBiggestInt))
  if n.hasKey("mptcp") and n["mptcp"].kind != JNull:
    result.mptcp = some(n["mptcp"].getBool)

proc `%`*(x: UnixSocketAddress): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  if x.abstract.isSome: result["abstract"] = %(x.abstract.get)
  if x.tight.isSome: result["tight"] = %(x.tight.get)

proc parse*(_: typedesc[UnixSocketAddress], n: JsonNode): UnixSocketAddress =
  result = default(UnixSocketAddress)
  result.path = n["path"].getStr
  if n.hasKey("abstract") and n["abstract"].kind != JNull:
    result.abstract = some(n["abstract"].getBool)
  if n.hasKey("tight") and n["tight"].kind != JNull:
    result.tight = some(n["tight"].getBool)

proc `%`*(x: VsockSocketAddress): JsonNode =
  result = newJObject()
  result["cid"] = %(x.cid)
  result["port"] = %(x.port)

proc parse*(_: typedesc[VsockSocketAddress], n: JsonNode): VsockSocketAddress =
  result = default(VsockSocketAddress)
  result.cid = n["cid"].getStr
  result.port = n["port"].getStr

proc `%`*(x: FdSocketAddress): JsonNode =
  result = newJObject()
  result["str"] = %(x.str)

proc parse*(_: typedesc[FdSocketAddress], n: JsonNode): FdSocketAddress =
  result = default(FdSocketAddress)
  result.str = n["str"].getStr

proc `%`*(x: InetSocketAddressWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[InetSocketAddressWrapper], n: JsonNode): InetSocketAddressWrapper =
  result = default(InetSocketAddressWrapper)
  result.data = parse(typedesc[InetSocketAddress], n["data"])

proc `%`*(x: UnixSocketAddressWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[UnixSocketAddressWrapper], n: JsonNode): UnixSocketAddressWrapper =
  result = default(UnixSocketAddressWrapper)
  result.data = parse(typedesc[UnixSocketAddress], n["data"])

proc `%`*(x: VsockSocketAddressWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[VsockSocketAddressWrapper], n: JsonNode): VsockSocketAddressWrapper =
  result = default(VsockSocketAddressWrapper)
  result.data = parse(typedesc[VsockSocketAddress], n["data"])

proc `%`*(x: FdSocketAddressWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[FdSocketAddressWrapper], n: JsonNode): FdSocketAddressWrapper =
  result = default(FdSocketAddressWrapper)
  result.data = parse(typedesc[FdSocketAddress], n["data"])

proc `%`*(x: SocketAddressLegacy): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of SocketAddressType.Inet:
    let sub = %(x.inet)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Unix:
    let sub = %(x.unix)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Vsock:
    let sub = %(x.vsock)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Fd:
    let sub = %(x.fd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[SocketAddressLegacy], n: JsonNode): SocketAddressLegacy =
  result = default(SocketAddressLegacy)
  let tag = parse(typedesc[SocketAddressType], n["type"])
  case tag
  of SocketAddressType.Inet:
    result = SocketAddressLegacy(`type`: tag, inet: parse(typedesc[InetSocketAddressWrapper], n))
  of SocketAddressType.Unix:
    result = SocketAddressLegacy(`type`: tag, unix: parse(typedesc[UnixSocketAddressWrapper], n))
  of SocketAddressType.Vsock:
    result = SocketAddressLegacy(`type`: tag, vsock: parse(typedesc[VsockSocketAddressWrapper], n))
  of SocketAddressType.Fd:
    result = SocketAddressLegacy(`type`: tag, fd: parse(typedesc[FdSocketAddressWrapper], n))

proc `%`*(x: SocketAddressType): JsonNode = %($x)
proc parse*(_: typedesc[SocketAddressType], n: JsonNode): SocketAddressType =
  let s = n.getStr
  case s
  of "inet": SocketAddressType.Inet
  of "unix": SocketAddressType.Unix
  of "vsock": SocketAddressType.Vsock
  of "fd": SocketAddressType.Fd
  else: raise newException(ValueError, "unknown SocketAddressType: " & s)

proc `%`*(x: SocketAddress): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of SocketAddressType.Inet:
    let sub = %(x.inet)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Unix:
    let sub = %(x.unix)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Vsock:
    let sub = %(x.vsock)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SocketAddressType.Fd:
    let sub = %(x.fd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[SocketAddress], n: JsonNode): SocketAddress =
  result = default(SocketAddress)
  let tag = parse(typedesc[SocketAddressType], n["type"])
  case tag
  of SocketAddressType.Inet:
    result = SocketAddress(`type`: tag, inet: parse(typedesc[InetSocketAddress], n))
  of SocketAddressType.Unix:
    result = SocketAddress(`type`: tag, unix: parse(typedesc[UnixSocketAddress], n))
  of SocketAddressType.Vsock:
    result = SocketAddress(`type`: tag, vsock: parse(typedesc[VsockSocketAddress], n))
  of SocketAddressType.Fd:
    result = SocketAddress(`type`: tag, fd: parse(typedesc[FdSocketAddress], n))

proc `%`*(x: RunState): JsonNode = %($x)
proc parse*(_: typedesc[RunState], n: JsonNode): RunState =
  let s = n.getStr
  case s
  of "debug": RunState.Debug
  of "inmigrate": RunState.Inmigrate
  of "internal-error": RunState.InternalError
  of "io-error": RunState.IoError
  of "paused": RunState.Paused
  of "postmigrate": RunState.Postmigrate
  of "prelaunch": RunState.Prelaunch
  of "finish-migrate": RunState.FinishMigrate
  of "restore-vm": RunState.RestoreVm
  of "running": RunState.Running
  of "save-vm": RunState.SaveVm
  of "shutdown": RunState.Shutdown
  of "suspended": RunState.Suspended
  of "watchdog": RunState.Watchdog
  of "guest-panicked": RunState.GuestPanicked
  of "colo": RunState.Colo
  else: raise newException(ValueError, "unknown RunState: " & s)

proc `%`*(x: ShutdownCause): JsonNode = %($x)
proc parse*(_: typedesc[ShutdownCause], n: JsonNode): ShutdownCause =
  let s = n.getStr
  case s
  of "none": ShutdownCause.None
  of "host-error": ShutdownCause.HostError
  of "host-qmp-quit": ShutdownCause.HostQmpQuit
  of "host-qmp-system-reset": ShutdownCause.HostQmpSystemReset
  of "host-signal": ShutdownCause.HostSignal
  of "host-ui": ShutdownCause.HostUi
  of "guest-shutdown": ShutdownCause.GuestShutdown
  of "guest-reset": ShutdownCause.GuestReset
  of "guest-panic": ShutdownCause.GuestPanic
  of "subsystem-reset": ShutdownCause.SubsystemReset
  of "snapshot-load": ShutdownCause.SnapshotLoad
  else: raise newException(ValueError, "unknown ShutdownCause: " & s)

proc `%`*(x: StatusInfo): JsonNode =
  result = newJObject()
  result["running"] = %(x.running)
  result["status"] = %(x.status)

proc parse*(_: typedesc[StatusInfo], n: JsonNode): StatusInfo =
  result = default(StatusInfo)
  result.running = n["running"].getBool
  result.status = parse(typedesc[RunState], n["status"])

proc `%`*(x: WatchdogAction): JsonNode = %($x)
proc parse*(_: typedesc[WatchdogAction], n: JsonNode): WatchdogAction =
  let s = n.getStr
  case s
  of "reset": WatchdogAction.Reset
  of "shutdown": WatchdogAction.Shutdown
  of "poweroff": WatchdogAction.Poweroff
  of "pause": WatchdogAction.Pause
  of "debug": WatchdogAction.Debug
  of "none": WatchdogAction.None
  of "inject-nmi": WatchdogAction.InjectNmi
  else: raise newException(ValueError, "unknown WatchdogAction: " & s)

proc `%`*(x: RebootAction): JsonNode = %($x)
proc parse*(_: typedesc[RebootAction], n: JsonNode): RebootAction =
  let s = n.getStr
  case s
  of "reset": RebootAction.Reset
  of "shutdown": RebootAction.Shutdown
  else: raise newException(ValueError, "unknown RebootAction: " & s)

proc `%`*(x: ShutdownAction): JsonNode = %($x)
proc parse*(_: typedesc[ShutdownAction], n: JsonNode): ShutdownAction =
  let s = n.getStr
  case s
  of "poweroff": ShutdownAction.Poweroff
  of "pause": ShutdownAction.Pause
  else: raise newException(ValueError, "unknown ShutdownAction: " & s)

proc `%`*(x: PanicAction): JsonNode = %($x)
proc parse*(_: typedesc[PanicAction], n: JsonNode): PanicAction =
  let s = n.getStr
  case s
  of "pause": PanicAction.Pause
  of "shutdown": PanicAction.Shutdown
  of "exit-failure": PanicAction.ExitFailure
  of "none": PanicAction.None
  else: raise newException(ValueError, "unknown PanicAction: " & s)

proc `%`*(x: GuestPanicAction): JsonNode = %($x)
proc parse*(_: typedesc[GuestPanicAction], n: JsonNode): GuestPanicAction =
  let s = n.getStr
  case s
  of "pause": GuestPanicAction.Pause
  of "poweroff": GuestPanicAction.Poweroff
  of "run": GuestPanicAction.Run
  else: raise newException(ValueError, "unknown GuestPanicAction: " & s)

proc `%`*(x: GuestPanicInformationType): JsonNode = %($x)
proc parse*(_: typedesc[GuestPanicInformationType], n: JsonNode): GuestPanicInformationType =
  let s = n.getStr
  case s
  of "hyper-v": GuestPanicInformationType.HyperV
  of "s390": GuestPanicInformationType.S390
  of "tdx": GuestPanicInformationType.Tdx
  of "sev": GuestPanicInformationType.Sev
  else: raise newException(ValueError, "unknown GuestPanicInformationType: " & s)

proc `%`*(x: GuestPanicInformation): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of GuestPanicInformationType.HyperV:
    let sub = %(x.hyperV)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of GuestPanicInformationType.S390:
    let sub = %(x.s390)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of GuestPanicInformationType.Tdx:
    let sub = %(x.tdx)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of GuestPanicInformationType.Sev:
    let sub = %(x.sev)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[GuestPanicInformation], n: JsonNode): GuestPanicInformation =
  result = default(GuestPanicInformation)
  let tag = parse(typedesc[GuestPanicInformationType], n["type"])
  case tag
  of GuestPanicInformationType.HyperV:
    result = GuestPanicInformation(`type`: tag, hyperV: parse(typedesc[GuestPanicInformationHyperV], n))
  of GuestPanicInformationType.S390:
    result = GuestPanicInformation(`type`: tag, s390: parse(typedesc[GuestPanicInformationS390], n))
  of GuestPanicInformationType.Tdx:
    result = GuestPanicInformation(`type`: tag, tdx: parse(typedesc[GuestPanicInformationTdx], n))
  of GuestPanicInformationType.Sev:
    result = GuestPanicInformation(`type`: tag, sev: parse(typedesc[GuestPanicInformationSev], n))

proc `%`*(x: GuestPanicInformationHyperV): JsonNode =
  result = newJObject()
  result["arg1"] = %(x.arg1)
  result["arg2"] = %(x.arg2)
  result["arg3"] = %(x.arg3)
  result["arg4"] = %(x.arg4)
  result["arg5"] = %(x.arg5)

proc parse*(_: typedesc[GuestPanicInformationHyperV], n: JsonNode): GuestPanicInformationHyperV =
  result = default(GuestPanicInformationHyperV)
  result.arg1 = cast[uint64](n["arg1"].getBiggestInt)
  result.arg2 = cast[uint64](n["arg2"].getBiggestInt)
  result.arg3 = cast[uint64](n["arg3"].getBiggestInt)
  result.arg4 = cast[uint64](n["arg4"].getBiggestInt)
  result.arg5 = cast[uint64](n["arg5"].getBiggestInt)

proc `%`*(x: S390CrashReason): JsonNode = %($x)
proc parse*(_: typedesc[S390CrashReason], n: JsonNode): S390CrashReason =
  let s = n.getStr
  case s
  of "unknown": S390CrashReason.Unknown
  of "disabled-wait": S390CrashReason.DisabledWait
  of "extint-loop": S390CrashReason.ExtintLoop
  of "pgmint-loop": S390CrashReason.PgmintLoop
  of "opint-loop": S390CrashReason.OpintLoop
  else: raise newException(ValueError, "unknown S390CrashReason: " & s)

proc `%`*(x: GuestPanicInformationS390): JsonNode =
  result = newJObject()
  result["core"] = %(x.core)
  result["psw-mask"] = %(x.pswMask)
  result["psw-addr"] = %(x.pswAddr)
  result["reason"] = %(x.reason)

proc parse*(_: typedesc[GuestPanicInformationS390], n: JsonNode): GuestPanicInformationS390 =
  result = default(GuestPanicInformationS390)
  result.core = uint32(n["core"].getBiggestInt)
  result.pswMask = cast[uint64](n["psw-mask"].getBiggestInt)
  result.pswAddr = cast[uint64](n["psw-addr"].getBiggestInt)
  result.reason = parse(typedesc[S390CrashReason], n["reason"])

proc `%`*(x: GuestPanicInformationTdx): JsonNode =
  result = newJObject()
  result["error-code"] = %(x.errorCode)
  result["message"] = %(x.message)
  if x.gpa.isSome: result["gpa"] = %(x.gpa.get)

proc parse*(_: typedesc[GuestPanicInformationTdx], n: JsonNode): GuestPanicInformationTdx =
  result = default(GuestPanicInformationTdx)
  result.errorCode = uint32(n["error-code"].getBiggestInt)
  result.message = n["message"].getStr
  if n.hasKey("gpa") and n["gpa"].kind != JNull:
    result.gpa = some(cast[uint64](n["gpa"].getBiggestInt))

proc `%`*(x: GuestPanicInformationSev): JsonNode =
  result = newJObject()
  result["set"] = %(x.set)
  result["code"] = %(x.code)

proc parse*(_: typedesc[GuestPanicInformationSev], n: JsonNode): GuestPanicInformationSev =
  result = default(GuestPanicInformationSev)
  result.set = uint32(n["set"].getBiggestInt)
  result.code = uint32(n["code"].getBiggestInt)

proc `%`*(x: MemoryFailureRecipient): JsonNode = %($x)
proc parse*(_: typedesc[MemoryFailureRecipient], n: JsonNode): MemoryFailureRecipient =
  let s = n.getStr
  case s
  of "hypervisor": MemoryFailureRecipient.Hypervisor
  of "guest": MemoryFailureRecipient.Guest
  else: raise newException(ValueError, "unknown MemoryFailureRecipient: " & s)

proc `%`*(x: MemoryFailureAction): JsonNode = %($x)
proc parse*(_: typedesc[MemoryFailureAction], n: JsonNode): MemoryFailureAction =
  let s = n.getStr
  case s
  of "ignore": MemoryFailureAction.Ignore
  of "inject": MemoryFailureAction.Inject
  of "fatal": MemoryFailureAction.Fatal
  of "reset": MemoryFailureAction.Reset
  else: raise newException(ValueError, "unknown MemoryFailureAction: " & s)

proc `%`*(x: MemoryFailureFlags): JsonNode =
  result = newJObject()
  result["action-required"] = %(x.actionRequired)
  result["recursive"] = %(x.recursive)

proc parse*(_: typedesc[MemoryFailureFlags], n: JsonNode): MemoryFailureFlags =
  result = default(MemoryFailureFlags)
  result.actionRequired = n["action-required"].getBool
  result.recursive = n["recursive"].getBool

proc `%`*(x: NotifyVmexitOption): JsonNode = %($x)
proc parse*(_: typedesc[NotifyVmexitOption], n: JsonNode): NotifyVmexitOption =
  let s = n.getStr
  case s
  of "run": NotifyVmexitOption.Run
  of "internal-error": NotifyVmexitOption.InternalError
  of "disable": NotifyVmexitOption.Disable
  else: raise newException(ValueError, "unknown NotifyVmexitOption: " & s)

proc `%`*(x: QCryptoTLSCredsEndpoint): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoTLSCredsEndpoint], n: JsonNode): QCryptoTLSCredsEndpoint =
  let s = n.getStr
  case s
  of "client": QCryptoTLSCredsEndpoint.Client
  of "server": QCryptoTLSCredsEndpoint.Server
  else: raise newException(ValueError, "unknown QCryptoTLSCredsEndpoint: " & s)

proc `%`*(x: QCryptoSecretFormat): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoSecretFormat], n: JsonNode): QCryptoSecretFormat =
  let s = n.getStr
  case s
  of "raw": QCryptoSecretFormat.Raw
  of "base64": QCryptoSecretFormat.Base64
  else: raise newException(ValueError, "unknown QCryptoSecretFormat: " & s)

proc `%`*(x: QCryptoHashAlgo): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoHashAlgo], n: JsonNode): QCryptoHashAlgo =
  let s = n.getStr
  case s
  of "md5": QCryptoHashAlgo.Md5
  of "sha1": QCryptoHashAlgo.Sha1
  of "sha224": QCryptoHashAlgo.Sha224
  of "sha256": QCryptoHashAlgo.Sha256
  of "sha384": QCryptoHashAlgo.Sha384
  of "sha512": QCryptoHashAlgo.Sha512
  of "ripemd160": QCryptoHashAlgo.Ripemd160
  of "sm3": QCryptoHashAlgo.Sm3
  else: raise newException(ValueError, "unknown QCryptoHashAlgo: " & s)

proc `%`*(x: QCryptoCipherAlgo): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoCipherAlgo], n: JsonNode): QCryptoCipherAlgo =
  let s = n.getStr
  case s
  of "aes-128": QCryptoCipherAlgo.Aes128
  of "aes-192": QCryptoCipherAlgo.Aes192
  of "aes-256": QCryptoCipherAlgo.Aes256
  of "des": QCryptoCipherAlgo.Des
  of "3des": QCryptoCipherAlgo.V3des
  of "cast5-128": QCryptoCipherAlgo.Cast5128
  of "serpent-128": QCryptoCipherAlgo.Serpent128
  of "serpent-192": QCryptoCipherAlgo.Serpent192
  of "serpent-256": QCryptoCipherAlgo.Serpent256
  of "twofish-128": QCryptoCipherAlgo.Twofish128
  of "twofish-192": QCryptoCipherAlgo.Twofish192
  of "twofish-256": QCryptoCipherAlgo.Twofish256
  of "sm4": QCryptoCipherAlgo.Sm4
  else: raise newException(ValueError, "unknown QCryptoCipherAlgo: " & s)

proc `%`*(x: QCryptoCipherMode): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoCipherMode], n: JsonNode): QCryptoCipherMode =
  let s = n.getStr
  case s
  of "ecb": QCryptoCipherMode.Ecb
  of "cbc": QCryptoCipherMode.Cbc
  of "xts": QCryptoCipherMode.Xts
  of "ctr": QCryptoCipherMode.Ctr
  else: raise newException(ValueError, "unknown QCryptoCipherMode: " & s)

proc `%`*(x: QCryptoIVGenAlgo): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoIVGenAlgo], n: JsonNode): QCryptoIVGenAlgo =
  let s = n.getStr
  case s
  of "plain": QCryptoIVGenAlgo.Plain
  of "plain64": QCryptoIVGenAlgo.Plain64
  of "essiv": QCryptoIVGenAlgo.Essiv
  else: raise newException(ValueError, "unknown QCryptoIVGenAlgo: " & s)

proc `%`*(x: QCryptoBlockFormat): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoBlockFormat], n: JsonNode): QCryptoBlockFormat =
  let s = n.getStr
  case s
  of "qcow": QCryptoBlockFormat.Qcow
  of "luks": QCryptoBlockFormat.Luks
  else: raise newException(ValueError, "unknown QCryptoBlockFormat: " & s)

proc `%`*(x: QCryptoBlockOptionsBase): JsonNode =
  result = newJObject()
  result["format"] = %(x.format)

proc parse*(_: typedesc[QCryptoBlockOptionsBase], n: JsonNode): QCryptoBlockOptionsBase =
  result = default(QCryptoBlockOptionsBase)
  result.format = parse(typedesc[QCryptoBlockFormat], n["format"])

proc `%`*(x: QCryptoBlockOptionsQCow): JsonNode =
  result = newJObject()
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)

proc parse*(_: typedesc[QCryptoBlockOptionsQCow], n: JsonNode): QCryptoBlockOptionsQCow =
  result = default(QCryptoBlockOptionsQCow)
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)

proc `%`*(x: QCryptoBlockOptionsLUKS): JsonNode =
  result = newJObject()
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)

proc parse*(_: typedesc[QCryptoBlockOptionsLUKS], n: JsonNode): QCryptoBlockOptionsLUKS =
  result = default(QCryptoBlockOptionsLUKS)
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)

proc `%`*(x: QCryptoBlockCreateOptionsLUKS): JsonNode =
  result = newJObject()
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)
  if x.cipherAlg.isSome: result["cipher-alg"] = %(x.cipherAlg.get)
  if x.cipherMode.isSome: result["cipher-mode"] = %(x.cipherMode.get)
  if x.ivgenAlg.isSome: result["ivgen-alg"] = %(x.ivgenAlg.get)
  if x.ivgenHashAlg.isSome: result["ivgen-hash-alg"] = %(x.ivgenHashAlg.get)
  if x.hashAlg.isSome: result["hash-alg"] = %(x.hashAlg.get)
  if x.iterTime.isSome: result["iter-time"] = %(x.iterTime.get)

proc parse*(_: typedesc[QCryptoBlockCreateOptionsLUKS], n: JsonNode): QCryptoBlockCreateOptionsLUKS =
  result = default(QCryptoBlockCreateOptionsLUKS)
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)
  if n.hasKey("cipher-alg") and n["cipher-alg"].kind != JNull:
    result.cipherAlg = some(parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"]))
  if n.hasKey("cipher-mode") and n["cipher-mode"].kind != JNull:
    result.cipherMode = some(parse(typedesc[QCryptoCipherMode], n["cipher-mode"]))
  if n.hasKey("ivgen-alg") and n["ivgen-alg"].kind != JNull:
    result.ivgenAlg = some(parse(typedesc[QCryptoIVGenAlgo], n["ivgen-alg"]))
  if n.hasKey("ivgen-hash-alg") and n["ivgen-hash-alg"].kind != JNull:
    result.ivgenHashAlg = some(parse(typedesc[QCryptoHashAlgo], n["ivgen-hash-alg"]))
  if n.hasKey("hash-alg") and n["hash-alg"].kind != JNull:
    result.hashAlg = some(parse(typedesc[QCryptoHashAlgo], n["hash-alg"]))
  if n.hasKey("iter-time") and n["iter-time"].kind != JNull:
    result.iterTime = some(int64(n["iter-time"].getBiggestInt))

proc `%`*(x: QCryptoBlockOpenOptions): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of QCryptoBlockFormat.Qcow:
    let sub = %(x.qcow)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of QCryptoBlockFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[QCryptoBlockOpenOptions], n: JsonNode): QCryptoBlockOpenOptions =
  result = default(QCryptoBlockOpenOptions)
  let tag = parse(typedesc[QCryptoBlockFormat], n["format"])
  case tag
  of QCryptoBlockFormat.Qcow:
    result = QCryptoBlockOpenOptions(format: tag, qcow: parse(typedesc[QCryptoBlockOptionsQCow], n))
  of QCryptoBlockFormat.Luks:
    result = QCryptoBlockOpenOptions(format: tag, luks: parse(typedesc[QCryptoBlockOptionsLUKS], n))

proc `%`*(x: QCryptoBlockCreateOptions): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of QCryptoBlockFormat.Qcow:
    let sub = %(x.qcow)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of QCryptoBlockFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[QCryptoBlockCreateOptions], n: JsonNode): QCryptoBlockCreateOptions =
  result = default(QCryptoBlockCreateOptions)
  let tag = parse(typedesc[QCryptoBlockFormat], n["format"])
  case tag
  of QCryptoBlockFormat.Qcow:
    result = QCryptoBlockCreateOptions(format: tag, qcow: parse(typedesc[QCryptoBlockOptionsQCow], n))
  of QCryptoBlockFormat.Luks:
    result = QCryptoBlockCreateOptions(format: tag, luks: parse(typedesc[QCryptoBlockCreateOptionsLUKS], n))

proc `%`*(x: QCryptoBlockInfoBase): JsonNode =
  result = newJObject()
  result["format"] = %(x.format)

proc parse*(_: typedesc[QCryptoBlockInfoBase], n: JsonNode): QCryptoBlockInfoBase =
  result = default(QCryptoBlockInfoBase)
  result.format = parse(typedesc[QCryptoBlockFormat], n["format"])

proc `%`*(x: QCryptoBlockInfoLUKSSlot): JsonNode =
  result = newJObject()
  result["active"] = %(x.active)
  if x.iters.isSome: result["iters"] = %(x.iters.get)
  if x.stripes.isSome: result["stripes"] = %(x.stripes.get)
  result["key-offset"] = %(x.keyOffset)

proc parse*(_: typedesc[QCryptoBlockInfoLUKSSlot], n: JsonNode): QCryptoBlockInfoLUKSSlot =
  result = default(QCryptoBlockInfoLUKSSlot)
  result.active = n["active"].getBool
  if n.hasKey("iters") and n["iters"].kind != JNull:
    result.iters = some(int64(n["iters"].getBiggestInt))
  if n.hasKey("stripes") and n["stripes"].kind != JNull:
    result.stripes = some(int64(n["stripes"].getBiggestInt))
  result.keyOffset = int64(n["key-offset"].getBiggestInt)

proc `%`*(x: QCryptoBlockInfoLUKS): JsonNode =
  result = newJObject()
  result["cipher-alg"] = %(x.cipherAlg)
  result["cipher-mode"] = %(x.cipherMode)
  result["ivgen-alg"] = %(x.ivgenAlg)
  if x.ivgenHashAlg.isSome: result["ivgen-hash-alg"] = %(x.ivgenHashAlg.get)
  result["hash-alg"] = %(x.hashAlg)
  result["detached-header"] = %(x.detachedHeader)
  result["payload-offset"] = %(x.payloadOffset)
  result["master-key-iters"] = %(x.masterKeyIters)
  result["uuid"] = %(x.uuid)
  result["slots"] = %(x.slots)

proc parse*(_: typedesc[QCryptoBlockInfoLUKS], n: JsonNode): QCryptoBlockInfoLUKS =
  result = default(QCryptoBlockInfoLUKS)
  result.cipherAlg = parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"])
  result.cipherMode = parse(typedesc[QCryptoCipherMode], n["cipher-mode"])
  result.ivgenAlg = parse(typedesc[QCryptoIVGenAlgo], n["ivgen-alg"])
  if n.hasKey("ivgen-hash-alg") and n["ivgen-hash-alg"].kind != JNull:
    result.ivgenHashAlg = some(parse(typedesc[QCryptoHashAlgo], n["ivgen-hash-alg"]))
  result.hashAlg = parse(typedesc[QCryptoHashAlgo], n["hash-alg"])
  result.detachedHeader = n["detached-header"].getBool
  result.payloadOffset = int64(n["payload-offset"].getBiggestInt)
  result.masterKeyIters = int64(n["master-key-iters"].getBiggestInt)
  result.uuid = n["uuid"].getStr
  result.slots = (n["slots"]).getElems.mapIt(parse(typedesc[QCryptoBlockInfoLUKSSlot], it))

proc `%`*(x: QCryptoBlockInfo): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of QCryptoBlockFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of QCryptoBlockFormat.Qcow: discard

proc parse*(_: typedesc[QCryptoBlockInfo], n: JsonNode): QCryptoBlockInfo =
  result = default(QCryptoBlockInfo)
  let tag = parse(typedesc[QCryptoBlockFormat], n["format"])
  case tag
  of QCryptoBlockFormat.Luks:
    result = QCryptoBlockInfo(format: tag, luks: parse(typedesc[QCryptoBlockInfoLUKS], n))
  of QCryptoBlockFormat.Qcow:
    result = QCryptoBlockInfo(format: tag)

proc `%`*(x: QCryptoBlockLUKSKeyslotState): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoBlockLUKSKeyslotState], n: JsonNode): QCryptoBlockLUKSKeyslotState =
  let s = n.getStr
  case s
  of "active": QCryptoBlockLUKSKeyslotState.Active
  of "inactive": QCryptoBlockLUKSKeyslotState.Inactive
  else: raise newException(ValueError, "unknown QCryptoBlockLUKSKeyslotState: " & s)

proc `%`*(x: QCryptoBlockAmendOptionsLUKS): JsonNode =
  result = newJObject()
  result["state"] = %(x.state)
  if x.newSecret.isSome: result["new-secret"] = %(x.newSecret.get)
  if x.oldSecret.isSome: result["old-secret"] = %(x.oldSecret.get)
  if x.keyslot.isSome: result["keyslot"] = %(x.keyslot.get)
  if x.iterTime.isSome: result["iter-time"] = %(x.iterTime.get)
  if x.secret.isSome: result["secret"] = %(x.secret.get)

proc parse*(_: typedesc[QCryptoBlockAmendOptionsLUKS], n: JsonNode): QCryptoBlockAmendOptionsLUKS =
  result = default(QCryptoBlockAmendOptionsLUKS)
  result.state = parse(typedesc[QCryptoBlockLUKSKeyslotState], n["state"])
  if n.hasKey("new-secret") and n["new-secret"].kind != JNull:
    result.newSecret = some(n["new-secret"].getStr)
  if n.hasKey("old-secret") and n["old-secret"].kind != JNull:
    result.oldSecret = some(n["old-secret"].getStr)
  if n.hasKey("keyslot") and n["keyslot"].kind != JNull:
    result.keyslot = some(int64(n["keyslot"].getBiggestInt))
  if n.hasKey("iter-time") and n["iter-time"].kind != JNull:
    result.iterTime = some(int64(n["iter-time"].getBiggestInt))
  if n.hasKey("secret") and n["secret"].kind != JNull:
    result.secret = some(n["secret"].getStr)

proc `%`*(x: QCryptoBlockAmendOptions): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of QCryptoBlockFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of QCryptoBlockFormat.Qcow: discard

proc parse*(_: typedesc[QCryptoBlockAmendOptions], n: JsonNode): QCryptoBlockAmendOptions =
  result = default(QCryptoBlockAmendOptions)
  let tag = parse(typedesc[QCryptoBlockFormat], n["format"])
  case tag
  of QCryptoBlockFormat.Luks:
    result = QCryptoBlockAmendOptions(format: tag, luks: parse(typedesc[QCryptoBlockAmendOptionsLUKS], n))
  of QCryptoBlockFormat.Qcow:
    result = QCryptoBlockAmendOptions(format: tag)

proc `%`*(x: SecretCommonProperties): JsonNode =
  result = newJObject()
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.keyid.isSome: result["keyid"] = %(x.keyid.get)
  if x.iv.isSome: result["iv"] = %(x.iv.get)

proc parse*(_: typedesc[SecretCommonProperties], n: JsonNode): SecretCommonProperties =
  result = default(SecretCommonProperties)
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[QCryptoSecretFormat], n["format"]))
  if n.hasKey("keyid") and n["keyid"].kind != JNull:
    result.keyid = some(n["keyid"].getStr)
  if n.hasKey("iv") and n["iv"].kind != JNull:
    result.iv = some(n["iv"].getStr)

proc `%`*(x: SecretProperties): JsonNode =
  result = newJObject()
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.keyid.isSome: result["keyid"] = %(x.keyid.get)
  if x.iv.isSome: result["iv"] = %(x.iv.get)
  if x.data.isSome: result["data"] = %(x.data.get)
  if x.file.isSome: result["file"] = %(x.file.get)

proc parse*(_: typedesc[SecretProperties], n: JsonNode): SecretProperties =
  result = default(SecretProperties)
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[QCryptoSecretFormat], n["format"]))
  if n.hasKey("keyid") and n["keyid"].kind != JNull:
    result.keyid = some(n["keyid"].getStr)
  if n.hasKey("iv") and n["iv"].kind != JNull:
    result.iv = some(n["iv"].getStr)
  if n.hasKey("data") and n["data"].kind != JNull:
    result.data = some(n["data"].getStr)
  if n.hasKey("file") and n["file"].kind != JNull:
    result.file = some(n["file"].getStr)

proc `%`*(x: SecretKeyringProperties): JsonNode =
  result = newJObject()
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.keyid.isSome: result["keyid"] = %(x.keyid.get)
  if x.iv.isSome: result["iv"] = %(x.iv.get)
  result["serial"] = %(x.serial)

proc parse*(_: typedesc[SecretKeyringProperties], n: JsonNode): SecretKeyringProperties =
  result = default(SecretKeyringProperties)
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[QCryptoSecretFormat], n["format"]))
  if n.hasKey("keyid") and n["keyid"].kind != JNull:
    result.keyid = some(n["keyid"].getStr)
  if n.hasKey("iv") and n["iv"].kind != JNull:
    result.iv = some(n["iv"].getStr)
  result.serial = int32(n["serial"].getBiggestInt)

proc `%`*(x: TlsCredsProperties): JsonNode =
  result = newJObject()
  if x.verifyPeer.isSome: result["verify-peer"] = %(x.verifyPeer.get)
  if x.dir.isSome: result["dir"] = %(x.dir.get)
  if x.endpoint.isSome: result["endpoint"] = %(x.endpoint.get)
  if x.priority.isSome: result["priority"] = %(x.priority.get)

proc parse*(_: typedesc[TlsCredsProperties], n: JsonNode): TlsCredsProperties =
  result = default(TlsCredsProperties)
  if n.hasKey("verify-peer") and n["verify-peer"].kind != JNull:
    result.verifyPeer = some(n["verify-peer"].getBool)
  if n.hasKey("dir") and n["dir"].kind != JNull:
    result.dir = some(n["dir"].getStr)
  if n.hasKey("endpoint") and n["endpoint"].kind != JNull:
    result.endpoint = some(parse(typedesc[QCryptoTLSCredsEndpoint], n["endpoint"]))
  if n.hasKey("priority") and n["priority"].kind != JNull:
    result.priority = some(n["priority"].getStr)

proc `%`*(x: TlsCredsAnonProperties): JsonNode =
  result = newJObject()
  if x.verifyPeer.isSome: result["verify-peer"] = %(x.verifyPeer.get)
  if x.dir.isSome: result["dir"] = %(x.dir.get)
  if x.endpoint.isSome: result["endpoint"] = %(x.endpoint.get)
  if x.priority.isSome: result["priority"] = %(x.priority.get)

proc parse*(_: typedesc[TlsCredsAnonProperties], n: JsonNode): TlsCredsAnonProperties =
  result = default(TlsCredsAnonProperties)
  if n.hasKey("verify-peer") and n["verify-peer"].kind != JNull:
    result.verifyPeer = some(n["verify-peer"].getBool)
  if n.hasKey("dir") and n["dir"].kind != JNull:
    result.dir = some(n["dir"].getStr)
  if n.hasKey("endpoint") and n["endpoint"].kind != JNull:
    result.endpoint = some(parse(typedesc[QCryptoTLSCredsEndpoint], n["endpoint"]))
  if n.hasKey("priority") and n["priority"].kind != JNull:
    result.priority = some(n["priority"].getStr)

proc `%`*(x: TlsCredsPskProperties): JsonNode =
  result = newJObject()
  if x.verifyPeer.isSome: result["verify-peer"] = %(x.verifyPeer.get)
  if x.dir.isSome: result["dir"] = %(x.dir.get)
  if x.endpoint.isSome: result["endpoint"] = %(x.endpoint.get)
  if x.priority.isSome: result["priority"] = %(x.priority.get)
  if x.username.isSome: result["username"] = %(x.username.get)

proc parse*(_: typedesc[TlsCredsPskProperties], n: JsonNode): TlsCredsPskProperties =
  result = default(TlsCredsPskProperties)
  if n.hasKey("verify-peer") and n["verify-peer"].kind != JNull:
    result.verifyPeer = some(n["verify-peer"].getBool)
  if n.hasKey("dir") and n["dir"].kind != JNull:
    result.dir = some(n["dir"].getStr)
  if n.hasKey("endpoint") and n["endpoint"].kind != JNull:
    result.endpoint = some(parse(typedesc[QCryptoTLSCredsEndpoint], n["endpoint"]))
  if n.hasKey("priority") and n["priority"].kind != JNull:
    result.priority = some(n["priority"].getStr)
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)

proc `%`*(x: TlsCredsX509Properties): JsonNode =
  result = newJObject()
  if x.verifyPeer.isSome: result["verify-peer"] = %(x.verifyPeer.get)
  if x.dir.isSome: result["dir"] = %(x.dir.get)
  if x.endpoint.isSome: result["endpoint"] = %(x.endpoint.get)
  if x.priority.isSome: result["priority"] = %(x.priority.get)
  if x.sanityCheck.isSome: result["sanity-check"] = %(x.sanityCheck.get)
  if x.passwordid.isSome: result["passwordid"] = %(x.passwordid.get)

proc parse*(_: typedesc[TlsCredsX509Properties], n: JsonNode): TlsCredsX509Properties =
  result = default(TlsCredsX509Properties)
  if n.hasKey("verify-peer") and n["verify-peer"].kind != JNull:
    result.verifyPeer = some(n["verify-peer"].getBool)
  if n.hasKey("dir") and n["dir"].kind != JNull:
    result.dir = some(n["dir"].getStr)
  if n.hasKey("endpoint") and n["endpoint"].kind != JNull:
    result.endpoint = some(parse(typedesc[QCryptoTLSCredsEndpoint], n["endpoint"]))
  if n.hasKey("priority") and n["priority"].kind != JNull:
    result.priority = some(n["priority"].getStr)
  if n.hasKey("sanity-check") and n["sanity-check"].kind != JNull:
    result.sanityCheck = some(n["sanity-check"].getBool)
  if n.hasKey("passwordid") and n["passwordid"].kind != JNull:
    result.passwordid = some(n["passwordid"].getStr)

proc `%`*(x: QCryptoAkCipherAlgo): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoAkCipherAlgo], n: JsonNode): QCryptoAkCipherAlgo =
  let s = n.getStr
  case s
  of "rsa": QCryptoAkCipherAlgo.Rsa
  else: raise newException(ValueError, "unknown QCryptoAkCipherAlgo: " & s)

proc `%`*(x: QCryptoAkCipherKeyType): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoAkCipherKeyType], n: JsonNode): QCryptoAkCipherKeyType =
  let s = n.getStr
  case s
  of "public": QCryptoAkCipherKeyType.Public
  of "private": QCryptoAkCipherKeyType.Private
  else: raise newException(ValueError, "unknown QCryptoAkCipherKeyType: " & s)

proc `%`*(x: QCryptoRSAPaddingAlgo): JsonNode = %($x)
proc parse*(_: typedesc[QCryptoRSAPaddingAlgo], n: JsonNode): QCryptoRSAPaddingAlgo =
  let s = n.getStr
  case s
  of "raw": QCryptoRSAPaddingAlgo.Raw
  of "pkcs1": QCryptoRSAPaddingAlgo.Pkcs1
  else: raise newException(ValueError, "unknown QCryptoRSAPaddingAlgo: " & s)

proc `%`*(x: QCryptoAkCipherOptionsRSA): JsonNode =
  result = newJObject()
  result["hash-alg"] = %(x.hashAlg)
  result["padding-alg"] = %(x.paddingAlg)

proc parse*(_: typedesc[QCryptoAkCipherOptionsRSA], n: JsonNode): QCryptoAkCipherOptionsRSA =
  result = default(QCryptoAkCipherOptionsRSA)
  result.hashAlg = parse(typedesc[QCryptoHashAlgo], n["hash-alg"])
  result.paddingAlg = parse(typedesc[QCryptoRSAPaddingAlgo], n["padding-alg"])

proc `%`*(x: QCryptoAkCipherOptions): JsonNode =
  result = newJObject()
  result["alg"] = %($x.alg)
  case x.alg
  of QCryptoAkCipherAlgo.Rsa:
    let sub = %(x.rsa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[QCryptoAkCipherOptions], n: JsonNode): QCryptoAkCipherOptions =
  result = default(QCryptoAkCipherOptions)
  let tag = parse(typedesc[QCryptoAkCipherAlgo], n["alg"])
  case tag
  of QCryptoAkCipherAlgo.Rsa:
    result = QCryptoAkCipherOptions(alg: tag, rsa: parse(typedesc[QCryptoAkCipherOptionsRSA], n))

proc `%`*(x: JobType): JsonNode = %($x)
proc parse*(_: typedesc[JobType], n: JsonNode): JobType =
  let s = n.getStr
  case s
  of "commit": JobType.Commit
  of "stream": JobType.Stream
  of "mirror": JobType.Mirror
  of "backup": JobType.Backup
  of "create": JobType.Create
  of "amend": JobType.Amend
  of "snapshot-load": JobType.SnapshotLoad
  of "snapshot-save": JobType.SnapshotSave
  of "snapshot-delete": JobType.SnapshotDelete
  else: raise newException(ValueError, "unknown JobType: " & s)

proc `%`*(x: JobStatus): JsonNode = %($x)
proc parse*(_: typedesc[JobStatus], n: JsonNode): JobStatus =
  let s = n.getStr
  case s
  of "undefined": JobStatus.Undefined
  of "created": JobStatus.Created
  of "running": JobStatus.Running
  of "paused": JobStatus.Paused
  of "ready": JobStatus.Ready
  of "standby": JobStatus.Standby
  of "waiting": JobStatus.Waiting
  of "pending": JobStatus.Pending
  of "aborting": JobStatus.Aborting
  of "concluded": JobStatus.Concluded
  of "null": JobStatus.Null
  else: raise newException(ValueError, "unknown JobStatus: " & s)

proc `%`*(x: JobVerb): JsonNode = %($x)
proc parse*(_: typedesc[JobVerb], n: JsonNode): JobVerb =
  let s = n.getStr
  case s
  of "cancel": JobVerb.Cancel
  of "pause": JobVerb.Pause
  of "resume": JobVerb.Resume
  of "set-speed": JobVerb.SetSpeed
  of "complete": JobVerb.Complete
  of "dismiss": JobVerb.Dismiss
  of "finalize": JobVerb.Finalize
  of "change": JobVerb.Change
  else: raise newException(ValueError, "unknown JobVerb: " & s)

proc `%`*(x: JobInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %(x.`type`)
  result["status"] = %(x.status)
  result["current-progress"] = %(x.currentProgress)
  result["total-progress"] = %(x.totalProgress)
  if x.error.isSome: result["error"] = %(x.error.get)

proc parse*(_: typedesc[JobInfo], n: JsonNode): JobInfo =
  result = default(JobInfo)
  result.id = n["id"].getStr
  result.`type` = parse(typedesc[JobType], n["type"])
  result.status = parse(typedesc[JobStatus], n["status"])
  result.currentProgress = int64(n["current-progress"].getBiggestInt)
  result.totalProgress = int64(n["total-progress"].getBiggestInt)
  if n.hasKey("error") and n["error"].kind != JNull:
    result.error = some(n["error"].getStr)

proc `%`*(x: KvmInfo): JsonNode =
  result = newJObject()
  result["enabled"] = %(x.enabled)
  result["present"] = %(x.present)

proc parse*(_: typedesc[KvmInfo], n: JsonNode): KvmInfo =
  result = default(KvmInfo)
  result.enabled = n["enabled"].getBool
  result.present = n["present"].getBool

proc `%`*(x: Accelerator): JsonNode = %($x)
proc parse*(_: typedesc[Accelerator], n: JsonNode): Accelerator =
  let s = n.getStr
  case s
  of "hvf": Accelerator.Hvf
  of "kvm": Accelerator.Kvm
  of "mshv": Accelerator.Mshv
  of "nvmm": Accelerator.Nvmm
  of "qtest": Accelerator.Qtest
  of "tcg": Accelerator.Tcg
  of "whpx": Accelerator.Whpx
  of "xen": Accelerator.Xen
  else: raise newException(ValueError, "unknown Accelerator: " & s)

proc `%`*(x: AcceleratorInfo): JsonNode =
  result = newJObject()
  result["enabled"] = %(x.enabled)
  result["present"] = %(x.present)

proc parse*(_: typedesc[AcceleratorInfo], n: JsonNode): AcceleratorInfo =
  result = default(AcceleratorInfo)
  result.enabled = parse(typedesc[Accelerator], n["enabled"])
  result.present = (n["present"]).getElems.mapIt(parse(typedesc[Accelerator], it))

proc `%`*(x: SnapshotInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["name"] = %(x.name)
  result["vm-state-size"] = %(x.vmStateSize)
  result["date-sec"] = %(x.dateSec)
  result["date-nsec"] = %(x.dateNsec)
  result["vm-clock-sec"] = %(x.vmClockSec)
  result["vm-clock-nsec"] = %(x.vmClockNsec)
  if x.icount.isSome: result["icount"] = %(x.icount.get)

proc parse*(_: typedesc[SnapshotInfo], n: JsonNode): SnapshotInfo =
  result = default(SnapshotInfo)
  result.id = n["id"].getStr
  result.name = n["name"].getStr
  result.vmStateSize = int64(n["vm-state-size"].getBiggestInt)
  result.dateSec = int64(n["date-sec"].getBiggestInt)
  result.dateNsec = int64(n["date-nsec"].getBiggestInt)
  result.vmClockSec = int64(n["vm-clock-sec"].getBiggestInt)
  result.vmClockNsec = int64(n["vm-clock-nsec"].getBiggestInt)
  if n.hasKey("icount") and n["icount"].kind != JNull:
    result.icount = some(int64(n["icount"].getBiggestInt))

proc `%`*(x: ImageInfoSpecificQCow2EncryptionBase): JsonNode =
  result = newJObject()
  result["format"] = %(x.format)

proc parse*(_: typedesc[ImageInfoSpecificQCow2EncryptionBase], n: JsonNode): ImageInfoSpecificQCow2EncryptionBase =
  result = default(ImageInfoSpecificQCow2EncryptionBase)
  result.format = parse(typedesc[BlockdevQcow2EncryptionFormat], n["format"])

proc `%`*(x: ImageInfoSpecificQCow2Encryption): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of BlockdevQcow2EncryptionFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevQcow2EncryptionFormat.Aes: discard

proc parse*(_: typedesc[ImageInfoSpecificQCow2Encryption], n: JsonNode): ImageInfoSpecificQCow2Encryption =
  result = default(ImageInfoSpecificQCow2Encryption)
  let tag = parse(typedesc[BlockdevQcow2EncryptionFormat], n["format"])
  case tag
  of BlockdevQcow2EncryptionFormat.Luks:
    result = ImageInfoSpecificQCow2Encryption(format: tag, luks: parse(typedesc[QCryptoBlockInfoLUKS], n))
  of BlockdevQcow2EncryptionFormat.Aes:
    result = ImageInfoSpecificQCow2Encryption(format: tag)

proc `%`*(x: ImageInfoSpecificQCow2): JsonNode =
  result = newJObject()
  result["compat"] = %(x.compat)
  if x.dataFile.isSome: result["data-file"] = %(x.dataFile.get)
  if x.dataFileRaw.isSome: result["data-file-raw"] = %(x.dataFileRaw.get)
  if x.extendedL2.isSome: result["extended-l2"] = %(x.extendedL2.get)
  if x.lazyRefcounts.isSome: result["lazy-refcounts"] = %(x.lazyRefcounts.get)
  if x.corrupt.isSome: result["corrupt"] = %(x.corrupt.get)
  result["refcount-bits"] = %(x.refcountBits)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)
  if x.bitmaps.isSome: result["bitmaps"] = %(x.bitmaps.get)
  result["compression-type"] = %(x.compressionType)

proc parse*(_: typedesc[ImageInfoSpecificQCow2], n: JsonNode): ImageInfoSpecificQCow2 =
  result = default(ImageInfoSpecificQCow2)
  result.compat = n["compat"].getStr
  if n.hasKey("data-file") and n["data-file"].kind != JNull:
    result.dataFile = some(n["data-file"].getStr)
  if n.hasKey("data-file-raw") and n["data-file-raw"].kind != JNull:
    result.dataFileRaw = some(n["data-file-raw"].getBool)
  if n.hasKey("extended-l2") and n["extended-l2"].kind != JNull:
    result.extendedL2 = some(n["extended-l2"].getBool)
  if n.hasKey("lazy-refcounts") and n["lazy-refcounts"].kind != JNull:
    result.lazyRefcounts = some(n["lazy-refcounts"].getBool)
  if n.hasKey("corrupt") and n["corrupt"].kind != JNull:
    result.corrupt = some(n["corrupt"].getBool)
  result.refcountBits = int64(n["refcount-bits"].getBiggestInt)
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[ImageInfoSpecificQCow2Encryption], n["encrypt"]))
  if n.hasKey("bitmaps") and n["bitmaps"].kind != JNull:
    result.bitmaps = some((n["bitmaps"]).getElems.mapIt(parse(typedesc[Qcow2BitmapInfo], it)))
  result.compressionType = parse(typedesc[Qcow2CompressionType], n["compression-type"])

proc `%`*(x: ImageInfoSpecificVmdk): JsonNode =
  result = newJObject()
  result["create-type"] = %(x.createType)
  result["cid"] = %(x.cid)
  result["parent-cid"] = %(x.parentCid)
  result["extents"] = %(x.extents)

proc parse*(_: typedesc[ImageInfoSpecificVmdk], n: JsonNode): ImageInfoSpecificVmdk =
  result = default(ImageInfoSpecificVmdk)
  result.createType = n["create-type"].getStr
  result.cid = int64(n["cid"].getBiggestInt)
  result.parentCid = int64(n["parent-cid"].getBiggestInt)
  result.extents = (n["extents"]).getElems.mapIt(parse(typedesc[VmdkExtentInfo], it))

proc `%`*(x: VmdkExtentInfo): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  result["format"] = %(x.format)
  result["virtual-size"] = %(x.virtualSize)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.compressed.isSome: result["compressed"] = %(x.compressed.get)

proc parse*(_: typedesc[VmdkExtentInfo], n: JsonNode): VmdkExtentInfo =
  result = default(VmdkExtentInfo)
  result.filename = n["filename"].getStr
  result.format = n["format"].getStr
  result.virtualSize = int64(n["virtual-size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(int64(n["cluster-size"].getBiggestInt))
  if n.hasKey("compressed") and n["compressed"].kind != JNull:
    result.compressed = some(n["compressed"].getBool)

proc `%`*(x: ImageInfoSpecificRbd): JsonNode =
  result = newJObject()
  if x.encryptionFormat.isSome: result["encryption-format"] = %(x.encryptionFormat.get)

proc parse*(_: typedesc[ImageInfoSpecificRbd], n: JsonNode): ImageInfoSpecificRbd =
  result = default(ImageInfoSpecificRbd)
  if n.hasKey("encryption-format") and n["encryption-format"].kind != JNull:
    result.encryptionFormat = some(parse(typedesc[RbdImageEncryptionFormat], n["encryption-format"]))

proc `%`*(x: ImageInfoSpecificFile): JsonNode =
  result = newJObject()
  if x.extentSizeHint.isSome: result["extent-size-hint"] = %(x.extentSizeHint.get)

proc parse*(_: typedesc[ImageInfoSpecificFile], n: JsonNode): ImageInfoSpecificFile =
  result = default(ImageInfoSpecificFile)
  if n.hasKey("extent-size-hint") and n["extent-size-hint"].kind != JNull:
    result.extentSizeHint = some(cast[uint64](n["extent-size-hint"].getBiggestInt))

proc `%`*(x: ImageInfoSpecificKind): JsonNode = %($x)
proc parse*(_: typedesc[ImageInfoSpecificKind], n: JsonNode): ImageInfoSpecificKind =
  let s = n.getStr
  case s
  of "qcow2": ImageInfoSpecificKind.Qcow2
  of "vmdk": ImageInfoSpecificKind.Vmdk
  of "luks": ImageInfoSpecificKind.Luks
  of "rbd": ImageInfoSpecificKind.Rbd
  of "file": ImageInfoSpecificKind.File
  else: raise newException(ValueError, "unknown ImageInfoSpecificKind: " & s)

proc `%`*(x: ImageInfoSpecificQCow2Wrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ImageInfoSpecificQCow2Wrapper], n: JsonNode): ImageInfoSpecificQCow2Wrapper =
  result = default(ImageInfoSpecificQCow2Wrapper)
  result.data = parse(typedesc[ImageInfoSpecificQCow2], n["data"])

proc `%`*(x: ImageInfoSpecificVmdkWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ImageInfoSpecificVmdkWrapper], n: JsonNode): ImageInfoSpecificVmdkWrapper =
  result = default(ImageInfoSpecificVmdkWrapper)
  result.data = parse(typedesc[ImageInfoSpecificVmdk], n["data"])

proc `%`*(x: ImageInfoSpecificLUKSWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ImageInfoSpecificLUKSWrapper], n: JsonNode): ImageInfoSpecificLUKSWrapper =
  result = default(ImageInfoSpecificLUKSWrapper)
  result.data = parse(typedesc[QCryptoBlockInfoLUKS], n["data"])

proc `%`*(x: ImageInfoSpecificRbdWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ImageInfoSpecificRbdWrapper], n: JsonNode): ImageInfoSpecificRbdWrapper =
  result = default(ImageInfoSpecificRbdWrapper)
  result.data = parse(typedesc[ImageInfoSpecificRbd], n["data"])

proc `%`*(x: ImageInfoSpecificFileWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ImageInfoSpecificFileWrapper], n: JsonNode): ImageInfoSpecificFileWrapper =
  result = default(ImageInfoSpecificFileWrapper)
  result.data = parse(typedesc[ImageInfoSpecificFile], n["data"])

proc `%`*(x: ImageInfoSpecific): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of ImageInfoSpecificKind.Qcow2:
    let sub = %(x.qcow2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ImageInfoSpecificKind.Vmdk:
    let sub = %(x.vmdk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ImageInfoSpecificKind.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ImageInfoSpecificKind.Rbd:
    let sub = %(x.rbd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ImageInfoSpecificKind.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[ImageInfoSpecific], n: JsonNode): ImageInfoSpecific =
  result = default(ImageInfoSpecific)
  let tag = parse(typedesc[ImageInfoSpecificKind], n["type"])
  case tag
  of ImageInfoSpecificKind.Qcow2:
    result = ImageInfoSpecific(`type`: tag, qcow2: parse(typedesc[ImageInfoSpecificQCow2Wrapper], n))
  of ImageInfoSpecificKind.Vmdk:
    result = ImageInfoSpecific(`type`: tag, vmdk: parse(typedesc[ImageInfoSpecificVmdkWrapper], n))
  of ImageInfoSpecificKind.Luks:
    result = ImageInfoSpecific(`type`: tag, luks: parse(typedesc[ImageInfoSpecificLUKSWrapper], n))
  of ImageInfoSpecificKind.Rbd:
    result = ImageInfoSpecific(`type`: tag, rbd: parse(typedesc[ImageInfoSpecificRbdWrapper], n))
  of ImageInfoSpecificKind.File:
    result = ImageInfoSpecific(`type`: tag, file: parse(typedesc[ImageInfoSpecificFileWrapper], n))

proc `%`*(x: BlockLimitsInfo): JsonNode =
  result = newJObject()
  result["request-alignment"] = %(x.requestAlignment)
  if x.maxDiscard.isSome: result["max-discard"] = %(x.maxDiscard.get)
  if x.discardAlignment.isSome: result["discard-alignment"] = %(x.discardAlignment.get)
  if x.maxWriteZeroes.isSome: result["max-write-zeroes"] = %(x.maxWriteZeroes.get)
  if x.writeZeroesAlignment.isSome: result["write-zeroes-alignment"] = %(x.writeZeroesAlignment.get)
  if x.optTransfer.isSome: result["opt-transfer"] = %(x.optTransfer.get)
  if x.maxTransfer.isSome: result["max-transfer"] = %(x.maxTransfer.get)
  if x.maxHwTransfer.isSome: result["max-hw-transfer"] = %(x.maxHwTransfer.get)
  result["max-iov"] = %(x.maxIov)
  if x.maxHwIov.isSome: result["max-hw-iov"] = %(x.maxHwIov.get)
  result["min-mem-alignment"] = %(x.minMemAlignment)
  result["opt-mem-alignment"] = %(x.optMemAlignment)

proc parse*(_: typedesc[BlockLimitsInfo], n: JsonNode): BlockLimitsInfo =
  result = default(BlockLimitsInfo)
  result.requestAlignment = uint32(n["request-alignment"].getBiggestInt)
  if n.hasKey("max-discard") and n["max-discard"].kind != JNull:
    result.maxDiscard = some(cast[uint64](n["max-discard"].getBiggestInt))
  if n.hasKey("discard-alignment") and n["discard-alignment"].kind != JNull:
    result.discardAlignment = some(uint32(n["discard-alignment"].getBiggestInt))
  if n.hasKey("max-write-zeroes") and n["max-write-zeroes"].kind != JNull:
    result.maxWriteZeroes = some(cast[uint64](n["max-write-zeroes"].getBiggestInt))
  if n.hasKey("write-zeroes-alignment") and n["write-zeroes-alignment"].kind != JNull:
    result.writeZeroesAlignment = some(uint32(n["write-zeroes-alignment"].getBiggestInt))
  if n.hasKey("opt-transfer") and n["opt-transfer"].kind != JNull:
    result.optTransfer = some(uint32(n["opt-transfer"].getBiggestInt))
  if n.hasKey("max-transfer") and n["max-transfer"].kind != JNull:
    result.maxTransfer = some(uint32(n["max-transfer"].getBiggestInt))
  if n.hasKey("max-hw-transfer") and n["max-hw-transfer"].kind != JNull:
    result.maxHwTransfer = some(uint32(n["max-hw-transfer"].getBiggestInt))
  result.maxIov = int64(n["max-iov"].getBiggestInt)
  if n.hasKey("max-hw-iov") and n["max-hw-iov"].kind != JNull:
    result.maxHwIov = some(int64(n["max-hw-iov"].getBiggestInt))
  result.minMemAlignment = cast[uint64](n["min-mem-alignment"].getBiggestInt)
  result.optMemAlignment = cast[uint64](n["opt-mem-alignment"].getBiggestInt)

proc `%`*(x: BlockNodeInfo): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  result["format"] = %(x.format)
  if x.dirtyFlag.isSome: result["dirty-flag"] = %(x.dirtyFlag.get)
  if x.actualSize.isSome: result["actual-size"] = %(x.actualSize.get)
  result["virtual-size"] = %(x.virtualSize)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.encrypted.isSome: result["encrypted"] = %(x.encrypted.get)
  if x.compressed.isSome: result["compressed"] = %(x.compressed.get)
  if x.backingFilename.isSome: result["backing-filename"] = %(x.backingFilename.get)
  if x.fullBackingFilename.isSome: result["full-backing-filename"] = %(x.fullBackingFilename.get)
  if x.backingFilenameFormat.isSome: result["backing-filename-format"] = %(x.backingFilenameFormat.get)
  if x.snapshots.isSome: result["snapshots"] = %(x.snapshots.get)
  if x.limits.isSome: result["limits"] = %(x.limits.get)
  if x.formatSpecific.isSome: result["format-specific"] = %(x.formatSpecific.get)

proc parse*(_: typedesc[BlockNodeInfo], n: JsonNode): BlockNodeInfo =
  result = default(BlockNodeInfo)
  result.filename = n["filename"].getStr
  result.format = n["format"].getStr
  if n.hasKey("dirty-flag") and n["dirty-flag"].kind != JNull:
    result.dirtyFlag = some(n["dirty-flag"].getBool)
  if n.hasKey("actual-size") and n["actual-size"].kind != JNull:
    result.actualSize = some(int64(n["actual-size"].getBiggestInt))
  result.virtualSize = int64(n["virtual-size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(int64(n["cluster-size"].getBiggestInt))
  if n.hasKey("encrypted") and n["encrypted"].kind != JNull:
    result.encrypted = some(n["encrypted"].getBool)
  if n.hasKey("compressed") and n["compressed"].kind != JNull:
    result.compressed = some(n["compressed"].getBool)
  if n.hasKey("backing-filename") and n["backing-filename"].kind != JNull:
    result.backingFilename = some(n["backing-filename"].getStr)
  if n.hasKey("full-backing-filename") and n["full-backing-filename"].kind != JNull:
    result.fullBackingFilename = some(n["full-backing-filename"].getStr)
  if n.hasKey("backing-filename-format") and n["backing-filename-format"].kind != JNull:
    result.backingFilenameFormat = some(n["backing-filename-format"].getStr)
  if n.hasKey("snapshots") and n["snapshots"].kind != JNull:
    result.snapshots = some((n["snapshots"]).getElems.mapIt(parse(typedesc[SnapshotInfo], it)))
  if n.hasKey("limits") and n["limits"].kind != JNull:
    result.limits = some(parse(typedesc[BlockLimitsInfo], n["limits"]))
  if n.hasKey("format-specific") and n["format-specific"].kind != JNull:
    result.formatSpecific = some(parse(typedesc[ImageInfoSpecific], n["format-specific"]))

proc `%`*(x: ImageInfo): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["filename"] = %(x.filename)
  result["format"] = %(x.format)
  if x.dirtyFlag.isSome: result["dirty-flag"] = %(x.dirtyFlag.get)
  if x.actualSize.isSome: result["actual-size"] = %(x.actualSize.get)
  result["virtual-size"] = %(x.virtualSize)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.encrypted.isSome: result["encrypted"] = %(x.encrypted.get)
  if x.compressed.isSome: result["compressed"] = %(x.compressed.get)
  if x.backingFilename.isSome: result["backing-filename"] = %(x.backingFilename.get)
  if x.fullBackingFilename.isSome: result["full-backing-filename"] = %(x.fullBackingFilename.get)
  if x.backingFilenameFormat.isSome: result["backing-filename-format"] = %(x.backingFilenameFormat.get)
  if x.snapshots.isSome: result["snapshots"] = %(x.snapshots.get)
  if x.limits.isSome: result["limits"] = %(x.limits.get)
  if x.formatSpecific.isSome: result["format-specific"] = %(x.formatSpecific.get)
  if x.backingImage.isSome: result["backing-image"] = %(x.backingImage.get)

proc parse*(_: typedesc[ImageInfo], n: JsonNode): ImageInfo =
  if n.kind == JNull: return nil
  new(result)
  result.filename = n["filename"].getStr
  result.format = n["format"].getStr
  if n.hasKey("dirty-flag") and n["dirty-flag"].kind != JNull:
    result.dirtyFlag = some(n["dirty-flag"].getBool)
  if n.hasKey("actual-size") and n["actual-size"].kind != JNull:
    result.actualSize = some(int64(n["actual-size"].getBiggestInt))
  result.virtualSize = int64(n["virtual-size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(int64(n["cluster-size"].getBiggestInt))
  if n.hasKey("encrypted") and n["encrypted"].kind != JNull:
    result.encrypted = some(n["encrypted"].getBool)
  if n.hasKey("compressed") and n["compressed"].kind != JNull:
    result.compressed = some(n["compressed"].getBool)
  if n.hasKey("backing-filename") and n["backing-filename"].kind != JNull:
    result.backingFilename = some(n["backing-filename"].getStr)
  if n.hasKey("full-backing-filename") and n["full-backing-filename"].kind != JNull:
    result.fullBackingFilename = some(n["full-backing-filename"].getStr)
  if n.hasKey("backing-filename-format") and n["backing-filename-format"].kind != JNull:
    result.backingFilenameFormat = some(n["backing-filename-format"].getStr)
  if n.hasKey("snapshots") and n["snapshots"].kind != JNull:
    result.snapshots = some((n["snapshots"]).getElems.mapIt(parse(typedesc[SnapshotInfo], it)))
  if n.hasKey("limits") and n["limits"].kind != JNull:
    result.limits = some(parse(typedesc[BlockLimitsInfo], n["limits"]))
  if n.hasKey("format-specific") and n["format-specific"].kind != JNull:
    result.formatSpecific = some(parse(typedesc[ImageInfoSpecific], n["format-specific"]))
  if n.hasKey("backing-image") and n["backing-image"].kind != JNull:
    result.backingImage = some(parse(typedesc[ImageInfo], n["backing-image"]))

proc `%`*(x: BlockChildInfo): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["name"] = %(x.name)
  result["info"] = %(x.info)

proc parse*(_: typedesc[BlockChildInfo], n: JsonNode): BlockChildInfo =
  if n.kind == JNull: return nil
  new(result)
  result.name = n["name"].getStr
  result.info = parse(typedesc[BlockGraphInfo], n["info"])

proc `%`*(x: BlockGraphInfo): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["filename"] = %(x.filename)
  result["format"] = %(x.format)
  if x.dirtyFlag.isSome: result["dirty-flag"] = %(x.dirtyFlag.get)
  if x.actualSize.isSome: result["actual-size"] = %(x.actualSize.get)
  result["virtual-size"] = %(x.virtualSize)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.encrypted.isSome: result["encrypted"] = %(x.encrypted.get)
  if x.compressed.isSome: result["compressed"] = %(x.compressed.get)
  if x.backingFilename.isSome: result["backing-filename"] = %(x.backingFilename.get)
  if x.fullBackingFilename.isSome: result["full-backing-filename"] = %(x.fullBackingFilename.get)
  if x.backingFilenameFormat.isSome: result["backing-filename-format"] = %(x.backingFilenameFormat.get)
  if x.snapshots.isSome: result["snapshots"] = %(x.snapshots.get)
  if x.limits.isSome: result["limits"] = %(x.limits.get)
  if x.formatSpecific.isSome: result["format-specific"] = %(x.formatSpecific.get)
  result["children"] = %(x.children)

proc parse*(_: typedesc[BlockGraphInfo], n: JsonNode): BlockGraphInfo =
  if n.kind == JNull: return nil
  new(result)
  result.filename = n["filename"].getStr
  result.format = n["format"].getStr
  if n.hasKey("dirty-flag") and n["dirty-flag"].kind != JNull:
    result.dirtyFlag = some(n["dirty-flag"].getBool)
  if n.hasKey("actual-size") and n["actual-size"].kind != JNull:
    result.actualSize = some(int64(n["actual-size"].getBiggestInt))
  result.virtualSize = int64(n["virtual-size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(int64(n["cluster-size"].getBiggestInt))
  if n.hasKey("encrypted") and n["encrypted"].kind != JNull:
    result.encrypted = some(n["encrypted"].getBool)
  if n.hasKey("compressed") and n["compressed"].kind != JNull:
    result.compressed = some(n["compressed"].getBool)
  if n.hasKey("backing-filename") and n["backing-filename"].kind != JNull:
    result.backingFilename = some(n["backing-filename"].getStr)
  if n.hasKey("full-backing-filename") and n["full-backing-filename"].kind != JNull:
    result.fullBackingFilename = some(n["full-backing-filename"].getStr)
  if n.hasKey("backing-filename-format") and n["backing-filename-format"].kind != JNull:
    result.backingFilenameFormat = some(n["backing-filename-format"].getStr)
  if n.hasKey("snapshots") and n["snapshots"].kind != JNull:
    result.snapshots = some((n["snapshots"]).getElems.mapIt(parse(typedesc[SnapshotInfo], it)))
  if n.hasKey("limits") and n["limits"].kind != JNull:
    result.limits = some(parse(typedesc[BlockLimitsInfo], n["limits"]))
  if n.hasKey("format-specific") and n["format-specific"].kind != JNull:
    result.formatSpecific = some(parse(typedesc[ImageInfoSpecific], n["format-specific"]))
  result.children = (n["children"]).getElems.mapIt(parse(typedesc[BlockChildInfo], it))

proc `%`*(x: ImageCheck): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  result["format"] = %(x.format)
  result["check-errors"] = %(x.checkErrors)
  if x.imageEndOffset.isSome: result["image-end-offset"] = %(x.imageEndOffset.get)
  if x.corruptions.isSome: result["corruptions"] = %(x.corruptions.get)
  if x.leaks.isSome: result["leaks"] = %(x.leaks.get)
  if x.corruptionsFixed.isSome: result["corruptions-fixed"] = %(x.corruptionsFixed.get)
  if x.leaksFixed.isSome: result["leaks-fixed"] = %(x.leaksFixed.get)
  if x.totalClusters.isSome: result["total-clusters"] = %(x.totalClusters.get)
  if x.allocatedClusters.isSome: result["allocated-clusters"] = %(x.allocatedClusters.get)
  if x.fragmentedClusters.isSome: result["fragmented-clusters"] = %(x.fragmentedClusters.get)
  if x.compressedClusters.isSome: result["compressed-clusters"] = %(x.compressedClusters.get)

proc parse*(_: typedesc[ImageCheck], n: JsonNode): ImageCheck =
  result = default(ImageCheck)
  result.filename = n["filename"].getStr
  result.format = n["format"].getStr
  result.checkErrors = int64(n["check-errors"].getBiggestInt)
  if n.hasKey("image-end-offset") and n["image-end-offset"].kind != JNull:
    result.imageEndOffset = some(int64(n["image-end-offset"].getBiggestInt))
  if n.hasKey("corruptions") and n["corruptions"].kind != JNull:
    result.corruptions = some(int64(n["corruptions"].getBiggestInt))
  if n.hasKey("leaks") and n["leaks"].kind != JNull:
    result.leaks = some(int64(n["leaks"].getBiggestInt))
  if n.hasKey("corruptions-fixed") and n["corruptions-fixed"].kind != JNull:
    result.corruptionsFixed = some(int64(n["corruptions-fixed"].getBiggestInt))
  if n.hasKey("leaks-fixed") and n["leaks-fixed"].kind != JNull:
    result.leaksFixed = some(int64(n["leaks-fixed"].getBiggestInt))
  if n.hasKey("total-clusters") and n["total-clusters"].kind != JNull:
    result.totalClusters = some(int64(n["total-clusters"].getBiggestInt))
  if n.hasKey("allocated-clusters") and n["allocated-clusters"].kind != JNull:
    result.allocatedClusters = some(int64(n["allocated-clusters"].getBiggestInt))
  if n.hasKey("fragmented-clusters") and n["fragmented-clusters"].kind != JNull:
    result.fragmentedClusters = some(int64(n["fragmented-clusters"].getBiggestInt))
  if n.hasKey("compressed-clusters") and n["compressed-clusters"].kind != JNull:
    result.compressedClusters = some(int64(n["compressed-clusters"].getBiggestInt))

proc `%`*(x: MapEntry): JsonNode =
  result = newJObject()
  result["start"] = %(x.start)
  result["length"] = %(x.length)
  result["data"] = %(x.data)
  result["zero"] = %(x.zero)
  result["compressed"] = %(x.compressed)
  result["depth"] = %(x.depth)
  result["present"] = %(x.present)
  if x.offset.isSome: result["offset"] = %(x.offset.get)
  if x.filename.isSome: result["filename"] = %(x.filename.get)

proc parse*(_: typedesc[MapEntry], n: JsonNode): MapEntry =
  result = default(MapEntry)
  result.start = int64(n["start"].getBiggestInt)
  result.length = int64(n["length"].getBiggestInt)
  result.data = n["data"].getBool
  result.zero = n["zero"].getBool
  result.compressed = n["compressed"].getBool
  result.depth = int64(n["depth"].getBiggestInt)
  result.present = n["present"].getBool
  if n.hasKey("offset") and n["offset"].kind != JNull:
    result.offset = some(int64(n["offset"].getBiggestInt))
  if n.hasKey("filename") and n["filename"].kind != JNull:
    result.filename = some(n["filename"].getStr)

proc `%`*(x: BlockdevCacheInfo): JsonNode =
  result = newJObject()
  result["writeback"] = %(x.writeback)
  result["direct"] = %(x.direct)
  result["no-flush"] = %(x.noFlush)

proc parse*(_: typedesc[BlockdevCacheInfo], n: JsonNode): BlockdevCacheInfo =
  result = default(BlockdevCacheInfo)
  result.writeback = n["writeback"].getBool
  result.direct = n["direct"].getBool
  result.noFlush = n["no-flush"].getBool

proc `%`*(x: BlockdevChild): JsonNode =
  result = newJObject()
  result["child"] = %(x.child)
  result["node-name"] = %(x.nodeName)

proc parse*(_: typedesc[BlockdevChild], n: JsonNode): BlockdevChild =
  result = default(BlockdevChild)
  result.child = n["child"].getStr
  result.nodeName = n["node-name"].getStr

proc `%`*(x: BlockDeviceInfo): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["node-name"] = %(x.nodeName)
  result["ro"] = %(x.ro)
  result["drv"] = %(x.drv)
  if x.backingFile.isSome: result["backing_file"] = %(x.backingFile.get)
  result["backing_file_depth"] = %(x.backingFileDepth)
  result["children"] = %(x.children)
  result["active"] = %(x.active)
  result["encrypted"] = %(x.encrypted)
  result["detect_zeroes"] = %(x.detectZeroes)
  result["bps"] = %(x.bps)
  result["bps_rd"] = %(x.bpsRd)
  result["bps_wr"] = %(x.bpsWr)
  result["iops"] = %(x.iops)
  result["iops_rd"] = %(x.iopsRd)
  result["iops_wr"] = %(x.iopsWr)
  result["image"] = %(x.image)
  if x.bpsMax.isSome: result["bps_max"] = %(x.bpsMax.get)
  if x.bpsRdMax.isSome: result["bps_rd_max"] = %(x.bpsRdMax.get)
  if x.bpsWrMax.isSome: result["bps_wr_max"] = %(x.bpsWrMax.get)
  if x.iopsMax.isSome: result["iops_max"] = %(x.iopsMax.get)
  if x.iopsRdMax.isSome: result["iops_rd_max"] = %(x.iopsRdMax.get)
  if x.iopsWrMax.isSome: result["iops_wr_max"] = %(x.iopsWrMax.get)
  if x.bpsMaxLength.isSome: result["bps_max_length"] = %(x.bpsMaxLength.get)
  if x.bpsRdMaxLength.isSome: result["bps_rd_max_length"] = %(x.bpsRdMaxLength.get)
  if x.bpsWrMaxLength.isSome: result["bps_wr_max_length"] = %(x.bpsWrMaxLength.get)
  if x.iopsMaxLength.isSome: result["iops_max_length"] = %(x.iopsMaxLength.get)
  if x.iopsRdMaxLength.isSome: result["iops_rd_max_length"] = %(x.iopsRdMaxLength.get)
  if x.iopsWrMaxLength.isSome: result["iops_wr_max_length"] = %(x.iopsWrMaxLength.get)
  if x.iopsSize.isSome: result["iops_size"] = %(x.iopsSize.get)
  if x.group.isSome: result["group"] = %(x.group.get)
  result["cache"] = %(x.cache)
  result["write_threshold"] = %(x.writeThreshold)
  if x.dirtyBitmaps.isSome: result["dirty-bitmaps"] = %(x.dirtyBitmaps.get)

proc parse*(_: typedesc[BlockDeviceInfo], n: JsonNode): BlockDeviceInfo =
  result = default(BlockDeviceInfo)
  result.file = n["file"].getStr
  result.nodeName = n["node-name"].getStr
  result.ro = n["ro"].getBool
  result.drv = n["drv"].getStr
  if n.hasKey("backing_file") and n["backing_file"].kind != JNull:
    result.backingFile = some(n["backing_file"].getStr)
  result.backingFileDepth = int64(n["backing_file_depth"].getBiggestInt)
  result.children = (n["children"]).getElems.mapIt(parse(typedesc[BlockdevChild], it))
  result.active = n["active"].getBool
  result.encrypted = n["encrypted"].getBool
  result.detectZeroes = parse(typedesc[BlockdevDetectZeroesOptions], n["detect_zeroes"])
  result.bps = int64(n["bps"].getBiggestInt)
  result.bpsRd = int64(n["bps_rd"].getBiggestInt)
  result.bpsWr = int64(n["bps_wr"].getBiggestInt)
  result.iops = int64(n["iops"].getBiggestInt)
  result.iopsRd = int64(n["iops_rd"].getBiggestInt)
  result.iopsWr = int64(n["iops_wr"].getBiggestInt)
  result.image = parse(typedesc[ImageInfo], n["image"])
  if n.hasKey("bps_max") and n["bps_max"].kind != JNull:
    result.bpsMax = some(int64(n["bps_max"].getBiggestInt))
  if n.hasKey("bps_rd_max") and n["bps_rd_max"].kind != JNull:
    result.bpsRdMax = some(int64(n["bps_rd_max"].getBiggestInt))
  if n.hasKey("bps_wr_max") and n["bps_wr_max"].kind != JNull:
    result.bpsWrMax = some(int64(n["bps_wr_max"].getBiggestInt))
  if n.hasKey("iops_max") and n["iops_max"].kind != JNull:
    result.iopsMax = some(int64(n["iops_max"].getBiggestInt))
  if n.hasKey("iops_rd_max") and n["iops_rd_max"].kind != JNull:
    result.iopsRdMax = some(int64(n["iops_rd_max"].getBiggestInt))
  if n.hasKey("iops_wr_max") and n["iops_wr_max"].kind != JNull:
    result.iopsWrMax = some(int64(n["iops_wr_max"].getBiggestInt))
  if n.hasKey("bps_max_length") and n["bps_max_length"].kind != JNull:
    result.bpsMaxLength = some(int64(n["bps_max_length"].getBiggestInt))
  if n.hasKey("bps_rd_max_length") and n["bps_rd_max_length"].kind != JNull:
    result.bpsRdMaxLength = some(int64(n["bps_rd_max_length"].getBiggestInt))
  if n.hasKey("bps_wr_max_length") and n["bps_wr_max_length"].kind != JNull:
    result.bpsWrMaxLength = some(int64(n["bps_wr_max_length"].getBiggestInt))
  if n.hasKey("iops_max_length") and n["iops_max_length"].kind != JNull:
    result.iopsMaxLength = some(int64(n["iops_max_length"].getBiggestInt))
  if n.hasKey("iops_rd_max_length") and n["iops_rd_max_length"].kind != JNull:
    result.iopsRdMaxLength = some(int64(n["iops_rd_max_length"].getBiggestInt))
  if n.hasKey("iops_wr_max_length") and n["iops_wr_max_length"].kind != JNull:
    result.iopsWrMaxLength = some(int64(n["iops_wr_max_length"].getBiggestInt))
  if n.hasKey("iops_size") and n["iops_size"].kind != JNull:
    result.iopsSize = some(int64(n["iops_size"].getBiggestInt))
  if n.hasKey("group") and n["group"].kind != JNull:
    result.group = some(n["group"].getStr)
  result.cache = parse(typedesc[BlockdevCacheInfo], n["cache"])
  result.writeThreshold = int64(n["write_threshold"].getBiggestInt)
  if n.hasKey("dirty-bitmaps") and n["dirty-bitmaps"].kind != JNull:
    result.dirtyBitmaps = some((n["dirty-bitmaps"]).getElems.mapIt(parse(typedesc[BlockDirtyInfo], it)))

proc `%`*(x: BlockDeviceIoStatus): JsonNode = %($x)
proc parse*(_: typedesc[BlockDeviceIoStatus], n: JsonNode): BlockDeviceIoStatus =
  let s = n.getStr
  case s
  of "ok": BlockDeviceIoStatus.Ok
  of "failed": BlockDeviceIoStatus.Failed
  of "nospace": BlockDeviceIoStatus.Nospace
  else: raise newException(ValueError, "unknown BlockDeviceIoStatus: " & s)

proc `%`*(x: BlockDirtyInfo): JsonNode =
  result = newJObject()
  if x.name.isSome: result["name"] = %(x.name.get)
  result["count"] = %(x.count)
  result["granularity"] = %(x.granularity)
  result["recording"] = %(x.recording)
  result["busy"] = %(x.busy)
  result["persistent"] = %(x.persistent)
  if x.inconsistent.isSome: result["inconsistent"] = %(x.inconsistent.get)

proc parse*(_: typedesc[BlockDirtyInfo], n: JsonNode): BlockDirtyInfo =
  result = default(BlockDirtyInfo)
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  result.count = int64(n["count"].getBiggestInt)
  result.granularity = uint32(n["granularity"].getBiggestInt)
  result.recording = n["recording"].getBool
  result.busy = n["busy"].getBool
  result.persistent = n["persistent"].getBool
  if n.hasKey("inconsistent") and n["inconsistent"].kind != JNull:
    result.inconsistent = some(n["inconsistent"].getBool)

proc `%`*(x: Qcow2BitmapInfoFlags): JsonNode = %($x)
proc parse*(_: typedesc[Qcow2BitmapInfoFlags], n: JsonNode): Qcow2BitmapInfoFlags =
  let s = n.getStr
  case s
  of "in-use": Qcow2BitmapInfoFlags.InUse
  of "auto": Qcow2BitmapInfoFlags.Auto
  else: raise newException(ValueError, "unknown Qcow2BitmapInfoFlags: " & s)

proc `%`*(x: Qcow2BitmapInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["granularity"] = %(x.granularity)
  result["flags"] = %(x.flags)

proc parse*(_: typedesc[Qcow2BitmapInfo], n: JsonNode): Qcow2BitmapInfo =
  result = default(Qcow2BitmapInfo)
  result.name = n["name"].getStr
  result.granularity = uint32(n["granularity"].getBiggestInt)
  result.flags = (n["flags"]).getElems.mapIt(parse(typedesc[Qcow2BitmapInfoFlags], it))

proc `%`*(x: BlockLatencyHistogramInfo): JsonNode =
  result = newJObject()
  result["boundaries"] = %(x.boundaries)
  result["bins"] = %(x.bins)

proc parse*(_: typedesc[BlockLatencyHistogramInfo], n: JsonNode): BlockLatencyHistogramInfo =
  result = default(BlockLatencyHistogramInfo)
  result.boundaries = (n["boundaries"]).getElems.mapIt(cast[uint64](it.getBiggestInt))
  result.bins = (n["bins"]).getElems.mapIt(cast[uint64](it.getBiggestInt))

proc `%`*(x: BlockInfo): JsonNode =
  result = newJObject()
  result["device"] = %(x.device)
  if x.qdev.isSome: result["qdev"] = %(x.qdev.get)
  result["type"] = %(x.`type`)
  result["removable"] = %(x.removable)
  result["locked"] = %(x.locked)
  if x.inserted.isSome: result["inserted"] = %(x.inserted.get)
  if x.trayOpen.isSome: result["tray_open"] = %(x.trayOpen.get)
  if x.ioStatus.isSome: result["io-status"] = %(x.ioStatus.get)

proc parse*(_: typedesc[BlockInfo], n: JsonNode): BlockInfo =
  result = default(BlockInfo)
  result.device = n["device"].getStr
  if n.hasKey("qdev") and n["qdev"].kind != JNull:
    result.qdev = some(n["qdev"].getStr)
  result.`type` = n["type"].getStr
  result.removable = n["removable"].getBool
  result.locked = n["locked"].getBool
  if n.hasKey("inserted") and n["inserted"].kind != JNull:
    result.inserted = some(parse(typedesc[BlockDeviceInfo], n["inserted"]))
  if n.hasKey("tray_open") and n["tray_open"].kind != JNull:
    result.trayOpen = some(n["tray_open"].getBool)
  if n.hasKey("io-status") and n["io-status"].kind != JNull:
    result.ioStatus = some(parse(typedesc[BlockDeviceIoStatus], n["io-status"]))

proc `%`*(x: BlockMeasureInfo): JsonNode =
  result = newJObject()
  result["required"] = %(x.required)
  result["fully-allocated"] = %(x.fullyAllocated)
  if x.bitmaps.isSome: result["bitmaps"] = %(x.bitmaps.get)

proc parse*(_: typedesc[BlockMeasureInfo], n: JsonNode): BlockMeasureInfo =
  result = default(BlockMeasureInfo)
  result.required = int64(n["required"].getBiggestInt)
  result.fullyAllocated = int64(n["fully-allocated"].getBiggestInt)
  if n.hasKey("bitmaps") and n["bitmaps"].kind != JNull:
    result.bitmaps = some(int64(n["bitmaps"].getBiggestInt))

proc `%`*(x: BlockDeviceTimedStats): JsonNode =
  result = newJObject()
  result["interval_length"] = %(x.intervalLength)
  result["min_rd_latency_ns"] = %(x.minRdLatencyNs)
  result["max_rd_latency_ns"] = %(x.maxRdLatencyNs)
  result["avg_rd_latency_ns"] = %(x.avgRdLatencyNs)
  result["min_wr_latency_ns"] = %(x.minWrLatencyNs)
  result["max_wr_latency_ns"] = %(x.maxWrLatencyNs)
  result["avg_wr_latency_ns"] = %(x.avgWrLatencyNs)
  result["min_zone_append_latency_ns"] = %(x.minZoneAppendLatencyNs)
  result["max_zone_append_latency_ns"] = %(x.maxZoneAppendLatencyNs)
  result["avg_zone_append_latency_ns"] = %(x.avgZoneAppendLatencyNs)
  result["min_flush_latency_ns"] = %(x.minFlushLatencyNs)
  result["max_flush_latency_ns"] = %(x.maxFlushLatencyNs)
  result["avg_flush_latency_ns"] = %(x.avgFlushLatencyNs)
  result["avg_rd_queue_depth"] = %(x.avgRdQueueDepth)
  result["avg_wr_queue_depth"] = %(x.avgWrQueueDepth)
  result["avg_zone_append_queue_depth"] = %(x.avgZoneAppendQueueDepth)

proc parse*(_: typedesc[BlockDeviceTimedStats], n: JsonNode): BlockDeviceTimedStats =
  result = default(BlockDeviceTimedStats)
  result.intervalLength = int64(n["interval_length"].getBiggestInt)
  result.minRdLatencyNs = int64(n["min_rd_latency_ns"].getBiggestInt)
  result.maxRdLatencyNs = int64(n["max_rd_latency_ns"].getBiggestInt)
  result.avgRdLatencyNs = int64(n["avg_rd_latency_ns"].getBiggestInt)
  result.minWrLatencyNs = int64(n["min_wr_latency_ns"].getBiggestInt)
  result.maxWrLatencyNs = int64(n["max_wr_latency_ns"].getBiggestInt)
  result.avgWrLatencyNs = int64(n["avg_wr_latency_ns"].getBiggestInt)
  result.minZoneAppendLatencyNs = int64(n["min_zone_append_latency_ns"].getBiggestInt)
  result.maxZoneAppendLatencyNs = int64(n["max_zone_append_latency_ns"].getBiggestInt)
  result.avgZoneAppendLatencyNs = int64(n["avg_zone_append_latency_ns"].getBiggestInt)
  result.minFlushLatencyNs = int64(n["min_flush_latency_ns"].getBiggestInt)
  result.maxFlushLatencyNs = int64(n["max_flush_latency_ns"].getBiggestInt)
  result.avgFlushLatencyNs = int64(n["avg_flush_latency_ns"].getBiggestInt)
  result.avgRdQueueDepth = (if n["avg_rd_queue_depth"].kind == JInt: float64(n["avg_rd_queue_depth"].getBiggestInt) else: float64(n["avg_rd_queue_depth"].getFloat))
  result.avgWrQueueDepth = (if n["avg_wr_queue_depth"].kind == JInt: float64(n["avg_wr_queue_depth"].getBiggestInt) else: float64(n["avg_wr_queue_depth"].getFloat))
  result.avgZoneAppendQueueDepth = (if n["avg_zone_append_queue_depth"].kind == JInt: float64(n["avg_zone_append_queue_depth"].getBiggestInt) else: float64(n["avg_zone_append_queue_depth"].getFloat))

proc `%`*(x: BlockDeviceStats): JsonNode =
  result = newJObject()
  result["rd_bytes"] = %(x.rdBytes)
  result["wr_bytes"] = %(x.wrBytes)
  result["zone_append_bytes"] = %(x.zoneAppendBytes)
  result["unmap_bytes"] = %(x.unmapBytes)
  result["rd_operations"] = %(x.rdOperations)
  result["wr_operations"] = %(x.wrOperations)
  result["zone_append_operations"] = %(x.zoneAppendOperations)
  result["flush_operations"] = %(x.flushOperations)
  result["unmap_operations"] = %(x.unmapOperations)
  result["rd_total_time_ns"] = %(x.rdTotalTimeNs)
  result["wr_total_time_ns"] = %(x.wrTotalTimeNs)
  result["zone_append_total_time_ns"] = %(x.zoneAppendTotalTimeNs)
  result["flush_total_time_ns"] = %(x.flushTotalTimeNs)
  result["unmap_total_time_ns"] = %(x.unmapTotalTimeNs)
  result["wr_highest_offset"] = %(x.wrHighestOffset)
  result["rd_merged"] = %(x.rdMerged)
  result["wr_merged"] = %(x.wrMerged)
  result["zone_append_merged"] = %(x.zoneAppendMerged)
  result["unmap_merged"] = %(x.unmapMerged)
  if x.idleTimeNs.isSome: result["idle_time_ns"] = %(x.idleTimeNs.get)
  result["failed_rd_operations"] = %(x.failedRdOperations)
  result["failed_wr_operations"] = %(x.failedWrOperations)
  result["failed_zone_append_operations"] = %(x.failedZoneAppendOperations)
  result["failed_flush_operations"] = %(x.failedFlushOperations)
  result["failed_unmap_operations"] = %(x.failedUnmapOperations)
  result["invalid_rd_operations"] = %(x.invalidRdOperations)
  result["invalid_wr_operations"] = %(x.invalidWrOperations)
  result["invalid_zone_append_operations"] = %(x.invalidZoneAppendOperations)
  result["invalid_flush_operations"] = %(x.invalidFlushOperations)
  result["invalid_unmap_operations"] = %(x.invalidUnmapOperations)
  result["account_invalid"] = %(x.accountInvalid)
  result["account_failed"] = %(x.accountFailed)
  result["timed_stats"] = %(x.timedStats)
  if x.rdLatencyHistogram.isSome: result["rd_latency_histogram"] = %(x.rdLatencyHistogram.get)
  if x.wrLatencyHistogram.isSome: result["wr_latency_histogram"] = %(x.wrLatencyHistogram.get)
  if x.zoneAppendLatencyHistogram.isSome: result["zone_append_latency_histogram"] = %(x.zoneAppendLatencyHistogram.get)
  if x.flushLatencyHistogram.isSome: result["flush_latency_histogram"] = %(x.flushLatencyHistogram.get)

proc parse*(_: typedesc[BlockDeviceStats], n: JsonNode): BlockDeviceStats =
  result = default(BlockDeviceStats)
  result.rdBytes = int64(n["rd_bytes"].getBiggestInt)
  result.wrBytes = int64(n["wr_bytes"].getBiggestInt)
  result.zoneAppendBytes = int64(n["zone_append_bytes"].getBiggestInt)
  result.unmapBytes = int64(n["unmap_bytes"].getBiggestInt)
  result.rdOperations = int64(n["rd_operations"].getBiggestInt)
  result.wrOperations = int64(n["wr_operations"].getBiggestInt)
  result.zoneAppendOperations = int64(n["zone_append_operations"].getBiggestInt)
  result.flushOperations = int64(n["flush_operations"].getBiggestInt)
  result.unmapOperations = int64(n["unmap_operations"].getBiggestInt)
  result.rdTotalTimeNs = int64(n["rd_total_time_ns"].getBiggestInt)
  result.wrTotalTimeNs = int64(n["wr_total_time_ns"].getBiggestInt)
  result.zoneAppendTotalTimeNs = int64(n["zone_append_total_time_ns"].getBiggestInt)
  result.flushTotalTimeNs = int64(n["flush_total_time_ns"].getBiggestInt)
  result.unmapTotalTimeNs = int64(n["unmap_total_time_ns"].getBiggestInt)
  result.wrHighestOffset = int64(n["wr_highest_offset"].getBiggestInt)
  result.rdMerged = int64(n["rd_merged"].getBiggestInt)
  result.wrMerged = int64(n["wr_merged"].getBiggestInt)
  result.zoneAppendMerged = int64(n["zone_append_merged"].getBiggestInt)
  result.unmapMerged = int64(n["unmap_merged"].getBiggestInt)
  if n.hasKey("idle_time_ns") and n["idle_time_ns"].kind != JNull:
    result.idleTimeNs = some(int64(n["idle_time_ns"].getBiggestInt))
  result.failedRdOperations = int64(n["failed_rd_operations"].getBiggestInt)
  result.failedWrOperations = int64(n["failed_wr_operations"].getBiggestInt)
  result.failedZoneAppendOperations = int64(n["failed_zone_append_operations"].getBiggestInt)
  result.failedFlushOperations = int64(n["failed_flush_operations"].getBiggestInt)
  result.failedUnmapOperations = int64(n["failed_unmap_operations"].getBiggestInt)
  result.invalidRdOperations = int64(n["invalid_rd_operations"].getBiggestInt)
  result.invalidWrOperations = int64(n["invalid_wr_operations"].getBiggestInt)
  result.invalidZoneAppendOperations = int64(n["invalid_zone_append_operations"].getBiggestInt)
  result.invalidFlushOperations = int64(n["invalid_flush_operations"].getBiggestInt)
  result.invalidUnmapOperations = int64(n["invalid_unmap_operations"].getBiggestInt)
  result.accountInvalid = n["account_invalid"].getBool
  result.accountFailed = n["account_failed"].getBool
  result.timedStats = (n["timed_stats"]).getElems.mapIt(parse(typedesc[BlockDeviceTimedStats], it))
  if n.hasKey("rd_latency_histogram") and n["rd_latency_histogram"].kind != JNull:
    result.rdLatencyHistogram = some(parse(typedesc[BlockLatencyHistogramInfo], n["rd_latency_histogram"]))
  if n.hasKey("wr_latency_histogram") and n["wr_latency_histogram"].kind != JNull:
    result.wrLatencyHistogram = some(parse(typedesc[BlockLatencyHistogramInfo], n["wr_latency_histogram"]))
  if n.hasKey("zone_append_latency_histogram") and n["zone_append_latency_histogram"].kind != JNull:
    result.zoneAppendLatencyHistogram = some(parse(typedesc[BlockLatencyHistogramInfo], n["zone_append_latency_histogram"]))
  if n.hasKey("flush_latency_histogram") and n["flush_latency_histogram"].kind != JNull:
    result.flushLatencyHistogram = some(parse(typedesc[BlockLatencyHistogramInfo], n["flush_latency_histogram"]))

proc `%`*(x: BlockStatsSpecificFile): JsonNode =
  result = newJObject()
  result["discard-nb-ok"] = %(x.discardNbOk)
  result["discard-nb-failed"] = %(x.discardNbFailed)
  result["discard-bytes-ok"] = %(x.discardBytesOk)

proc parse*(_: typedesc[BlockStatsSpecificFile], n: JsonNode): BlockStatsSpecificFile =
  result = default(BlockStatsSpecificFile)
  result.discardNbOk = cast[uint64](n["discard-nb-ok"].getBiggestInt)
  result.discardNbFailed = cast[uint64](n["discard-nb-failed"].getBiggestInt)
  result.discardBytesOk = cast[uint64](n["discard-bytes-ok"].getBiggestInt)

proc `%`*(x: BlockStatsSpecificNvme): JsonNode =
  result = newJObject()
  result["completion-errors"] = %(x.completionErrors)
  result["aligned-accesses"] = %(x.alignedAccesses)
  result["unaligned-accesses"] = %(x.unalignedAccesses)

proc parse*(_: typedesc[BlockStatsSpecificNvme], n: JsonNode): BlockStatsSpecificNvme =
  result = default(BlockStatsSpecificNvme)
  result.completionErrors = cast[uint64](n["completion-errors"].getBiggestInt)
  result.alignedAccesses = cast[uint64](n["aligned-accesses"].getBiggestInt)
  result.unalignedAccesses = cast[uint64](n["unaligned-accesses"].getBiggestInt)

proc `%`*(x: BlockStatsSpecific): JsonNode =
  result = newJObject()
  result["driver"] = %($x.driver)
  case x.driver
  of BlockdevDriver.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.HostDevice:
    let sub = %(x.hostDevice)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Nvme:
    let sub = %(x.nvme)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blkdebug: discard
  of BlockdevDriver.Blklogwrites: discard
  of BlockdevDriver.Blkreplay: discard
  of BlockdevDriver.Blkverify: discard
  of BlockdevDriver.Bochs: discard
  of BlockdevDriver.Cloop: discard
  of BlockdevDriver.Compress: discard
  of BlockdevDriver.CopyBeforeWrite: discard
  of BlockdevDriver.CopyOnRead: discard
  of BlockdevDriver.Dmg: discard
  of BlockdevDriver.SnapshotAccess: discard
  of BlockdevDriver.Ftp: discard
  of BlockdevDriver.Ftps: discard
  of BlockdevDriver.Gluster: discard
  of BlockdevDriver.HostCdrom: discard
  of BlockdevDriver.Http: discard
  of BlockdevDriver.Https: discard
  of BlockdevDriver.IoUring: discard
  of BlockdevDriver.Iscsi: discard
  of BlockdevDriver.Luks: discard
  of BlockdevDriver.Nbd: discard
  of BlockdevDriver.Nfs: discard
  of BlockdevDriver.NullAio: discard
  of BlockdevDriver.NullCo: discard
  of BlockdevDriver.NvmeIoUring: discard
  of BlockdevDriver.Parallels: discard
  of BlockdevDriver.Preallocate: discard
  of BlockdevDriver.Qcow: discard
  of BlockdevDriver.Qcow2: discard
  of BlockdevDriver.Qed: discard
  of BlockdevDriver.Quorum: discard
  of BlockdevDriver.Raw: discard
  of BlockdevDriver.Rbd: discard
  of BlockdevDriver.Replication: discard
  of BlockdevDriver.Ssh: discard
  of BlockdevDriver.Throttle: discard
  of BlockdevDriver.Vdi: discard
  of BlockdevDriver.Vhdx: discard
  of BlockdevDriver.VirtioBlkVfioPci: discard
  of BlockdevDriver.VirtioBlkVhostUser: discard
  of BlockdevDriver.VirtioBlkVhostVdpa: discard
  of BlockdevDriver.Vmdk: discard
  of BlockdevDriver.Vpc: discard
  of BlockdevDriver.Vvfat: discard

proc parse*(_: typedesc[BlockStatsSpecific], n: JsonNode): BlockStatsSpecific =
  result = default(BlockStatsSpecific)
  let tag = parse(typedesc[BlockdevDriver], n["driver"])
  case tag
  of BlockdevDriver.File:
    result = BlockStatsSpecific(driver: tag, file: parse(typedesc[BlockStatsSpecificFile], n))
  of BlockdevDriver.HostDevice:
    result = BlockStatsSpecific(driver: tag, hostDevice: parse(typedesc[BlockStatsSpecificFile], n))
  of BlockdevDriver.Nvme:
    result = BlockStatsSpecific(driver: tag, nvme: parse(typedesc[BlockStatsSpecificNvme], n))
  of BlockdevDriver.Blkdebug:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Blklogwrites:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Blkreplay:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Blkverify:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Bochs:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Cloop:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Compress:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.CopyBeforeWrite:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.CopyOnRead:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Dmg:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.SnapshotAccess:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Ftp:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Ftps:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Gluster:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.HostCdrom:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Http:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Https:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.IoUring:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Iscsi:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Luks:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Nbd:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Nfs:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.NullAio:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.NullCo:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.NvmeIoUring:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Parallels:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Preallocate:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Qcow:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Qcow2:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Qed:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Quorum:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Raw:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Rbd:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Replication:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Ssh:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Throttle:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Vdi:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Vhdx:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.VirtioBlkVfioPci:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.VirtioBlkVhostUser:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.VirtioBlkVhostVdpa:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Vmdk:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Vpc:
    result = BlockStatsSpecific(driver: tag)
  of BlockdevDriver.Vvfat:
    result = BlockStatsSpecific(driver: tag)

proc `%`*(x: BlockStats): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  if x.device.isSome: result["device"] = %(x.device.get)
  if x.qdev.isSome: result["qdev"] = %(x.qdev.get)
  if x.nodeName.isSome: result["node-name"] = %(x.nodeName.get)
  result["stats"] = %(x.stats)
  if x.driverSpecific.isSome: result["driver-specific"] = %(x.driverSpecific.get)
  if x.parent.isSome: result["parent"] = %(x.parent.get)
  if x.backing.isSome: result["backing"] = %(x.backing.get)

proc parse*(_: typedesc[BlockStats], n: JsonNode): BlockStats =
  if n.kind == JNull: return nil
  new(result)
  if n.hasKey("device") and n["device"].kind != JNull:
    result.device = some(n["device"].getStr)
  if n.hasKey("qdev") and n["qdev"].kind != JNull:
    result.qdev = some(n["qdev"].getStr)
  if n.hasKey("node-name") and n["node-name"].kind != JNull:
    result.nodeName = some(n["node-name"].getStr)
  result.stats = parse(typedesc[BlockDeviceStats], n["stats"])
  if n.hasKey("driver-specific") and n["driver-specific"].kind != JNull:
    result.driverSpecific = some(parse(typedesc[BlockStatsSpecific], n["driver-specific"]))
  if n.hasKey("parent") and n["parent"].kind != JNull:
    result.parent = some(parse(typedesc[BlockStats], n["parent"]))
  if n.hasKey("backing") and n["backing"].kind != JNull:
    result.backing = some(parse(typedesc[BlockStats], n["backing"]))

proc `%`*(x: BlockdevOnError): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevOnError], n: JsonNode): BlockdevOnError =
  let s = n.getStr
  case s
  of "report": BlockdevOnError.Report
  of "ignore": BlockdevOnError.Ignore
  of "enospc": BlockdevOnError.Enospc
  of "stop": BlockdevOnError.Stop
  of "auto": BlockdevOnError.Auto
  else: raise newException(ValueError, "unknown BlockdevOnError: " & s)

proc `%`*(x: MirrorSyncMode): JsonNode = %($x)
proc parse*(_: typedesc[MirrorSyncMode], n: JsonNode): MirrorSyncMode =
  let s = n.getStr
  case s
  of "top": MirrorSyncMode.Top
  of "full": MirrorSyncMode.Full
  of "none": MirrorSyncMode.None
  of "incremental": MirrorSyncMode.Incremental
  of "bitmap": MirrorSyncMode.Bitmap
  else: raise newException(ValueError, "unknown MirrorSyncMode: " & s)

proc `%`*(x: BitmapSyncMode): JsonNode = %($x)
proc parse*(_: typedesc[BitmapSyncMode], n: JsonNode): BitmapSyncMode =
  let s = n.getStr
  case s
  of "on-success": BitmapSyncMode.OnSuccess
  of "never": BitmapSyncMode.Never
  of "always": BitmapSyncMode.Always
  else: raise newException(ValueError, "unknown BitmapSyncMode: " & s)

proc `%`*(x: MirrorCopyMode): JsonNode = %($x)
proc parse*(_: typedesc[MirrorCopyMode], n: JsonNode): MirrorCopyMode =
  let s = n.getStr
  case s
  of "background": MirrorCopyMode.Background
  of "write-blocking": MirrorCopyMode.WriteBlocking
  else: raise newException(ValueError, "unknown MirrorCopyMode: " & s)

proc `%`*(x: BlockJobInfoMirror): JsonNode =
  result = newJObject()
  result["actively-synced"] = %(x.activelySynced)

proc parse*(_: typedesc[BlockJobInfoMirror], n: JsonNode): BlockJobInfoMirror =
  result = default(BlockJobInfoMirror)
  result.activelySynced = n["actively-synced"].getBool

proc `%`*(x: BlockJobInfo): JsonNode =
  result = newJObject()
  result["device"] = %(x.device)
  result["len"] = %(x.len)
  result["offset"] = %(x.offset)
  result["busy"] = %(x.busy)
  result["paused"] = %(x.paused)
  result["speed"] = %(x.speed)
  result["io-status"] = %(x.ioStatus)
  result["ready"] = %(x.ready)
  result["status"] = %(x.status)
  result["auto-finalize"] = %(x.autoFinalize)
  result["auto-dismiss"] = %(x.autoDismiss)
  if x.error.isSome: result["error"] = %(x.error.get)
  result["type"] = %($x.`type`)
  case x.`type`
  of JobType.Mirror:
    let sub = %(x.mirror)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of JobType.Commit: discard
  of JobType.Stream: discard
  of JobType.Backup: discard
  of JobType.Create: discard
  of JobType.Amend: discard
  of JobType.SnapshotLoad: discard
  of JobType.SnapshotSave: discard
  of JobType.SnapshotDelete: discard

proc parse*(_: typedesc[BlockJobInfo], n: JsonNode): BlockJobInfo =
  result = default(BlockJobInfo)
  let tag = parse(typedesc[JobType], n["type"])
  case tag
  of JobType.Mirror:
    result = BlockJobInfo(`type`: tag, mirror: parse(typedesc[BlockJobInfoMirror], n))
  of JobType.Commit:
    result = BlockJobInfo(`type`: tag)
  of JobType.Stream:
    result = BlockJobInfo(`type`: tag)
  of JobType.Backup:
    result = BlockJobInfo(`type`: tag)
  of JobType.Create:
    result = BlockJobInfo(`type`: tag)
  of JobType.Amend:
    result = BlockJobInfo(`type`: tag)
  of JobType.SnapshotLoad:
    result = BlockJobInfo(`type`: tag)
  of JobType.SnapshotSave:
    result = BlockJobInfo(`type`: tag)
  of JobType.SnapshotDelete:
    result = BlockJobInfo(`type`: tag)
  result.device = n["device"].getStr
  result.len = int64(n["len"].getBiggestInt)
  result.offset = int64(n["offset"].getBiggestInt)
  result.busy = n["busy"].getBool
  result.paused = n["paused"].getBool
  result.speed = int64(n["speed"].getBiggestInt)
  result.ioStatus = parse(typedesc[BlockDeviceIoStatus], n["io-status"])
  result.ready = n["ready"].getBool
  result.status = parse(typedesc[JobStatus], n["status"])
  result.autoFinalize = n["auto-finalize"].getBool
  result.autoDismiss = n["auto-dismiss"].getBool
  if n.hasKey("error") and n["error"].kind != JNull:
    result.error = some(n["error"].getStr)

proc `%`*(x: NewImageMode): JsonNode = %($x)
proc parse*(_: typedesc[NewImageMode], n: JsonNode): NewImageMode =
  let s = n.getStr
  case s
  of "existing": NewImageMode.Existing
  of "absolute-paths": NewImageMode.AbsolutePaths
  else: raise newException(ValueError, "unknown NewImageMode: " & s)

proc `%`*(x: BlockdevSnapshotSync): JsonNode =
  result = newJObject()
  if x.device.isSome: result["device"] = %(x.device.get)
  if x.nodeName.isSome: result["node-name"] = %(x.nodeName.get)
  result["snapshot-file"] = %(x.snapshotFile)
  if x.snapshotNodeName.isSome: result["snapshot-node-name"] = %(x.snapshotNodeName.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.mode.isSome: result["mode"] = %(x.mode.get)

proc parse*(_: typedesc[BlockdevSnapshotSync], n: JsonNode): BlockdevSnapshotSync =
  result = default(BlockdevSnapshotSync)
  if n.hasKey("device") and n["device"].kind != JNull:
    result.device = some(n["device"].getStr)
  if n.hasKey("node-name") and n["node-name"].kind != JNull:
    result.nodeName = some(n["node-name"].getStr)
  result.snapshotFile = n["snapshot-file"].getStr
  if n.hasKey("snapshot-node-name") and n["snapshot-node-name"].kind != JNull:
    result.snapshotNodeName = some(n["snapshot-node-name"].getStr)
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(n["format"].getStr)
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[NewImageMode], n["mode"]))

proc `%`*(x: BlockdevSnapshot): JsonNode =
  result = newJObject()
  result["node"] = %(x.node)
  result["overlay"] = %(x.overlay)

proc parse*(_: typedesc[BlockdevSnapshot], n: JsonNode): BlockdevSnapshot =
  result = default(BlockdevSnapshot)
  result.node = n["node"].getStr
  result.overlay = n["overlay"].getStr

proc `%`*(x: BackupPerf): JsonNode =
  result = newJObject()
  if x.useCopyRange.isSome: result["use-copy-range"] = %(x.useCopyRange.get)
  if x.maxWorkers.isSome: result["max-workers"] = %(x.maxWorkers.get)
  if x.maxChunk.isSome: result["max-chunk"] = %(x.maxChunk.get)
  if x.minClusterSize.isSome: result["min-cluster-size"] = %(x.minClusterSize.get)

proc parse*(_: typedesc[BackupPerf], n: JsonNode): BackupPerf =
  result = default(BackupPerf)
  if n.hasKey("use-copy-range") and n["use-copy-range"].kind != JNull:
    result.useCopyRange = some(n["use-copy-range"].getBool)
  if n.hasKey("max-workers") and n["max-workers"].kind != JNull:
    result.maxWorkers = some(int64(n["max-workers"].getBiggestInt))
  if n.hasKey("max-chunk") and n["max-chunk"].kind != JNull:
    result.maxChunk = some(int64(n["max-chunk"].getBiggestInt))
  if n.hasKey("min-cluster-size") and n["min-cluster-size"].kind != JNull:
    result.minClusterSize = some(cast[uint64](n["min-cluster-size"].getBiggestInt))

proc `%`*(x: BackupCommon): JsonNode =
  result = newJObject()
  if x.jobId.isSome: result["job-id"] = %(x.jobId.get)
  result["device"] = %(x.device)
  result["sync"] = %(x.sync)
  if x.speed.isSome: result["speed"] = %(x.speed.get)
  if x.bitmap.isSome: result["bitmap"] = %(x.bitmap.get)
  if x.bitmapMode.isSome: result["bitmap-mode"] = %(x.bitmapMode.get)
  if x.compress.isSome: result["compress"] = %(x.compress.get)
  if x.onSourceError.isSome: result["on-source-error"] = %(x.onSourceError.get)
  if x.onTargetError.isSome: result["on-target-error"] = %(x.onTargetError.get)
  if x.onCbwError.isSome: result["on-cbw-error"] = %(x.onCbwError.get)
  if x.autoFinalize.isSome: result["auto-finalize"] = %(x.autoFinalize.get)
  if x.autoDismiss.isSome: result["auto-dismiss"] = %(x.autoDismiss.get)
  if x.filterNodeName.isSome: result["filter-node-name"] = %(x.filterNodeName.get)
  if x.discardSource.isSome: result["discard-source"] = %(x.discardSource.get)
  if x.xPerf.isSome: result["x-perf"] = %(x.xPerf.get)

proc parse*(_: typedesc[BackupCommon], n: JsonNode): BackupCommon =
  result = default(BackupCommon)
  if n.hasKey("job-id") and n["job-id"].kind != JNull:
    result.jobId = some(n["job-id"].getStr)
  result.device = n["device"].getStr
  result.sync = parse(typedesc[MirrorSyncMode], n["sync"])
  if n.hasKey("speed") and n["speed"].kind != JNull:
    result.speed = some(int64(n["speed"].getBiggestInt))
  if n.hasKey("bitmap") and n["bitmap"].kind != JNull:
    result.bitmap = some(n["bitmap"].getStr)
  if n.hasKey("bitmap-mode") and n["bitmap-mode"].kind != JNull:
    result.bitmapMode = some(parse(typedesc[BitmapSyncMode], n["bitmap-mode"]))
  if n.hasKey("compress") and n["compress"].kind != JNull:
    result.compress = some(n["compress"].getBool)
  if n.hasKey("on-source-error") and n["on-source-error"].kind != JNull:
    result.onSourceError = some(parse(typedesc[BlockdevOnError], n["on-source-error"]))
  if n.hasKey("on-target-error") and n["on-target-error"].kind != JNull:
    result.onTargetError = some(parse(typedesc[BlockdevOnError], n["on-target-error"]))
  if n.hasKey("on-cbw-error") and n["on-cbw-error"].kind != JNull:
    result.onCbwError = some(parse(typedesc[OnCbwError], n["on-cbw-error"]))
  if n.hasKey("auto-finalize") and n["auto-finalize"].kind != JNull:
    result.autoFinalize = some(n["auto-finalize"].getBool)
  if n.hasKey("auto-dismiss") and n["auto-dismiss"].kind != JNull:
    result.autoDismiss = some(n["auto-dismiss"].getBool)
  if n.hasKey("filter-node-name") and n["filter-node-name"].kind != JNull:
    result.filterNodeName = some(n["filter-node-name"].getStr)
  if n.hasKey("discard-source") and n["discard-source"].kind != JNull:
    result.discardSource = some(n["discard-source"].getBool)
  if n.hasKey("x-perf") and n["x-perf"].kind != JNull:
    result.xPerf = some(parse(typedesc[BackupPerf], n["x-perf"]))

proc `%`*(x: DriveBackup): JsonNode =
  result = newJObject()
  if x.jobId.isSome: result["job-id"] = %(x.jobId.get)
  result["device"] = %(x.device)
  result["sync"] = %(x.sync)
  if x.speed.isSome: result["speed"] = %(x.speed.get)
  if x.bitmap.isSome: result["bitmap"] = %(x.bitmap.get)
  if x.bitmapMode.isSome: result["bitmap-mode"] = %(x.bitmapMode.get)
  if x.compress.isSome: result["compress"] = %(x.compress.get)
  if x.onSourceError.isSome: result["on-source-error"] = %(x.onSourceError.get)
  if x.onTargetError.isSome: result["on-target-error"] = %(x.onTargetError.get)
  if x.onCbwError.isSome: result["on-cbw-error"] = %(x.onCbwError.get)
  if x.autoFinalize.isSome: result["auto-finalize"] = %(x.autoFinalize.get)
  if x.autoDismiss.isSome: result["auto-dismiss"] = %(x.autoDismiss.get)
  if x.filterNodeName.isSome: result["filter-node-name"] = %(x.filterNodeName.get)
  if x.discardSource.isSome: result["discard-source"] = %(x.discardSource.get)
  if x.xPerf.isSome: result["x-perf"] = %(x.xPerf.get)
  result["target"] = %(x.target)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.mode.isSome: result["mode"] = %(x.mode.get)

proc parse*(_: typedesc[DriveBackup], n: JsonNode): DriveBackup =
  result = default(DriveBackup)
  if n.hasKey("job-id") and n["job-id"].kind != JNull:
    result.jobId = some(n["job-id"].getStr)
  result.device = n["device"].getStr
  result.sync = parse(typedesc[MirrorSyncMode], n["sync"])
  if n.hasKey("speed") and n["speed"].kind != JNull:
    result.speed = some(int64(n["speed"].getBiggestInt))
  if n.hasKey("bitmap") and n["bitmap"].kind != JNull:
    result.bitmap = some(n["bitmap"].getStr)
  if n.hasKey("bitmap-mode") and n["bitmap-mode"].kind != JNull:
    result.bitmapMode = some(parse(typedesc[BitmapSyncMode], n["bitmap-mode"]))
  if n.hasKey("compress") and n["compress"].kind != JNull:
    result.compress = some(n["compress"].getBool)
  if n.hasKey("on-source-error") and n["on-source-error"].kind != JNull:
    result.onSourceError = some(parse(typedesc[BlockdevOnError], n["on-source-error"]))
  if n.hasKey("on-target-error") and n["on-target-error"].kind != JNull:
    result.onTargetError = some(parse(typedesc[BlockdevOnError], n["on-target-error"]))
  if n.hasKey("on-cbw-error") and n["on-cbw-error"].kind != JNull:
    result.onCbwError = some(parse(typedesc[OnCbwError], n["on-cbw-error"]))
  if n.hasKey("auto-finalize") and n["auto-finalize"].kind != JNull:
    result.autoFinalize = some(n["auto-finalize"].getBool)
  if n.hasKey("auto-dismiss") and n["auto-dismiss"].kind != JNull:
    result.autoDismiss = some(n["auto-dismiss"].getBool)
  if n.hasKey("filter-node-name") and n["filter-node-name"].kind != JNull:
    result.filterNodeName = some(n["filter-node-name"].getStr)
  if n.hasKey("discard-source") and n["discard-source"].kind != JNull:
    result.discardSource = some(n["discard-source"].getBool)
  if n.hasKey("x-perf") and n["x-perf"].kind != JNull:
    result.xPerf = some(parse(typedesc[BackupPerf], n["x-perf"]))
  result.target = n["target"].getStr
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(n["format"].getStr)
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[NewImageMode], n["mode"]))

proc `%`*(x: BlockdevBackup): JsonNode =
  result = newJObject()
  if x.jobId.isSome: result["job-id"] = %(x.jobId.get)
  result["device"] = %(x.device)
  result["sync"] = %(x.sync)
  if x.speed.isSome: result["speed"] = %(x.speed.get)
  if x.bitmap.isSome: result["bitmap"] = %(x.bitmap.get)
  if x.bitmapMode.isSome: result["bitmap-mode"] = %(x.bitmapMode.get)
  if x.compress.isSome: result["compress"] = %(x.compress.get)
  if x.onSourceError.isSome: result["on-source-error"] = %(x.onSourceError.get)
  if x.onTargetError.isSome: result["on-target-error"] = %(x.onTargetError.get)
  if x.onCbwError.isSome: result["on-cbw-error"] = %(x.onCbwError.get)
  if x.autoFinalize.isSome: result["auto-finalize"] = %(x.autoFinalize.get)
  if x.autoDismiss.isSome: result["auto-dismiss"] = %(x.autoDismiss.get)
  if x.filterNodeName.isSome: result["filter-node-name"] = %(x.filterNodeName.get)
  if x.discardSource.isSome: result["discard-source"] = %(x.discardSource.get)
  if x.xPerf.isSome: result["x-perf"] = %(x.xPerf.get)
  result["target"] = %(x.target)

proc parse*(_: typedesc[BlockdevBackup], n: JsonNode): BlockdevBackup =
  result = default(BlockdevBackup)
  if n.hasKey("job-id") and n["job-id"].kind != JNull:
    result.jobId = some(n["job-id"].getStr)
  result.device = n["device"].getStr
  result.sync = parse(typedesc[MirrorSyncMode], n["sync"])
  if n.hasKey("speed") and n["speed"].kind != JNull:
    result.speed = some(int64(n["speed"].getBiggestInt))
  if n.hasKey("bitmap") and n["bitmap"].kind != JNull:
    result.bitmap = some(n["bitmap"].getStr)
  if n.hasKey("bitmap-mode") and n["bitmap-mode"].kind != JNull:
    result.bitmapMode = some(parse(typedesc[BitmapSyncMode], n["bitmap-mode"]))
  if n.hasKey("compress") and n["compress"].kind != JNull:
    result.compress = some(n["compress"].getBool)
  if n.hasKey("on-source-error") and n["on-source-error"].kind != JNull:
    result.onSourceError = some(parse(typedesc[BlockdevOnError], n["on-source-error"]))
  if n.hasKey("on-target-error") and n["on-target-error"].kind != JNull:
    result.onTargetError = some(parse(typedesc[BlockdevOnError], n["on-target-error"]))
  if n.hasKey("on-cbw-error") and n["on-cbw-error"].kind != JNull:
    result.onCbwError = some(parse(typedesc[OnCbwError], n["on-cbw-error"]))
  if n.hasKey("auto-finalize") and n["auto-finalize"].kind != JNull:
    result.autoFinalize = some(n["auto-finalize"].getBool)
  if n.hasKey("auto-dismiss") and n["auto-dismiss"].kind != JNull:
    result.autoDismiss = some(n["auto-dismiss"].getBool)
  if n.hasKey("filter-node-name") and n["filter-node-name"].kind != JNull:
    result.filterNodeName = some(n["filter-node-name"].getStr)
  if n.hasKey("discard-source") and n["discard-source"].kind != JNull:
    result.discardSource = some(n["discard-source"].getBool)
  if n.hasKey("x-perf") and n["x-perf"].kind != JNull:
    result.xPerf = some(parse(typedesc[BackupPerf], n["x-perf"]))
  result.target = n["target"].getStr

proc `%`*(x: XDbgBlockGraphNodeType): JsonNode = %($x)
proc parse*(_: typedesc[XDbgBlockGraphNodeType], n: JsonNode): XDbgBlockGraphNodeType =
  let s = n.getStr
  case s
  of "block-backend": XDbgBlockGraphNodeType.BlockBackend
  of "block-job": XDbgBlockGraphNodeType.BlockJob
  of "block-driver": XDbgBlockGraphNodeType.BlockDriver
  else: raise newException(ValueError, "unknown XDbgBlockGraphNodeType: " & s)

proc `%`*(x: XDbgBlockGraphNode): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %(x.`type`)
  result["name"] = %(x.name)

proc parse*(_: typedesc[XDbgBlockGraphNode], n: JsonNode): XDbgBlockGraphNode =
  result = default(XDbgBlockGraphNode)
  result.id = cast[uint64](n["id"].getBiggestInt)
  result.`type` = parse(typedesc[XDbgBlockGraphNodeType], n["type"])
  result.name = n["name"].getStr

proc `%`*(x: BlockPermission): JsonNode = %($x)
proc parse*(_: typedesc[BlockPermission], n: JsonNode): BlockPermission =
  let s = n.getStr
  case s
  of "consistent-read": BlockPermission.ConsistentRead
  of "write": BlockPermission.Write
  of "write-unchanged": BlockPermission.WriteUnchanged
  of "resize": BlockPermission.Resize
  else: raise newException(ValueError, "unknown BlockPermission: " & s)

proc `%`*(x: XDbgBlockGraphEdge): JsonNode =
  result = newJObject()
  result["parent"] = %(x.parent)
  result["child"] = %(x.child)
  result["name"] = %(x.name)
  result["perm"] = %(x.perm)
  result["shared-perm"] = %(x.sharedPerm)

proc parse*(_: typedesc[XDbgBlockGraphEdge], n: JsonNode): XDbgBlockGraphEdge =
  result = default(XDbgBlockGraphEdge)
  result.parent = cast[uint64](n["parent"].getBiggestInt)
  result.child = cast[uint64](n["child"].getBiggestInt)
  result.name = n["name"].getStr
  result.perm = (n["perm"]).getElems.mapIt(parse(typedesc[BlockPermission], it))
  result.sharedPerm = (n["shared-perm"]).getElems.mapIt(parse(typedesc[BlockPermission], it))

proc `%`*(x: XDbgBlockGraph): JsonNode =
  result = newJObject()
  result["nodes"] = %(x.nodes)
  result["edges"] = %(x.edges)

proc parse*(_: typedesc[XDbgBlockGraph], n: JsonNode): XDbgBlockGraph =
  result = default(XDbgBlockGraph)
  result.nodes = (n["nodes"]).getElems.mapIt(parse(typedesc[XDbgBlockGraphNode], it))
  result.edges = (n["edges"]).getElems.mapIt(parse(typedesc[XDbgBlockGraphEdge], it))

proc `%`*(x: DriveMirror): JsonNode =
  result = newJObject()
  if x.jobId.isSome: result["job-id"] = %(x.jobId.get)
  result["device"] = %(x.device)
  result["target"] = %(x.target)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.nodeName.isSome: result["node-name"] = %(x.nodeName.get)
  if x.replaces.isSome: result["replaces"] = %(x.replaces.get)
  result["sync"] = %(x.sync)
  if x.mode.isSome: result["mode"] = %(x.mode.get)
  if x.speed.isSome: result["speed"] = %(x.speed.get)
  if x.granularity.isSome: result["granularity"] = %(x.granularity.get)
  if x.bufSize.isSome: result["buf-size"] = %(x.bufSize.get)
  if x.onSourceError.isSome: result["on-source-error"] = %(x.onSourceError.get)
  if x.onTargetError.isSome: result["on-target-error"] = %(x.onTargetError.get)
  if x.unmap.isSome: result["unmap"] = %(x.unmap.get)
  if x.copyMode.isSome: result["copy-mode"] = %(x.copyMode.get)
  if x.autoFinalize.isSome: result["auto-finalize"] = %(x.autoFinalize.get)
  if x.autoDismiss.isSome: result["auto-dismiss"] = %(x.autoDismiss.get)

proc parse*(_: typedesc[DriveMirror], n: JsonNode): DriveMirror =
  result = default(DriveMirror)
  if n.hasKey("job-id") and n["job-id"].kind != JNull:
    result.jobId = some(n["job-id"].getStr)
  result.device = n["device"].getStr
  result.target = n["target"].getStr
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(n["format"].getStr)
  if n.hasKey("node-name") and n["node-name"].kind != JNull:
    result.nodeName = some(n["node-name"].getStr)
  if n.hasKey("replaces") and n["replaces"].kind != JNull:
    result.replaces = some(n["replaces"].getStr)
  result.sync = parse(typedesc[MirrorSyncMode], n["sync"])
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[NewImageMode], n["mode"]))
  if n.hasKey("speed") and n["speed"].kind != JNull:
    result.speed = some(int64(n["speed"].getBiggestInt))
  if n.hasKey("granularity") and n["granularity"].kind != JNull:
    result.granularity = some(uint32(n["granularity"].getBiggestInt))
  if n.hasKey("buf-size") and n["buf-size"].kind != JNull:
    result.bufSize = some(int64(n["buf-size"].getBiggestInt))
  if n.hasKey("on-source-error") and n["on-source-error"].kind != JNull:
    result.onSourceError = some(parse(typedesc[BlockdevOnError], n["on-source-error"]))
  if n.hasKey("on-target-error") and n["on-target-error"].kind != JNull:
    result.onTargetError = some(parse(typedesc[BlockdevOnError], n["on-target-error"]))
  if n.hasKey("unmap") and n["unmap"].kind != JNull:
    result.unmap = some(n["unmap"].getBool)
  if n.hasKey("copy-mode") and n["copy-mode"].kind != JNull:
    result.copyMode = some(parse(typedesc[MirrorCopyMode], n["copy-mode"]))
  if n.hasKey("auto-finalize") and n["auto-finalize"].kind != JNull:
    result.autoFinalize = some(n["auto-finalize"].getBool)
  if n.hasKey("auto-dismiss") and n["auto-dismiss"].kind != JNull:
    result.autoDismiss = some(n["auto-dismiss"].getBool)

proc `%`*(x: BlockDirtyBitmap): JsonNode =
  result = newJObject()
  result["node"] = %(x.node)
  result["name"] = %(x.name)

proc parse*(_: typedesc[BlockDirtyBitmap], n: JsonNode): BlockDirtyBitmap =
  result = default(BlockDirtyBitmap)
  result.node = n["node"].getStr
  result.name = n["name"].getStr

proc `%`*(x: BlockDirtyBitmapAdd): JsonNode =
  result = newJObject()
  result["node"] = %(x.node)
  result["name"] = %(x.name)
  if x.granularity.isSome: result["granularity"] = %(x.granularity.get)
  if x.persistent.isSome: result["persistent"] = %(x.persistent.get)
  if x.disabled.isSome: result["disabled"] = %(x.disabled.get)

proc parse*(_: typedesc[BlockDirtyBitmapAdd], n: JsonNode): BlockDirtyBitmapAdd =
  result = default(BlockDirtyBitmapAdd)
  result.node = n["node"].getStr
  result.name = n["name"].getStr
  if n.hasKey("granularity") and n["granularity"].kind != JNull:
    result.granularity = some(uint32(n["granularity"].getBiggestInt))
  if n.hasKey("persistent") and n["persistent"].kind != JNull:
    result.persistent = some(n["persistent"].getBool)
  if n.hasKey("disabled") and n["disabled"].kind != JNull:
    result.disabled = some(n["disabled"].getBool)

proc `%`*(x: BlockDirtyBitmapOrStr): JsonNode =
  case x.kind
  of BlockDirtyBitmapOrStrKind.Local: %(x.local)
  of BlockDirtyBitmapOrStrKind.External: %(x.external)

proc parse*(_: typedesc[BlockDirtyBitmapOrStr], n: JsonNode): BlockDirtyBitmapOrStr =
  result = default(BlockDirtyBitmapOrStr)
  if n.kind == JString:
    result = BlockDirtyBitmapOrStr(kind: BlockDirtyBitmapOrStrKind.Local, local: n.getStr)
  elif n.kind == JObject:
    result = BlockDirtyBitmapOrStr(kind: BlockDirtyBitmapOrStrKind.External, external: parse(typedesc[BlockDirtyBitmap], n))
  else: raise newException(ValueError,
      "cannot decode BlockDirtyBitmapOrStr from JSON")

proc `%`*(x: BlockDirtyBitmapMerge): JsonNode =
  result = newJObject()
  result["node"] = %(x.node)
  result["target"] = %(x.target)
  result["bitmaps"] = %(x.bitmaps)

proc parse*(_: typedesc[BlockDirtyBitmapMerge], n: JsonNode): BlockDirtyBitmapMerge =
  result = default(BlockDirtyBitmapMerge)
  result.node = n["node"].getStr
  result.target = n["target"].getStr
  result.bitmaps = (n["bitmaps"]).getElems.mapIt(parse(typedesc[BlockDirtyBitmapOrStr], it))

proc `%`*(x: BlockDirtyBitmapSha256): JsonNode =
  result = newJObject()
  result["sha256"] = %(x.sha256)

proc parse*(_: typedesc[BlockDirtyBitmapSha256], n: JsonNode): BlockDirtyBitmapSha256 =
  result = default(BlockDirtyBitmapSha256)
  result.sha256 = n["sha256"].getStr

proc `%`*(x: BlockIOThrottle): JsonNode =
  result = newJObject()
  if x.device.isSome: result["device"] = %(x.device.get)
  if x.id.isSome: result["id"] = %(x.id.get)
  result["bps"] = %(x.bps)
  result["bps_rd"] = %(x.bpsRd)
  result["bps_wr"] = %(x.bpsWr)
  result["iops"] = %(x.iops)
  result["iops_rd"] = %(x.iopsRd)
  result["iops_wr"] = %(x.iopsWr)
  if x.bpsMax.isSome: result["bps_max"] = %(x.bpsMax.get)
  if x.bpsRdMax.isSome: result["bps_rd_max"] = %(x.bpsRdMax.get)
  if x.bpsWrMax.isSome: result["bps_wr_max"] = %(x.bpsWrMax.get)
  if x.iopsMax.isSome: result["iops_max"] = %(x.iopsMax.get)
  if x.iopsRdMax.isSome: result["iops_rd_max"] = %(x.iopsRdMax.get)
  if x.iopsWrMax.isSome: result["iops_wr_max"] = %(x.iopsWrMax.get)
  if x.bpsMaxLength.isSome: result["bps_max_length"] = %(x.bpsMaxLength.get)
  if x.bpsRdMaxLength.isSome: result["bps_rd_max_length"] = %(x.bpsRdMaxLength.get)
  if x.bpsWrMaxLength.isSome: result["bps_wr_max_length"] = %(x.bpsWrMaxLength.get)
  if x.iopsMaxLength.isSome: result["iops_max_length"] = %(x.iopsMaxLength.get)
  if x.iopsRdMaxLength.isSome: result["iops_rd_max_length"] = %(x.iopsRdMaxLength.get)
  if x.iopsWrMaxLength.isSome: result["iops_wr_max_length"] = %(x.iopsWrMaxLength.get)
  if x.iopsSize.isSome: result["iops_size"] = %(x.iopsSize.get)
  if x.group.isSome: result["group"] = %(x.group.get)

proc parse*(_: typedesc[BlockIOThrottle], n: JsonNode): BlockIOThrottle =
  result = default(BlockIOThrottle)
  if n.hasKey("device") and n["device"].kind != JNull:
    result.device = some(n["device"].getStr)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.bps = int64(n["bps"].getBiggestInt)
  result.bpsRd = int64(n["bps_rd"].getBiggestInt)
  result.bpsWr = int64(n["bps_wr"].getBiggestInt)
  result.iops = int64(n["iops"].getBiggestInt)
  result.iopsRd = int64(n["iops_rd"].getBiggestInt)
  result.iopsWr = int64(n["iops_wr"].getBiggestInt)
  if n.hasKey("bps_max") and n["bps_max"].kind != JNull:
    result.bpsMax = some(int64(n["bps_max"].getBiggestInt))
  if n.hasKey("bps_rd_max") and n["bps_rd_max"].kind != JNull:
    result.bpsRdMax = some(int64(n["bps_rd_max"].getBiggestInt))
  if n.hasKey("bps_wr_max") and n["bps_wr_max"].kind != JNull:
    result.bpsWrMax = some(int64(n["bps_wr_max"].getBiggestInt))
  if n.hasKey("iops_max") and n["iops_max"].kind != JNull:
    result.iopsMax = some(int64(n["iops_max"].getBiggestInt))
  if n.hasKey("iops_rd_max") and n["iops_rd_max"].kind != JNull:
    result.iopsRdMax = some(int64(n["iops_rd_max"].getBiggestInt))
  if n.hasKey("iops_wr_max") and n["iops_wr_max"].kind != JNull:
    result.iopsWrMax = some(int64(n["iops_wr_max"].getBiggestInt))
  if n.hasKey("bps_max_length") and n["bps_max_length"].kind != JNull:
    result.bpsMaxLength = some(int64(n["bps_max_length"].getBiggestInt))
  if n.hasKey("bps_rd_max_length") and n["bps_rd_max_length"].kind != JNull:
    result.bpsRdMaxLength = some(int64(n["bps_rd_max_length"].getBiggestInt))
  if n.hasKey("bps_wr_max_length") and n["bps_wr_max_length"].kind != JNull:
    result.bpsWrMaxLength = some(int64(n["bps_wr_max_length"].getBiggestInt))
  if n.hasKey("iops_max_length") and n["iops_max_length"].kind != JNull:
    result.iopsMaxLength = some(int64(n["iops_max_length"].getBiggestInt))
  if n.hasKey("iops_rd_max_length") and n["iops_rd_max_length"].kind != JNull:
    result.iopsRdMaxLength = some(int64(n["iops_rd_max_length"].getBiggestInt))
  if n.hasKey("iops_wr_max_length") and n["iops_wr_max_length"].kind != JNull:
    result.iopsWrMaxLength = some(int64(n["iops_wr_max_length"].getBiggestInt))
  if n.hasKey("iops_size") and n["iops_size"].kind != JNull:
    result.iopsSize = some(int64(n["iops_size"].getBiggestInt))
  if n.hasKey("group") and n["group"].kind != JNull:
    result.group = some(n["group"].getStr)

proc `%`*(x: ThrottleLimits): JsonNode =
  result = newJObject()
  if x.iopsTotal.isSome: result["iops-total"] = %(x.iopsTotal.get)
  if x.iopsTotalMax.isSome: result["iops-total-max"] = %(x.iopsTotalMax.get)
  if x.iopsTotalMaxLength.isSome: result["iops-total-max-length"] = %(x.iopsTotalMaxLength.get)
  if x.iopsRead.isSome: result["iops-read"] = %(x.iopsRead.get)
  if x.iopsReadMax.isSome: result["iops-read-max"] = %(x.iopsReadMax.get)
  if x.iopsReadMaxLength.isSome: result["iops-read-max-length"] = %(x.iopsReadMaxLength.get)
  if x.iopsWrite.isSome: result["iops-write"] = %(x.iopsWrite.get)
  if x.iopsWriteMax.isSome: result["iops-write-max"] = %(x.iopsWriteMax.get)
  if x.iopsWriteMaxLength.isSome: result["iops-write-max-length"] = %(x.iopsWriteMaxLength.get)
  if x.bpsTotal.isSome: result["bps-total"] = %(x.bpsTotal.get)
  if x.bpsTotalMax.isSome: result["bps-total-max"] = %(x.bpsTotalMax.get)
  if x.bpsTotalMaxLength.isSome: result["bps-total-max-length"] = %(x.bpsTotalMaxLength.get)
  if x.bpsRead.isSome: result["bps-read"] = %(x.bpsRead.get)
  if x.bpsReadMax.isSome: result["bps-read-max"] = %(x.bpsReadMax.get)
  if x.bpsReadMaxLength.isSome: result["bps-read-max-length"] = %(x.bpsReadMaxLength.get)
  if x.bpsWrite.isSome: result["bps-write"] = %(x.bpsWrite.get)
  if x.bpsWriteMax.isSome: result["bps-write-max"] = %(x.bpsWriteMax.get)
  if x.bpsWriteMaxLength.isSome: result["bps-write-max-length"] = %(x.bpsWriteMaxLength.get)
  if x.iopsSize.isSome: result["iops-size"] = %(x.iopsSize.get)

proc parse*(_: typedesc[ThrottleLimits], n: JsonNode): ThrottleLimits =
  result = default(ThrottleLimits)
  if n.hasKey("iops-total") and n["iops-total"].kind != JNull:
    result.iopsTotal = some(int64(n["iops-total"].getBiggestInt))
  if n.hasKey("iops-total-max") and n["iops-total-max"].kind != JNull:
    result.iopsTotalMax = some(int64(n["iops-total-max"].getBiggestInt))
  if n.hasKey("iops-total-max-length") and n["iops-total-max-length"].kind != JNull:
    result.iopsTotalMaxLength = some(int64(n["iops-total-max-length"].getBiggestInt))
  if n.hasKey("iops-read") and n["iops-read"].kind != JNull:
    result.iopsRead = some(int64(n["iops-read"].getBiggestInt))
  if n.hasKey("iops-read-max") and n["iops-read-max"].kind != JNull:
    result.iopsReadMax = some(int64(n["iops-read-max"].getBiggestInt))
  if n.hasKey("iops-read-max-length") and n["iops-read-max-length"].kind != JNull:
    result.iopsReadMaxLength = some(int64(n["iops-read-max-length"].getBiggestInt))
  if n.hasKey("iops-write") and n["iops-write"].kind != JNull:
    result.iopsWrite = some(int64(n["iops-write"].getBiggestInt))
  if n.hasKey("iops-write-max") and n["iops-write-max"].kind != JNull:
    result.iopsWriteMax = some(int64(n["iops-write-max"].getBiggestInt))
  if n.hasKey("iops-write-max-length") and n["iops-write-max-length"].kind != JNull:
    result.iopsWriteMaxLength = some(int64(n["iops-write-max-length"].getBiggestInt))
  if n.hasKey("bps-total") and n["bps-total"].kind != JNull:
    result.bpsTotal = some(int64(n["bps-total"].getBiggestInt))
  if n.hasKey("bps-total-max") and n["bps-total-max"].kind != JNull:
    result.bpsTotalMax = some(int64(n["bps-total-max"].getBiggestInt))
  if n.hasKey("bps-total-max-length") and n["bps-total-max-length"].kind != JNull:
    result.bpsTotalMaxLength = some(int64(n["bps-total-max-length"].getBiggestInt))
  if n.hasKey("bps-read") and n["bps-read"].kind != JNull:
    result.bpsRead = some(int64(n["bps-read"].getBiggestInt))
  if n.hasKey("bps-read-max") and n["bps-read-max"].kind != JNull:
    result.bpsReadMax = some(int64(n["bps-read-max"].getBiggestInt))
  if n.hasKey("bps-read-max-length") and n["bps-read-max-length"].kind != JNull:
    result.bpsReadMaxLength = some(int64(n["bps-read-max-length"].getBiggestInt))
  if n.hasKey("bps-write") and n["bps-write"].kind != JNull:
    result.bpsWrite = some(int64(n["bps-write"].getBiggestInt))
  if n.hasKey("bps-write-max") and n["bps-write-max"].kind != JNull:
    result.bpsWriteMax = some(int64(n["bps-write-max"].getBiggestInt))
  if n.hasKey("bps-write-max-length") and n["bps-write-max-length"].kind != JNull:
    result.bpsWriteMaxLength = some(int64(n["bps-write-max-length"].getBiggestInt))
  if n.hasKey("iops-size") and n["iops-size"].kind != JNull:
    result.iopsSize = some(int64(n["iops-size"].getBiggestInt))

proc `%`*(x: ThrottleGroupProperties): JsonNode =
  result = newJObject()
  if x.limits.isSome: result["limits"] = %(x.limits.get)
  if x.xIopsTotal.isSome: result["x-iops-total"] = %(x.xIopsTotal.get)
  if x.xIopsTotalMax.isSome: result["x-iops-total-max"] = %(x.xIopsTotalMax.get)
  if x.xIopsTotalMaxLength.isSome: result["x-iops-total-max-length"] = %(x.xIopsTotalMaxLength.get)
  if x.xIopsRead.isSome: result["x-iops-read"] = %(x.xIopsRead.get)
  if x.xIopsReadMax.isSome: result["x-iops-read-max"] = %(x.xIopsReadMax.get)
  if x.xIopsReadMaxLength.isSome: result["x-iops-read-max-length"] = %(x.xIopsReadMaxLength.get)
  if x.xIopsWrite.isSome: result["x-iops-write"] = %(x.xIopsWrite.get)
  if x.xIopsWriteMax.isSome: result["x-iops-write-max"] = %(x.xIopsWriteMax.get)
  if x.xIopsWriteMaxLength.isSome: result["x-iops-write-max-length"] = %(x.xIopsWriteMaxLength.get)
  if x.xBpsTotal.isSome: result["x-bps-total"] = %(x.xBpsTotal.get)
  if x.xBpsTotalMax.isSome: result["x-bps-total-max"] = %(x.xBpsTotalMax.get)
  if x.xBpsTotalMaxLength.isSome: result["x-bps-total-max-length"] = %(x.xBpsTotalMaxLength.get)
  if x.xBpsRead.isSome: result["x-bps-read"] = %(x.xBpsRead.get)
  if x.xBpsReadMax.isSome: result["x-bps-read-max"] = %(x.xBpsReadMax.get)
  if x.xBpsReadMaxLength.isSome: result["x-bps-read-max-length"] = %(x.xBpsReadMaxLength.get)
  if x.xBpsWrite.isSome: result["x-bps-write"] = %(x.xBpsWrite.get)
  if x.xBpsWriteMax.isSome: result["x-bps-write-max"] = %(x.xBpsWriteMax.get)
  if x.xBpsWriteMaxLength.isSome: result["x-bps-write-max-length"] = %(x.xBpsWriteMaxLength.get)
  if x.xIopsSize.isSome: result["x-iops-size"] = %(x.xIopsSize.get)

proc parse*(_: typedesc[ThrottleGroupProperties], n: JsonNode): ThrottleGroupProperties =
  result = default(ThrottleGroupProperties)
  if n.hasKey("limits") and n["limits"].kind != JNull:
    result.limits = some(parse(typedesc[ThrottleLimits], n["limits"]))
  if n.hasKey("x-iops-total") and n["x-iops-total"].kind != JNull:
    result.xIopsTotal = some(int64(n["x-iops-total"].getBiggestInt))
  if n.hasKey("x-iops-total-max") and n["x-iops-total-max"].kind != JNull:
    result.xIopsTotalMax = some(int64(n["x-iops-total-max"].getBiggestInt))
  if n.hasKey("x-iops-total-max-length") and n["x-iops-total-max-length"].kind != JNull:
    result.xIopsTotalMaxLength = some(int64(n["x-iops-total-max-length"].getBiggestInt))
  if n.hasKey("x-iops-read") and n["x-iops-read"].kind != JNull:
    result.xIopsRead = some(int64(n["x-iops-read"].getBiggestInt))
  if n.hasKey("x-iops-read-max") and n["x-iops-read-max"].kind != JNull:
    result.xIopsReadMax = some(int64(n["x-iops-read-max"].getBiggestInt))
  if n.hasKey("x-iops-read-max-length") and n["x-iops-read-max-length"].kind != JNull:
    result.xIopsReadMaxLength = some(int64(n["x-iops-read-max-length"].getBiggestInt))
  if n.hasKey("x-iops-write") and n["x-iops-write"].kind != JNull:
    result.xIopsWrite = some(int64(n["x-iops-write"].getBiggestInt))
  if n.hasKey("x-iops-write-max") and n["x-iops-write-max"].kind != JNull:
    result.xIopsWriteMax = some(int64(n["x-iops-write-max"].getBiggestInt))
  if n.hasKey("x-iops-write-max-length") and n["x-iops-write-max-length"].kind != JNull:
    result.xIopsWriteMaxLength = some(int64(n["x-iops-write-max-length"].getBiggestInt))
  if n.hasKey("x-bps-total") and n["x-bps-total"].kind != JNull:
    result.xBpsTotal = some(int64(n["x-bps-total"].getBiggestInt))
  if n.hasKey("x-bps-total-max") and n["x-bps-total-max"].kind != JNull:
    result.xBpsTotalMax = some(int64(n["x-bps-total-max"].getBiggestInt))
  if n.hasKey("x-bps-total-max-length") and n["x-bps-total-max-length"].kind != JNull:
    result.xBpsTotalMaxLength = some(int64(n["x-bps-total-max-length"].getBiggestInt))
  if n.hasKey("x-bps-read") and n["x-bps-read"].kind != JNull:
    result.xBpsRead = some(int64(n["x-bps-read"].getBiggestInt))
  if n.hasKey("x-bps-read-max") and n["x-bps-read-max"].kind != JNull:
    result.xBpsReadMax = some(int64(n["x-bps-read-max"].getBiggestInt))
  if n.hasKey("x-bps-read-max-length") and n["x-bps-read-max-length"].kind != JNull:
    result.xBpsReadMaxLength = some(int64(n["x-bps-read-max-length"].getBiggestInt))
  if n.hasKey("x-bps-write") and n["x-bps-write"].kind != JNull:
    result.xBpsWrite = some(int64(n["x-bps-write"].getBiggestInt))
  if n.hasKey("x-bps-write-max") and n["x-bps-write-max"].kind != JNull:
    result.xBpsWriteMax = some(int64(n["x-bps-write-max"].getBiggestInt))
  if n.hasKey("x-bps-write-max-length") and n["x-bps-write-max-length"].kind != JNull:
    result.xBpsWriteMaxLength = some(int64(n["x-bps-write-max-length"].getBiggestInt))
  if n.hasKey("x-iops-size") and n["x-iops-size"].kind != JNull:
    result.xIopsSize = some(int64(n["x-iops-size"].getBiggestInt))

proc `%`*(x: BlockJobChangeOptionsMirror): JsonNode =
  result = newJObject()
  result["copy-mode"] = %(x.copyMode)

proc parse*(_: typedesc[BlockJobChangeOptionsMirror], n: JsonNode): BlockJobChangeOptionsMirror =
  result = default(BlockJobChangeOptionsMirror)
  result.copyMode = parse(typedesc[MirrorCopyMode], n["copy-mode"])

proc `%`*(x: BlockJobChangeOptions): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %($x.`type`)
  case x.`type`
  of JobType.Mirror:
    let sub = %(x.mirror)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of JobType.Commit: discard
  of JobType.Stream: discard
  of JobType.Backup: discard
  of JobType.Create: discard
  of JobType.Amend: discard
  of JobType.SnapshotLoad: discard
  of JobType.SnapshotSave: discard
  of JobType.SnapshotDelete: discard

proc parse*(_: typedesc[BlockJobChangeOptions], n: JsonNode): BlockJobChangeOptions =
  result = default(BlockJobChangeOptions)
  let tag = parse(typedesc[JobType], n["type"])
  case tag
  of JobType.Mirror:
    result = BlockJobChangeOptions(`type`: tag, mirror: parse(typedesc[BlockJobChangeOptionsMirror], n))
  of JobType.Commit:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.Stream:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.Backup:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.Create:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.Amend:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.SnapshotLoad:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.SnapshotSave:
    result = BlockJobChangeOptions(`type`: tag)
  of JobType.SnapshotDelete:
    result = BlockJobChangeOptions(`type`: tag)
  result.id = n["id"].getStr

proc `%`*(x: BlockdevDiscardOptions): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevDiscardOptions], n: JsonNode): BlockdevDiscardOptions =
  let s = n.getStr
  case s
  of "ignore": BlockdevDiscardOptions.Ignore
  of "unmap": BlockdevDiscardOptions.Unmap
  else: raise newException(ValueError, "unknown BlockdevDiscardOptions: " & s)

proc `%`*(x: BlockdevDetectZeroesOptions): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevDetectZeroesOptions], n: JsonNode): BlockdevDetectZeroesOptions =
  let s = n.getStr
  case s
  of "off": BlockdevDetectZeroesOptions.Off
  of "on": BlockdevDetectZeroesOptions.On
  of "unmap": BlockdevDetectZeroesOptions.Unmap
  else: raise newException(ValueError, "unknown BlockdevDetectZeroesOptions: " & s)

proc `%`*(x: BlockdevAioOptions): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevAioOptions], n: JsonNode): BlockdevAioOptions =
  let s = n.getStr
  case s
  of "threads": BlockdevAioOptions.Threads
  of "native": BlockdevAioOptions.Native
  of "io_uring": BlockdevAioOptions.IoUring
  else: raise newException(ValueError, "unknown BlockdevAioOptions: " & s)

proc `%`*(x: BlockdevCacheOptions): JsonNode =
  result = newJObject()
  if x.direct.isSome: result["direct"] = %(x.direct.get)
  if x.noFlush.isSome: result["no-flush"] = %(x.noFlush.get)

proc parse*(_: typedesc[BlockdevCacheOptions], n: JsonNode): BlockdevCacheOptions =
  result = default(BlockdevCacheOptions)
  if n.hasKey("direct") and n["direct"].kind != JNull:
    result.direct = some(n["direct"].getBool)
  if n.hasKey("no-flush") and n["no-flush"].kind != JNull:
    result.noFlush = some(n["no-flush"].getBool)

proc `%`*(x: BlockdevDriver): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevDriver], n: JsonNode): BlockdevDriver =
  let s = n.getStr
  case s
  of "blkdebug": BlockdevDriver.Blkdebug
  of "blklogwrites": BlockdevDriver.Blklogwrites
  of "blkreplay": BlockdevDriver.Blkreplay
  of "blkverify": BlockdevDriver.Blkverify
  of "bochs": BlockdevDriver.Bochs
  of "cloop": BlockdevDriver.Cloop
  of "compress": BlockdevDriver.Compress
  of "copy-before-write": BlockdevDriver.CopyBeforeWrite
  of "copy-on-read": BlockdevDriver.CopyOnRead
  of "dmg": BlockdevDriver.Dmg
  of "file": BlockdevDriver.File
  of "snapshot-access": BlockdevDriver.SnapshotAccess
  of "ftp": BlockdevDriver.Ftp
  of "ftps": BlockdevDriver.Ftps
  of "gluster": BlockdevDriver.Gluster
  of "host_cdrom": BlockdevDriver.HostCdrom
  of "host_device": BlockdevDriver.HostDevice
  of "http": BlockdevDriver.Http
  of "https": BlockdevDriver.Https
  of "io_uring": BlockdevDriver.IoUring
  of "iscsi": BlockdevDriver.Iscsi
  of "luks": BlockdevDriver.Luks
  of "nbd": BlockdevDriver.Nbd
  of "nfs": BlockdevDriver.Nfs
  of "null-aio": BlockdevDriver.NullAio
  of "null-co": BlockdevDriver.NullCo
  of "nvme": BlockdevDriver.Nvme
  of "nvme-io_uring": BlockdevDriver.NvmeIoUring
  of "parallels": BlockdevDriver.Parallels
  of "preallocate": BlockdevDriver.Preallocate
  of "qcow": BlockdevDriver.Qcow
  of "qcow2": BlockdevDriver.Qcow2
  of "qed": BlockdevDriver.Qed
  of "quorum": BlockdevDriver.Quorum
  of "raw": BlockdevDriver.Raw
  of "rbd": BlockdevDriver.Rbd
  of "replication": BlockdevDriver.Replication
  of "ssh": BlockdevDriver.Ssh
  of "throttle": BlockdevDriver.Throttle
  of "vdi": BlockdevDriver.Vdi
  of "vhdx": BlockdevDriver.Vhdx
  of "virtio-blk-vfio-pci": BlockdevDriver.VirtioBlkVfioPci
  of "virtio-blk-vhost-user": BlockdevDriver.VirtioBlkVhostUser
  of "virtio-blk-vhost-vdpa": BlockdevDriver.VirtioBlkVhostVdpa
  of "vmdk": BlockdevDriver.Vmdk
  of "vpc": BlockdevDriver.Vpc
  of "vvfat": BlockdevDriver.Vvfat
  else: raise newException(ValueError, "unknown BlockdevDriver: " & s)

proc `%`*(x: BlockdevOptionsFile): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  if x.prManager.isSome: result["pr-manager"] = %(x.prManager.get)
  if x.locking.isSome: result["locking"] = %(x.locking.get)
  if x.aio.isSome: result["aio"] = %(x.aio.get)
  if x.aioMaxBatch.isSome: result["aio-max-batch"] = %(x.aioMaxBatch.get)
  if x.dropCache.isSome: result["drop-cache"] = %(x.dropCache.get)
  if x.xCheckCacheDropped.isSome: result["x-check-cache-dropped"] = %(x.xCheckCacheDropped.get)

proc parse*(_: typedesc[BlockdevOptionsFile], n: JsonNode): BlockdevOptionsFile =
  result = default(BlockdevOptionsFile)
  result.filename = n["filename"].getStr
  if n.hasKey("pr-manager") and n["pr-manager"].kind != JNull:
    result.prManager = some(n["pr-manager"].getStr)
  if n.hasKey("locking") and n["locking"].kind != JNull:
    result.locking = some(parse(typedesc[OnOffAuto], n["locking"]))
  if n.hasKey("aio") and n["aio"].kind != JNull:
    result.aio = some(parse(typedesc[BlockdevAioOptions], n["aio"]))
  if n.hasKey("aio-max-batch") and n["aio-max-batch"].kind != JNull:
    result.aioMaxBatch = some(int64(n["aio-max-batch"].getBiggestInt))
  if n.hasKey("drop-cache") and n["drop-cache"].kind != JNull:
    result.dropCache = some(n["drop-cache"].getBool)
  if n.hasKey("x-check-cache-dropped") and n["x-check-cache-dropped"].kind != JNull:
    result.xCheckCacheDropped = some(n["x-check-cache-dropped"].getBool)

proc `%`*(x: BlockdevOptionsNull): JsonNode =
  result = newJObject()
  if x.size.isSome: result["size"] = %(x.size.get)
  if x.latencyNs.isSome: result["latency-ns"] = %(x.latencyNs.get)
  if x.readZeroes.isSome: result["read-zeroes"] = %(x.readZeroes.get)

proc parse*(_: typedesc[BlockdevOptionsNull], n: JsonNode): BlockdevOptionsNull =
  result = default(BlockdevOptionsNull)
  if n.hasKey("size") and n["size"].kind != JNull:
    result.size = some(int64(n["size"].getBiggestInt))
  if n.hasKey("latency-ns") and n["latency-ns"].kind != JNull:
    result.latencyNs = some(cast[uint64](n["latency-ns"].getBiggestInt))
  if n.hasKey("read-zeroes") and n["read-zeroes"].kind != JNull:
    result.readZeroes = some(n["read-zeroes"].getBool)

proc `%`*(x: BlockdevOptionsNVMe): JsonNode =
  result = newJObject()
  result["device"] = %(x.device)
  result["namespace"] = %(x.namespace)

proc parse*(_: typedesc[BlockdevOptionsNVMe], n: JsonNode): BlockdevOptionsNVMe =
  result = default(BlockdevOptionsNVMe)
  result.device = n["device"].getStr
  result.namespace = int64(n["namespace"].getBiggestInt)

proc `%`*(x: BlockdevOptionsVVFAT): JsonNode =
  result = newJObject()
  result["dir"] = %(x.dir)
  if x.fatType.isSome: result["fat-type"] = %(x.fatType.get)
  if x.floppy.isSome: result["floppy"] = %(x.floppy.get)
  if x.label.isSome: result["label"] = %(x.label.get)
  if x.rw.isSome: result["rw"] = %(x.rw.get)

proc parse*(_: typedesc[BlockdevOptionsVVFAT], n: JsonNode): BlockdevOptionsVVFAT =
  result = default(BlockdevOptionsVVFAT)
  result.dir = n["dir"].getStr
  if n.hasKey("fat-type") and n["fat-type"].kind != JNull:
    result.fatType = some(int64(n["fat-type"].getBiggestInt))
  if n.hasKey("floppy") and n["floppy"].kind != JNull:
    result.floppy = some(n["floppy"].getBool)
  if n.hasKey("label") and n["label"].kind != JNull:
    result.label = some(n["label"].getStr)
  if n.hasKey("rw") and n["rw"].kind != JNull:
    result.rw = some(n["rw"].getBool)

proc `%`*(x: BlockdevOptionsGenericFormat): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)

proc parse*(_: typedesc[BlockdevOptionsGenericFormat], n: JsonNode): BlockdevOptionsGenericFormat =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])

proc `%`*(x: BlockdevOptionsLUKS): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)
  if x.header.isSome: result["header"] = %(x.header.get)

proc parse*(_: typedesc[BlockdevOptionsLUKS], n: JsonNode): BlockdevOptionsLUKS =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)
  if n.hasKey("header") and n["header"].kind != JNull:
    result.header = some(parse(typedesc[BlockdevRef], n["header"]))

proc `%`*(x: BlockdevOptionsGenericCOWFormat): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.backing.isSome: result["backing"] = %(x.backing.get)

proc parse*(_: typedesc[BlockdevOptionsGenericCOWFormat], n: JsonNode): BlockdevOptionsGenericCOWFormat =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("backing") and n["backing"].kind != JNull:
    result.backing = some(parse(typedesc[BlockdevRefOrNull], n["backing"]))

proc `%`*(x: Qcow2OverlapCheckMode): JsonNode = %($x)
proc parse*(_: typedesc[Qcow2OverlapCheckMode], n: JsonNode): Qcow2OverlapCheckMode =
  let s = n.getStr
  case s
  of "none": Qcow2OverlapCheckMode.None
  of "constant": Qcow2OverlapCheckMode.Constant
  of "cached": Qcow2OverlapCheckMode.Cached
  of "all": Qcow2OverlapCheckMode.All
  else: raise newException(ValueError, "unknown Qcow2OverlapCheckMode: " & s)

proc `%`*(x: Qcow2OverlapCheckFlags): JsonNode =
  result = newJObject()
  if x.`template`.isSome: result["template"] = %(x.`template`.get)
  if x.mainHeader.isSome: result["main-header"] = %(x.mainHeader.get)
  if x.activeL1.isSome: result["active-l1"] = %(x.activeL1.get)
  if x.activeL2.isSome: result["active-l2"] = %(x.activeL2.get)
  if x.refcountTable.isSome: result["refcount-table"] = %(x.refcountTable.get)
  if x.refcountBlock.isSome: result["refcount-block"] = %(x.refcountBlock.get)
  if x.snapshotTable.isSome: result["snapshot-table"] = %(x.snapshotTable.get)
  if x.inactiveL1.isSome: result["inactive-l1"] = %(x.inactiveL1.get)
  if x.inactiveL2.isSome: result["inactive-l2"] = %(x.inactiveL2.get)
  if x.bitmapDirectory.isSome: result["bitmap-directory"] = %(x.bitmapDirectory.get)

proc parse*(_: typedesc[Qcow2OverlapCheckFlags], n: JsonNode): Qcow2OverlapCheckFlags =
  result = default(Qcow2OverlapCheckFlags)
  if n.hasKey("template") and n["template"].kind != JNull:
    result.`template` = some(parse(typedesc[Qcow2OverlapCheckMode], n["template"]))
  if n.hasKey("main-header") and n["main-header"].kind != JNull:
    result.mainHeader = some(n["main-header"].getBool)
  if n.hasKey("active-l1") and n["active-l1"].kind != JNull:
    result.activeL1 = some(n["active-l1"].getBool)
  if n.hasKey("active-l2") and n["active-l2"].kind != JNull:
    result.activeL2 = some(n["active-l2"].getBool)
  if n.hasKey("refcount-table") and n["refcount-table"].kind != JNull:
    result.refcountTable = some(n["refcount-table"].getBool)
  if n.hasKey("refcount-block") and n["refcount-block"].kind != JNull:
    result.refcountBlock = some(n["refcount-block"].getBool)
  if n.hasKey("snapshot-table") and n["snapshot-table"].kind != JNull:
    result.snapshotTable = some(n["snapshot-table"].getBool)
  if n.hasKey("inactive-l1") and n["inactive-l1"].kind != JNull:
    result.inactiveL1 = some(n["inactive-l1"].getBool)
  if n.hasKey("inactive-l2") and n["inactive-l2"].kind != JNull:
    result.inactiveL2 = some(n["inactive-l2"].getBool)
  if n.hasKey("bitmap-directory") and n["bitmap-directory"].kind != JNull:
    result.bitmapDirectory = some(n["bitmap-directory"].getBool)

proc `%`*(x: Qcow2OverlapChecks): JsonNode =
  case x.kind
  of Qcow2OverlapChecksKind.Flags: %(x.flags)
  of Qcow2OverlapChecksKind.Mode: %(x.mode)

proc parse*(_: typedesc[Qcow2OverlapChecks], n: JsonNode): Qcow2OverlapChecks =
  result = default(Qcow2OverlapChecks)
  if n.kind == JObject:
    result = Qcow2OverlapChecks(kind: Qcow2OverlapChecksKind.Flags, flags: parse(typedesc[Qcow2OverlapCheckFlags], n))
  elif n.kind == JObject:
    result = Qcow2OverlapChecks(kind: Qcow2OverlapChecksKind.Mode, mode: parse(typedesc[Qcow2OverlapCheckMode], n))
  else: raise newException(ValueError,
      "cannot decode Qcow2OverlapChecks from JSON")

proc `%`*(x: BlockdevQcowEncryptionFormat): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevQcowEncryptionFormat], n: JsonNode): BlockdevQcowEncryptionFormat =
  let s = n.getStr
  case s
  of "aes": BlockdevQcowEncryptionFormat.Aes
  else: raise newException(ValueError, "unknown BlockdevQcowEncryptionFormat: " & s)

proc `%`*(x: BlockdevQcowEncryption): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of BlockdevQcowEncryptionFormat.Aes:
    let sub = %(x.aes)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[BlockdevQcowEncryption], n: JsonNode): BlockdevQcowEncryption =
  result = default(BlockdevQcowEncryption)
  let tag = parse(typedesc[BlockdevQcowEncryptionFormat], n["format"])
  case tag
  of BlockdevQcowEncryptionFormat.Aes:
    result = BlockdevQcowEncryption(format: tag, aes: parse(typedesc[QCryptoBlockOptionsQCow], n))

proc `%`*(x: BlockdevOptionsQcow): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.backing.isSome: result["backing"] = %(x.backing.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)

proc parse*(_: typedesc[BlockdevOptionsQcow], n: JsonNode): BlockdevOptionsQcow =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("backing") and n["backing"].kind != JNull:
    result.backing = some(parse(typedesc[BlockdevRefOrNull], n["backing"]))
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[BlockdevQcowEncryption], n["encrypt"]))

proc `%`*(x: BlockdevQcow2EncryptionFormat): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevQcow2EncryptionFormat], n: JsonNode): BlockdevQcow2EncryptionFormat =
  let s = n.getStr
  case s
  of "aes": BlockdevQcow2EncryptionFormat.Aes
  of "luks": BlockdevQcow2EncryptionFormat.Luks
  else: raise newException(ValueError, "unknown BlockdevQcow2EncryptionFormat: " & s)

proc `%`*(x: BlockdevQcow2Encryption): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of BlockdevQcow2EncryptionFormat.Aes:
    let sub = %(x.aes)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevQcow2EncryptionFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[BlockdevQcow2Encryption], n: JsonNode): BlockdevQcow2Encryption =
  result = default(BlockdevQcow2Encryption)
  let tag = parse(typedesc[BlockdevQcow2EncryptionFormat], n["format"])
  case tag
  of BlockdevQcow2EncryptionFormat.Aes:
    result = BlockdevQcow2Encryption(format: tag, aes: parse(typedesc[QCryptoBlockOptionsQCow], n))
  of BlockdevQcow2EncryptionFormat.Luks:
    result = BlockdevQcow2Encryption(format: tag, luks: parse(typedesc[QCryptoBlockOptionsLUKS], n))

proc `%`*(x: BlockdevOptionsPreallocate): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.preallocAlign.isSome: result["prealloc-align"] = %(x.preallocAlign.get)
  if x.preallocSize.isSome: result["prealloc-size"] = %(x.preallocSize.get)

proc parse*(_: typedesc[BlockdevOptionsPreallocate], n: JsonNode): BlockdevOptionsPreallocate =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("prealloc-align") and n["prealloc-align"].kind != JNull:
    result.preallocAlign = some(int64(n["prealloc-align"].getBiggestInt))
  if n.hasKey("prealloc-size") and n["prealloc-size"].kind != JNull:
    result.preallocSize = some(int64(n["prealloc-size"].getBiggestInt))

proc `%`*(x: BlockdevOptionsQcow2): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.backing.isSome: result["backing"] = %(x.backing.get)
  if x.lazyRefcounts.isSome: result["lazy-refcounts"] = %(x.lazyRefcounts.get)
  if x.passDiscardRequest.isSome: result["pass-discard-request"] = %(x.passDiscardRequest.get)
  if x.passDiscardSnapshot.isSome: result["pass-discard-snapshot"] = %(x.passDiscardSnapshot.get)
  if x.passDiscardOther.isSome: result["pass-discard-other"] = %(x.passDiscardOther.get)
  if x.discardNoUnref.isSome: result["discard-no-unref"] = %(x.discardNoUnref.get)
  if x.overlapCheck.isSome: result["overlap-check"] = %(x.overlapCheck.get)
  if x.cacheSize.isSome: result["cache-size"] = %(x.cacheSize.get)
  if x.l2CacheSize.isSome: result["l2-cache-size"] = %(x.l2CacheSize.get)
  if x.l2CacheEntrySize.isSome: result["l2-cache-entry-size"] = %(x.l2CacheEntrySize.get)
  if x.refcountCacheSize.isSome: result["refcount-cache-size"] = %(x.refcountCacheSize.get)
  if x.cacheCleanInterval.isSome: result["cache-clean-interval"] = %(x.cacheCleanInterval.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)
  if x.dataFile.isSome: result["data-file"] = %(x.dataFile.get)

proc parse*(_: typedesc[BlockdevOptionsQcow2], n: JsonNode): BlockdevOptionsQcow2 =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("backing") and n["backing"].kind != JNull:
    result.backing = some(parse(typedesc[BlockdevRefOrNull], n["backing"]))
  if n.hasKey("lazy-refcounts") and n["lazy-refcounts"].kind != JNull:
    result.lazyRefcounts = some(n["lazy-refcounts"].getBool)
  if n.hasKey("pass-discard-request") and n["pass-discard-request"].kind != JNull:
    result.passDiscardRequest = some(n["pass-discard-request"].getBool)
  if n.hasKey("pass-discard-snapshot") and n["pass-discard-snapshot"].kind != JNull:
    result.passDiscardSnapshot = some(n["pass-discard-snapshot"].getBool)
  if n.hasKey("pass-discard-other") and n["pass-discard-other"].kind != JNull:
    result.passDiscardOther = some(n["pass-discard-other"].getBool)
  if n.hasKey("discard-no-unref") and n["discard-no-unref"].kind != JNull:
    result.discardNoUnref = some(n["discard-no-unref"].getBool)
  if n.hasKey("overlap-check") and n["overlap-check"].kind != JNull:
    result.overlapCheck = some(parse(typedesc[Qcow2OverlapChecks], n["overlap-check"]))
  if n.hasKey("cache-size") and n["cache-size"].kind != JNull:
    result.cacheSize = some(int64(n["cache-size"].getBiggestInt))
  if n.hasKey("l2-cache-size") and n["l2-cache-size"].kind != JNull:
    result.l2CacheSize = some(int64(n["l2-cache-size"].getBiggestInt))
  if n.hasKey("l2-cache-entry-size") and n["l2-cache-entry-size"].kind != JNull:
    result.l2CacheEntrySize = some(int64(n["l2-cache-entry-size"].getBiggestInt))
  if n.hasKey("refcount-cache-size") and n["refcount-cache-size"].kind != JNull:
    result.refcountCacheSize = some(int64(n["refcount-cache-size"].getBiggestInt))
  if n.hasKey("cache-clean-interval") and n["cache-clean-interval"].kind != JNull:
    result.cacheCleanInterval = some(int64(n["cache-clean-interval"].getBiggestInt))
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[BlockdevQcow2Encryption], n["encrypt"]))
  if n.hasKey("data-file") and n["data-file"].kind != JNull:
    result.dataFile = some(parse(typedesc[BlockdevRef], n["data-file"]))

proc `%`*(x: SshHostKeyCheckMode): JsonNode = %($x)
proc parse*(_: typedesc[SshHostKeyCheckMode], n: JsonNode): SshHostKeyCheckMode =
  let s = n.getStr
  case s
  of "none": SshHostKeyCheckMode.None
  of "hash": SshHostKeyCheckMode.Hash
  of "known_hosts": SshHostKeyCheckMode.KnownHosts
  else: raise newException(ValueError, "unknown SshHostKeyCheckMode: " & s)

proc `%`*(x: SshHostKeyCheckHashType): JsonNode = %($x)
proc parse*(_: typedesc[SshHostKeyCheckHashType], n: JsonNode): SshHostKeyCheckHashType =
  let s = n.getStr
  case s
  of "md5": SshHostKeyCheckHashType.Md5
  of "sha1": SshHostKeyCheckHashType.Sha1
  of "sha256": SshHostKeyCheckHashType.Sha256
  else: raise newException(ValueError, "unknown SshHostKeyCheckHashType: " & s)

proc `%`*(x: SshHostKeyHash): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)
  result["hash"] = %(x.hash)

proc parse*(_: typedesc[SshHostKeyHash], n: JsonNode): SshHostKeyHash =
  result = default(SshHostKeyHash)
  result.`type` = parse(typedesc[SshHostKeyCheckHashType], n["type"])
  result.hash = n["hash"].getStr

proc `%`*(x: SshHostKeyCheck): JsonNode =
  result = newJObject()
  result["mode"] = %($x.mode)
  case x.mode
  of SshHostKeyCheckMode.Hash:
    let sub = %(x.hash)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SshHostKeyCheckMode.None: discard
  of SshHostKeyCheckMode.KnownHosts: discard

proc parse*(_: typedesc[SshHostKeyCheck], n: JsonNode): SshHostKeyCheck =
  result = default(SshHostKeyCheck)
  let tag = parse(typedesc[SshHostKeyCheckMode], n["mode"])
  case tag
  of SshHostKeyCheckMode.Hash:
    result = SshHostKeyCheck(mode: tag, hash: parse(typedesc[SshHostKeyHash], n))
  of SshHostKeyCheckMode.None:
    result = SshHostKeyCheck(mode: tag)
  of SshHostKeyCheckMode.KnownHosts:
    result = SshHostKeyCheck(mode: tag)

proc `%`*(x: BlockdevOptionsSsh): JsonNode =
  result = newJObject()
  result["server"] = %(x.server)
  result["path"] = %(x.path)
  if x.user.isSome: result["user"] = %(x.user.get)
  if x.hostKeyCheck.isSome: result["host-key-check"] = %(x.hostKeyCheck.get)

proc parse*(_: typedesc[BlockdevOptionsSsh], n: JsonNode): BlockdevOptionsSsh =
  result = default(BlockdevOptionsSsh)
  result.server = parse(typedesc[InetSocketAddress], n["server"])
  result.path = n["path"].getStr
  if n.hasKey("user") and n["user"].kind != JNull:
    result.user = some(n["user"].getStr)
  if n.hasKey("host-key-check") and n["host-key-check"].kind != JNull:
    result.hostKeyCheck = some(parse(typedesc[SshHostKeyCheck], n["host-key-check"]))

proc `%`*(x: BlkdebugEvent): JsonNode = %($x)
proc parse*(_: typedesc[BlkdebugEvent], n: JsonNode): BlkdebugEvent =
  let s = n.getStr
  case s
  of "l1_update": BlkdebugEvent.L1Update
  of "l1_grow_alloc_table": BlkdebugEvent.L1GrowAllocTable
  of "l1_grow_write_table": BlkdebugEvent.L1GrowWriteTable
  of "l1_grow_activate_table": BlkdebugEvent.L1GrowActivateTable
  of "l2_load": BlkdebugEvent.L2Load
  of "l2_update": BlkdebugEvent.L2Update
  of "l2_update_compressed": BlkdebugEvent.L2UpdateCompressed
  of "l2_alloc_cow_read": BlkdebugEvent.L2AllocCowRead
  of "l2_alloc_write": BlkdebugEvent.L2AllocWrite
  of "read_aio": BlkdebugEvent.ReadAio
  of "read_backing_aio": BlkdebugEvent.ReadBackingAio
  of "read_compressed": BlkdebugEvent.ReadCompressed
  of "write_aio": BlkdebugEvent.WriteAio
  of "write_compressed": BlkdebugEvent.WriteCompressed
  of "vmstate_load": BlkdebugEvent.VmstateLoad
  of "vmstate_save": BlkdebugEvent.VmstateSave
  of "cow_read": BlkdebugEvent.CowRead
  of "cow_write": BlkdebugEvent.CowWrite
  of "reftable_load": BlkdebugEvent.ReftableLoad
  of "reftable_grow": BlkdebugEvent.ReftableGrow
  of "reftable_update": BlkdebugEvent.ReftableUpdate
  of "refblock_load": BlkdebugEvent.RefblockLoad
  of "refblock_update": BlkdebugEvent.RefblockUpdate
  of "refblock_update_part": BlkdebugEvent.RefblockUpdatePart
  of "refblock_alloc": BlkdebugEvent.RefblockAlloc
  of "refblock_alloc_hookup": BlkdebugEvent.RefblockAllocHookup
  of "refblock_alloc_write": BlkdebugEvent.RefblockAllocWrite
  of "refblock_alloc_write_blocks": BlkdebugEvent.RefblockAllocWriteBlocks
  of "refblock_alloc_write_table": BlkdebugEvent.RefblockAllocWriteTable
  of "refblock_alloc_switch_table": BlkdebugEvent.RefblockAllocSwitchTable
  of "cluster_alloc": BlkdebugEvent.ClusterAlloc
  of "cluster_alloc_bytes": BlkdebugEvent.ClusterAllocBytes
  of "cluster_free": BlkdebugEvent.ClusterFree
  of "flush_to_os": BlkdebugEvent.FlushToOs
  of "flush_to_disk": BlkdebugEvent.FlushToDisk
  of "pwritev_rmw_head": BlkdebugEvent.PwritevRmwHead
  of "pwritev_rmw_after_head": BlkdebugEvent.PwritevRmwAfterHead
  of "pwritev_rmw_tail": BlkdebugEvent.PwritevRmwTail
  of "pwritev_rmw_after_tail": BlkdebugEvent.PwritevRmwAfterTail
  of "pwritev": BlkdebugEvent.Pwritev
  of "pwritev_zero": BlkdebugEvent.PwritevZero
  of "pwritev_done": BlkdebugEvent.PwritevDone
  of "empty_image_prepare": BlkdebugEvent.EmptyImagePrepare
  of "l1_shrink_write_table": BlkdebugEvent.L1ShrinkWriteTable
  of "l1_shrink_free_l2_clusters": BlkdebugEvent.L1ShrinkFreeL2Clusters
  of "cor_write": BlkdebugEvent.CorWrite
  of "cluster_alloc_space": BlkdebugEvent.ClusterAllocSpace
  of "none": BlkdebugEvent.None
  else: raise newException(ValueError, "unknown BlkdebugEvent: " & s)

proc `%`*(x: BlkdebugIOType): JsonNode = %($x)
proc parse*(_: typedesc[BlkdebugIOType], n: JsonNode): BlkdebugIOType =
  let s = n.getStr
  case s
  of "read": BlkdebugIOType.Read
  of "write": BlkdebugIOType.Write
  of "write-zeroes": BlkdebugIOType.WriteZeroes
  of "discard": BlkdebugIOType.Discard
  of "flush": BlkdebugIOType.Flush
  of "block-status": BlkdebugIOType.BlockStatus
  else: raise newException(ValueError, "unknown BlkdebugIOType: " & s)

proc `%`*(x: BlkdebugInjectErrorOptions): JsonNode =
  result = newJObject()
  result["event"] = %(x.event)
  if x.state.isSome: result["state"] = %(x.state.get)
  if x.iotype.isSome: result["iotype"] = %(x.iotype.get)
  if x.errno.isSome: result["errno"] = %(x.errno.get)
  if x.sector.isSome: result["sector"] = %(x.sector.get)
  if x.once.isSome: result["once"] = %(x.once.get)
  if x.immediately.isSome: result["immediately"] = %(x.immediately.get)

proc parse*(_: typedesc[BlkdebugInjectErrorOptions], n: JsonNode): BlkdebugInjectErrorOptions =
  result = default(BlkdebugInjectErrorOptions)
  result.event = parse(typedesc[BlkdebugEvent], n["event"])
  if n.hasKey("state") and n["state"].kind != JNull:
    result.state = some(int64(n["state"].getBiggestInt))
  if n.hasKey("iotype") and n["iotype"].kind != JNull:
    result.iotype = some(parse(typedesc[BlkdebugIOType], n["iotype"]))
  if n.hasKey("errno") and n["errno"].kind != JNull:
    result.errno = some(int64(n["errno"].getBiggestInt))
  if n.hasKey("sector") and n["sector"].kind != JNull:
    result.sector = some(int64(n["sector"].getBiggestInt))
  if n.hasKey("once") and n["once"].kind != JNull:
    result.once = some(n["once"].getBool)
  if n.hasKey("immediately") and n["immediately"].kind != JNull:
    result.immediately = some(n["immediately"].getBool)

proc `%`*(x: BlkdebugSetStateOptions): JsonNode =
  result = newJObject()
  result["event"] = %(x.event)
  if x.state.isSome: result["state"] = %(x.state.get)
  result["new_state"] = %(x.newState)

proc parse*(_: typedesc[BlkdebugSetStateOptions], n: JsonNode): BlkdebugSetStateOptions =
  result = default(BlkdebugSetStateOptions)
  result.event = parse(typedesc[BlkdebugEvent], n["event"])
  if n.hasKey("state") and n["state"].kind != JNull:
    result.state = some(int64(n["state"].getBiggestInt))
  result.newState = int64(n["new_state"].getBiggestInt)

proc `%`*(x: BlockdevOptionsBlkdebug): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["image"] = %(x.image)
  if x.config.isSome: result["config"] = %(x.config.get)
  if x.align.isSome: result["align"] = %(x.align.get)
  if x.maxTransfer.isSome: result["max-transfer"] = %(x.maxTransfer.get)
  if x.optWriteZero.isSome: result["opt-write-zero"] = %(x.optWriteZero.get)
  if x.maxWriteZero.isSome: result["max-write-zero"] = %(x.maxWriteZero.get)
  if x.optDiscard.isSome: result["opt-discard"] = %(x.optDiscard.get)
  if x.maxDiscard.isSome: result["max-discard"] = %(x.maxDiscard.get)
  if x.injectError.isSome: result["inject-error"] = %(x.injectError.get)
  if x.setState.isSome: result["set-state"] = %(x.setState.get)
  if x.takeChildPerms.isSome: result["take-child-perms"] = %(x.takeChildPerms.get)
  if x.unshareChildPerms.isSome: result["unshare-child-perms"] = %(x.unshareChildPerms.get)

proc parse*(_: typedesc[BlockdevOptionsBlkdebug], n: JsonNode): BlockdevOptionsBlkdebug =
  if n.kind == JNull: return nil
  new(result)
  result.image = parse(typedesc[BlockdevRef], n["image"])
  if n.hasKey("config") and n["config"].kind != JNull:
    result.config = some(n["config"].getStr)
  if n.hasKey("align") and n["align"].kind != JNull:
    result.align = some(int64(n["align"].getBiggestInt))
  if n.hasKey("max-transfer") and n["max-transfer"].kind != JNull:
    result.maxTransfer = some(int32(n["max-transfer"].getBiggestInt))
  if n.hasKey("opt-write-zero") and n["opt-write-zero"].kind != JNull:
    result.optWriteZero = some(int32(n["opt-write-zero"].getBiggestInt))
  if n.hasKey("max-write-zero") and n["max-write-zero"].kind != JNull:
    result.maxWriteZero = some(int32(n["max-write-zero"].getBiggestInt))
  if n.hasKey("opt-discard") and n["opt-discard"].kind != JNull:
    result.optDiscard = some(int32(n["opt-discard"].getBiggestInt))
  if n.hasKey("max-discard") and n["max-discard"].kind != JNull:
    result.maxDiscard = some(int32(n["max-discard"].getBiggestInt))
  if n.hasKey("inject-error") and n["inject-error"].kind != JNull:
    result.injectError = some((n["inject-error"]).getElems.mapIt(parse(typedesc[BlkdebugInjectErrorOptions], it)))
  if n.hasKey("set-state") and n["set-state"].kind != JNull:
    result.setState = some((n["set-state"]).getElems.mapIt(parse(typedesc[BlkdebugSetStateOptions], it)))
  if n.hasKey("take-child-perms") and n["take-child-perms"].kind != JNull:
    result.takeChildPerms = some((n["take-child-perms"]).getElems.mapIt(parse(typedesc[BlockPermission], it)))
  if n.hasKey("unshare-child-perms") and n["unshare-child-perms"].kind != JNull:
    result.unshareChildPerms = some((n["unshare-child-perms"]).getElems.mapIt(parse(typedesc[BlockPermission], it)))

proc `%`*(x: BlockdevOptionsBlklogwrites): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  result["log"] = %(x.log)
  if x.logSectorSize.isSome: result["log-sector-size"] = %(x.logSectorSize.get)
  if x.logAppend.isSome: result["log-append"] = %(x.logAppend.get)
  if x.logSuperUpdateInterval.isSome: result["log-super-update-interval"] = %(x.logSuperUpdateInterval.get)

proc parse*(_: typedesc[BlockdevOptionsBlklogwrites], n: JsonNode): BlockdevOptionsBlklogwrites =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.log = parse(typedesc[BlockdevRef], n["log"])
  if n.hasKey("log-sector-size") and n["log-sector-size"].kind != JNull:
    result.logSectorSize = some(uint32(n["log-sector-size"].getBiggestInt))
  if n.hasKey("log-append") and n["log-append"].kind != JNull:
    result.logAppend = some(n["log-append"].getBool)
  if n.hasKey("log-super-update-interval") and n["log-super-update-interval"].kind != JNull:
    result.logSuperUpdateInterval = some(cast[uint64](n["log-super-update-interval"].getBiggestInt))

proc `%`*(x: BlockdevOptionsBlkverify): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["test"] = %(x.test)
  result["raw"] = %(x.raw)

proc parse*(_: typedesc[BlockdevOptionsBlkverify], n: JsonNode): BlockdevOptionsBlkverify =
  if n.kind == JNull: return nil
  new(result)
  result.test = parse(typedesc[BlockdevRef], n["test"])
  result.raw = parse(typedesc[BlockdevRef], n["raw"])

proc `%`*(x: BlockdevOptionsBlkreplay): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["image"] = %(x.image)

proc parse*(_: typedesc[BlockdevOptionsBlkreplay], n: JsonNode): BlockdevOptionsBlkreplay =
  if n.kind == JNull: return nil
  new(result)
  result.image = parse(typedesc[BlockdevRef], n["image"])

proc `%`*(x: QuorumReadPattern): JsonNode = %($x)
proc parse*(_: typedesc[QuorumReadPattern], n: JsonNode): QuorumReadPattern =
  let s = n.getStr
  case s
  of "quorum": QuorumReadPattern.Quorum
  of "fifo": QuorumReadPattern.Fifo
  else: raise newException(ValueError, "unknown QuorumReadPattern: " & s)

proc `%`*(x: BlockdevOptionsQuorum): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  if x.blkverify.isSome: result["blkverify"] = %(x.blkverify.get)
  result["children"] = %(x.children)
  result["vote-threshold"] = %(x.voteThreshold)
  if x.rewriteCorrupted.isSome: result["rewrite-corrupted"] = %(x.rewriteCorrupted.get)
  if x.readPattern.isSome: result["read-pattern"] = %(x.readPattern.get)

proc parse*(_: typedesc[BlockdevOptionsQuorum], n: JsonNode): BlockdevOptionsQuorum =
  if n.kind == JNull: return nil
  new(result)
  if n.hasKey("blkverify") and n["blkverify"].kind != JNull:
    result.blkverify = some(n["blkverify"].getBool)
  result.children = (n["children"]).getElems.mapIt(parse(typedesc[BlockdevRef], it))
  result.voteThreshold = int64(n["vote-threshold"].getBiggestInt)
  if n.hasKey("rewrite-corrupted") and n["rewrite-corrupted"].kind != JNull:
    result.rewriteCorrupted = some(n["rewrite-corrupted"].getBool)
  if n.hasKey("read-pattern") and n["read-pattern"].kind != JNull:
    result.readPattern = some(parse(typedesc[QuorumReadPattern], n["read-pattern"]))

proc `%`*(x: BlockdevOptionsGluster): JsonNode =
  result = newJObject()
  result["volume"] = %(x.volume)
  result["path"] = %(x.path)
  result["server"] = %(x.server)
  if x.debug.isSome: result["debug"] = %(x.debug.get)
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)

proc parse*(_: typedesc[BlockdevOptionsGluster], n: JsonNode): BlockdevOptionsGluster =
  result = default(BlockdevOptionsGluster)
  result.volume = n["volume"].getStr
  result.path = n["path"].getStr
  result.server = (n["server"]).getElems.mapIt(parse(typedesc[SocketAddress], it))
  if n.hasKey("debug") and n["debug"].kind != JNull:
    result.debug = some(int64(n["debug"].getBiggestInt))
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)

proc `%`*(x: BlockdevOptionsIoUring): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)

proc parse*(_: typedesc[BlockdevOptionsIoUring], n: JsonNode): BlockdevOptionsIoUring =
  result = default(BlockdevOptionsIoUring)
  result.filename = n["filename"].getStr

proc `%`*(x: BlockdevOptionsNvmeIoUring): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)

proc parse*(_: typedesc[BlockdevOptionsNvmeIoUring], n: JsonNode): BlockdevOptionsNvmeIoUring =
  result = default(BlockdevOptionsNvmeIoUring)
  result.path = n["path"].getStr

proc `%`*(x: BlockdevOptionsVirtioBlkVfioPci): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)

proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVfioPci], n: JsonNode): BlockdevOptionsVirtioBlkVfioPci =
  result = default(BlockdevOptionsVirtioBlkVfioPci)
  result.path = n["path"].getStr

proc `%`*(x: BlockdevOptionsVirtioBlkVhostUser): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)

proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVhostUser], n: JsonNode): BlockdevOptionsVirtioBlkVhostUser =
  result = default(BlockdevOptionsVirtioBlkVhostUser)
  result.path = n["path"].getStr

proc `%`*(x: BlockdevOptionsVirtioBlkVhostVdpa): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)

proc parse*(_: typedesc[BlockdevOptionsVirtioBlkVhostVdpa], n: JsonNode): BlockdevOptionsVirtioBlkVhostVdpa =
  result = default(BlockdevOptionsVirtioBlkVhostVdpa)
  result.path = n["path"].getStr

proc `%`*(x: IscsiTransport): JsonNode = %($x)
proc parse*(_: typedesc[IscsiTransport], n: JsonNode): IscsiTransport =
  let s = n.getStr
  case s
  of "tcp": IscsiTransport.Tcp
  of "iser": IscsiTransport.Iser
  else: raise newException(ValueError, "unknown IscsiTransport: " & s)

proc `%`*(x: IscsiHeaderDigest): JsonNode = %($x)
proc parse*(_: typedesc[IscsiHeaderDigest], n: JsonNode): IscsiHeaderDigest =
  let s = n.getStr
  case s
  of "crc32c": IscsiHeaderDigest.Crc32c
  of "none": IscsiHeaderDigest.None
  of "crc32c-none": IscsiHeaderDigest.Crc32cNone
  of "none-crc32c": IscsiHeaderDigest.NoneCrc32c
  else: raise newException(ValueError, "unknown IscsiHeaderDigest: " & s)

proc `%`*(x: BlockdevOptionsIscsi): JsonNode =
  result = newJObject()
  result["transport"] = %(x.transport)
  result["portal"] = %(x.portal)
  result["target"] = %(x.target)
  if x.lun.isSome: result["lun"] = %(x.lun.get)
  if x.user.isSome: result["user"] = %(x.user.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.initiatorName.isSome: result["initiator-name"] = %(x.initiatorName.get)
  if x.headerDigest.isSome: result["header-digest"] = %(x.headerDigest.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)

proc parse*(_: typedesc[BlockdevOptionsIscsi], n: JsonNode): BlockdevOptionsIscsi =
  result = default(BlockdevOptionsIscsi)
  result.transport = parse(typedesc[IscsiTransport], n["transport"])
  result.portal = n["portal"].getStr
  result.target = n["target"].getStr
  if n.hasKey("lun") and n["lun"].kind != JNull:
    result.lun = some(int64(n["lun"].getBiggestInt))
  if n.hasKey("user") and n["user"].kind != JNull:
    result.user = some(n["user"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("initiator-name") and n["initiator-name"].kind != JNull:
    result.initiatorName = some(n["initiator-name"].getStr)
  if n.hasKey("header-digest") and n["header-digest"].kind != JNull:
    result.headerDigest = some(parse(typedesc[IscsiHeaderDigest], n["header-digest"]))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))

proc `%`*(x: RbdAuthMode): JsonNode = %($x)
proc parse*(_: typedesc[RbdAuthMode], n: JsonNode): RbdAuthMode =
  let s = n.getStr
  case s
  of "cephx": RbdAuthMode.Cephx
  of "none": RbdAuthMode.None
  else: raise newException(ValueError, "unknown RbdAuthMode: " & s)

proc `%`*(x: RbdImageEncryptionFormat): JsonNode = %($x)
proc parse*(_: typedesc[RbdImageEncryptionFormat], n: JsonNode): RbdImageEncryptionFormat =
  let s = n.getStr
  case s
  of "luks": RbdImageEncryptionFormat.Luks
  of "luks2": RbdImageEncryptionFormat.Luks2
  of "luks-any": RbdImageEncryptionFormat.LuksAny
  else: raise newException(ValueError, "unknown RbdImageEncryptionFormat: " & s)

proc `%`*(x: RbdEncryptionOptionsLUKSBase): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)

proc parse*(_: typedesc[RbdEncryptionOptionsLUKSBase], n: JsonNode): RbdEncryptionOptionsLUKSBase =
  result = default(RbdEncryptionOptionsLUKSBase)
  result.keySecret = n["key-secret"].getStr

proc `%`*(x: RbdEncryptionCreateOptionsLUKSBase): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)
  if x.cipherAlg.isSome: result["cipher-alg"] = %(x.cipherAlg.get)

proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKSBase], n: JsonNode): RbdEncryptionCreateOptionsLUKSBase =
  result = default(RbdEncryptionCreateOptionsLUKSBase)
  result.keySecret = n["key-secret"].getStr
  if n.hasKey("cipher-alg") and n["cipher-alg"].kind != JNull:
    result.cipherAlg = some(parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"]))

proc `%`*(x: RbdEncryptionOptionsLUKS): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)

proc parse*(_: typedesc[RbdEncryptionOptionsLUKS], n: JsonNode): RbdEncryptionOptionsLUKS =
  result = default(RbdEncryptionOptionsLUKS)
  result.keySecret = n["key-secret"].getStr

proc `%`*(x: RbdEncryptionOptionsLUKS2): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)

proc parse*(_: typedesc[RbdEncryptionOptionsLUKS2], n: JsonNode): RbdEncryptionOptionsLUKS2 =
  result = default(RbdEncryptionOptionsLUKS2)
  result.keySecret = n["key-secret"].getStr

proc `%`*(x: RbdEncryptionOptionsLUKSAny): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)

proc parse*(_: typedesc[RbdEncryptionOptionsLUKSAny], n: JsonNode): RbdEncryptionOptionsLUKSAny =
  result = default(RbdEncryptionOptionsLUKSAny)
  result.keySecret = n["key-secret"].getStr

proc `%`*(x: RbdEncryptionCreateOptionsLUKS): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)
  if x.cipherAlg.isSome: result["cipher-alg"] = %(x.cipherAlg.get)

proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKS], n: JsonNode): RbdEncryptionCreateOptionsLUKS =
  result = default(RbdEncryptionCreateOptionsLUKS)
  result.keySecret = n["key-secret"].getStr
  if n.hasKey("cipher-alg") and n["cipher-alg"].kind != JNull:
    result.cipherAlg = some(parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"]))

proc `%`*(x: RbdEncryptionCreateOptionsLUKS2): JsonNode =
  result = newJObject()
  result["key-secret"] = %(x.keySecret)
  if x.cipherAlg.isSome: result["cipher-alg"] = %(x.cipherAlg.get)

proc parse*(_: typedesc[RbdEncryptionCreateOptionsLUKS2], n: JsonNode): RbdEncryptionCreateOptionsLUKS2 =
  result = default(RbdEncryptionCreateOptionsLUKS2)
  result.keySecret = n["key-secret"].getStr
  if n.hasKey("cipher-alg") and n["cipher-alg"].kind != JNull:
    result.cipherAlg = some(parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"]))

proc `%`*(x: RbdEncryptionOptions): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  if x.parent.isSome: result["parent"] = %(x.parent.get)
  result["format"] = %($x.format)
  case x.format
  of RbdImageEncryptionFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of RbdImageEncryptionFormat.Luks2:
    let sub = %(x.luks2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of RbdImageEncryptionFormat.LuksAny:
    let sub = %(x.luksAny)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[RbdEncryptionOptions], n: JsonNode): RbdEncryptionOptions =
  if n.kind == JNull: return nil
  let tag = parse(typedesc[RbdImageEncryptionFormat], n["format"])
  case tag
  of RbdImageEncryptionFormat.Luks:
    result = RbdEncryptionOptions(format: tag, luks: parse(typedesc[RbdEncryptionOptionsLUKS], n))
  of RbdImageEncryptionFormat.Luks2:
    result = RbdEncryptionOptions(format: tag, luks2: parse(typedesc[RbdEncryptionOptionsLUKS2], n))
  of RbdImageEncryptionFormat.LuksAny:
    result = RbdEncryptionOptions(format: tag, luksAny: parse(typedesc[RbdEncryptionOptionsLUKSAny], n))
  if n.hasKey("parent") and n["parent"].kind != JNull:
    result.parent = some(parse(typedesc[RbdEncryptionOptions], n["parent"]))

proc `%`*(x: RbdEncryptionCreateOptions): JsonNode =
  result = newJObject()
  result["format"] = %($x.format)
  case x.format
  of RbdImageEncryptionFormat.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of RbdImageEncryptionFormat.Luks2:
    let sub = %(x.luks2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of RbdImageEncryptionFormat.LuksAny: discard

proc parse*(_: typedesc[RbdEncryptionCreateOptions], n: JsonNode): RbdEncryptionCreateOptions =
  result = default(RbdEncryptionCreateOptions)
  let tag = parse(typedesc[RbdImageEncryptionFormat], n["format"])
  case tag
  of RbdImageEncryptionFormat.Luks:
    result = RbdEncryptionCreateOptions(format: tag, luks: parse(typedesc[RbdEncryptionCreateOptionsLUKS], n))
  of RbdImageEncryptionFormat.Luks2:
    result = RbdEncryptionCreateOptions(format: tag, luks2: parse(typedesc[RbdEncryptionCreateOptionsLUKS2], n))
  of RbdImageEncryptionFormat.LuksAny:
    result = RbdEncryptionCreateOptions(format: tag)

proc `%`*(x: BlockdevOptionsRbd): JsonNode =
  result = newJObject()
  result["pool"] = %(x.pool)
  if x.namespace.isSome: result["namespace"] = %(x.namespace.get)
  result["image"] = %(x.image)
  if x.conf.isSome: result["conf"] = %(x.conf.get)
  if x.snapshot.isSome: result["snapshot"] = %(x.snapshot.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)
  if x.user.isSome: result["user"] = %(x.user.get)
  if x.authClientRequired.isSome: result["auth-client-required"] = %(x.authClientRequired.get)
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)
  if x.server.isSome: result["server"] = %(x.server.get)

proc parse*(_: typedesc[BlockdevOptionsRbd], n: JsonNode): BlockdevOptionsRbd =
  result = default(BlockdevOptionsRbd)
  result.pool = n["pool"].getStr
  if n.hasKey("namespace") and n["namespace"].kind != JNull:
    result.namespace = some(n["namespace"].getStr)
  result.image = n["image"].getStr
  if n.hasKey("conf") and n["conf"].kind != JNull:
    result.conf = some(n["conf"].getStr)
  if n.hasKey("snapshot") and n["snapshot"].kind != JNull:
    result.snapshot = some(n["snapshot"].getStr)
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[RbdEncryptionOptions], n["encrypt"]))
  if n.hasKey("user") and n["user"].kind != JNull:
    result.user = some(n["user"].getStr)
  if n.hasKey("auth-client-required") and n["auth-client-required"].kind != JNull:
    result.authClientRequired = some((n["auth-client-required"]).getElems.mapIt(parse(typedesc[RbdAuthMode], it)))
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)
  if n.hasKey("server") and n["server"].kind != JNull:
    result.server = some((n["server"]).getElems.mapIt(parse(typedesc[InetSocketAddressBase], it)))

proc `%`*(x: ReplicationMode): JsonNode = %($x)
proc parse*(_: typedesc[ReplicationMode], n: JsonNode): ReplicationMode =
  let s = n.getStr
  case s
  of "primary": ReplicationMode.Primary
  of "secondary": ReplicationMode.Secondary
  else: raise newException(ValueError, "unknown ReplicationMode: " & s)

proc `%`*(x: BlockdevOptionsReplication): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  result["mode"] = %(x.mode)
  if x.topId.isSome: result["top-id"] = %(x.topId.get)

proc parse*(_: typedesc[BlockdevOptionsReplication], n: JsonNode): BlockdevOptionsReplication =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.mode = parse(typedesc[ReplicationMode], n["mode"])
  if n.hasKey("top-id") and n["top-id"].kind != JNull:
    result.topId = some(n["top-id"].getStr)

proc `%`*(x: NFSTransport): JsonNode = %($x)
proc parse*(_: typedesc[NFSTransport], n: JsonNode): NFSTransport =
  let s = n.getStr
  case s
  of "inet": NFSTransport.Inet
  else: raise newException(ValueError, "unknown NFSTransport: " & s)

proc `%`*(x: NFSServer): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)
  result["host"] = %(x.host)

proc parse*(_: typedesc[NFSServer], n: JsonNode): NFSServer =
  result = default(NFSServer)
  result.`type` = parse(typedesc[NFSTransport], n["type"])
  result.host = n["host"].getStr

proc `%`*(x: BlockdevOptionsNfs): JsonNode =
  result = newJObject()
  result["server"] = %(x.server)
  result["path"] = %(x.path)
  if x.user.isSome: result["user"] = %(x.user.get)
  if x.group.isSome: result["group"] = %(x.group.get)
  if x.tcpSynCount.isSome: result["tcp-syn-count"] = %(x.tcpSynCount.get)
  if x.readaheadSize.isSome: result["readahead-size"] = %(x.readaheadSize.get)
  if x.pageCacheSize.isSome: result["page-cache-size"] = %(x.pageCacheSize.get)
  if x.debug.isSome: result["debug"] = %(x.debug.get)

proc parse*(_: typedesc[BlockdevOptionsNfs], n: JsonNode): BlockdevOptionsNfs =
  result = default(BlockdevOptionsNfs)
  result.server = parse(typedesc[NFSServer], n["server"])
  result.path = n["path"].getStr
  if n.hasKey("user") and n["user"].kind != JNull:
    result.user = some(int64(n["user"].getBiggestInt))
  if n.hasKey("group") and n["group"].kind != JNull:
    result.group = some(int64(n["group"].getBiggestInt))
  if n.hasKey("tcp-syn-count") and n["tcp-syn-count"].kind != JNull:
    result.tcpSynCount = some(int64(n["tcp-syn-count"].getBiggestInt))
  if n.hasKey("readahead-size") and n["readahead-size"].kind != JNull:
    result.readaheadSize = some(int64(n["readahead-size"].getBiggestInt))
  if n.hasKey("page-cache-size") and n["page-cache-size"].kind != JNull:
    result.pageCacheSize = some(int64(n["page-cache-size"].getBiggestInt))
  if n.hasKey("debug") and n["debug"].kind != JNull:
    result.debug = some(int64(n["debug"].getBiggestInt))

proc `%`*(x: BlockdevOptionsCurlBase): JsonNode =
  result = newJObject()
  result["url"] = %(x.url)
  if x.readahead.isSome: result["readahead"] = %(x.readahead.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)
  if x.username.isSome: result["username"] = %(x.username.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.proxyUsername.isSome: result["proxy-username"] = %(x.proxyUsername.get)
  if x.proxyPasswordSecret.isSome: result["proxy-password-secret"] = %(x.proxyPasswordSecret.get)

proc parse*(_: typedesc[BlockdevOptionsCurlBase], n: JsonNode): BlockdevOptionsCurlBase =
  result = default(BlockdevOptionsCurlBase)
  result.url = n["url"].getStr
  if n.hasKey("readahead") and n["readahead"].kind != JNull:
    result.readahead = some(int64(n["readahead"].getBiggestInt))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("proxy-username") and n["proxy-username"].kind != JNull:
    result.proxyUsername = some(n["proxy-username"].getStr)
  if n.hasKey("proxy-password-secret") and n["proxy-password-secret"].kind != JNull:
    result.proxyPasswordSecret = some(n["proxy-password-secret"].getStr)

proc `%`*(x: BlockdevOptionsCurlHttp): JsonNode =
  result = newJObject()
  result["url"] = %(x.url)
  if x.readahead.isSome: result["readahead"] = %(x.readahead.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)
  if x.username.isSome: result["username"] = %(x.username.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.proxyUsername.isSome: result["proxy-username"] = %(x.proxyUsername.get)
  if x.proxyPasswordSecret.isSome: result["proxy-password-secret"] = %(x.proxyPasswordSecret.get)
  if x.cookie.isSome: result["cookie"] = %(x.cookie.get)
  if x.cookieSecret.isSome: result["cookie-secret"] = %(x.cookieSecret.get)
  if x.forceRange.isSome: result["force-range"] = %(x.forceRange.get)

proc parse*(_: typedesc[BlockdevOptionsCurlHttp], n: JsonNode): BlockdevOptionsCurlHttp =
  result = default(BlockdevOptionsCurlHttp)
  result.url = n["url"].getStr
  if n.hasKey("readahead") and n["readahead"].kind != JNull:
    result.readahead = some(int64(n["readahead"].getBiggestInt))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("proxy-username") and n["proxy-username"].kind != JNull:
    result.proxyUsername = some(n["proxy-username"].getStr)
  if n.hasKey("proxy-password-secret") and n["proxy-password-secret"].kind != JNull:
    result.proxyPasswordSecret = some(n["proxy-password-secret"].getStr)
  if n.hasKey("cookie") and n["cookie"].kind != JNull:
    result.cookie = some(n["cookie"].getStr)
  if n.hasKey("cookie-secret") and n["cookie-secret"].kind != JNull:
    result.cookieSecret = some(n["cookie-secret"].getStr)
  if n.hasKey("force-range") and n["force-range"].kind != JNull:
    result.forceRange = some(n["force-range"].getBool)

proc `%`*(x: BlockdevOptionsCurlHttps): JsonNode =
  result = newJObject()
  result["url"] = %(x.url)
  if x.readahead.isSome: result["readahead"] = %(x.readahead.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)
  if x.username.isSome: result["username"] = %(x.username.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.proxyUsername.isSome: result["proxy-username"] = %(x.proxyUsername.get)
  if x.proxyPasswordSecret.isSome: result["proxy-password-secret"] = %(x.proxyPasswordSecret.get)
  if x.cookie.isSome: result["cookie"] = %(x.cookie.get)
  if x.cookieSecret.isSome: result["cookie-secret"] = %(x.cookieSecret.get)
  if x.forceRange.isSome: result["force-range"] = %(x.forceRange.get)
  if x.sslverify.isSome: result["sslverify"] = %(x.sslverify.get)

proc parse*(_: typedesc[BlockdevOptionsCurlHttps], n: JsonNode): BlockdevOptionsCurlHttps =
  result = default(BlockdevOptionsCurlHttps)
  result.url = n["url"].getStr
  if n.hasKey("readahead") and n["readahead"].kind != JNull:
    result.readahead = some(int64(n["readahead"].getBiggestInt))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("proxy-username") and n["proxy-username"].kind != JNull:
    result.proxyUsername = some(n["proxy-username"].getStr)
  if n.hasKey("proxy-password-secret") and n["proxy-password-secret"].kind != JNull:
    result.proxyPasswordSecret = some(n["proxy-password-secret"].getStr)
  if n.hasKey("cookie") and n["cookie"].kind != JNull:
    result.cookie = some(n["cookie"].getStr)
  if n.hasKey("cookie-secret") and n["cookie-secret"].kind != JNull:
    result.cookieSecret = some(n["cookie-secret"].getStr)
  if n.hasKey("force-range") and n["force-range"].kind != JNull:
    result.forceRange = some(n["force-range"].getBool)
  if n.hasKey("sslverify") and n["sslverify"].kind != JNull:
    result.sslverify = some(n["sslverify"].getBool)

proc `%`*(x: BlockdevOptionsCurlFtp): JsonNode =
  result = newJObject()
  result["url"] = %(x.url)
  if x.readahead.isSome: result["readahead"] = %(x.readahead.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)
  if x.username.isSome: result["username"] = %(x.username.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.proxyUsername.isSome: result["proxy-username"] = %(x.proxyUsername.get)
  if x.proxyPasswordSecret.isSome: result["proxy-password-secret"] = %(x.proxyPasswordSecret.get)

proc parse*(_: typedesc[BlockdevOptionsCurlFtp], n: JsonNode): BlockdevOptionsCurlFtp =
  result = default(BlockdevOptionsCurlFtp)
  result.url = n["url"].getStr
  if n.hasKey("readahead") and n["readahead"].kind != JNull:
    result.readahead = some(int64(n["readahead"].getBiggestInt))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("proxy-username") and n["proxy-username"].kind != JNull:
    result.proxyUsername = some(n["proxy-username"].getStr)
  if n.hasKey("proxy-password-secret") and n["proxy-password-secret"].kind != JNull:
    result.proxyPasswordSecret = some(n["proxy-password-secret"].getStr)

proc `%`*(x: BlockdevOptionsCurlFtps): JsonNode =
  result = newJObject()
  result["url"] = %(x.url)
  if x.readahead.isSome: result["readahead"] = %(x.readahead.get)
  if x.timeout.isSome: result["timeout"] = %(x.timeout.get)
  if x.username.isSome: result["username"] = %(x.username.get)
  if x.passwordSecret.isSome: result["password-secret"] = %(x.passwordSecret.get)
  if x.proxyUsername.isSome: result["proxy-username"] = %(x.proxyUsername.get)
  if x.proxyPasswordSecret.isSome: result["proxy-password-secret"] = %(x.proxyPasswordSecret.get)
  if x.sslverify.isSome: result["sslverify"] = %(x.sslverify.get)

proc parse*(_: typedesc[BlockdevOptionsCurlFtps], n: JsonNode): BlockdevOptionsCurlFtps =
  result = default(BlockdevOptionsCurlFtps)
  result.url = n["url"].getStr
  if n.hasKey("readahead") and n["readahead"].kind != JNull:
    result.readahead = some(int64(n["readahead"].getBiggestInt))
  if n.hasKey("timeout") and n["timeout"].kind != JNull:
    result.timeout = some(int64(n["timeout"].getBiggestInt))
  if n.hasKey("username") and n["username"].kind != JNull:
    result.username = some(n["username"].getStr)
  if n.hasKey("password-secret") and n["password-secret"].kind != JNull:
    result.passwordSecret = some(n["password-secret"].getStr)
  if n.hasKey("proxy-username") and n["proxy-username"].kind != JNull:
    result.proxyUsername = some(n["proxy-username"].getStr)
  if n.hasKey("proxy-password-secret") and n["proxy-password-secret"].kind != JNull:
    result.proxyPasswordSecret = some(n["proxy-password-secret"].getStr)
  if n.hasKey("sslverify") and n["sslverify"].kind != JNull:
    result.sslverify = some(n["sslverify"].getBool)

proc `%`*(x: BlockdevOptionsNbd): JsonNode =
  result = newJObject()
  result["server"] = %(x.server)
  if x.`export`.isSome: result["export"] = %(x.`export`.get)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsHostname.isSome: result["tls-hostname"] = %(x.tlsHostname.get)
  if x.xDirtyBitmap.isSome: result["x-dirty-bitmap"] = %(x.xDirtyBitmap.get)
  if x.reconnectDelay.isSome: result["reconnect-delay"] = %(x.reconnectDelay.get)
  if x.openTimeout.isSome: result["open-timeout"] = %(x.openTimeout.get)

proc parse*(_: typedesc[BlockdevOptionsNbd], n: JsonNode): BlockdevOptionsNbd =
  result = default(BlockdevOptionsNbd)
  result.server = parse(typedesc[SocketAddress], n["server"])
  if n.hasKey("export") and n["export"].kind != JNull:
    result.`export` = some(n["export"].getStr)
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(n["tls-creds"].getStr)
  if n.hasKey("tls-hostname") and n["tls-hostname"].kind != JNull:
    result.tlsHostname = some(n["tls-hostname"].getStr)
  if n.hasKey("x-dirty-bitmap") and n["x-dirty-bitmap"].kind != JNull:
    result.xDirtyBitmap = some(n["x-dirty-bitmap"].getStr)
  if n.hasKey("reconnect-delay") and n["reconnect-delay"].kind != JNull:
    result.reconnectDelay = some(uint32(n["reconnect-delay"].getBiggestInt))
  if n.hasKey("open-timeout") and n["open-timeout"].kind != JNull:
    result.openTimeout = some(uint32(n["open-timeout"].getBiggestInt))

proc `%`*(x: BlockdevOptionsRaw): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.offset.isSome: result["offset"] = %(x.offset.get)
  if x.size.isSome: result["size"] = %(x.size.get)

proc parse*(_: typedesc[BlockdevOptionsRaw], n: JsonNode): BlockdevOptionsRaw =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("offset") and n["offset"].kind != JNull:
    result.offset = some(int64(n["offset"].getBiggestInt))
  if n.hasKey("size") and n["size"].kind != JNull:
    result.size = some(int64(n["size"].getBiggestInt))

proc `%`*(x: BlockdevOptionsThrottle): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["throttle-group"] = %(x.throttleGroup)
  result["file"] = %(x.file)

proc parse*(_: typedesc[BlockdevOptionsThrottle], n: JsonNode): BlockdevOptionsThrottle =
  if n.kind == JNull: return nil
  new(result)
  result.throttleGroup = n["throttle-group"].getStr
  result.file = parse(typedesc[BlockdevRef], n["file"])

proc `%`*(x: BlockdevOptionsCor): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  if x.bottom.isSome: result["bottom"] = %(x.bottom.get)

proc parse*(_: typedesc[BlockdevOptionsCor], n: JsonNode): BlockdevOptionsCor =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("bottom") and n["bottom"].kind != JNull:
    result.bottom = some(n["bottom"].getStr)

proc `%`*(x: OnCbwError): JsonNode = %($x)
proc parse*(_: typedesc[OnCbwError], n: JsonNode): OnCbwError =
  let s = n.getStr
  case s
  of "break-guest-write": OnCbwError.BreakGuestWrite
  of "break-snapshot": OnCbwError.BreakSnapshot
  else: raise newException(ValueError, "unknown OnCbwError: " & s)

proc `%`*(x: BlockdevOptionsCbw): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["file"] = %(x.file)
  result["target"] = %(x.target)
  if x.bitmap.isSome: result["bitmap"] = %(x.bitmap.get)
  if x.onCbwError.isSome: result["on-cbw-error"] = %(x.onCbwError.get)
  if x.cbwTimeout.isSome: result["cbw-timeout"] = %(x.cbwTimeout.get)
  if x.minClusterSize.isSome: result["min-cluster-size"] = %(x.minClusterSize.get)

proc parse*(_: typedesc[BlockdevOptionsCbw], n: JsonNode): BlockdevOptionsCbw =
  if n.kind == JNull: return nil
  new(result)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.target = parse(typedesc[BlockdevRef], n["target"])
  if n.hasKey("bitmap") and n["bitmap"].kind != JNull:
    result.bitmap = some(parse(typedesc[BlockDirtyBitmap], n["bitmap"]))
  if n.hasKey("on-cbw-error") and n["on-cbw-error"].kind != JNull:
    result.onCbwError = some(parse(typedesc[OnCbwError], n["on-cbw-error"]))
  if n.hasKey("cbw-timeout") and n["cbw-timeout"].kind != JNull:
    result.cbwTimeout = some(uint32(n["cbw-timeout"].getBiggestInt))
  if n.hasKey("min-cluster-size") and n["min-cluster-size"].kind != JNull:
    result.minClusterSize = some(cast[uint64](n["min-cluster-size"].getBiggestInt))

proc `%`*(x: BlockdevOptions): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  if x.nodeName.isSome: result["node-name"] = %(x.nodeName.get)
  if x.`discard`.isSome: result["discard"] = %(x.`discard`.get)
  if x.cache.isSome: result["cache"] = %(x.cache.get)
  if x.active.isSome: result["active"] = %(x.active.get)
  if x.readOnly.isSome: result["read-only"] = %(x.readOnly.get)
  if x.autoReadOnly.isSome: result["auto-read-only"] = %(x.autoReadOnly.get)
  if x.forceShare.isSome: result["force-share"] = %(x.forceShare.get)
  if x.detectZeroes.isSome: result["detect-zeroes"] = %(x.detectZeroes.get)
  result["driver"] = %($x.driver)
  case x.driver
  of BlockdevDriver.Blkdebug:
    let sub = %(x.blkdebug)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blklogwrites:
    let sub = %(x.blklogwrites)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blkverify:
    let sub = %(x.blkverify)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blkreplay:
    let sub = %(x.blkreplay)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Bochs:
    let sub = %(x.bochs)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Cloop:
    let sub = %(x.cloop)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Compress:
    let sub = %(x.compress)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.CopyBeforeWrite:
    let sub = %(x.copyBeforeWrite)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.CopyOnRead:
    let sub = %(x.copyOnRead)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Dmg:
    let sub = %(x.dmg)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Ftp:
    let sub = %(x.ftp)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Ftps:
    let sub = %(x.ftps)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Gluster:
    let sub = %(x.gluster)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.HostCdrom:
    let sub = %(x.hostCdrom)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.HostDevice:
    let sub = %(x.hostDevice)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Http:
    let sub = %(x.http)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Https:
    let sub = %(x.https)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.IoUring:
    let sub = %(x.ioUring)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Iscsi:
    let sub = %(x.iscsi)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Nbd:
    let sub = %(x.nbd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Nfs:
    let sub = %(x.nfs)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.NullAio:
    let sub = %(x.nullAio)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.NullCo:
    let sub = %(x.nullCo)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Nvme:
    let sub = %(x.nvme)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.NvmeIoUring:
    let sub = %(x.nvmeIoUring)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Parallels:
    let sub = %(x.parallels)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Preallocate:
    let sub = %(x.preallocate)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qcow2:
    let sub = %(x.qcow2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qcow:
    let sub = %(x.qcow)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qed:
    let sub = %(x.qed)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Quorum:
    let sub = %(x.quorum)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Raw:
    let sub = %(x.raw)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Rbd:
    let sub = %(x.rbd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Replication:
    let sub = %(x.replication)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.SnapshotAccess:
    let sub = %(x.snapshotAccess)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Ssh:
    let sub = %(x.ssh)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Throttle:
    let sub = %(x.throttle)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vdi:
    let sub = %(x.vdi)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vhdx:
    let sub = %(x.vhdx)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.VirtioBlkVfioPci:
    let sub = %(x.virtioBlkVfioPci)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.VirtioBlkVhostUser:
    let sub = %(x.virtioBlkVhostUser)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.VirtioBlkVhostVdpa:
    let sub = %(x.virtioBlkVhostVdpa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vmdk:
    let sub = %(x.vmdk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vpc:
    let sub = %(x.vpc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vvfat:
    let sub = %(x.vvfat)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[BlockdevOptions], n: JsonNode): BlockdevOptions =
  if n.kind == JNull: return nil
  let tag = parse(typedesc[BlockdevDriver], n["driver"])
  case tag
  of BlockdevDriver.Blkdebug:
    result = BlockdevOptions(driver: tag, blkdebug: parse(typedesc[BlockdevOptionsBlkdebug], n))
  of BlockdevDriver.Blklogwrites:
    result = BlockdevOptions(driver: tag, blklogwrites: parse(typedesc[BlockdevOptionsBlklogwrites], n))
  of BlockdevDriver.Blkverify:
    result = BlockdevOptions(driver: tag, blkverify: parse(typedesc[BlockdevOptionsBlkverify], n))
  of BlockdevDriver.Blkreplay:
    result = BlockdevOptions(driver: tag, blkreplay: parse(typedesc[BlockdevOptionsBlkreplay], n))
  of BlockdevDriver.Bochs:
    result = BlockdevOptions(driver: tag, bochs: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Cloop:
    result = BlockdevOptions(driver: tag, cloop: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Compress:
    result = BlockdevOptions(driver: tag, compress: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.CopyBeforeWrite:
    result = BlockdevOptions(driver: tag, copyBeforeWrite: parse(typedesc[BlockdevOptionsCbw], n))
  of BlockdevDriver.CopyOnRead:
    result = BlockdevOptions(driver: tag, copyOnRead: parse(typedesc[BlockdevOptionsCor], n))
  of BlockdevDriver.Dmg:
    result = BlockdevOptions(driver: tag, dmg: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.File:
    result = BlockdevOptions(driver: tag, file: parse(typedesc[BlockdevOptionsFile], n))
  of BlockdevDriver.Ftp:
    result = BlockdevOptions(driver: tag, ftp: parse(typedesc[BlockdevOptionsCurlFtp], n))
  of BlockdevDriver.Ftps:
    result = BlockdevOptions(driver: tag, ftps: parse(typedesc[BlockdevOptionsCurlFtps], n))
  of BlockdevDriver.Gluster:
    result = BlockdevOptions(driver: tag, gluster: parse(typedesc[BlockdevOptionsGluster], n))
  of BlockdevDriver.HostCdrom:
    result = BlockdevOptions(driver: tag, hostCdrom: parse(typedesc[BlockdevOptionsFile], n))
  of BlockdevDriver.HostDevice:
    result = BlockdevOptions(driver: tag, hostDevice: parse(typedesc[BlockdevOptionsFile], n))
  of BlockdevDriver.Http:
    result = BlockdevOptions(driver: tag, http: parse(typedesc[BlockdevOptionsCurlHttp], n))
  of BlockdevDriver.Https:
    result = BlockdevOptions(driver: tag, https: parse(typedesc[BlockdevOptionsCurlHttps], n))
  of BlockdevDriver.IoUring:
    result = BlockdevOptions(driver: tag, ioUring: parse(typedesc[BlockdevOptionsIoUring], n))
  of BlockdevDriver.Iscsi:
    result = BlockdevOptions(driver: tag, iscsi: parse(typedesc[BlockdevOptionsIscsi], n))
  of BlockdevDriver.Luks:
    result = BlockdevOptions(driver: tag, luks: parse(typedesc[BlockdevOptionsLUKS], n))
  of BlockdevDriver.Nbd:
    result = BlockdevOptions(driver: tag, nbd: parse(typedesc[BlockdevOptionsNbd], n))
  of BlockdevDriver.Nfs:
    result = BlockdevOptions(driver: tag, nfs: parse(typedesc[BlockdevOptionsNfs], n))
  of BlockdevDriver.NullAio:
    result = BlockdevOptions(driver: tag, nullAio: parse(typedesc[BlockdevOptionsNull], n))
  of BlockdevDriver.NullCo:
    result = BlockdevOptions(driver: tag, nullCo: parse(typedesc[BlockdevOptionsNull], n))
  of BlockdevDriver.Nvme:
    result = BlockdevOptions(driver: tag, nvme: parse(typedesc[BlockdevOptionsNVMe], n))
  of BlockdevDriver.NvmeIoUring:
    result = BlockdevOptions(driver: tag, nvmeIoUring: parse(typedesc[BlockdevOptionsNvmeIoUring], n))
  of BlockdevDriver.Parallels:
    result = BlockdevOptions(driver: tag, parallels: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Preallocate:
    result = BlockdevOptions(driver: tag, preallocate: parse(typedesc[BlockdevOptionsPreallocate], n))
  of BlockdevDriver.Qcow2:
    result = BlockdevOptions(driver: tag, qcow2: parse(typedesc[BlockdevOptionsQcow2], n))
  of BlockdevDriver.Qcow:
    result = BlockdevOptions(driver: tag, qcow: parse(typedesc[BlockdevOptionsQcow], n))
  of BlockdevDriver.Qed:
    result = BlockdevOptions(driver: tag, qed: parse(typedesc[BlockdevOptionsGenericCOWFormat], n))
  of BlockdevDriver.Quorum:
    result = BlockdevOptions(driver: tag, quorum: parse(typedesc[BlockdevOptionsQuorum], n))
  of BlockdevDriver.Raw:
    result = BlockdevOptions(driver: tag, raw: parse(typedesc[BlockdevOptionsRaw], n))
  of BlockdevDriver.Rbd:
    result = BlockdevOptions(driver: tag, rbd: parse(typedesc[BlockdevOptionsRbd], n))
  of BlockdevDriver.Replication:
    result = BlockdevOptions(driver: tag, replication: parse(typedesc[BlockdevOptionsReplication], n))
  of BlockdevDriver.SnapshotAccess:
    result = BlockdevOptions(driver: tag, snapshotAccess: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Ssh:
    result = BlockdevOptions(driver: tag, ssh: parse(typedesc[BlockdevOptionsSsh], n))
  of BlockdevDriver.Throttle:
    result = BlockdevOptions(driver: tag, throttle: parse(typedesc[BlockdevOptionsThrottle], n))
  of BlockdevDriver.Vdi:
    result = BlockdevOptions(driver: tag, vdi: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Vhdx:
    result = BlockdevOptions(driver: tag, vhdx: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.VirtioBlkVfioPci:
    result = BlockdevOptions(driver: tag, virtioBlkVfioPci: parse(typedesc[BlockdevOptionsVirtioBlkVfioPci], n))
  of BlockdevDriver.VirtioBlkVhostUser:
    result = BlockdevOptions(driver: tag, virtioBlkVhostUser: parse(typedesc[BlockdevOptionsVirtioBlkVhostUser], n))
  of BlockdevDriver.VirtioBlkVhostVdpa:
    result = BlockdevOptions(driver: tag, virtioBlkVhostVdpa: parse(typedesc[BlockdevOptionsVirtioBlkVhostVdpa], n))
  of BlockdevDriver.Vmdk:
    result = BlockdevOptions(driver: tag, vmdk: parse(typedesc[BlockdevOptionsGenericCOWFormat], n))
  of BlockdevDriver.Vpc:
    result = BlockdevOptions(driver: tag, vpc: parse(typedesc[BlockdevOptionsGenericFormat], n))
  of BlockdevDriver.Vvfat:
    result = BlockdevOptions(driver: tag, vvfat: parse(typedesc[BlockdevOptionsVVFAT], n))
  if n.hasKey("node-name") and n["node-name"].kind != JNull:
    result.nodeName = some(n["node-name"].getStr)
  if n.hasKey("discard") and n["discard"].kind != JNull:
    result.`discard` = some(parse(typedesc[BlockdevDiscardOptions], n["discard"]))
  if n.hasKey("cache") and n["cache"].kind != JNull:
    result.cache = some(parse(typedesc[BlockdevCacheOptions], n["cache"]))
  if n.hasKey("active") and n["active"].kind != JNull:
    result.active = some(n["active"].getBool)
  if n.hasKey("read-only") and n["read-only"].kind != JNull:
    result.readOnly = some(n["read-only"].getBool)
  if n.hasKey("auto-read-only") and n["auto-read-only"].kind != JNull:
    result.autoReadOnly = some(n["auto-read-only"].getBool)
  if n.hasKey("force-share") and n["force-share"].kind != JNull:
    result.forceShare = some(n["force-share"].getBool)
  if n.hasKey("detect-zeroes") and n["detect-zeroes"].kind != JNull:
    result.detectZeroes = some(parse(typedesc[BlockdevDetectZeroesOptions], n["detect-zeroes"]))

proc `%`*(x: BlockdevRef): JsonNode =
  if x.isNil: return newJNull()
  case x.kind
  of BlockdevRefKind.Definition: %(x.definition)
  of BlockdevRefKind.Reference: %(x.reference)

proc parse*(_: typedesc[BlockdevRef], n: JsonNode): BlockdevRef =
  result = default(BlockdevRef)
  if n.kind == JObject:
    result = BlockdevRef(kind: BlockdevRefKind.Definition, definition: parse(typedesc[BlockdevOptions], n))
  elif n.kind == JString:
    result = BlockdevRef(kind: BlockdevRefKind.Reference, reference: n.getStr)
  else: raise newException(ValueError,
      "cannot decode BlockdevRef from JSON")

proc `%`*(x: BlockdevRefOrNull): JsonNode =
  if x.isNil: return newJNull()
  case x.kind
  of BlockdevRefOrNullKind.Definition: %(x.definition)
  of BlockdevRefOrNullKind.Reference: %(x.reference)
  of BlockdevRefOrNullKind.Null: %(x.null)

proc parse*(_: typedesc[BlockdevRefOrNull], n: JsonNode): BlockdevRefOrNull =
  result = default(BlockdevRefOrNull)
  if n.kind == JObject:
    result = BlockdevRefOrNull(kind: BlockdevRefOrNullKind.Definition, definition: parse(typedesc[BlockdevOptions], n))
  elif n.kind == JString:
    result = BlockdevRefOrNull(kind: BlockdevRefOrNullKind.Reference, reference: n.getStr)
  elif n.kind == JNull:
    result = BlockdevRefOrNull(kind: BlockdevRefOrNullKind.Null, null: n)
  else: raise newException(ValueError,
      "cannot decode BlockdevRefOrNull from JSON")

proc `%`*(x: BlockdevCreateOptionsFile): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  result["size"] = %(x.size)
  if x.preallocation.isSome: result["preallocation"] = %(x.preallocation.get)
  if x.nocow.isSome: result["nocow"] = %(x.nocow.get)
  if x.extentSizeHint.isSome: result["extent-size-hint"] = %(x.extentSizeHint.get)

proc parse*(_: typedesc[BlockdevCreateOptionsFile], n: JsonNode): BlockdevCreateOptionsFile =
  result = default(BlockdevCreateOptionsFile)
  result.filename = n["filename"].getStr
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("preallocation") and n["preallocation"].kind != JNull:
    result.preallocation = some(parse(typedesc[PreallocMode], n["preallocation"]))
  if n.hasKey("nocow") and n["nocow"].kind != JNull:
    result.nocow = some(n["nocow"].getBool)
  if n.hasKey("extent-size-hint") and n["extent-size-hint"].kind != JNull:
    result.extentSizeHint = some(cast[uint64](n["extent-size-hint"].getBiggestInt))

proc `%`*(x: BlockdevCreateOptionsGluster): JsonNode =
  result = newJObject()
  result["location"] = %(x.location)
  result["size"] = %(x.size)
  if x.preallocation.isSome: result["preallocation"] = %(x.preallocation.get)

proc parse*(_: typedesc[BlockdevCreateOptionsGluster], n: JsonNode): BlockdevCreateOptionsGluster =
  result = default(BlockdevCreateOptionsGluster)
  result.location = parse(typedesc[BlockdevOptionsGluster], n["location"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("preallocation") and n["preallocation"].kind != JNull:
    result.preallocation = some(parse(typedesc[PreallocMode], n["preallocation"]))

proc `%`*(x: BlockdevCreateOptionsLUKS): JsonNode =
  result = newJObject()
  if x.keySecret.isSome: result["key-secret"] = %(x.keySecret.get)
  if x.cipherAlg.isSome: result["cipher-alg"] = %(x.cipherAlg.get)
  if x.cipherMode.isSome: result["cipher-mode"] = %(x.cipherMode.get)
  if x.ivgenAlg.isSome: result["ivgen-alg"] = %(x.ivgenAlg.get)
  if x.ivgenHashAlg.isSome: result["ivgen-hash-alg"] = %(x.ivgenHashAlg.get)
  if x.hashAlg.isSome: result["hash-alg"] = %(x.hashAlg.get)
  if x.iterTime.isSome: result["iter-time"] = %(x.iterTime.get)
  if x.file.isSome: result["file"] = %(x.file.get)
  if x.header.isSome: result["header"] = %(x.header.get)
  result["size"] = %(x.size)
  if x.preallocation.isSome: result["preallocation"] = %(x.preallocation.get)

proc parse*(_: typedesc[BlockdevCreateOptionsLUKS], n: JsonNode): BlockdevCreateOptionsLUKS =
  result = default(BlockdevCreateOptionsLUKS)
  if n.hasKey("key-secret") and n["key-secret"].kind != JNull:
    result.keySecret = some(n["key-secret"].getStr)
  if n.hasKey("cipher-alg") and n["cipher-alg"].kind != JNull:
    result.cipherAlg = some(parse(typedesc[QCryptoCipherAlgo], n["cipher-alg"]))
  if n.hasKey("cipher-mode") and n["cipher-mode"].kind != JNull:
    result.cipherMode = some(parse(typedesc[QCryptoCipherMode], n["cipher-mode"]))
  if n.hasKey("ivgen-alg") and n["ivgen-alg"].kind != JNull:
    result.ivgenAlg = some(parse(typedesc[QCryptoIVGenAlgo], n["ivgen-alg"]))
  if n.hasKey("ivgen-hash-alg") and n["ivgen-hash-alg"].kind != JNull:
    result.ivgenHashAlg = some(parse(typedesc[QCryptoHashAlgo], n["ivgen-hash-alg"]))
  if n.hasKey("hash-alg") and n["hash-alg"].kind != JNull:
    result.hashAlg = some(parse(typedesc[QCryptoHashAlgo], n["hash-alg"]))
  if n.hasKey("iter-time") and n["iter-time"].kind != JNull:
    result.iterTime = some(int64(n["iter-time"].getBiggestInt))
  if n.hasKey("file") and n["file"].kind != JNull:
    result.file = some(parse(typedesc[BlockdevRef], n["file"]))
  if n.hasKey("header") and n["header"].kind != JNull:
    result.header = some(parse(typedesc[BlockdevRef], n["header"]))
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("preallocation") and n["preallocation"].kind != JNull:
    result.preallocation = some(parse(typedesc[PreallocMode], n["preallocation"]))

proc `%`*(x: BlockdevCreateOptionsNfs): JsonNode =
  result = newJObject()
  result["location"] = %(x.location)
  result["size"] = %(x.size)

proc parse*(_: typedesc[BlockdevCreateOptionsNfs], n: JsonNode): BlockdevCreateOptionsNfs =
  result = default(BlockdevCreateOptionsNfs)
  result.location = parse(typedesc[BlockdevOptionsNfs], n["location"])
  result.size = cast[uint64](n["size"].getBiggestInt)

proc `%`*(x: BlockdevCreateOptionsParallels): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)

proc parse*(_: typedesc[BlockdevCreateOptionsParallels], n: JsonNode): BlockdevCreateOptionsParallels =
  result = default(BlockdevCreateOptionsParallels)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(cast[uint64](n["cluster-size"].getBiggestInt))

proc `%`*(x: BlockdevCreateOptionsQcow): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.backingFile.isSome: result["backing-file"] = %(x.backingFile.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)

proc parse*(_: typedesc[BlockdevCreateOptionsQcow], n: JsonNode): BlockdevCreateOptionsQcow =
  result = default(BlockdevCreateOptionsQcow)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("backing-file") and n["backing-file"].kind != JNull:
    result.backingFile = some(n["backing-file"].getStr)
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[QCryptoBlockCreateOptions], n["encrypt"]))

proc `%`*(x: BlockdevQcow2Version): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevQcow2Version], n: JsonNode): BlockdevQcow2Version =
  let s = n.getStr
  case s
  of "v2": BlockdevQcow2Version.V2
  of "v3": BlockdevQcow2Version.V3
  else: raise newException(ValueError, "unknown BlockdevQcow2Version: " & s)

proc `%`*(x: Qcow2CompressionType): JsonNode = %($x)
proc parse*(_: typedesc[Qcow2CompressionType], n: JsonNode): Qcow2CompressionType =
  let s = n.getStr
  case s
  of "zlib": Qcow2CompressionType.Zlib
  of "zstd": Qcow2CompressionType.Zstd
  else: raise newException(ValueError, "unknown Qcow2CompressionType: " & s)

proc `%`*(x: BlockdevCreateOptionsQcow2): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  if x.dataFile.isSome: result["data-file"] = %(x.dataFile.get)
  if x.dataFileRaw.isSome: result["data-file-raw"] = %(x.dataFileRaw.get)
  if x.extendedL2.isSome: result["extended-l2"] = %(x.extendedL2.get)
  result["size"] = %(x.size)
  if x.version.isSome: result["version"] = %(x.version.get)
  if x.backingFile.isSome: result["backing-file"] = %(x.backingFile.get)
  if x.backingFmt.isSome: result["backing-fmt"] = %(x.backingFmt.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.preallocation.isSome: result["preallocation"] = %(x.preallocation.get)
  if x.lazyRefcounts.isSome: result["lazy-refcounts"] = %(x.lazyRefcounts.get)
  if x.refcountBits.isSome: result["refcount-bits"] = %(x.refcountBits.get)
  if x.compressionType.isSome: result["compression-type"] = %(x.compressionType.get)

proc parse*(_: typedesc[BlockdevCreateOptionsQcow2], n: JsonNode): BlockdevCreateOptionsQcow2 =
  result = default(BlockdevCreateOptionsQcow2)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  if n.hasKey("data-file") and n["data-file"].kind != JNull:
    result.dataFile = some(parse(typedesc[BlockdevRef], n["data-file"]))
  if n.hasKey("data-file-raw") and n["data-file-raw"].kind != JNull:
    result.dataFileRaw = some(n["data-file-raw"].getBool)
  if n.hasKey("extended-l2") and n["extended-l2"].kind != JNull:
    result.extendedL2 = some(n["extended-l2"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("version") and n["version"].kind != JNull:
    result.version = some(parse(typedesc[BlockdevQcow2Version], n["version"]))
  if n.hasKey("backing-file") and n["backing-file"].kind != JNull:
    result.backingFile = some(n["backing-file"].getStr)
  if n.hasKey("backing-fmt") and n["backing-fmt"].kind != JNull:
    result.backingFmt = some(parse(typedesc[BlockdevDriver], n["backing-fmt"]))
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[QCryptoBlockCreateOptions], n["encrypt"]))
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(cast[uint64](n["cluster-size"].getBiggestInt))
  if n.hasKey("preallocation") and n["preallocation"].kind != JNull:
    result.preallocation = some(parse(typedesc[PreallocMode], n["preallocation"]))
  if n.hasKey("lazy-refcounts") and n["lazy-refcounts"].kind != JNull:
    result.lazyRefcounts = some(n["lazy-refcounts"].getBool)
  if n.hasKey("refcount-bits") and n["refcount-bits"].kind != JNull:
    result.refcountBits = some(int64(n["refcount-bits"].getBiggestInt))
  if n.hasKey("compression-type") and n["compression-type"].kind != JNull:
    result.compressionType = some(parse(typedesc[Qcow2CompressionType], n["compression-type"]))

proc `%`*(x: BlockdevCreateOptionsQed): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.backingFile.isSome: result["backing-file"] = %(x.backingFile.get)
  if x.backingFmt.isSome: result["backing-fmt"] = %(x.backingFmt.get)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.tableSize.isSome: result["table-size"] = %(x.tableSize.get)

proc parse*(_: typedesc[BlockdevCreateOptionsQed], n: JsonNode): BlockdevCreateOptionsQed =
  result = default(BlockdevCreateOptionsQed)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("backing-file") and n["backing-file"].kind != JNull:
    result.backingFile = some(n["backing-file"].getStr)
  if n.hasKey("backing-fmt") and n["backing-fmt"].kind != JNull:
    result.backingFmt = some(parse(typedesc[BlockdevDriver], n["backing-fmt"]))
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(cast[uint64](n["cluster-size"].getBiggestInt))
  if n.hasKey("table-size") and n["table-size"].kind != JNull:
    result.tableSize = some(int64(n["table-size"].getBiggestInt))

proc `%`*(x: BlockdevCreateOptionsRbd): JsonNode =
  result = newJObject()
  result["location"] = %(x.location)
  result["size"] = %(x.size)
  if x.clusterSize.isSome: result["cluster-size"] = %(x.clusterSize.get)
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)

proc parse*(_: typedesc[BlockdevCreateOptionsRbd], n: JsonNode): BlockdevCreateOptionsRbd =
  result = default(BlockdevCreateOptionsRbd)
  result.location = parse(typedesc[BlockdevOptionsRbd], n["location"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("cluster-size") and n["cluster-size"].kind != JNull:
    result.clusterSize = some(cast[uint64](n["cluster-size"].getBiggestInt))
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[RbdEncryptionCreateOptions], n["encrypt"]))

proc `%`*(x: BlockdevVmdkSubformat): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevVmdkSubformat], n: JsonNode): BlockdevVmdkSubformat =
  let s = n.getStr
  case s
  of "monolithicSparse": BlockdevVmdkSubformat.MonolithicSparse
  of "monolithicFlat": BlockdevVmdkSubformat.MonolithicFlat
  of "twoGbMaxExtentSparse": BlockdevVmdkSubformat.TwoGbMaxExtentSparse
  of "twoGbMaxExtentFlat": BlockdevVmdkSubformat.TwoGbMaxExtentFlat
  of "streamOptimized": BlockdevVmdkSubformat.StreamOptimized
  else: raise newException(ValueError, "unknown BlockdevVmdkSubformat: " & s)

proc `%`*(x: BlockdevVmdkAdapterType): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevVmdkAdapterType], n: JsonNode): BlockdevVmdkAdapterType =
  let s = n.getStr
  case s
  of "ide": BlockdevVmdkAdapterType.Ide
  of "buslogic": BlockdevVmdkAdapterType.Buslogic
  of "lsilogic": BlockdevVmdkAdapterType.Lsilogic
  of "legacyESX": BlockdevVmdkAdapterType.LegacyESX
  else: raise newException(ValueError, "unknown BlockdevVmdkAdapterType: " & s)

proc `%`*(x: BlockdevCreateOptionsVmdk): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.extents.isSome: result["extents"] = %(x.extents.get)
  if x.subformat.isSome: result["subformat"] = %(x.subformat.get)
  if x.backingFile.isSome: result["backing-file"] = %(x.backingFile.get)
  if x.adapterType.isSome: result["adapter-type"] = %(x.adapterType.get)
  if x.hwversion.isSome: result["hwversion"] = %(x.hwversion.get)
  if x.toolsversion.isSome: result["toolsversion"] = %(x.toolsversion.get)
  if x.zeroedGrain.isSome: result["zeroed-grain"] = %(x.zeroedGrain.get)

proc parse*(_: typedesc[BlockdevCreateOptionsVmdk], n: JsonNode): BlockdevCreateOptionsVmdk =
  result = default(BlockdevCreateOptionsVmdk)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("extents") and n["extents"].kind != JNull:
    result.extents = some((n["extents"]).getElems.mapIt(parse(typedesc[BlockdevRef], it)))
  if n.hasKey("subformat") and n["subformat"].kind != JNull:
    result.subformat = some(parse(typedesc[BlockdevVmdkSubformat], n["subformat"]))
  if n.hasKey("backing-file") and n["backing-file"].kind != JNull:
    result.backingFile = some(n["backing-file"].getStr)
  if n.hasKey("adapter-type") and n["adapter-type"].kind != JNull:
    result.adapterType = some(parse(typedesc[BlockdevVmdkAdapterType], n["adapter-type"]))
  if n.hasKey("hwversion") and n["hwversion"].kind != JNull:
    result.hwversion = some(n["hwversion"].getStr)
  if n.hasKey("toolsversion") and n["toolsversion"].kind != JNull:
    result.toolsversion = some(n["toolsversion"].getStr)
  if n.hasKey("zeroed-grain") and n["zeroed-grain"].kind != JNull:
    result.zeroedGrain = some(n["zeroed-grain"].getBool)

proc `%`*(x: BlockdevCreateOptionsSsh): JsonNode =
  result = newJObject()
  result["location"] = %(x.location)
  result["size"] = %(x.size)

proc parse*(_: typedesc[BlockdevCreateOptionsSsh], n: JsonNode): BlockdevCreateOptionsSsh =
  result = default(BlockdevCreateOptionsSsh)
  result.location = parse(typedesc[BlockdevOptionsSsh], n["location"])
  result.size = cast[uint64](n["size"].getBiggestInt)

proc `%`*(x: BlockdevCreateOptionsVdi): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.preallocation.isSome: result["preallocation"] = %(x.preallocation.get)

proc parse*(_: typedesc[BlockdevCreateOptionsVdi], n: JsonNode): BlockdevCreateOptionsVdi =
  result = default(BlockdevCreateOptionsVdi)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("preallocation") and n["preallocation"].kind != JNull:
    result.preallocation = some(parse(typedesc[PreallocMode], n["preallocation"]))

proc `%`*(x: BlockdevVhdxSubformat): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevVhdxSubformat], n: JsonNode): BlockdevVhdxSubformat =
  let s = n.getStr
  case s
  of "dynamic": BlockdevVhdxSubformat.Dynamic
  of "fixed": BlockdevVhdxSubformat.Fixed
  else: raise newException(ValueError, "unknown BlockdevVhdxSubformat: " & s)

proc `%`*(x: BlockdevCreateOptionsVhdx): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.logSize.isSome: result["log-size"] = %(x.logSize.get)
  if x.blockSize.isSome: result["block-size"] = %(x.blockSize.get)
  if x.subformat.isSome: result["subformat"] = %(x.subformat.get)
  if x.blockStateZero.isSome: result["block-state-zero"] = %(x.blockStateZero.get)

proc parse*(_: typedesc[BlockdevCreateOptionsVhdx], n: JsonNode): BlockdevCreateOptionsVhdx =
  result = default(BlockdevCreateOptionsVhdx)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("log-size") and n["log-size"].kind != JNull:
    result.logSize = some(cast[uint64](n["log-size"].getBiggestInt))
  if n.hasKey("block-size") and n["block-size"].kind != JNull:
    result.blockSize = some(cast[uint64](n["block-size"].getBiggestInt))
  if n.hasKey("subformat") and n["subformat"].kind != JNull:
    result.subformat = some(parse(typedesc[BlockdevVhdxSubformat], n["subformat"]))
  if n.hasKey("block-state-zero") and n["block-state-zero"].kind != JNull:
    result.blockStateZero = some(n["block-state-zero"].getBool)

proc `%`*(x: BlockdevVpcSubformat): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevVpcSubformat], n: JsonNode): BlockdevVpcSubformat =
  let s = n.getStr
  case s
  of "dynamic": BlockdevVpcSubformat.Dynamic
  of "fixed": BlockdevVpcSubformat.Fixed
  else: raise newException(ValueError, "unknown BlockdevVpcSubformat: " & s)

proc `%`*(x: BlockdevCreateOptionsVpc): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)
  result["size"] = %(x.size)
  if x.subformat.isSome: result["subformat"] = %(x.subformat.get)
  if x.forceSize.isSome: result["force-size"] = %(x.forceSize.get)

proc parse*(_: typedesc[BlockdevCreateOptionsVpc], n: JsonNode): BlockdevCreateOptionsVpc =
  result = default(BlockdevCreateOptionsVpc)
  result.file = parse(typedesc[BlockdevRef], n["file"])
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("subformat") and n["subformat"].kind != JNull:
    result.subformat = some(parse(typedesc[BlockdevVpcSubformat], n["subformat"]))
  if n.hasKey("force-size") and n["force-size"].kind != JNull:
    result.forceSize = some(n["force-size"].getBool)

proc `%`*(x: BlockdevCreateOptions): JsonNode =
  result = newJObject()
  result["driver"] = %($x.driver)
  case x.driver
  of BlockdevDriver.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Gluster:
    let sub = %(x.gluster)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Nfs:
    let sub = %(x.nfs)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Parallels:
    let sub = %(x.parallels)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qcow:
    let sub = %(x.qcow)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qcow2:
    let sub = %(x.qcow2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qed:
    let sub = %(x.qed)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Rbd:
    let sub = %(x.rbd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Ssh:
    let sub = %(x.ssh)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vdi:
    let sub = %(x.vdi)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vhdx:
    let sub = %(x.vhdx)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vmdk:
    let sub = %(x.vmdk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Vpc:
    let sub = %(x.vpc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blkdebug: discard
  of BlockdevDriver.Blklogwrites: discard
  of BlockdevDriver.Blkreplay: discard
  of BlockdevDriver.Blkverify: discard
  of BlockdevDriver.Bochs: discard
  of BlockdevDriver.Cloop: discard
  of BlockdevDriver.Compress: discard
  of BlockdevDriver.CopyBeforeWrite: discard
  of BlockdevDriver.CopyOnRead: discard
  of BlockdevDriver.Dmg: discard
  of BlockdevDriver.SnapshotAccess: discard
  of BlockdevDriver.Ftp: discard
  of BlockdevDriver.Ftps: discard
  of BlockdevDriver.HostCdrom: discard
  of BlockdevDriver.HostDevice: discard
  of BlockdevDriver.Http: discard
  of BlockdevDriver.Https: discard
  of BlockdevDriver.IoUring: discard
  of BlockdevDriver.Iscsi: discard
  of BlockdevDriver.Nbd: discard
  of BlockdevDriver.NullAio: discard
  of BlockdevDriver.NullCo: discard
  of BlockdevDriver.Nvme: discard
  of BlockdevDriver.NvmeIoUring: discard
  of BlockdevDriver.Preallocate: discard
  of BlockdevDriver.Quorum: discard
  of BlockdevDriver.Raw: discard
  of BlockdevDriver.Replication: discard
  of BlockdevDriver.Throttle: discard
  of BlockdevDriver.VirtioBlkVfioPci: discard
  of BlockdevDriver.VirtioBlkVhostUser: discard
  of BlockdevDriver.VirtioBlkVhostVdpa: discard
  of BlockdevDriver.Vvfat: discard

proc parse*(_: typedesc[BlockdevCreateOptions], n: JsonNode): BlockdevCreateOptions =
  result = default(BlockdevCreateOptions)
  let tag = parse(typedesc[BlockdevDriver], n["driver"])
  case tag
  of BlockdevDriver.File:
    result = BlockdevCreateOptions(driver: tag, file: parse(typedesc[BlockdevCreateOptionsFile], n))
  of BlockdevDriver.Gluster:
    result = BlockdevCreateOptions(driver: tag, gluster: parse(typedesc[BlockdevCreateOptionsGluster], n))
  of BlockdevDriver.Luks:
    result = BlockdevCreateOptions(driver: tag, luks: parse(typedesc[BlockdevCreateOptionsLUKS], n))
  of BlockdevDriver.Nfs:
    result = BlockdevCreateOptions(driver: tag, nfs: parse(typedesc[BlockdevCreateOptionsNfs], n))
  of BlockdevDriver.Parallels:
    result = BlockdevCreateOptions(driver: tag, parallels: parse(typedesc[BlockdevCreateOptionsParallels], n))
  of BlockdevDriver.Qcow:
    result = BlockdevCreateOptions(driver: tag, qcow: parse(typedesc[BlockdevCreateOptionsQcow], n))
  of BlockdevDriver.Qcow2:
    result = BlockdevCreateOptions(driver: tag, qcow2: parse(typedesc[BlockdevCreateOptionsQcow2], n))
  of BlockdevDriver.Qed:
    result = BlockdevCreateOptions(driver: tag, qed: parse(typedesc[BlockdevCreateOptionsQed], n))
  of BlockdevDriver.Rbd:
    result = BlockdevCreateOptions(driver: tag, rbd: parse(typedesc[BlockdevCreateOptionsRbd], n))
  of BlockdevDriver.Ssh:
    result = BlockdevCreateOptions(driver: tag, ssh: parse(typedesc[BlockdevCreateOptionsSsh], n))
  of BlockdevDriver.Vdi:
    result = BlockdevCreateOptions(driver: tag, vdi: parse(typedesc[BlockdevCreateOptionsVdi], n))
  of BlockdevDriver.Vhdx:
    result = BlockdevCreateOptions(driver: tag, vhdx: parse(typedesc[BlockdevCreateOptionsVhdx], n))
  of BlockdevDriver.Vmdk:
    result = BlockdevCreateOptions(driver: tag, vmdk: parse(typedesc[BlockdevCreateOptionsVmdk], n))
  of BlockdevDriver.Vpc:
    result = BlockdevCreateOptions(driver: tag, vpc: parse(typedesc[BlockdevCreateOptionsVpc], n))
  of BlockdevDriver.Blkdebug:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Blklogwrites:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Blkreplay:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Blkverify:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Bochs:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Cloop:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Compress:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.CopyBeforeWrite:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.CopyOnRead:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Dmg:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.SnapshotAccess:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Ftp:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Ftps:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.HostCdrom:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.HostDevice:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Http:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Https:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.IoUring:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Iscsi:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Nbd:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.NullAio:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.NullCo:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Nvme:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.NvmeIoUring:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Preallocate:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Quorum:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Raw:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Replication:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Throttle:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVfioPci:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVhostUser:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVhostVdpa:
    result = BlockdevCreateOptions(driver: tag)
  of BlockdevDriver.Vvfat:
    result = BlockdevCreateOptions(driver: tag)

proc `%`*(x: BlockdevAmendOptionsLUKS): JsonNode =
  result = newJObject()
  result["state"] = %(x.state)
  if x.newSecret.isSome: result["new-secret"] = %(x.newSecret.get)
  if x.oldSecret.isSome: result["old-secret"] = %(x.oldSecret.get)
  if x.keyslot.isSome: result["keyslot"] = %(x.keyslot.get)
  if x.iterTime.isSome: result["iter-time"] = %(x.iterTime.get)
  if x.secret.isSome: result["secret"] = %(x.secret.get)

proc parse*(_: typedesc[BlockdevAmendOptionsLUKS], n: JsonNode): BlockdevAmendOptionsLUKS =
  result = default(BlockdevAmendOptionsLUKS)
  result.state = parse(typedesc[QCryptoBlockLUKSKeyslotState], n["state"])
  if n.hasKey("new-secret") and n["new-secret"].kind != JNull:
    result.newSecret = some(n["new-secret"].getStr)
  if n.hasKey("old-secret") and n["old-secret"].kind != JNull:
    result.oldSecret = some(n["old-secret"].getStr)
  if n.hasKey("keyslot") and n["keyslot"].kind != JNull:
    result.keyslot = some(int64(n["keyslot"].getBiggestInt))
  if n.hasKey("iter-time") and n["iter-time"].kind != JNull:
    result.iterTime = some(int64(n["iter-time"].getBiggestInt))
  if n.hasKey("secret") and n["secret"].kind != JNull:
    result.secret = some(n["secret"].getStr)

proc `%`*(x: BlockdevAmendOptionsQcow2): JsonNode =
  result = newJObject()
  if x.encrypt.isSome: result["encrypt"] = %(x.encrypt.get)

proc parse*(_: typedesc[BlockdevAmendOptionsQcow2], n: JsonNode): BlockdevAmendOptionsQcow2 =
  result = default(BlockdevAmendOptionsQcow2)
  if n.hasKey("encrypt") and n["encrypt"].kind != JNull:
    result.encrypt = some(parse(typedesc[QCryptoBlockAmendOptions], n["encrypt"]))

proc `%`*(x: BlockdevAmendOptions): JsonNode =
  result = newJObject()
  result["driver"] = %($x.driver)
  case x.driver
  of BlockdevDriver.Luks:
    let sub = %(x.luks)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Qcow2:
    let sub = %(x.qcow2)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockdevDriver.Blkdebug: discard
  of BlockdevDriver.Blklogwrites: discard
  of BlockdevDriver.Blkreplay: discard
  of BlockdevDriver.Blkverify: discard
  of BlockdevDriver.Bochs: discard
  of BlockdevDriver.Cloop: discard
  of BlockdevDriver.Compress: discard
  of BlockdevDriver.CopyBeforeWrite: discard
  of BlockdevDriver.CopyOnRead: discard
  of BlockdevDriver.Dmg: discard
  of BlockdevDriver.File: discard
  of BlockdevDriver.SnapshotAccess: discard
  of BlockdevDriver.Ftp: discard
  of BlockdevDriver.Ftps: discard
  of BlockdevDriver.Gluster: discard
  of BlockdevDriver.HostCdrom: discard
  of BlockdevDriver.HostDevice: discard
  of BlockdevDriver.Http: discard
  of BlockdevDriver.Https: discard
  of BlockdevDriver.IoUring: discard
  of BlockdevDriver.Iscsi: discard
  of BlockdevDriver.Nbd: discard
  of BlockdevDriver.Nfs: discard
  of BlockdevDriver.NullAio: discard
  of BlockdevDriver.NullCo: discard
  of BlockdevDriver.Nvme: discard
  of BlockdevDriver.NvmeIoUring: discard
  of BlockdevDriver.Parallels: discard
  of BlockdevDriver.Preallocate: discard
  of BlockdevDriver.Qcow: discard
  of BlockdevDriver.Qed: discard
  of BlockdevDriver.Quorum: discard
  of BlockdevDriver.Raw: discard
  of BlockdevDriver.Rbd: discard
  of BlockdevDriver.Replication: discard
  of BlockdevDriver.Ssh: discard
  of BlockdevDriver.Throttle: discard
  of BlockdevDriver.Vdi: discard
  of BlockdevDriver.Vhdx: discard
  of BlockdevDriver.VirtioBlkVfioPci: discard
  of BlockdevDriver.VirtioBlkVhostUser: discard
  of BlockdevDriver.VirtioBlkVhostVdpa: discard
  of BlockdevDriver.Vmdk: discard
  of BlockdevDriver.Vpc: discard
  of BlockdevDriver.Vvfat: discard

proc parse*(_: typedesc[BlockdevAmendOptions], n: JsonNode): BlockdevAmendOptions =
  result = default(BlockdevAmendOptions)
  let tag = parse(typedesc[BlockdevDriver], n["driver"])
  case tag
  of BlockdevDriver.Luks:
    result = BlockdevAmendOptions(driver: tag, luks: parse(typedesc[BlockdevAmendOptionsLUKS], n))
  of BlockdevDriver.Qcow2:
    result = BlockdevAmendOptions(driver: tag, qcow2: parse(typedesc[BlockdevAmendOptionsQcow2], n))
  of BlockdevDriver.Blkdebug:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Blklogwrites:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Blkreplay:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Blkverify:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Bochs:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Cloop:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Compress:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.CopyBeforeWrite:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.CopyOnRead:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Dmg:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.File:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.SnapshotAccess:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Ftp:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Ftps:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Gluster:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.HostCdrom:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.HostDevice:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Http:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Https:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.IoUring:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Iscsi:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Nbd:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Nfs:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.NullAio:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.NullCo:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Nvme:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.NvmeIoUring:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Parallels:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Preallocate:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Qcow:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Qed:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Quorum:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Raw:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Rbd:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Replication:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Ssh:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Throttle:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Vdi:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Vhdx:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVfioPci:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVhostUser:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.VirtioBlkVhostVdpa:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Vmdk:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Vpc:
    result = BlockdevAmendOptions(driver: tag)
  of BlockdevDriver.Vvfat:
    result = BlockdevAmendOptions(driver: tag)

proc `%`*(x: BlockErrorAction): JsonNode = %($x)
proc parse*(_: typedesc[BlockErrorAction], n: JsonNode): BlockErrorAction =
  let s = n.getStr
  case s
  of "ignore": BlockErrorAction.Ignore
  of "report": BlockErrorAction.Report
  of "stop": BlockErrorAction.Stop
  else: raise newException(ValueError, "unknown BlockErrorAction: " & s)

proc `%`*(x: PreallocMode): JsonNode = %($x)
proc parse*(_: typedesc[PreallocMode], n: JsonNode): PreallocMode =
  let s = n.getStr
  case s
  of "off": PreallocMode.Off
  of "metadata": PreallocMode.Metadata
  of "falloc": PreallocMode.Falloc
  of "full": PreallocMode.Full
  else: raise newException(ValueError, "unknown PreallocMode: " & s)

proc `%`*(x: QuorumOpType): JsonNode = %($x)
proc parse*(_: typedesc[QuorumOpType], n: JsonNode): QuorumOpType =
  let s = n.getStr
  case s
  of "read": QuorumOpType.Read
  of "write": QuorumOpType.Write
  of "flush": QuorumOpType.Flush
  else: raise newException(ValueError, "unknown QuorumOpType: " & s)

proc `%`*(x: BlockdevSnapshotInternal): JsonNode =
  result = newJObject()
  result["device"] = %(x.device)
  result["name"] = %(x.name)

proc parse*(_: typedesc[BlockdevSnapshotInternal], n: JsonNode): BlockdevSnapshotInternal =
  result = default(BlockdevSnapshotInternal)
  result.device = n["device"].getStr
  result.name = n["name"].getStr

proc `%`*(x: DummyBlockCoreForceArrays): JsonNode =
  result = newJObject()
  result["unused-block-graph-info"] = %(x.unusedBlockGraphInfo)

proc parse*(_: typedesc[DummyBlockCoreForceArrays], n: JsonNode): DummyBlockCoreForceArrays =
  result = default(DummyBlockCoreForceArrays)
  result.unusedBlockGraphInfo = (n["unused-block-graph-info"]).getElems.mapIt(parse(typedesc[BlockGraphInfo], it))

proc `%`*(x: BiosAtaTranslation): JsonNode = %($x)
proc parse*(_: typedesc[BiosAtaTranslation], n: JsonNode): BiosAtaTranslation =
  let s = n.getStr
  case s
  of "auto": BiosAtaTranslation.Auto
  of "none": BiosAtaTranslation.None
  of "lba": BiosAtaTranslation.Lba
  of "large": BiosAtaTranslation.Large
  of "rechs": BiosAtaTranslation.Rechs
  else: raise newException(ValueError, "unknown BiosAtaTranslation: " & s)

proc `%`*(x: FloppyDriveType): JsonNode = %($x)
proc parse*(_: typedesc[FloppyDriveType], n: JsonNode): FloppyDriveType =
  let s = n.getStr
  case s
  of "144": FloppyDriveType.V144
  of "288": FloppyDriveType.V288
  of "120": FloppyDriveType.V120
  of "none": FloppyDriveType.None
  of "auto": FloppyDriveType.Auto
  else: raise newException(ValueError, "unknown FloppyDriveType: " & s)

proc `%`*(x: PRManagerInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["connected"] = %(x.connected)

proc parse*(_: typedesc[PRManagerInfo], n: JsonNode): PRManagerInfo =
  result = default(PRManagerInfo)
  result.id = n["id"].getStr
  result.connected = n["connected"].getBool

proc `%`*(x: BlockdevChangeReadOnlyMode): JsonNode = %($x)
proc parse*(_: typedesc[BlockdevChangeReadOnlyMode], n: JsonNode): BlockdevChangeReadOnlyMode =
  let s = n.getStr
  case s
  of "retain": BlockdevChangeReadOnlyMode.Retain
  of "read-only": BlockdevChangeReadOnlyMode.ReadOnly
  of "read-write": BlockdevChangeReadOnlyMode.ReadWrite
  else: raise newException(ValueError, "unknown BlockdevChangeReadOnlyMode: " & s)

proc `%`*(x: NbdServerOptionsBase): JsonNode =
  result = newJObject()
  if x.handshakeMaxSeconds.isSome: result["handshake-max-seconds"] = %(x.handshakeMaxSeconds.get)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsAuthz.isSome: result["tls-authz"] = %(x.tlsAuthz.get)
  if x.maxConnections.isSome: result["max-connections"] = %(x.maxConnections.get)

proc parse*(_: typedesc[NbdServerOptionsBase], n: JsonNode): NbdServerOptionsBase =
  result = default(NbdServerOptionsBase)
  if n.hasKey("handshake-max-seconds") and n["handshake-max-seconds"].kind != JNull:
    result.handshakeMaxSeconds = some(uint32(n["handshake-max-seconds"].getBiggestInt))
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(n["tls-creds"].getStr)
  if n.hasKey("tls-authz") and n["tls-authz"].kind != JNull:
    result.tlsAuthz = some(n["tls-authz"].getStr)
  if n.hasKey("max-connections") and n["max-connections"].kind != JNull:
    result.maxConnections = some(uint32(n["max-connections"].getBiggestInt))

proc `%`*(x: NbdServerOptions): JsonNode =
  result = newJObject()
  if x.handshakeMaxSeconds.isSome: result["handshake-max-seconds"] = %(x.handshakeMaxSeconds.get)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsAuthz.isSome: result["tls-authz"] = %(x.tlsAuthz.get)
  if x.maxConnections.isSome: result["max-connections"] = %(x.maxConnections.get)
  result["addr"] = %(x.`addr`)

proc parse*(_: typedesc[NbdServerOptions], n: JsonNode): NbdServerOptions =
  result = default(NbdServerOptions)
  if n.hasKey("handshake-max-seconds") and n["handshake-max-seconds"].kind != JNull:
    result.handshakeMaxSeconds = some(uint32(n["handshake-max-seconds"].getBiggestInt))
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(n["tls-creds"].getStr)
  if n.hasKey("tls-authz") and n["tls-authz"].kind != JNull:
    result.tlsAuthz = some(n["tls-authz"].getStr)
  if n.hasKey("max-connections") and n["max-connections"].kind != JNull:
    result.maxConnections = some(uint32(n["max-connections"].getBiggestInt))
  result.`addr` = parse(typedesc[SocketAddress], n["addr"])

proc `%`*(x: NbdServerOptionsLegacy): JsonNode =
  result = newJObject()
  if x.handshakeMaxSeconds.isSome: result["handshake-max-seconds"] = %(x.handshakeMaxSeconds.get)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsAuthz.isSome: result["tls-authz"] = %(x.tlsAuthz.get)
  if x.maxConnections.isSome: result["max-connections"] = %(x.maxConnections.get)
  result["addr"] = %(x.`addr`)

proc parse*(_: typedesc[NbdServerOptionsLegacy], n: JsonNode): NbdServerOptionsLegacy =
  result = default(NbdServerOptionsLegacy)
  if n.hasKey("handshake-max-seconds") and n["handshake-max-seconds"].kind != JNull:
    result.handshakeMaxSeconds = some(uint32(n["handshake-max-seconds"].getBiggestInt))
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(n["tls-creds"].getStr)
  if n.hasKey("tls-authz") and n["tls-authz"].kind != JNull:
    result.tlsAuthz = some(n["tls-authz"].getStr)
  if n.hasKey("max-connections") and n["max-connections"].kind != JNull:
    result.maxConnections = some(uint32(n["max-connections"].getBiggestInt))
  result.`addr` = parse(typedesc[SocketAddressLegacy], n["addr"])

proc `%`*(x: BlockExportOptionsNbdBase): JsonNode =
  result = newJObject()
  if x.name.isSome: result["name"] = %(x.name.get)
  if x.description.isSome: result["description"] = %(x.description.get)

proc parse*(_: typedesc[BlockExportOptionsNbdBase], n: JsonNode): BlockExportOptionsNbdBase =
  result = default(BlockExportOptionsNbdBase)
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  if n.hasKey("description") and n["description"].kind != JNull:
    result.description = some(n["description"].getStr)

proc `%`*(x: BlockExportOptionsNbd): JsonNode =
  result = newJObject()
  if x.name.isSome: result["name"] = %(x.name.get)
  if x.description.isSome: result["description"] = %(x.description.get)
  if x.bitmaps.isSome: result["bitmaps"] = %(x.bitmaps.get)
  if x.allocationDepth.isSome: result["allocation-depth"] = %(x.allocationDepth.get)

proc parse*(_: typedesc[BlockExportOptionsNbd], n: JsonNode): BlockExportOptionsNbd =
  result = default(BlockExportOptionsNbd)
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  if n.hasKey("description") and n["description"].kind != JNull:
    result.description = some(n["description"].getStr)
  if n.hasKey("bitmaps") and n["bitmaps"].kind != JNull:
    result.bitmaps = some((n["bitmaps"]).getElems.mapIt(parse(typedesc[BlockDirtyBitmapOrStr], it)))
  if n.hasKey("allocation-depth") and n["allocation-depth"].kind != JNull:
    result.allocationDepth = some(n["allocation-depth"].getBool)

proc `%`*(x: BlockExportOptionsVhostUserBlk): JsonNode =
  result = newJObject()
  result["addr"] = %(x.`addr`)
  if x.logicalBlockSize.isSome: result["logical-block-size"] = %(x.logicalBlockSize.get)
  if x.numQueues.isSome: result["num-queues"] = %(x.numQueues.get)

proc parse*(_: typedesc[BlockExportOptionsVhostUserBlk], n: JsonNode): BlockExportOptionsVhostUserBlk =
  result = default(BlockExportOptionsVhostUserBlk)
  result.`addr` = parse(typedesc[SocketAddress], n["addr"])
  if n.hasKey("logical-block-size") and n["logical-block-size"].kind != JNull:
    result.logicalBlockSize = some(cast[uint64](n["logical-block-size"].getBiggestInt))
  if n.hasKey("num-queues") and n["num-queues"].kind != JNull:
    result.numQueues = some(uint16(n["num-queues"].getBiggestInt))

proc `%`*(x: FuseExportAllowOther): JsonNode = %($x)
proc parse*(_: typedesc[FuseExportAllowOther], n: JsonNode): FuseExportAllowOther =
  let s = n.getStr
  case s
  of "off": FuseExportAllowOther.Off
  of "on": FuseExportAllowOther.On
  of "auto": FuseExportAllowOther.Auto
  else: raise newException(ValueError, "unknown FuseExportAllowOther: " & s)

proc `%`*(x: BlockExportOptionsFuse): JsonNode =
  result = newJObject()
  result["mountpoint"] = %(x.mountpoint)
  if x.growable.isSome: result["growable"] = %(x.growable.get)
  if x.allowOther.isSome: result["allow-other"] = %(x.allowOther.get)

proc parse*(_: typedesc[BlockExportOptionsFuse], n: JsonNode): BlockExportOptionsFuse =
  result = default(BlockExportOptionsFuse)
  result.mountpoint = n["mountpoint"].getStr
  if n.hasKey("growable") and n["growable"].kind != JNull:
    result.growable = some(n["growable"].getBool)
  if n.hasKey("allow-other") and n["allow-other"].kind != JNull:
    result.allowOther = some(parse(typedesc[FuseExportAllowOther], n["allow-other"]))

proc `%`*(x: BlockExportOptionsVduseBlk): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.numQueues.isSome: result["num-queues"] = %(x.numQueues.get)
  if x.queueSize.isSome: result["queue-size"] = %(x.queueSize.get)
  if x.logicalBlockSize.isSome: result["logical-block-size"] = %(x.logicalBlockSize.get)
  if x.serial.isSome: result["serial"] = %(x.serial.get)

proc parse*(_: typedesc[BlockExportOptionsVduseBlk], n: JsonNode): BlockExportOptionsVduseBlk =
  result = default(BlockExportOptionsVduseBlk)
  result.name = n["name"].getStr
  if n.hasKey("num-queues") and n["num-queues"].kind != JNull:
    result.numQueues = some(uint16(n["num-queues"].getBiggestInt))
  if n.hasKey("queue-size") and n["queue-size"].kind != JNull:
    result.queueSize = some(uint16(n["queue-size"].getBiggestInt))
  if n.hasKey("logical-block-size") and n["logical-block-size"].kind != JNull:
    result.logicalBlockSize = some(cast[uint64](n["logical-block-size"].getBiggestInt))
  if n.hasKey("serial") and n["serial"].kind != JNull:
    result.serial = some(n["serial"].getStr)

proc `%`*(x: NbdServerAddOptions): JsonNode =
  result = newJObject()
  if x.name.isSome: result["name"] = %(x.name.get)
  if x.description.isSome: result["description"] = %(x.description.get)
  result["device"] = %(x.device)
  if x.writable.isSome: result["writable"] = %(x.writable.get)
  if x.bitmap.isSome: result["bitmap"] = %(x.bitmap.get)

proc parse*(_: typedesc[NbdServerAddOptions], n: JsonNode): NbdServerAddOptions =
  result = default(NbdServerAddOptions)
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  if n.hasKey("description") and n["description"].kind != JNull:
    result.description = some(n["description"].getStr)
  result.device = n["device"].getStr
  if n.hasKey("writable") and n["writable"].kind != JNull:
    result.writable = some(n["writable"].getBool)
  if n.hasKey("bitmap") and n["bitmap"].kind != JNull:
    result.bitmap = some(n["bitmap"].getStr)

proc `%`*(x: BlockExportRemoveMode): JsonNode = %($x)
proc parse*(_: typedesc[BlockExportRemoveMode], n: JsonNode): BlockExportRemoveMode =
  let s = n.getStr
  case s
  of "safe": BlockExportRemoveMode.Safe
  of "hard": BlockExportRemoveMode.Hard
  else: raise newException(ValueError, "unknown BlockExportRemoveMode: " & s)

proc `%`*(x: BlockExportType): JsonNode = %($x)
proc parse*(_: typedesc[BlockExportType], n: JsonNode): BlockExportType =
  let s = n.getStr
  case s
  of "nbd": BlockExportType.Nbd
  of "vhost-user-blk": BlockExportType.VhostUserBlk
  of "fuse": BlockExportType.Fuse
  of "vduse-blk": BlockExportType.VduseBlk
  else: raise newException(ValueError, "unknown BlockExportType: " & s)

proc `%`*(x: BlockExportOptions): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  if x.fixedIothread.isSome: result["fixed-iothread"] = %(x.fixedIothread.get)
  if x.iothread.isSome: result["iothread"] = %(x.iothread.get)
  result["node-name"] = %(x.nodeName)
  if x.writable.isSome: result["writable"] = %(x.writable.get)
  if x.writethrough.isSome: result["writethrough"] = %(x.writethrough.get)
  if x.allowInactive.isSome: result["allow-inactive"] = %(x.allowInactive.get)
  result["type"] = %($x.`type`)
  case x.`type`
  of BlockExportType.Nbd:
    let sub = %(x.nbd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockExportType.VhostUserBlk:
    let sub = %(x.vhostUserBlk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockExportType.Fuse:
    let sub = %(x.fuse)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of BlockExportType.VduseBlk:
    let sub = %(x.vduseBlk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[BlockExportOptions], n: JsonNode): BlockExportOptions =
  result = default(BlockExportOptions)
  let tag = parse(typedesc[BlockExportType], n["type"])
  case tag
  of BlockExportType.Nbd:
    result = BlockExportOptions(`type`: tag, nbd: parse(typedesc[BlockExportOptionsNbd], n))
  of BlockExportType.VhostUserBlk:
    result = BlockExportOptions(`type`: tag, vhostUserBlk: parse(typedesc[BlockExportOptionsVhostUserBlk], n))
  of BlockExportType.Fuse:
    result = BlockExportOptions(`type`: tag, fuse: parse(typedesc[BlockExportOptionsFuse], n))
  of BlockExportType.VduseBlk:
    result = BlockExportOptions(`type`: tag, vduseBlk: parse(typedesc[BlockExportOptionsVduseBlk], n))
  result.id = n["id"].getStr
  if n.hasKey("fixed-iothread") and n["fixed-iothread"].kind != JNull:
    result.fixedIothread = some(n["fixed-iothread"].getBool)
  if n.hasKey("iothread") and n["iothread"].kind != JNull:
    result.iothread = some(parse(typedesc[BlockExportIothreads], n["iothread"]))
  result.nodeName = n["node-name"].getStr
  if n.hasKey("writable") and n["writable"].kind != JNull:
    result.writable = some(n["writable"].getBool)
  if n.hasKey("writethrough") and n["writethrough"].kind != JNull:
    result.writethrough = some(n["writethrough"].getBool)
  if n.hasKey("allow-inactive") and n["allow-inactive"].kind != JNull:
    result.allowInactive = some(n["allow-inactive"].getBool)

proc `%`*(x: BlockExportIothreads): JsonNode =
  case x.kind
  of BlockExportIothreadsKind.Single: %(x.single)
  of BlockExportIothreadsKind.Multi: %(x.multi)

proc parse*(_: typedesc[BlockExportIothreads], n: JsonNode): BlockExportIothreads =
  result = default(BlockExportIothreads)
  if n.kind == JString:
    result = BlockExportIothreads(kind: BlockExportIothreadsKind.Single, single: n.getStr)
  elif n.kind == JArray:
    result = BlockExportIothreads(kind: BlockExportIothreadsKind.Multi, multi: (n).getElems.mapIt(it.getStr))
  else: raise newException(ValueError,
      "cannot decode BlockExportIothreads from JSON")

proc `%`*(x: BlockExportInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %(x.`type`)
  result["node-name"] = %(x.nodeName)
  result["shutting-down"] = %(x.shuttingDown)

proc parse*(_: typedesc[BlockExportInfo], n: JsonNode): BlockExportInfo =
  result = default(BlockExportInfo)
  result.id = n["id"].getStr
  result.`type` = parse(typedesc[BlockExportType], n["type"])
  result.nodeName = n["node-name"].getStr
  result.shuttingDown = n["shutting-down"].getBool

proc `%`*(x: ChardevInfo): JsonNode =
  result = newJObject()
  result["label"] = %(x.label)
  result["filename"] = %(x.filename)
  result["frontend-open"] = %(x.frontendOpen)

proc parse*(_: typedesc[ChardevInfo], n: JsonNode): ChardevInfo =
  result = default(ChardevInfo)
  result.label = n["label"].getStr
  result.filename = n["filename"].getStr
  result.frontendOpen = n["frontend-open"].getBool

proc `%`*(x: ChardevBackendInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)

proc parse*(_: typedesc[ChardevBackendInfo], n: JsonNode): ChardevBackendInfo =
  result = default(ChardevBackendInfo)
  result.name = n["name"].getStr

proc `%`*(x: DataFormat): JsonNode = %($x)
proc parse*(_: typedesc[DataFormat], n: JsonNode): DataFormat =
  let s = n.getStr
  case s
  of "utf8": DataFormat.Utf8
  of "base64": DataFormat.Base64
  else: raise newException(ValueError, "unknown DataFormat: " & s)

proc `%`*(x: ChardevCommon): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)

proc parse*(_: typedesc[ChardevCommon], n: JsonNode): ChardevCommon =
  result = default(ChardevCommon)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)

proc `%`*(x: ChardevFile): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  result["out"] = %(x.`out`)
  if x.append.isSome: result["append"] = %(x.append.get)

proc parse*(_: typedesc[ChardevFile], n: JsonNode): ChardevFile =
  result = default(ChardevFile)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(n["in"].getStr)
  result.`out` = n["out"].getStr
  if n.hasKey("append") and n["append"].kind != JNull:
    result.append = some(n["append"].getBool)

proc `%`*(x: ChardevHostdev): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["device"] = %(x.device)

proc parse*(_: typedesc[ChardevHostdev], n: JsonNode): ChardevHostdev =
  result = default(ChardevHostdev)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.device = n["device"].getStr

proc `%`*(x: ChardevSocket): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["addr"] = %(x.`addr`)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsAuthz.isSome: result["tls-authz"] = %(x.tlsAuthz.get)
  if x.server.isSome: result["server"] = %(x.server.get)
  if x.wait.isSome: result["wait"] = %(x.wait.get)
  if x.nodelay.isSome: result["nodelay"] = %(x.nodelay.get)
  if x.telnet.isSome: result["telnet"] = %(x.telnet.get)
  if x.tn3270.isSome: result["tn3270"] = %(x.tn3270.get)
  if x.websocket.isSome: result["websocket"] = %(x.websocket.get)
  if x.reconnectMs.isSome: result["reconnect-ms"] = %(x.reconnectMs.get)

proc parse*(_: typedesc[ChardevSocket], n: JsonNode): ChardevSocket =
  result = default(ChardevSocket)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.`addr` = parse(typedesc[SocketAddressLegacy], n["addr"])
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(n["tls-creds"].getStr)
  if n.hasKey("tls-authz") and n["tls-authz"].kind != JNull:
    result.tlsAuthz = some(n["tls-authz"].getStr)
  if n.hasKey("server") and n["server"].kind != JNull:
    result.server = some(n["server"].getBool)
  if n.hasKey("wait") and n["wait"].kind != JNull:
    result.wait = some(n["wait"].getBool)
  if n.hasKey("nodelay") and n["nodelay"].kind != JNull:
    result.nodelay = some(n["nodelay"].getBool)
  if n.hasKey("telnet") and n["telnet"].kind != JNull:
    result.telnet = some(n["telnet"].getBool)
  if n.hasKey("tn3270") and n["tn3270"].kind != JNull:
    result.tn3270 = some(n["tn3270"].getBool)
  if n.hasKey("websocket") and n["websocket"].kind != JNull:
    result.websocket = some(n["websocket"].getBool)
  if n.hasKey("reconnect-ms") and n["reconnect-ms"].kind != JNull:
    result.reconnectMs = some(int64(n["reconnect-ms"].getBiggestInt))

proc `%`*(x: ChardevUdp): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["remote"] = %(x.remote)
  if x.local.isSome: result["local"] = %(x.local.get)

proc parse*(_: typedesc[ChardevUdp], n: JsonNode): ChardevUdp =
  result = default(ChardevUdp)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.remote = parse(typedesc[SocketAddressLegacy], n["remote"])
  if n.hasKey("local") and n["local"].kind != JNull:
    result.local = some(parse(typedesc[SocketAddressLegacy], n["local"]))

proc `%`*(x: ChardevMux): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["chardev"] = %(x.chardev)

proc parse*(_: typedesc[ChardevMux], n: JsonNode): ChardevMux =
  result = default(ChardevMux)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.chardev = n["chardev"].getStr

proc `%`*(x: ChardevHub): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["chardevs"] = %(x.chardevs)

proc parse*(_: typedesc[ChardevHub], n: JsonNode): ChardevHub =
  result = default(ChardevHub)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.chardevs = (n["chardevs"]).getElems.mapIt(it.getStr)

proc `%`*(x: ChardevStdio): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.signal.isSome: result["signal"] = %(x.signal.get)

proc parse*(_: typedesc[ChardevStdio], n: JsonNode): ChardevStdio =
  result = default(ChardevStdio)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("signal") and n["signal"].kind != JNull:
    result.signal = some(n["signal"].getBool)

proc `%`*(x: ChardevSpiceChannel): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["type"] = %(x.`type`)

proc parse*(_: typedesc[ChardevSpiceChannel], n: JsonNode): ChardevSpiceChannel =
  result = default(ChardevSpiceChannel)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.`type` = n["type"].getStr

proc `%`*(x: ChardevSpicePort): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["fqdn"] = %(x.fqdn)

proc parse*(_: typedesc[ChardevSpicePort], n: JsonNode): ChardevSpicePort =
  result = default(ChardevSpicePort)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.fqdn = n["fqdn"].getStr

proc `%`*(x: ChardevDBus): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  result["name"] = %(x.name)

proc parse*(_: typedesc[ChardevDBus], n: JsonNode): ChardevDBus =
  result = default(ChardevDBus)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  result.name = n["name"].getStr

proc `%`*(x: ChardevVC): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.width.isSome: result["width"] = %(x.width.get)
  if x.height.isSome: result["height"] = %(x.height.get)
  if x.cols.isSome: result["cols"] = %(x.cols.get)
  if x.rows.isSome: result["rows"] = %(x.rows.get)

proc parse*(_: typedesc[ChardevVC], n: JsonNode): ChardevVC =
  result = default(ChardevVC)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("width") and n["width"].kind != JNull:
    result.width = some(int64(n["width"].getBiggestInt))
  if n.hasKey("height") and n["height"].kind != JNull:
    result.height = some(int64(n["height"].getBiggestInt))
  if n.hasKey("cols") and n["cols"].kind != JNull:
    result.cols = some(int64(n["cols"].getBiggestInt))
  if n.hasKey("rows") and n["rows"].kind != JNull:
    result.rows = some(int64(n["rows"].getBiggestInt))

proc `%`*(x: ChardevRingbuf): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.size.isSome: result["size"] = %(x.size.get)

proc parse*(_: typedesc[ChardevRingbuf], n: JsonNode): ChardevRingbuf =
  result = default(ChardevRingbuf)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("size") and n["size"].kind != JNull:
    result.size = some(int64(n["size"].getBiggestInt))

proc `%`*(x: ChardevQemuVDAgent): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.mouse.isSome: result["mouse"] = %(x.mouse.get)
  if x.clipboard.isSome: result["clipboard"] = %(x.clipboard.get)

proc parse*(_: typedesc[ChardevQemuVDAgent], n: JsonNode): ChardevQemuVDAgent =
  result = default(ChardevQemuVDAgent)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("mouse") and n["mouse"].kind != JNull:
    result.mouse = some(n["mouse"].getBool)
  if n.hasKey("clipboard") and n["clipboard"].kind != JNull:
    result.clipboard = some(n["clipboard"].getBool)

proc `%`*(x: ChardevPty): JsonNode =
  result = newJObject()
  if x.logfile.isSome: result["logfile"] = %(x.logfile.get)
  if x.logappend.isSome: result["logappend"] = %(x.logappend.get)
  if x.logtimestamp.isSome: result["logtimestamp"] = %(x.logtimestamp.get)
  if x.path.isSome: result["path"] = %(x.path.get)

proc parse*(_: typedesc[ChardevPty], n: JsonNode): ChardevPty =
  result = default(ChardevPty)
  if n.hasKey("logfile") and n["logfile"].kind != JNull:
    result.logfile = some(n["logfile"].getStr)
  if n.hasKey("logappend") and n["logappend"].kind != JNull:
    result.logappend = some(n["logappend"].getBool)
  if n.hasKey("logtimestamp") and n["logtimestamp"].kind != JNull:
    result.logtimestamp = some(n["logtimestamp"].getBool)
  if n.hasKey("path") and n["path"].kind != JNull:
    result.path = some(n["path"].getStr)

proc `%`*(x: ChardevBackendKind): JsonNode = %($x)
proc parse*(_: typedesc[ChardevBackendKind], n: JsonNode): ChardevBackendKind =
  let s = n.getStr
  case s
  of "file": ChardevBackendKind.File
  of "serial": ChardevBackendKind.Serial
  of "parallel": ChardevBackendKind.Parallel
  of "pipe": ChardevBackendKind.Pipe
  of "socket": ChardevBackendKind.Socket
  of "udp": ChardevBackendKind.Udp
  of "pty": ChardevBackendKind.Pty
  of "null": ChardevBackendKind.Null
  of "mux": ChardevBackendKind.Mux
  of "hub": ChardevBackendKind.Hub
  of "msmouse": ChardevBackendKind.Msmouse
  of "wctablet": ChardevBackendKind.Wctablet
  of "braille": ChardevBackendKind.Braille
  of "testdev": ChardevBackendKind.Testdev
  of "stdio": ChardevBackendKind.Stdio
  of "console": ChardevBackendKind.Console
  of "spicevmc": ChardevBackendKind.Spicevmc
  of "spiceport": ChardevBackendKind.Spiceport
  of "qemu-vdagent": ChardevBackendKind.QemuVdagent
  of "dbus": ChardevBackendKind.Dbus
  of "vc": ChardevBackendKind.Vc
  of "ringbuf": ChardevBackendKind.Ringbuf
  of "memory": ChardevBackendKind.Memory
  else: raise newException(ValueError, "unknown ChardevBackendKind: " & s)

proc `%`*(x: ChardevFileWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevFileWrapper], n: JsonNode): ChardevFileWrapper =
  result = default(ChardevFileWrapper)
  result.data = parse(typedesc[ChardevFile], n["data"])

proc `%`*(x: ChardevHostdevWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevHostdevWrapper], n: JsonNode): ChardevHostdevWrapper =
  result = default(ChardevHostdevWrapper)
  result.data = parse(typedesc[ChardevHostdev], n["data"])

proc `%`*(x: ChardevSocketWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevSocketWrapper], n: JsonNode): ChardevSocketWrapper =
  result = default(ChardevSocketWrapper)
  result.data = parse(typedesc[ChardevSocket], n["data"])

proc `%`*(x: ChardevUdpWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevUdpWrapper], n: JsonNode): ChardevUdpWrapper =
  result = default(ChardevUdpWrapper)
  result.data = parse(typedesc[ChardevUdp], n["data"])

proc `%`*(x: ChardevCommonWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevCommonWrapper], n: JsonNode): ChardevCommonWrapper =
  result = default(ChardevCommonWrapper)
  result.data = parse(typedesc[ChardevCommon], n["data"])

proc `%`*(x: ChardevMuxWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevMuxWrapper], n: JsonNode): ChardevMuxWrapper =
  result = default(ChardevMuxWrapper)
  result.data = parse(typedesc[ChardevMux], n["data"])

proc `%`*(x: ChardevHubWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevHubWrapper], n: JsonNode): ChardevHubWrapper =
  result = default(ChardevHubWrapper)
  result.data = parse(typedesc[ChardevHub], n["data"])

proc `%`*(x: ChardevStdioWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevStdioWrapper], n: JsonNode): ChardevStdioWrapper =
  result = default(ChardevStdioWrapper)
  result.data = parse(typedesc[ChardevStdio], n["data"])

proc `%`*(x: ChardevSpiceChannelWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevSpiceChannelWrapper], n: JsonNode): ChardevSpiceChannelWrapper =
  result = default(ChardevSpiceChannelWrapper)
  result.data = parse(typedesc[ChardevSpiceChannel], n["data"])

proc `%`*(x: ChardevSpicePortWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevSpicePortWrapper], n: JsonNode): ChardevSpicePortWrapper =
  result = default(ChardevSpicePortWrapper)
  result.data = parse(typedesc[ChardevSpicePort], n["data"])

proc `%`*(x: ChardevQemuVDAgentWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevQemuVDAgentWrapper], n: JsonNode): ChardevQemuVDAgentWrapper =
  result = default(ChardevQemuVDAgentWrapper)
  result.data = parse(typedesc[ChardevQemuVDAgent], n["data"])

proc `%`*(x: ChardevDBusWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevDBusWrapper], n: JsonNode): ChardevDBusWrapper =
  result = default(ChardevDBusWrapper)
  result.data = parse(typedesc[ChardevDBus], n["data"])

proc `%`*(x: ChardevVCWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevVCWrapper], n: JsonNode): ChardevVCWrapper =
  result = default(ChardevVCWrapper)
  result.data = parse(typedesc[ChardevVC], n["data"])

proc `%`*(x: ChardevRingbufWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevRingbufWrapper], n: JsonNode): ChardevRingbufWrapper =
  result = default(ChardevRingbufWrapper)
  result.data = parse(typedesc[ChardevRingbuf], n["data"])

proc `%`*(x: ChardevPtyWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[ChardevPtyWrapper], n: JsonNode): ChardevPtyWrapper =
  result = default(ChardevPtyWrapper)
  result.data = parse(typedesc[ChardevPty], n["data"])

proc `%`*(x: ChardevBackend): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of ChardevBackendKind.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Serial:
    let sub = %(x.serial)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Parallel:
    let sub = %(x.parallel)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Pipe:
    let sub = %(x.pipe)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Socket:
    let sub = %(x.socket)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Udp:
    let sub = %(x.udp)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Pty:
    let sub = %(x.pty)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Null:
    let sub = %(x.null)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Mux:
    let sub = %(x.mux)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Hub:
    let sub = %(x.hub)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Msmouse:
    let sub = %(x.msmouse)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Wctablet:
    let sub = %(x.wctablet)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Braille:
    let sub = %(x.braille)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Testdev:
    let sub = %(x.testdev)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Stdio:
    let sub = %(x.stdio)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Console:
    let sub = %(x.console)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Spicevmc:
    let sub = %(x.spicevmc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Spiceport:
    let sub = %(x.spiceport)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.QemuVdagent:
    let sub = %(x.qemuVdagent)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Dbus:
    let sub = %(x.dbus)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Vc:
    let sub = %(x.vc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Ringbuf:
    let sub = %(x.ringbuf)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ChardevBackendKind.Memory:
    let sub = %(x.memory)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[ChardevBackend], n: JsonNode): ChardevBackend =
  result = default(ChardevBackend)
  let tag = parse(typedesc[ChardevBackendKind], n["type"])
  case tag
  of ChardevBackendKind.File:
    result = ChardevBackend(`type`: tag, file: parse(typedesc[ChardevFileWrapper], n))
  of ChardevBackendKind.Serial:
    result = ChardevBackend(`type`: tag, serial: parse(typedesc[ChardevHostdevWrapper], n))
  of ChardevBackendKind.Parallel:
    result = ChardevBackend(`type`: tag, parallel: parse(typedesc[ChardevHostdevWrapper], n))
  of ChardevBackendKind.Pipe:
    result = ChardevBackend(`type`: tag, pipe: parse(typedesc[ChardevHostdevWrapper], n))
  of ChardevBackendKind.Socket:
    result = ChardevBackend(`type`: tag, socket: parse(typedesc[ChardevSocketWrapper], n))
  of ChardevBackendKind.Udp:
    result = ChardevBackend(`type`: tag, udp: parse(typedesc[ChardevUdpWrapper], n))
  of ChardevBackendKind.Pty:
    result = ChardevBackend(`type`: tag, pty: parse(typedesc[ChardevPtyWrapper], n))
  of ChardevBackendKind.Null:
    result = ChardevBackend(`type`: tag, null: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Mux:
    result = ChardevBackend(`type`: tag, mux: parse(typedesc[ChardevMuxWrapper], n))
  of ChardevBackendKind.Hub:
    result = ChardevBackend(`type`: tag, hub: parse(typedesc[ChardevHubWrapper], n))
  of ChardevBackendKind.Msmouse:
    result = ChardevBackend(`type`: tag, msmouse: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Wctablet:
    result = ChardevBackend(`type`: tag, wctablet: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Braille:
    result = ChardevBackend(`type`: tag, braille: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Testdev:
    result = ChardevBackend(`type`: tag, testdev: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Stdio:
    result = ChardevBackend(`type`: tag, stdio: parse(typedesc[ChardevStdioWrapper], n))
  of ChardevBackendKind.Console:
    result = ChardevBackend(`type`: tag, console: parse(typedesc[ChardevCommonWrapper], n))
  of ChardevBackendKind.Spicevmc:
    result = ChardevBackend(`type`: tag, spicevmc: parse(typedesc[ChardevSpiceChannelWrapper], n))
  of ChardevBackendKind.Spiceport:
    result = ChardevBackend(`type`: tag, spiceport: parse(typedesc[ChardevSpicePortWrapper], n))
  of ChardevBackendKind.QemuVdagent:
    result = ChardevBackend(`type`: tag, qemuVdagent: parse(typedesc[ChardevQemuVDAgentWrapper], n))
  of ChardevBackendKind.Dbus:
    result = ChardevBackend(`type`: tag, dbus: parse(typedesc[ChardevDBusWrapper], n))
  of ChardevBackendKind.Vc:
    result = ChardevBackend(`type`: tag, vc: parse(typedesc[ChardevVCWrapper], n))
  of ChardevBackendKind.Ringbuf:
    result = ChardevBackend(`type`: tag, ringbuf: parse(typedesc[ChardevRingbufWrapper], n))
  of ChardevBackendKind.Memory:
    result = ChardevBackend(`type`: tag, memory: parse(typedesc[ChardevRingbufWrapper], n))

proc `%`*(x: ChardevReturn): JsonNode =
  result = newJObject()
  if x.pty.isSome: result["pty"] = %(x.pty.get)

proc parse*(_: typedesc[ChardevReturn], n: JsonNode): ChardevReturn =
  result = default(ChardevReturn)
  if n.hasKey("pty") and n["pty"].kind != JNull:
    result.pty = some(n["pty"].getStr)

proc `%`*(x: DumpGuestMemoryFormat): JsonNode = %($x)
proc parse*(_: typedesc[DumpGuestMemoryFormat], n: JsonNode): DumpGuestMemoryFormat =
  let s = n.getStr
  case s
  of "elf": DumpGuestMemoryFormat.Elf
  of "kdump-zlib": DumpGuestMemoryFormat.KdumpZlib
  of "kdump-lzo": DumpGuestMemoryFormat.KdumpLzo
  of "kdump-snappy": DumpGuestMemoryFormat.KdumpSnappy
  of "kdump-raw-zlib": DumpGuestMemoryFormat.KdumpRawZlib
  of "kdump-raw-lzo": DumpGuestMemoryFormat.KdumpRawLzo
  of "kdump-raw-snappy": DumpGuestMemoryFormat.KdumpRawSnappy
  of "win-dmp": DumpGuestMemoryFormat.WinDmp
  else: raise newException(ValueError, "unknown DumpGuestMemoryFormat: " & s)

proc `%`*(x: DumpStatus): JsonNode = %($x)
proc parse*(_: typedesc[DumpStatus], n: JsonNode): DumpStatus =
  let s = n.getStr
  case s
  of "none": DumpStatus.None
  of "active": DumpStatus.Active
  of "completed": DumpStatus.Completed
  of "failed": DumpStatus.Failed
  else: raise newException(ValueError, "unknown DumpStatus: " & s)

proc `%`*(x: DumpQueryResult): JsonNode =
  result = newJObject()
  result["status"] = %(x.status)
  result["completed"] = %(x.completed)
  result["total"] = %(x.total)

proc parse*(_: typedesc[DumpQueryResult], n: JsonNode): DumpQueryResult =
  result = default(DumpQueryResult)
  result.status = parse(typedesc[DumpStatus], n["status"])
  result.completed = int64(n["completed"].getBiggestInt)
  result.total = int64(n["total"].getBiggestInt)

proc `%`*(x: DumpGuestMemoryCapability): JsonNode =
  result = newJObject()
  result["formats"] = %(x.formats)

proc parse*(_: typedesc[DumpGuestMemoryCapability], n: JsonNode): DumpGuestMemoryCapability =
  result = default(DumpGuestMemoryCapability)
  result.formats = (n["formats"]).getElems.mapIt(parse(typedesc[DumpGuestMemoryFormat], it))

proc `%`*(x: NetLegacyNicOptions): JsonNode =
  result = newJObject()
  if x.netdev.isSome: result["netdev"] = %(x.netdev.get)
  if x.macaddr.isSome: result["macaddr"] = %(x.macaddr.get)
  if x.model.isSome: result["model"] = %(x.model.get)
  if x.`addr`.isSome: result["addr"] = %(x.`addr`.get)
  if x.vectors.isSome: result["vectors"] = %(x.vectors.get)

proc parse*(_: typedesc[NetLegacyNicOptions], n: JsonNode): NetLegacyNicOptions =
  result = default(NetLegacyNicOptions)
  if n.hasKey("netdev") and n["netdev"].kind != JNull:
    result.netdev = some(n["netdev"].getStr)
  if n.hasKey("macaddr") and n["macaddr"].kind != JNull:
    result.macaddr = some(n["macaddr"].getStr)
  if n.hasKey("model") and n["model"].kind != JNull:
    result.model = some(n["model"].getStr)
  if n.hasKey("addr") and n["addr"].kind != JNull:
    result.`addr` = some(n["addr"].getStr)
  if n.hasKey("vectors") and n["vectors"].kind != JNull:
    result.vectors = some(uint32(n["vectors"].getBiggestInt))

proc `%`*(x: String): JsonNode =
  result = newJObject()
  result["str"] = %(x.str)

proc parse*(_: typedesc[String], n: JsonNode): String =
  result = default(String)
  result.str = n["str"].getStr

proc `%`*(x: NetDevPasstOptions): JsonNode =
  result = newJObject()
  if x.path.isSome: result["path"] = %(x.path.get)
  if x.quiet.isSome: result["quiet"] = %(x.quiet.get)
  if x.vhostUser.isSome: result["vhost-user"] = %(x.vhostUser.get)
  if x.mtu.isSome: result["mtu"] = %(x.mtu.get)
  if x.address.isSome: result["address"] = %(x.address.get)
  if x.netmask.isSome: result["netmask"] = %(x.netmask.get)
  if x.mac.isSome: result["mac"] = %(x.mac.get)
  if x.gateway.isSome: result["gateway"] = %(x.gateway.get)
  if x.`interface`.isSome: result["interface"] = %(x.`interface`.get)
  if x.outbound.isSome: result["outbound"] = %(x.outbound.get)
  if x.outboundIf4.isSome: result["outbound-if4"] = %(x.outboundIf4.get)
  if x.outboundIf6.isSome: result["outbound-if6"] = %(x.outboundIf6.get)
  if x.dns.isSome: result["dns"] = %(x.dns.get)
  if x.search.isSome: result["search"] = %(x.search.get)
  if x.fqdn.isSome: result["fqdn"] = %(x.fqdn.get)
  if x.dhcpDns.isSome: result["dhcp-dns"] = %(x.dhcpDns.get)
  if x.dhcpSearch.isSome: result["dhcp-search"] = %(x.dhcpSearch.get)
  if x.mapHostLoopback.isSome: result["map-host-loopback"] = %(x.mapHostLoopback.get)
  if x.mapGuestAddr.isSome: result["map-guest-addr"] = %(x.mapGuestAddr.get)
  if x.dnsForward.isSome: result["dns-forward"] = %(x.dnsForward.get)
  if x.dnsHost.isSome: result["dns-host"] = %(x.dnsHost.get)
  if x.tcp.isSome: result["tcp"] = %(x.tcp.get)
  if x.udp.isSome: result["udp"] = %(x.udp.get)
  if x.icmp.isSome: result["icmp"] = %(x.icmp.get)
  if x.dhcp.isSome: result["dhcp"] = %(x.dhcp.get)
  if x.ndp.isSome: result["ndp"] = %(x.ndp.get)
  if x.dhcpv6.isSome: result["dhcpv6"] = %(x.dhcpv6.get)
  if x.ra.isSome: result["ra"] = %(x.ra.get)
  if x.freebind.isSome: result["freebind"] = %(x.freebind.get)
  if x.ipv4.isSome: result["ipv4"] = %(x.ipv4.get)
  if x.ipv6.isSome: result["ipv6"] = %(x.ipv6.get)
  if x.tcpPorts.isSome: result["tcp-ports"] = %(x.tcpPorts.get)
  if x.udpPorts.isSome: result["udp-ports"] = %(x.udpPorts.get)
  if x.param.isSome: result["param"] = %(x.param.get)

proc parse*(_: typedesc[NetDevPasstOptions], n: JsonNode): NetDevPasstOptions =
  result = default(NetDevPasstOptions)
  if n.hasKey("path") and n["path"].kind != JNull:
    result.path = some(n["path"].getStr)
  if n.hasKey("quiet") and n["quiet"].kind != JNull:
    result.quiet = some(n["quiet"].getBool)
  if n.hasKey("vhost-user") and n["vhost-user"].kind != JNull:
    result.vhostUser = some(n["vhost-user"].getBool)
  if n.hasKey("mtu") and n["mtu"].kind != JNull:
    result.mtu = some(int64(n["mtu"].getBiggestInt))
  if n.hasKey("address") and n["address"].kind != JNull:
    result.address = some(n["address"].getStr)
  if n.hasKey("netmask") and n["netmask"].kind != JNull:
    result.netmask = some(n["netmask"].getStr)
  if n.hasKey("mac") and n["mac"].kind != JNull:
    result.mac = some(n["mac"].getStr)
  if n.hasKey("gateway") and n["gateway"].kind != JNull:
    result.gateway = some(n["gateway"].getStr)
  if n.hasKey("interface") and n["interface"].kind != JNull:
    result.`interface` = some(n["interface"].getStr)
  if n.hasKey("outbound") and n["outbound"].kind != JNull:
    result.outbound = some(n["outbound"].getStr)
  if n.hasKey("outbound-if4") and n["outbound-if4"].kind != JNull:
    result.outboundIf4 = some(n["outbound-if4"].getStr)
  if n.hasKey("outbound-if6") and n["outbound-if6"].kind != JNull:
    result.outboundIf6 = some(n["outbound-if6"].getStr)
  if n.hasKey("dns") and n["dns"].kind != JNull:
    result.dns = some(n["dns"].getStr)
  if n.hasKey("search") and n["search"].kind != JNull:
    result.search = some((n["search"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("fqdn") and n["fqdn"].kind != JNull:
    result.fqdn = some(n["fqdn"].getStr)
  if n.hasKey("dhcp-dns") and n["dhcp-dns"].kind != JNull:
    result.dhcpDns = some(n["dhcp-dns"].getBool)
  if n.hasKey("dhcp-search") and n["dhcp-search"].kind != JNull:
    result.dhcpSearch = some(n["dhcp-search"].getBool)
  if n.hasKey("map-host-loopback") and n["map-host-loopback"].kind != JNull:
    result.mapHostLoopback = some(n["map-host-loopback"].getStr)
  if n.hasKey("map-guest-addr") and n["map-guest-addr"].kind != JNull:
    result.mapGuestAddr = some(n["map-guest-addr"].getStr)
  if n.hasKey("dns-forward") and n["dns-forward"].kind != JNull:
    result.dnsForward = some(n["dns-forward"].getStr)
  if n.hasKey("dns-host") and n["dns-host"].kind != JNull:
    result.dnsHost = some(n["dns-host"].getStr)
  if n.hasKey("tcp") and n["tcp"].kind != JNull:
    result.tcp = some(n["tcp"].getBool)
  if n.hasKey("udp") and n["udp"].kind != JNull:
    result.udp = some(n["udp"].getBool)
  if n.hasKey("icmp") and n["icmp"].kind != JNull:
    result.icmp = some(n["icmp"].getBool)
  if n.hasKey("dhcp") and n["dhcp"].kind != JNull:
    result.dhcp = some(n["dhcp"].getBool)
  if n.hasKey("ndp") and n["ndp"].kind != JNull:
    result.ndp = some(n["ndp"].getBool)
  if n.hasKey("dhcpv6") and n["dhcpv6"].kind != JNull:
    result.dhcpv6 = some(n["dhcpv6"].getBool)
  if n.hasKey("ra") and n["ra"].kind != JNull:
    result.ra = some(n["ra"].getBool)
  if n.hasKey("freebind") and n["freebind"].kind != JNull:
    result.freebind = some(n["freebind"].getBool)
  if n.hasKey("ipv4") and n["ipv4"].kind != JNull:
    result.ipv4 = some(n["ipv4"].getBool)
  if n.hasKey("ipv6") and n["ipv6"].kind != JNull:
    result.ipv6 = some(n["ipv6"].getBool)
  if n.hasKey("tcp-ports") and n["tcp-ports"].kind != JNull:
    result.tcpPorts = some((n["tcp-ports"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("udp-ports") and n["udp-ports"].kind != JNull:
    result.udpPorts = some((n["udp-ports"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("param") and n["param"].kind != JNull:
    result.param = some((n["param"]).getElems.mapIt(parse(typedesc[String], it)))

proc `%`*(x: NetdevUserOptions): JsonNode =
  result = newJObject()
  if x.hostname.isSome: result["hostname"] = %(x.hostname.get)
  if x.restrict.isSome: result["restrict"] = %(x.restrict.get)
  if x.ipv4.isSome: result["ipv4"] = %(x.ipv4.get)
  if x.ipv6.isSome: result["ipv6"] = %(x.ipv6.get)
  if x.ip.isSome: result["ip"] = %(x.ip.get)
  if x.net.isSome: result["net"] = %(x.net.get)
  if x.host.isSome: result["host"] = %(x.host.get)
  if x.tftp.isSome: result["tftp"] = %(x.tftp.get)
  if x.bootfile.isSome: result["bootfile"] = %(x.bootfile.get)
  if x.dhcpstart.isSome: result["dhcpstart"] = %(x.dhcpstart.get)
  if x.dns.isSome: result["dns"] = %(x.dns.get)
  if x.dnssearch.isSome: result["dnssearch"] = %(x.dnssearch.get)
  if x.domainname.isSome: result["domainname"] = %(x.domainname.get)
  if x.ipv6Prefix.isSome: result["ipv6-prefix"] = %(x.ipv6Prefix.get)
  if x.ipv6Prefixlen.isSome: result["ipv6-prefixlen"] = %(x.ipv6Prefixlen.get)
  if x.ipv6Host.isSome: result["ipv6-host"] = %(x.ipv6Host.get)
  if x.ipv6Dns.isSome: result["ipv6-dns"] = %(x.ipv6Dns.get)
  if x.smb.isSome: result["smb"] = %(x.smb.get)
  if x.smbserver.isSome: result["smbserver"] = %(x.smbserver.get)
  if x.hostfwd.isSome: result["hostfwd"] = %(x.hostfwd.get)
  if x.guestfwd.isSome: result["guestfwd"] = %(x.guestfwd.get)
  if x.tftpServerName.isSome: result["tftp-server-name"] = %(x.tftpServerName.get)

proc parse*(_: typedesc[NetdevUserOptions], n: JsonNode): NetdevUserOptions =
  result = default(NetdevUserOptions)
  if n.hasKey("hostname") and n["hostname"].kind != JNull:
    result.hostname = some(n["hostname"].getStr)
  if n.hasKey("restrict") and n["restrict"].kind != JNull:
    result.restrict = some(n["restrict"].getBool)
  if n.hasKey("ipv4") and n["ipv4"].kind != JNull:
    result.ipv4 = some(n["ipv4"].getBool)
  if n.hasKey("ipv6") and n["ipv6"].kind != JNull:
    result.ipv6 = some(n["ipv6"].getBool)
  if n.hasKey("ip") and n["ip"].kind != JNull:
    result.ip = some(n["ip"].getStr)
  if n.hasKey("net") and n["net"].kind != JNull:
    result.net = some(n["net"].getStr)
  if n.hasKey("host") and n["host"].kind != JNull:
    result.host = some(n["host"].getStr)
  if n.hasKey("tftp") and n["tftp"].kind != JNull:
    result.tftp = some(n["tftp"].getStr)
  if n.hasKey("bootfile") and n["bootfile"].kind != JNull:
    result.bootfile = some(n["bootfile"].getStr)
  if n.hasKey("dhcpstart") and n["dhcpstart"].kind != JNull:
    result.dhcpstart = some(n["dhcpstart"].getStr)
  if n.hasKey("dns") and n["dns"].kind != JNull:
    result.dns = some(n["dns"].getStr)
  if n.hasKey("dnssearch") and n["dnssearch"].kind != JNull:
    result.dnssearch = some((n["dnssearch"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("domainname") and n["domainname"].kind != JNull:
    result.domainname = some(n["domainname"].getStr)
  if n.hasKey("ipv6-prefix") and n["ipv6-prefix"].kind != JNull:
    result.ipv6Prefix = some(n["ipv6-prefix"].getStr)
  if n.hasKey("ipv6-prefixlen") and n["ipv6-prefixlen"].kind != JNull:
    result.ipv6Prefixlen = some(int64(n["ipv6-prefixlen"].getBiggestInt))
  if n.hasKey("ipv6-host") and n["ipv6-host"].kind != JNull:
    result.ipv6Host = some(n["ipv6-host"].getStr)
  if n.hasKey("ipv6-dns") and n["ipv6-dns"].kind != JNull:
    result.ipv6Dns = some(n["ipv6-dns"].getStr)
  if n.hasKey("smb") and n["smb"].kind != JNull:
    result.smb = some(n["smb"].getStr)
  if n.hasKey("smbserver") and n["smbserver"].kind != JNull:
    result.smbserver = some(n["smbserver"].getStr)
  if n.hasKey("hostfwd") and n["hostfwd"].kind != JNull:
    result.hostfwd = some((n["hostfwd"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("guestfwd") and n["guestfwd"].kind != JNull:
    result.guestfwd = some((n["guestfwd"]).getElems.mapIt(parse(typedesc[String], it)))
  if n.hasKey("tftp-server-name") and n["tftp-server-name"].kind != JNull:
    result.tftpServerName = some(n["tftp-server-name"].getStr)

proc `%`*(x: NetdevTapOptions): JsonNode =
  result = newJObject()
  if x.ifname.isSome: result["ifname"] = %(x.ifname.get)
  if x.fd.isSome: result["fd"] = %(x.fd.get)
  if x.fds.isSome: result["fds"] = %(x.fds.get)
  if x.script.isSome: result["script"] = %(x.script.get)
  if x.downscript.isSome: result["downscript"] = %(x.downscript.get)
  if x.br.isSome: result["br"] = %(x.br.get)
  if x.helper.isSome: result["helper"] = %(x.helper.get)
  if x.sndbuf.isSome: result["sndbuf"] = %(x.sndbuf.get)
  if x.vnetHdr.isSome: result["vnet_hdr"] = %(x.vnetHdr.get)
  if x.vhost.isSome: result["vhost"] = %(x.vhost.get)
  if x.vhostfd.isSome: result["vhostfd"] = %(x.vhostfd.get)
  if x.vhostfds.isSome: result["vhostfds"] = %(x.vhostfds.get)
  if x.vhostforce.isSome: result["vhostforce"] = %(x.vhostforce.get)
  if x.queues.isSome: result["queues"] = %(x.queues.get)
  if x.pollUs.isSome: result["poll-us"] = %(x.pollUs.get)

proc parse*(_: typedesc[NetdevTapOptions], n: JsonNode): NetdevTapOptions =
  result = default(NetdevTapOptions)
  if n.hasKey("ifname") and n["ifname"].kind != JNull:
    result.ifname = some(n["ifname"].getStr)
  if n.hasKey("fd") and n["fd"].kind != JNull:
    result.fd = some(n["fd"].getStr)
  if n.hasKey("fds") and n["fds"].kind != JNull:
    result.fds = some(n["fds"].getStr)
  if n.hasKey("script") and n["script"].kind != JNull:
    result.script = some(n["script"].getStr)
  if n.hasKey("downscript") and n["downscript"].kind != JNull:
    result.downscript = some(n["downscript"].getStr)
  if n.hasKey("br") and n["br"].kind != JNull:
    result.br = some(n["br"].getStr)
  if n.hasKey("helper") and n["helper"].kind != JNull:
    result.helper = some(n["helper"].getStr)
  if n.hasKey("sndbuf") and n["sndbuf"].kind != JNull:
    result.sndbuf = some(cast[uint64](n["sndbuf"].getBiggestInt))
  if n.hasKey("vnet_hdr") and n["vnet_hdr"].kind != JNull:
    result.vnetHdr = some(n["vnet_hdr"].getBool)
  if n.hasKey("vhost") and n["vhost"].kind != JNull:
    result.vhost = some(n["vhost"].getBool)
  if n.hasKey("vhostfd") and n["vhostfd"].kind != JNull:
    result.vhostfd = some(n["vhostfd"].getStr)
  if n.hasKey("vhostfds") and n["vhostfds"].kind != JNull:
    result.vhostfds = some(n["vhostfds"].getStr)
  if n.hasKey("vhostforce") and n["vhostforce"].kind != JNull:
    result.vhostforce = some(n["vhostforce"].getBool)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(uint32(n["queues"].getBiggestInt))
  if n.hasKey("poll-us") and n["poll-us"].kind != JNull:
    result.pollUs = some(uint32(n["poll-us"].getBiggestInt))

proc `%`*(x: NetdevSocketOptions): JsonNode =
  result = newJObject()
  if x.fd.isSome: result["fd"] = %(x.fd.get)
  if x.listen.isSome: result["listen"] = %(x.listen.get)
  if x.connect.isSome: result["connect"] = %(x.connect.get)
  if x.mcast.isSome: result["mcast"] = %(x.mcast.get)
  if x.localaddr.isSome: result["localaddr"] = %(x.localaddr.get)
  if x.udp.isSome: result["udp"] = %(x.udp.get)

proc parse*(_: typedesc[NetdevSocketOptions], n: JsonNode): NetdevSocketOptions =
  result = default(NetdevSocketOptions)
  if n.hasKey("fd") and n["fd"].kind != JNull:
    result.fd = some(n["fd"].getStr)
  if n.hasKey("listen") and n["listen"].kind != JNull:
    result.listen = some(n["listen"].getStr)
  if n.hasKey("connect") and n["connect"].kind != JNull:
    result.connect = some(n["connect"].getStr)
  if n.hasKey("mcast") and n["mcast"].kind != JNull:
    result.mcast = some(n["mcast"].getStr)
  if n.hasKey("localaddr") and n["localaddr"].kind != JNull:
    result.localaddr = some(n["localaddr"].getStr)
  if n.hasKey("udp") and n["udp"].kind != JNull:
    result.udp = some(n["udp"].getStr)

proc `%`*(x: NetdevL2TPv3Options): JsonNode =
  result = newJObject()
  result["src"] = %(x.src)
  result["dst"] = %(x.dst)
  if x.srcport.isSome: result["srcport"] = %(x.srcport.get)
  if x.dstport.isSome: result["dstport"] = %(x.dstport.get)
  if x.ipv6.isSome: result["ipv6"] = %(x.ipv6.get)
  if x.udp.isSome: result["udp"] = %(x.udp.get)
  if x.cookie64.isSome: result["cookie64"] = %(x.cookie64.get)
  if x.counter.isSome: result["counter"] = %(x.counter.get)
  if x.pincounter.isSome: result["pincounter"] = %(x.pincounter.get)
  if x.txcookie.isSome: result["txcookie"] = %(x.txcookie.get)
  if x.rxcookie.isSome: result["rxcookie"] = %(x.rxcookie.get)
  result["txsession"] = %(x.txsession)
  if x.rxsession.isSome: result["rxsession"] = %(x.rxsession.get)
  if x.offset.isSome: result["offset"] = %(x.offset.get)

proc parse*(_: typedesc[NetdevL2TPv3Options], n: JsonNode): NetdevL2TPv3Options =
  result = default(NetdevL2TPv3Options)
  result.src = n["src"].getStr
  result.dst = n["dst"].getStr
  if n.hasKey("srcport") and n["srcport"].kind != JNull:
    result.srcport = some(n["srcport"].getStr)
  if n.hasKey("dstport") and n["dstport"].kind != JNull:
    result.dstport = some(n["dstport"].getStr)
  if n.hasKey("ipv6") and n["ipv6"].kind != JNull:
    result.ipv6 = some(n["ipv6"].getBool)
  if n.hasKey("udp") and n["udp"].kind != JNull:
    result.udp = some(n["udp"].getBool)
  if n.hasKey("cookie64") and n["cookie64"].kind != JNull:
    result.cookie64 = some(n["cookie64"].getBool)
  if n.hasKey("counter") and n["counter"].kind != JNull:
    result.counter = some(n["counter"].getBool)
  if n.hasKey("pincounter") and n["pincounter"].kind != JNull:
    result.pincounter = some(n["pincounter"].getBool)
  if n.hasKey("txcookie") and n["txcookie"].kind != JNull:
    result.txcookie = some(cast[uint64](n["txcookie"].getBiggestInt))
  if n.hasKey("rxcookie") and n["rxcookie"].kind != JNull:
    result.rxcookie = some(cast[uint64](n["rxcookie"].getBiggestInt))
  result.txsession = uint32(n["txsession"].getBiggestInt)
  if n.hasKey("rxsession") and n["rxsession"].kind != JNull:
    result.rxsession = some(uint32(n["rxsession"].getBiggestInt))
  if n.hasKey("offset") and n["offset"].kind != JNull:
    result.offset = some(uint32(n["offset"].getBiggestInt))

proc `%`*(x: NetdevVdeOptions): JsonNode =
  result = newJObject()
  if x.sock.isSome: result["sock"] = %(x.sock.get)
  if x.port.isSome: result["port"] = %(x.port.get)
  if x.group.isSome: result["group"] = %(x.group.get)
  if x.mode.isSome: result["mode"] = %(x.mode.get)

proc parse*(_: typedesc[NetdevVdeOptions], n: JsonNode): NetdevVdeOptions =
  result = default(NetdevVdeOptions)
  if n.hasKey("sock") and n["sock"].kind != JNull:
    result.sock = some(n["sock"].getStr)
  if n.hasKey("port") and n["port"].kind != JNull:
    result.port = some(uint16(n["port"].getBiggestInt))
  if n.hasKey("group") and n["group"].kind != JNull:
    result.group = some(n["group"].getStr)
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(uint16(n["mode"].getBiggestInt))

proc `%`*(x: NetdevBridgeOptions): JsonNode =
  result = newJObject()
  if x.br.isSome: result["br"] = %(x.br.get)
  if x.helper.isSome: result["helper"] = %(x.helper.get)

proc parse*(_: typedesc[NetdevBridgeOptions], n: JsonNode): NetdevBridgeOptions =
  result = default(NetdevBridgeOptions)
  if n.hasKey("br") and n["br"].kind != JNull:
    result.br = some(n["br"].getStr)
  if n.hasKey("helper") and n["helper"].kind != JNull:
    result.helper = some(n["helper"].getStr)

proc `%`*(x: NetdevHubPortOptions): JsonNode =
  result = newJObject()
  result["hubid"] = %(x.hubid)
  if x.netdev.isSome: result["netdev"] = %(x.netdev.get)

proc parse*(_: typedesc[NetdevHubPortOptions], n: JsonNode): NetdevHubPortOptions =
  result = default(NetdevHubPortOptions)
  result.hubid = int32(n["hubid"].getBiggestInt)
  if n.hasKey("netdev") and n["netdev"].kind != JNull:
    result.netdev = some(n["netdev"].getStr)

proc `%`*(x: NetdevNetmapOptions): JsonNode =
  result = newJObject()
  result["ifname"] = %(x.ifname)
  if x.devname.isSome: result["devname"] = %(x.devname.get)

proc parse*(_: typedesc[NetdevNetmapOptions], n: JsonNode): NetdevNetmapOptions =
  result = default(NetdevNetmapOptions)
  result.ifname = n["ifname"].getStr
  if n.hasKey("devname") and n["devname"].kind != JNull:
    result.devname = some(n["devname"].getStr)

proc `%`*(x: AFXDPMode): JsonNode = %($x)
proc parse*(_: typedesc[AFXDPMode], n: JsonNode): AFXDPMode =
  let s = n.getStr
  case s
  of "native": AFXDPMode.Native
  of "skb": AFXDPMode.Skb
  else: raise newException(ValueError, "unknown AFXDPMode: " & s)

proc `%`*(x: NetdevAFXDPOptions): JsonNode =
  result = newJObject()
  result["ifname"] = %(x.ifname)
  if x.mode.isSome: result["mode"] = %(x.mode.get)
  if x.forceCopy.isSome: result["force-copy"] = %(x.forceCopy.get)
  if x.queues.isSome: result["queues"] = %(x.queues.get)
  if x.startQueue.isSome: result["start-queue"] = %(x.startQueue.get)
  if x.inhibit.isSome: result["inhibit"] = %(x.inhibit.get)
  if x.sockFds.isSome: result["sock-fds"] = %(x.sockFds.get)
  if x.mapPath.isSome: result["map-path"] = %(x.mapPath.get)
  if x.mapStartIndex.isSome: result["map-start-index"] = %(x.mapStartIndex.get)

proc parse*(_: typedesc[NetdevAFXDPOptions], n: JsonNode): NetdevAFXDPOptions =
  result = default(NetdevAFXDPOptions)
  result.ifname = n["ifname"].getStr
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[AFXDPMode], n["mode"]))
  if n.hasKey("force-copy") and n["force-copy"].kind != JNull:
    result.forceCopy = some(n["force-copy"].getBool)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(int64(n["queues"].getBiggestInt))
  if n.hasKey("start-queue") and n["start-queue"].kind != JNull:
    result.startQueue = some(int64(n["start-queue"].getBiggestInt))
  if n.hasKey("inhibit") and n["inhibit"].kind != JNull:
    result.inhibit = some(n["inhibit"].getBool)
  if n.hasKey("sock-fds") and n["sock-fds"].kind != JNull:
    result.sockFds = some(n["sock-fds"].getStr)
  if n.hasKey("map-path") and n["map-path"].kind != JNull:
    result.mapPath = some(n["map-path"].getStr)
  if n.hasKey("map-start-index") and n["map-start-index"].kind != JNull:
    result.mapStartIndex = some(int32(n["map-start-index"].getBiggestInt))

proc `%`*(x: NetdevVhostUserOptions): JsonNode =
  result = newJObject()
  result["chardev"] = %(x.chardev)
  if x.vhostforce.isSome: result["vhostforce"] = %(x.vhostforce.get)
  if x.queues.isSome: result["queues"] = %(x.queues.get)

proc parse*(_: typedesc[NetdevVhostUserOptions], n: JsonNode): NetdevVhostUserOptions =
  result = default(NetdevVhostUserOptions)
  result.chardev = n["chardev"].getStr
  if n.hasKey("vhostforce") and n["vhostforce"].kind != JNull:
    result.vhostforce = some(n["vhostforce"].getBool)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(int64(n["queues"].getBiggestInt))

proc `%`*(x: NetdevVhostVDPAOptions): JsonNode =
  result = newJObject()
  if x.vhostdev.isSome: result["vhostdev"] = %(x.vhostdev.get)
  if x.vhostfd.isSome: result["vhostfd"] = %(x.vhostfd.get)
  if x.queues.isSome: result["queues"] = %(x.queues.get)
  if x.xSvq.isSome: result["x-svq"] = %(x.xSvq.get)

proc parse*(_: typedesc[NetdevVhostVDPAOptions], n: JsonNode): NetdevVhostVDPAOptions =
  result = default(NetdevVhostVDPAOptions)
  if n.hasKey("vhostdev") and n["vhostdev"].kind != JNull:
    result.vhostdev = some(n["vhostdev"].getStr)
  if n.hasKey("vhostfd") and n["vhostfd"].kind != JNull:
    result.vhostfd = some(n["vhostfd"].getStr)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(int64(n["queues"].getBiggestInt))
  if n.hasKey("x-svq") and n["x-svq"].kind != JNull:
    result.xSvq = some(n["x-svq"].getBool)

proc `%`*(x: NetdevVmnetHostOptions): JsonNode =
  result = newJObject()
  if x.startAddress.isSome: result["start-address"] = %(x.startAddress.get)
  if x.endAddress.isSome: result["end-address"] = %(x.endAddress.get)
  if x.subnetMask.isSome: result["subnet-mask"] = %(x.subnetMask.get)
  if x.isolated.isSome: result["isolated"] = %(x.isolated.get)
  if x.netUuid.isSome: result["net-uuid"] = %(x.netUuid.get)

proc parse*(_: typedesc[NetdevVmnetHostOptions], n: JsonNode): NetdevVmnetHostOptions =
  result = default(NetdevVmnetHostOptions)
  if n.hasKey("start-address") and n["start-address"].kind != JNull:
    result.startAddress = some(n["start-address"].getStr)
  if n.hasKey("end-address") and n["end-address"].kind != JNull:
    result.endAddress = some(n["end-address"].getStr)
  if n.hasKey("subnet-mask") and n["subnet-mask"].kind != JNull:
    result.subnetMask = some(n["subnet-mask"].getStr)
  if n.hasKey("isolated") and n["isolated"].kind != JNull:
    result.isolated = some(n["isolated"].getBool)
  if n.hasKey("net-uuid") and n["net-uuid"].kind != JNull:
    result.netUuid = some(n["net-uuid"].getStr)

proc `%`*(x: NetdevVmnetSharedOptions): JsonNode =
  result = newJObject()
  if x.startAddress.isSome: result["start-address"] = %(x.startAddress.get)
  if x.endAddress.isSome: result["end-address"] = %(x.endAddress.get)
  if x.subnetMask.isSome: result["subnet-mask"] = %(x.subnetMask.get)
  if x.isolated.isSome: result["isolated"] = %(x.isolated.get)
  if x.nat66Prefix.isSome: result["nat66-prefix"] = %(x.nat66Prefix.get)

proc parse*(_: typedesc[NetdevVmnetSharedOptions], n: JsonNode): NetdevVmnetSharedOptions =
  result = default(NetdevVmnetSharedOptions)
  if n.hasKey("start-address") and n["start-address"].kind != JNull:
    result.startAddress = some(n["start-address"].getStr)
  if n.hasKey("end-address") and n["end-address"].kind != JNull:
    result.endAddress = some(n["end-address"].getStr)
  if n.hasKey("subnet-mask") and n["subnet-mask"].kind != JNull:
    result.subnetMask = some(n["subnet-mask"].getStr)
  if n.hasKey("isolated") and n["isolated"].kind != JNull:
    result.isolated = some(n["isolated"].getBool)
  if n.hasKey("nat66-prefix") and n["nat66-prefix"].kind != JNull:
    result.nat66Prefix = some(n["nat66-prefix"].getStr)

proc `%`*(x: NetdevVmnetBridgedOptions): JsonNode =
  result = newJObject()
  result["ifname"] = %(x.ifname)
  if x.isolated.isSome: result["isolated"] = %(x.isolated.get)

proc parse*(_: typedesc[NetdevVmnetBridgedOptions], n: JsonNode): NetdevVmnetBridgedOptions =
  result = default(NetdevVmnetBridgedOptions)
  result.ifname = n["ifname"].getStr
  if n.hasKey("isolated") and n["isolated"].kind != JNull:
    result.isolated = some(n["isolated"].getBool)

proc `%`*(x: NetdevStreamOptions): JsonNode =
  result = newJObject()
  result["addr"] = %(x.`addr`)
  if x.server.isSome: result["server"] = %(x.server.get)
  if x.reconnectMs.isSome: result["reconnect-ms"] = %(x.reconnectMs.get)

proc parse*(_: typedesc[NetdevStreamOptions], n: JsonNode): NetdevStreamOptions =
  result = default(NetdevStreamOptions)
  result.`addr` = parse(typedesc[SocketAddress], n["addr"])
  if n.hasKey("server") and n["server"].kind != JNull:
    result.server = some(n["server"].getBool)
  if n.hasKey("reconnect-ms") and n["reconnect-ms"].kind != JNull:
    result.reconnectMs = some(int64(n["reconnect-ms"].getBiggestInt))

proc `%`*(x: NetdevDgramOptions): JsonNode =
  result = newJObject()
  if x.local.isSome: result["local"] = %(x.local.get)
  if x.remote.isSome: result["remote"] = %(x.remote.get)

proc parse*(_: typedesc[NetdevDgramOptions], n: JsonNode): NetdevDgramOptions =
  result = default(NetdevDgramOptions)
  if n.hasKey("local") and n["local"].kind != JNull:
    result.local = some(parse(typedesc[SocketAddress], n["local"]))
  if n.hasKey("remote") and n["remote"].kind != JNull:
    result.remote = some(parse(typedesc[SocketAddress], n["remote"]))

proc `%`*(x: NetClientDriver): JsonNode = %($x)
proc parse*(_: typedesc[NetClientDriver], n: JsonNode): NetClientDriver =
  let s = n.getStr
  case s
  of "none": NetClientDriver.None
  of "nic": NetClientDriver.Nic
  of "user": NetClientDriver.User
  of "tap": NetClientDriver.Tap
  of "l2tpv3": NetClientDriver.L2tpv3
  of "socket": NetClientDriver.Socket
  of "stream": NetClientDriver.Stream
  of "dgram": NetClientDriver.Dgram
  of "vde": NetClientDriver.Vde
  of "bridge": NetClientDriver.Bridge
  of "hubport": NetClientDriver.Hubport
  of "netmap": NetClientDriver.Netmap
  of "vhost-user": NetClientDriver.VhostUser
  of "vhost-vdpa": NetClientDriver.VhostVdpa
  of "passt": NetClientDriver.Passt
  of "af-xdp": NetClientDriver.AfXdp
  of "vmnet-host": NetClientDriver.VmnetHost
  of "vmnet-shared": NetClientDriver.VmnetShared
  of "vmnet-bridged": NetClientDriver.VmnetBridged
  else: raise newException(ValueError, "unknown NetClientDriver: " & s)

proc `%`*(x: Netdev): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %($x.`type`)
  case x.`type`
  of NetClientDriver.Nic:
    let sub = %(x.nic)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Passt:
    let sub = %(x.passt)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.User:
    let sub = %(x.user)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Tap:
    let sub = %(x.tap)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.L2tpv3:
    let sub = %(x.l2tpv3)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Socket:
    let sub = %(x.socket)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Stream:
    let sub = %(x.stream)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Dgram:
    let sub = %(x.dgram)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Vde:
    let sub = %(x.vde)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Bridge:
    let sub = %(x.bridge)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Hubport:
    let sub = %(x.hubport)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.Netmap:
    let sub = %(x.netmap)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.AfXdp:
    let sub = %(x.afXdp)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.VhostUser:
    let sub = %(x.vhostUser)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.VhostVdpa:
    let sub = %(x.vhostVdpa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.VmnetHost:
    let sub = %(x.vmnetHost)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.VmnetShared:
    let sub = %(x.vmnetShared)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.VmnetBridged:
    let sub = %(x.vmnetBridged)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NetClientDriver.None: discard

proc parse*(_: typedesc[Netdev], n: JsonNode): Netdev =
  result = default(Netdev)
  let tag = parse(typedesc[NetClientDriver], n["type"])
  case tag
  of NetClientDriver.Nic:
    result = Netdev(`type`: tag, nic: parse(typedesc[NetLegacyNicOptions], n))
  of NetClientDriver.Passt:
    result = Netdev(`type`: tag, passt: parse(typedesc[NetDevPasstOptions], n))
  of NetClientDriver.User:
    result = Netdev(`type`: tag, user: parse(typedesc[NetdevUserOptions], n))
  of NetClientDriver.Tap:
    result = Netdev(`type`: tag, tap: parse(typedesc[NetdevTapOptions], n))
  of NetClientDriver.L2tpv3:
    result = Netdev(`type`: tag, l2tpv3: parse(typedesc[NetdevL2TPv3Options], n))
  of NetClientDriver.Socket:
    result = Netdev(`type`: tag, socket: parse(typedesc[NetdevSocketOptions], n))
  of NetClientDriver.Stream:
    result = Netdev(`type`: tag, stream: parse(typedesc[NetdevStreamOptions], n))
  of NetClientDriver.Dgram:
    result = Netdev(`type`: tag, dgram: parse(typedesc[NetdevDgramOptions], n))
  of NetClientDriver.Vde:
    result = Netdev(`type`: tag, vde: parse(typedesc[NetdevVdeOptions], n))
  of NetClientDriver.Bridge:
    result = Netdev(`type`: tag, bridge: parse(typedesc[NetdevBridgeOptions], n))
  of NetClientDriver.Hubport:
    result = Netdev(`type`: tag, hubport: parse(typedesc[NetdevHubPortOptions], n))
  of NetClientDriver.Netmap:
    result = Netdev(`type`: tag, netmap: parse(typedesc[NetdevNetmapOptions], n))
  of NetClientDriver.AfXdp:
    result = Netdev(`type`: tag, afXdp: parse(typedesc[NetdevAFXDPOptions], n))
  of NetClientDriver.VhostUser:
    result = Netdev(`type`: tag, vhostUser: parse(typedesc[NetdevVhostUserOptions], n))
  of NetClientDriver.VhostVdpa:
    result = Netdev(`type`: tag, vhostVdpa: parse(typedesc[NetdevVhostVDPAOptions], n))
  of NetClientDriver.VmnetHost:
    result = Netdev(`type`: tag, vmnetHost: parse(typedesc[NetdevVmnetHostOptions], n))
  of NetClientDriver.VmnetShared:
    result = Netdev(`type`: tag, vmnetShared: parse(typedesc[NetdevVmnetSharedOptions], n))
  of NetClientDriver.VmnetBridged:
    result = Netdev(`type`: tag, vmnetBridged: parse(typedesc[NetdevVmnetBridgedOptions], n))
  of NetClientDriver.None:
    result = Netdev(`type`: tag)
  result.id = n["id"].getStr

proc `%`*(x: RxState): JsonNode = %($x)
proc parse*(_: typedesc[RxState], n: JsonNode): RxState =
  let s = n.getStr
  case s
  of "normal": RxState.Normal
  of "none": RxState.None
  of "all": RxState.All
  else: raise newException(ValueError, "unknown RxState: " & s)

proc `%`*(x: RxFilterInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["promiscuous"] = %(x.promiscuous)
  result["multicast"] = %(x.multicast)
  result["unicast"] = %(x.unicast)
  result["vlan"] = %(x.vlan)
  result["broadcast-allowed"] = %(x.broadcastAllowed)
  result["multicast-overflow"] = %(x.multicastOverflow)
  result["unicast-overflow"] = %(x.unicastOverflow)
  result["main-mac"] = %(x.mainMac)
  result["vlan-table"] = %(x.vlanTable)
  result["unicast-table"] = %(x.unicastTable)
  result["multicast-table"] = %(x.multicastTable)

proc parse*(_: typedesc[RxFilterInfo], n: JsonNode): RxFilterInfo =
  result = default(RxFilterInfo)
  result.name = n["name"].getStr
  result.promiscuous = n["promiscuous"].getBool
  result.multicast = parse(typedesc[RxState], n["multicast"])
  result.unicast = parse(typedesc[RxState], n["unicast"])
  result.vlan = parse(typedesc[RxState], n["vlan"])
  result.broadcastAllowed = n["broadcast-allowed"].getBool
  result.multicastOverflow = n["multicast-overflow"].getBool
  result.unicastOverflow = n["unicast-overflow"].getBool
  result.mainMac = n["main-mac"].getStr
  result.vlanTable = (n["vlan-table"]).getElems.mapIt(int64(it.getBiggestInt))
  result.unicastTable = (n["unicast-table"]).getElems.mapIt(it.getStr)
  result.multicastTable = (n["multicast-table"]).getElems.mapIt(it.getStr)

proc `%`*(x: AnnounceParameters): JsonNode =
  result = newJObject()
  result["initial"] = %(x.initial)
  result["max"] = %(x.max)
  result["rounds"] = %(x.rounds)
  result["step"] = %(x.step)
  if x.interfaces.isSome: result["interfaces"] = %(x.interfaces.get)
  if x.id.isSome: result["id"] = %(x.id.get)

proc parse*(_: typedesc[AnnounceParameters], n: JsonNode): AnnounceParameters =
  result = default(AnnounceParameters)
  result.initial = int64(n["initial"].getBiggestInt)
  result.max = int64(n["max"].getBiggestInt)
  result.rounds = int64(n["rounds"].getBiggestInt)
  result.step = int64(n["step"].getBiggestInt)
  if n.hasKey("interfaces") and n["interfaces"].kind != JNull:
    result.interfaces = some((n["interfaces"]).getElems.mapIt(it.getStr))
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)

proc `%`*(x: EbpfObject): JsonNode =
  result = newJObject()
  result["object"] = %(x.`object`)

proc parse*(_: typedesc[EbpfObject], n: JsonNode): EbpfObject =
  result = default(EbpfObject)
  result.`object` = n["object"].getStr

proc `%`*(x: EbpfProgramID): JsonNode = %($x)
proc parse*(_: typedesc[EbpfProgramID], n: JsonNode): EbpfProgramID =
  let s = n.getStr
  case s
  of "rss": EbpfProgramID.Rss
  else: raise newException(ValueError, "unknown EbpfProgramID: " & s)

proc `%`*(x: RockerSwitch): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["id"] = %(x.id)
  result["ports"] = %(x.ports)

proc parse*(_: typedesc[RockerSwitch], n: JsonNode): RockerSwitch =
  result = default(RockerSwitch)
  result.name = n["name"].getStr
  result.id = cast[uint64](n["id"].getBiggestInt)
  result.ports = uint32(n["ports"].getBiggestInt)

proc `%`*(x: RockerPortDuplex): JsonNode = %($x)
proc parse*(_: typedesc[RockerPortDuplex], n: JsonNode): RockerPortDuplex =
  let s = n.getStr
  case s
  of "half": RockerPortDuplex.Half
  of "full": RockerPortDuplex.Full
  else: raise newException(ValueError, "unknown RockerPortDuplex: " & s)

proc `%`*(x: RockerPortAutoneg): JsonNode = %($x)
proc parse*(_: typedesc[RockerPortAutoneg], n: JsonNode): RockerPortAutoneg =
  let s = n.getStr
  case s
  of "off": RockerPortAutoneg.Off
  of "on": RockerPortAutoneg.On
  else: raise newException(ValueError, "unknown RockerPortAutoneg: " & s)

proc `%`*(x: RockerPort): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["enabled"] = %(x.enabled)
  result["link-up"] = %(x.linkUp)
  result["speed"] = %(x.speed)
  result["duplex"] = %(x.duplex)
  result["autoneg"] = %(x.autoneg)

proc parse*(_: typedesc[RockerPort], n: JsonNode): RockerPort =
  result = default(RockerPort)
  result.name = n["name"].getStr
  result.enabled = n["enabled"].getBool
  result.linkUp = n["link-up"].getBool
  result.speed = uint32(n["speed"].getBiggestInt)
  result.duplex = parse(typedesc[RockerPortDuplex], n["duplex"])
  result.autoneg = parse(typedesc[RockerPortAutoneg], n["autoneg"])

proc `%`*(x: RockerOfDpaFlowKey): JsonNode =
  result = newJObject()
  result["priority"] = %(x.priority)
  result["tbl-id"] = %(x.tblId)
  if x.inPport.isSome: result["in-pport"] = %(x.inPport.get)
  if x.tunnelId.isSome: result["tunnel-id"] = %(x.tunnelId.get)
  if x.vlanId.isSome: result["vlan-id"] = %(x.vlanId.get)
  if x.ethType.isSome: result["eth-type"] = %(x.ethType.get)
  if x.ethSrc.isSome: result["eth-src"] = %(x.ethSrc.get)
  if x.ethDst.isSome: result["eth-dst"] = %(x.ethDst.get)
  if x.ipProto.isSome: result["ip-proto"] = %(x.ipProto.get)
  if x.ipTos.isSome: result["ip-tos"] = %(x.ipTos.get)
  if x.ipDst.isSome: result["ip-dst"] = %(x.ipDst.get)

proc parse*(_: typedesc[RockerOfDpaFlowKey], n: JsonNode): RockerOfDpaFlowKey =
  result = default(RockerOfDpaFlowKey)
  result.priority = uint32(n["priority"].getBiggestInt)
  result.tblId = uint32(n["tbl-id"].getBiggestInt)
  if n.hasKey("in-pport") and n["in-pport"].kind != JNull:
    result.inPport = some(uint32(n["in-pport"].getBiggestInt))
  if n.hasKey("tunnel-id") and n["tunnel-id"].kind != JNull:
    result.tunnelId = some(uint32(n["tunnel-id"].getBiggestInt))
  if n.hasKey("vlan-id") and n["vlan-id"].kind != JNull:
    result.vlanId = some(uint16(n["vlan-id"].getBiggestInt))
  if n.hasKey("eth-type") and n["eth-type"].kind != JNull:
    result.ethType = some(uint16(n["eth-type"].getBiggestInt))
  if n.hasKey("eth-src") and n["eth-src"].kind != JNull:
    result.ethSrc = some(n["eth-src"].getStr)
  if n.hasKey("eth-dst") and n["eth-dst"].kind != JNull:
    result.ethDst = some(n["eth-dst"].getStr)
  if n.hasKey("ip-proto") and n["ip-proto"].kind != JNull:
    result.ipProto = some(uint8(n["ip-proto"].getBiggestInt))
  if n.hasKey("ip-tos") and n["ip-tos"].kind != JNull:
    result.ipTos = some(uint8(n["ip-tos"].getBiggestInt))
  if n.hasKey("ip-dst") and n["ip-dst"].kind != JNull:
    result.ipDst = some(n["ip-dst"].getStr)

proc `%`*(x: RockerOfDpaFlowMask): JsonNode =
  result = newJObject()
  if x.inPport.isSome: result["in-pport"] = %(x.inPport.get)
  if x.tunnelId.isSome: result["tunnel-id"] = %(x.tunnelId.get)
  if x.vlanId.isSome: result["vlan-id"] = %(x.vlanId.get)
  if x.ethSrc.isSome: result["eth-src"] = %(x.ethSrc.get)
  if x.ethDst.isSome: result["eth-dst"] = %(x.ethDst.get)
  if x.ipProto.isSome: result["ip-proto"] = %(x.ipProto.get)
  if x.ipTos.isSome: result["ip-tos"] = %(x.ipTos.get)

proc parse*(_: typedesc[RockerOfDpaFlowMask], n: JsonNode): RockerOfDpaFlowMask =
  result = default(RockerOfDpaFlowMask)
  if n.hasKey("in-pport") and n["in-pport"].kind != JNull:
    result.inPport = some(uint32(n["in-pport"].getBiggestInt))
  if n.hasKey("tunnel-id") and n["tunnel-id"].kind != JNull:
    result.tunnelId = some(uint32(n["tunnel-id"].getBiggestInt))
  if n.hasKey("vlan-id") and n["vlan-id"].kind != JNull:
    result.vlanId = some(uint16(n["vlan-id"].getBiggestInt))
  if n.hasKey("eth-src") and n["eth-src"].kind != JNull:
    result.ethSrc = some(n["eth-src"].getStr)
  if n.hasKey("eth-dst") and n["eth-dst"].kind != JNull:
    result.ethDst = some(n["eth-dst"].getStr)
  if n.hasKey("ip-proto") and n["ip-proto"].kind != JNull:
    result.ipProto = some(uint8(n["ip-proto"].getBiggestInt))
  if n.hasKey("ip-tos") and n["ip-tos"].kind != JNull:
    result.ipTos = some(uint8(n["ip-tos"].getBiggestInt))

proc `%`*(x: RockerOfDpaFlowAction): JsonNode =
  result = newJObject()
  if x.gotoTbl.isSome: result["goto-tbl"] = %(x.gotoTbl.get)
  if x.groupId.isSome: result["group-id"] = %(x.groupId.get)
  if x.tunnelLport.isSome: result["tunnel-lport"] = %(x.tunnelLport.get)
  if x.vlanId.isSome: result["vlan-id"] = %(x.vlanId.get)
  if x.newVlanId.isSome: result["new-vlan-id"] = %(x.newVlanId.get)
  if x.outPport.isSome: result["out-pport"] = %(x.outPport.get)

proc parse*(_: typedesc[RockerOfDpaFlowAction], n: JsonNode): RockerOfDpaFlowAction =
  result = default(RockerOfDpaFlowAction)
  if n.hasKey("goto-tbl") and n["goto-tbl"].kind != JNull:
    result.gotoTbl = some(uint32(n["goto-tbl"].getBiggestInt))
  if n.hasKey("group-id") and n["group-id"].kind != JNull:
    result.groupId = some(uint32(n["group-id"].getBiggestInt))
  if n.hasKey("tunnel-lport") and n["tunnel-lport"].kind != JNull:
    result.tunnelLport = some(uint32(n["tunnel-lport"].getBiggestInt))
  if n.hasKey("vlan-id") and n["vlan-id"].kind != JNull:
    result.vlanId = some(uint16(n["vlan-id"].getBiggestInt))
  if n.hasKey("new-vlan-id") and n["new-vlan-id"].kind != JNull:
    result.newVlanId = some(uint16(n["new-vlan-id"].getBiggestInt))
  if n.hasKey("out-pport") and n["out-pport"].kind != JNull:
    result.outPport = some(uint32(n["out-pport"].getBiggestInt))

proc `%`*(x: RockerOfDpaFlow): JsonNode =
  result = newJObject()
  result["cookie"] = %(x.cookie)
  result["hits"] = %(x.hits)
  result["key"] = %(x.key)
  result["mask"] = %(x.mask)
  result["action"] = %(x.action)

proc parse*(_: typedesc[RockerOfDpaFlow], n: JsonNode): RockerOfDpaFlow =
  result = default(RockerOfDpaFlow)
  result.cookie = cast[uint64](n["cookie"].getBiggestInt)
  result.hits = cast[uint64](n["hits"].getBiggestInt)
  result.key = parse(typedesc[RockerOfDpaFlowKey], n["key"])
  result.mask = parse(typedesc[RockerOfDpaFlowMask], n["mask"])
  result.action = parse(typedesc[RockerOfDpaFlowAction], n["action"])

proc `%`*(x: RockerOfDpaGroup): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["type"] = %(x.`type`)
  if x.vlanId.isSome: result["vlan-id"] = %(x.vlanId.get)
  if x.pport.isSome: result["pport"] = %(x.pport.get)
  if x.index.isSome: result["index"] = %(x.index.get)
  if x.outPport.isSome: result["out-pport"] = %(x.outPport.get)
  if x.groupId.isSome: result["group-id"] = %(x.groupId.get)
  if x.setVlanId.isSome: result["set-vlan-id"] = %(x.setVlanId.get)
  if x.popVlan.isSome: result["pop-vlan"] = %(x.popVlan.get)
  if x.groupIds.isSome: result["group-ids"] = %(x.groupIds.get)
  if x.setEthSrc.isSome: result["set-eth-src"] = %(x.setEthSrc.get)
  if x.setEthDst.isSome: result["set-eth-dst"] = %(x.setEthDst.get)
  if x.ttlCheck.isSome: result["ttl-check"] = %(x.ttlCheck.get)

proc parse*(_: typedesc[RockerOfDpaGroup], n: JsonNode): RockerOfDpaGroup =
  result = default(RockerOfDpaGroup)
  result.id = uint32(n["id"].getBiggestInt)
  result.`type` = uint8(n["type"].getBiggestInt)
  if n.hasKey("vlan-id") and n["vlan-id"].kind != JNull:
    result.vlanId = some(uint16(n["vlan-id"].getBiggestInt))
  if n.hasKey("pport") and n["pport"].kind != JNull:
    result.pport = some(uint32(n["pport"].getBiggestInt))
  if n.hasKey("index") and n["index"].kind != JNull:
    result.index = some(uint32(n["index"].getBiggestInt))
  if n.hasKey("out-pport") and n["out-pport"].kind != JNull:
    result.outPport = some(uint32(n["out-pport"].getBiggestInt))
  if n.hasKey("group-id") and n["group-id"].kind != JNull:
    result.groupId = some(uint32(n["group-id"].getBiggestInt))
  if n.hasKey("set-vlan-id") and n["set-vlan-id"].kind != JNull:
    result.setVlanId = some(uint16(n["set-vlan-id"].getBiggestInt))
  if n.hasKey("pop-vlan") and n["pop-vlan"].kind != JNull:
    result.popVlan = some(uint8(n["pop-vlan"].getBiggestInt))
  if n.hasKey("group-ids") and n["group-ids"].kind != JNull:
    result.groupIds = some((n["group-ids"]).getElems.mapIt(uint32(it.getBiggestInt)))
  if n.hasKey("set-eth-src") and n["set-eth-src"].kind != JNull:
    result.setEthSrc = some(n["set-eth-src"].getStr)
  if n.hasKey("set-eth-dst") and n["set-eth-dst"].kind != JNull:
    result.setEthDst = some(n["set-eth-dst"].getStr)
  if n.hasKey("ttl-check") and n["ttl-check"].kind != JNull:
    result.ttlCheck = some(uint8(n["ttl-check"].getBiggestInt))

proc `%`*(x: TpmModel): JsonNode = %($x)
proc parse*(_: typedesc[TpmModel], n: JsonNode): TpmModel =
  let s = n.getStr
  case s
  of "tpm-tis": TpmModel.TpmTis
  of "tpm-crb": TpmModel.TpmCrb
  of "tpm-spapr": TpmModel.TpmSpapr
  else: raise newException(ValueError, "unknown TpmModel: " & s)

proc `%`*(x: TpmType): JsonNode = %($x)
proc parse*(_: typedesc[TpmType], n: JsonNode): TpmType =
  let s = n.getStr
  case s
  of "passthrough": TpmType.Passthrough
  of "emulator": TpmType.Emulator
  else: raise newException(ValueError, "unknown TpmType: " & s)

proc `%`*(x: TPMPassthroughOptions): JsonNode =
  result = newJObject()
  if x.path.isSome: result["path"] = %(x.path.get)
  if x.cancelPath.isSome: result["cancel-path"] = %(x.cancelPath.get)

proc parse*(_: typedesc[TPMPassthroughOptions], n: JsonNode): TPMPassthroughOptions =
  result = default(TPMPassthroughOptions)
  if n.hasKey("path") and n["path"].kind != JNull:
    result.path = some(n["path"].getStr)
  if n.hasKey("cancel-path") and n["cancel-path"].kind != JNull:
    result.cancelPath = some(n["cancel-path"].getStr)

proc `%`*(x: TPMEmulatorOptions): JsonNode =
  result = newJObject()
  result["chardev"] = %(x.chardev)

proc parse*(_: typedesc[TPMEmulatorOptions], n: JsonNode): TPMEmulatorOptions =
  result = default(TPMEmulatorOptions)
  result.chardev = n["chardev"].getStr

proc `%`*(x: TPMPassthroughOptionsWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[TPMPassthroughOptionsWrapper], n: JsonNode): TPMPassthroughOptionsWrapper =
  result = default(TPMPassthroughOptionsWrapper)
  result.data = parse(typedesc[TPMPassthroughOptions], n["data"])

proc `%`*(x: TPMEmulatorOptionsWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[TPMEmulatorOptionsWrapper], n: JsonNode): TPMEmulatorOptionsWrapper =
  result = default(TPMEmulatorOptionsWrapper)
  result.data = parse(typedesc[TPMEmulatorOptions], n["data"])

proc `%`*(x: TpmTypeOptions): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of TpmType.Passthrough:
    let sub = %(x.passthrough)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TpmType.Emulator:
    let sub = %(x.emulator)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[TpmTypeOptions], n: JsonNode): TpmTypeOptions =
  result = default(TpmTypeOptions)
  let tag = parse(typedesc[TpmType], n["type"])
  case tag
  of TpmType.Passthrough:
    result = TpmTypeOptions(`type`: tag, passthrough: parse(typedesc[TPMPassthroughOptionsWrapper], n))
  of TpmType.Emulator:
    result = TpmTypeOptions(`type`: tag, emulator: parse(typedesc[TPMEmulatorOptionsWrapper], n))

proc `%`*(x: TPMInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["model"] = %(x.model)
  result["options"] = %(x.options)

proc parse*(_: typedesc[TPMInfo], n: JsonNode): TPMInfo =
  result = default(TPMInfo)
  result.id = n["id"].getStr
  result.model = parse(typedesc[TpmModel], n["model"])
  result.options = parse(typedesc[TpmTypeOptions], n["options"])

proc `%`*(x: DisplayProtocol): JsonNode = %($x)
proc parse*(_: typedesc[DisplayProtocol], n: JsonNode): DisplayProtocol =
  let s = n.getStr
  case s
  of "vnc": DisplayProtocol.Vnc
  of "spice": DisplayProtocol.Spice
  else: raise newException(ValueError, "unknown DisplayProtocol: " & s)

proc `%`*(x: SetPasswordAction): JsonNode = %($x)
proc parse*(_: typedesc[SetPasswordAction], n: JsonNode): SetPasswordAction =
  let s = n.getStr
  case s
  of "keep": SetPasswordAction.Keep
  of "fail": SetPasswordAction.Fail
  of "disconnect": SetPasswordAction.Disconnect
  else: raise newException(ValueError, "unknown SetPasswordAction: " & s)

proc `%`*(x: SetPasswordOptions): JsonNode =
  result = newJObject()
  result["password"] = %(x.password)
  if x.connected.isSome: result["connected"] = %(x.connected.get)
  result["protocol"] = %($x.protocol)
  case x.protocol
  of DisplayProtocol.Vnc:
    let sub = %(x.vnc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayProtocol.Spice: discard

proc parse*(_: typedesc[SetPasswordOptions], n: JsonNode): SetPasswordOptions =
  result = default(SetPasswordOptions)
  let tag = parse(typedesc[DisplayProtocol], n["protocol"])
  case tag
  of DisplayProtocol.Vnc:
    result = SetPasswordOptions(protocol: tag, vnc: parse(typedesc[SetPasswordOptionsVnc], n))
  of DisplayProtocol.Spice:
    result = SetPasswordOptions(protocol: tag)
  result.password = n["password"].getStr
  if n.hasKey("connected") and n["connected"].kind != JNull:
    result.connected = some(parse(typedesc[SetPasswordAction], n["connected"]))

proc `%`*(x: SetPasswordOptionsVnc): JsonNode =
  result = newJObject()
  if x.display.isSome: result["display"] = %(x.display.get)

proc parse*(_: typedesc[SetPasswordOptionsVnc], n: JsonNode): SetPasswordOptionsVnc =
  result = default(SetPasswordOptionsVnc)
  if n.hasKey("display") and n["display"].kind != JNull:
    result.display = some(n["display"].getStr)

proc `%`*(x: ExpirePasswordOptions): JsonNode =
  result = newJObject()
  result["time"] = %(x.time)
  result["protocol"] = %($x.protocol)
  case x.protocol
  of DisplayProtocol.Vnc:
    let sub = %(x.vnc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayProtocol.Spice: discard

proc parse*(_: typedesc[ExpirePasswordOptions], n: JsonNode): ExpirePasswordOptions =
  result = default(ExpirePasswordOptions)
  let tag = parse(typedesc[DisplayProtocol], n["protocol"])
  case tag
  of DisplayProtocol.Vnc:
    result = ExpirePasswordOptions(protocol: tag, vnc: parse(typedesc[ExpirePasswordOptionsVnc], n))
  of DisplayProtocol.Spice:
    result = ExpirePasswordOptions(protocol: tag)
  result.time = n["time"].getStr

proc `%`*(x: ExpirePasswordOptionsVnc): JsonNode =
  result = newJObject()
  if x.display.isSome: result["display"] = %(x.display.get)

proc parse*(_: typedesc[ExpirePasswordOptionsVnc], n: JsonNode): ExpirePasswordOptionsVnc =
  result = default(ExpirePasswordOptionsVnc)
  if n.hasKey("display") and n["display"].kind != JNull:
    result.display = some(n["display"].getStr)

proc `%`*(x: ImageFormat): JsonNode = %($x)
proc parse*(_: typedesc[ImageFormat], n: JsonNode): ImageFormat =
  let s = n.getStr
  case s
  of "ppm": ImageFormat.Ppm
  of "png": ImageFormat.Png
  else: raise newException(ValueError, "unknown ImageFormat: " & s)

proc `%`*(x: SpiceBasicInfo): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["port"] = %(x.port)
  result["family"] = %(x.family)

proc parse*(_: typedesc[SpiceBasicInfo], n: JsonNode): SpiceBasicInfo =
  result = default(SpiceBasicInfo)
  result.host = n["host"].getStr
  result.port = n["port"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])

proc `%`*(x: SpiceServerInfo): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["port"] = %(x.port)
  result["family"] = %(x.family)
  if x.auth.isSome: result["auth"] = %(x.auth.get)

proc parse*(_: typedesc[SpiceServerInfo], n: JsonNode): SpiceServerInfo =
  result = default(SpiceServerInfo)
  result.host = n["host"].getStr
  result.port = n["port"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  if n.hasKey("auth") and n["auth"].kind != JNull:
    result.auth = some(n["auth"].getStr)

proc `%`*(x: SpiceChannel): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["port"] = %(x.port)
  result["family"] = %(x.family)
  result["connection-id"] = %(x.connectionId)
  result["channel-type"] = %(x.channelType)
  result["channel-id"] = %(x.channelId)
  result["tls"] = %(x.tls)

proc parse*(_: typedesc[SpiceChannel], n: JsonNode): SpiceChannel =
  result = default(SpiceChannel)
  result.host = n["host"].getStr
  result.port = n["port"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  result.connectionId = int64(n["connection-id"].getBiggestInt)
  result.channelType = int64(n["channel-type"].getBiggestInt)
  result.channelId = int64(n["channel-id"].getBiggestInt)
  result.tls = n["tls"].getBool

proc `%`*(x: SpiceQueryMouseMode): JsonNode = %($x)
proc parse*(_: typedesc[SpiceQueryMouseMode], n: JsonNode): SpiceQueryMouseMode =
  let s = n.getStr
  case s
  of "client": SpiceQueryMouseMode.Client
  of "server": SpiceQueryMouseMode.Server
  of "unknown": SpiceQueryMouseMode.Unknown
  else: raise newException(ValueError, "unknown SpiceQueryMouseMode: " & s)

proc `%`*(x: SpiceInfo): JsonNode =
  result = newJObject()
  result["enabled"] = %(x.enabled)
  result["migrated"] = %(x.migrated)
  if x.host.isSome: result["host"] = %(x.host.get)
  if x.port.isSome: result["port"] = %(x.port.get)
  if x.tlsPort.isSome: result["tls-port"] = %(x.tlsPort.get)
  if x.auth.isSome: result["auth"] = %(x.auth.get)
  if x.compiledVersion.isSome: result["compiled-version"] = %(x.compiledVersion.get)
  result["mouse-mode"] = %(x.mouseMode)
  if x.channels.isSome: result["channels"] = %(x.channels.get)

proc parse*(_: typedesc[SpiceInfo], n: JsonNode): SpiceInfo =
  result = default(SpiceInfo)
  result.enabled = n["enabled"].getBool
  result.migrated = n["migrated"].getBool
  if n.hasKey("host") and n["host"].kind != JNull:
    result.host = some(n["host"].getStr)
  if n.hasKey("port") and n["port"].kind != JNull:
    result.port = some(int64(n["port"].getBiggestInt))
  if n.hasKey("tls-port") and n["tls-port"].kind != JNull:
    result.tlsPort = some(int64(n["tls-port"].getBiggestInt))
  if n.hasKey("auth") and n["auth"].kind != JNull:
    result.auth = some(n["auth"].getStr)
  if n.hasKey("compiled-version") and n["compiled-version"].kind != JNull:
    result.compiledVersion = some(n["compiled-version"].getStr)
  result.mouseMode = parse(typedesc[SpiceQueryMouseMode], n["mouse-mode"])
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some((n["channels"]).getElems.mapIt(parse(typedesc[SpiceChannel], it)))

proc `%`*(x: VncBasicInfo): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["service"] = %(x.service)
  result["family"] = %(x.family)
  result["websocket"] = %(x.websocket)

proc parse*(_: typedesc[VncBasicInfo], n: JsonNode): VncBasicInfo =
  result = default(VncBasicInfo)
  result.host = n["host"].getStr
  result.service = n["service"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  result.websocket = n["websocket"].getBool

proc `%`*(x: VncServerInfo): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["service"] = %(x.service)
  result["family"] = %(x.family)
  result["websocket"] = %(x.websocket)
  if x.auth.isSome: result["auth"] = %(x.auth.get)

proc parse*(_: typedesc[VncServerInfo], n: JsonNode): VncServerInfo =
  result = default(VncServerInfo)
  result.host = n["host"].getStr
  result.service = n["service"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  result.websocket = n["websocket"].getBool
  if n.hasKey("auth") and n["auth"].kind != JNull:
    result.auth = some(n["auth"].getStr)

proc `%`*(x: VncClientInfo): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["service"] = %(x.service)
  result["family"] = %(x.family)
  result["websocket"] = %(x.websocket)
  if x.x509Dname.isSome: result["x509_dname"] = %(x.x509Dname.get)
  if x.saslUsername.isSome: result["sasl_username"] = %(x.saslUsername.get)

proc parse*(_: typedesc[VncClientInfo], n: JsonNode): VncClientInfo =
  result = default(VncClientInfo)
  result.host = n["host"].getStr
  result.service = n["service"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  result.websocket = n["websocket"].getBool
  if n.hasKey("x509_dname") and n["x509_dname"].kind != JNull:
    result.x509Dname = some(n["x509_dname"].getStr)
  if n.hasKey("sasl_username") and n["sasl_username"].kind != JNull:
    result.saslUsername = some(n["sasl_username"].getStr)

proc `%`*(x: VncInfo): JsonNode =
  result = newJObject()
  result["enabled"] = %(x.enabled)
  if x.host.isSome: result["host"] = %(x.host.get)
  if x.family.isSome: result["family"] = %(x.family.get)
  if x.service.isSome: result["service"] = %(x.service.get)
  if x.auth.isSome: result["auth"] = %(x.auth.get)
  if x.clients.isSome: result["clients"] = %(x.clients.get)

proc parse*(_: typedesc[VncInfo], n: JsonNode): VncInfo =
  result = default(VncInfo)
  result.enabled = n["enabled"].getBool
  if n.hasKey("host") and n["host"].kind != JNull:
    result.host = some(n["host"].getStr)
  if n.hasKey("family") and n["family"].kind != JNull:
    result.family = some(parse(typedesc[NetworkAddressFamily], n["family"]))
  if n.hasKey("service") and n["service"].kind != JNull:
    result.service = some(n["service"].getStr)
  if n.hasKey("auth") and n["auth"].kind != JNull:
    result.auth = some(n["auth"].getStr)
  if n.hasKey("clients") and n["clients"].kind != JNull:
    result.clients = some((n["clients"]).getElems.mapIt(parse(typedesc[VncClientInfo], it)))

proc `%`*(x: VncPrimaryAuth): JsonNode = %($x)
proc parse*(_: typedesc[VncPrimaryAuth], n: JsonNode): VncPrimaryAuth =
  let s = n.getStr
  case s
  of "none": VncPrimaryAuth.None
  of "vnc": VncPrimaryAuth.Vnc
  of "ra2": VncPrimaryAuth.Ra2
  of "ra2ne": VncPrimaryAuth.Ra2ne
  of "tight": VncPrimaryAuth.Tight
  of "ultra": VncPrimaryAuth.Ultra
  of "tls": VncPrimaryAuth.Tls
  of "vencrypt": VncPrimaryAuth.Vencrypt
  of "sasl": VncPrimaryAuth.Sasl
  else: raise newException(ValueError, "unknown VncPrimaryAuth: " & s)

proc `%`*(x: VncVencryptSubAuth): JsonNode = %($x)
proc parse*(_: typedesc[VncVencryptSubAuth], n: JsonNode): VncVencryptSubAuth =
  let s = n.getStr
  case s
  of "plain": VncVencryptSubAuth.Plain
  of "tls-none": VncVencryptSubAuth.TlsNone
  of "x509-none": VncVencryptSubAuth.X509None
  of "tls-vnc": VncVencryptSubAuth.TlsVnc
  of "x509-vnc": VncVencryptSubAuth.X509Vnc
  of "tls-plain": VncVencryptSubAuth.TlsPlain
  of "x509-plain": VncVencryptSubAuth.X509Plain
  of "tls-sasl": VncVencryptSubAuth.TlsSasl
  of "x509-sasl": VncVencryptSubAuth.X509Sasl
  else: raise newException(ValueError, "unknown VncVencryptSubAuth: " & s)

proc `%`*(x: VncServerInfo2): JsonNode =
  result = newJObject()
  result["host"] = %(x.host)
  result["service"] = %(x.service)
  result["family"] = %(x.family)
  result["websocket"] = %(x.websocket)
  result["auth"] = %(x.auth)
  if x.vencrypt.isSome: result["vencrypt"] = %(x.vencrypt.get)

proc parse*(_: typedesc[VncServerInfo2], n: JsonNode): VncServerInfo2 =
  result = default(VncServerInfo2)
  result.host = n["host"].getStr
  result.service = n["service"].getStr
  result.family = parse(typedesc[NetworkAddressFamily], n["family"])
  result.websocket = n["websocket"].getBool
  result.auth = parse(typedesc[VncPrimaryAuth], n["auth"])
  if n.hasKey("vencrypt") and n["vencrypt"].kind != JNull:
    result.vencrypt = some(parse(typedesc[VncVencryptSubAuth], n["vencrypt"]))

proc `%`*(x: VncInfo2): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["server"] = %(x.server)
  result["clients"] = %(x.clients)
  result["auth"] = %(x.auth)
  if x.vencrypt.isSome: result["vencrypt"] = %(x.vencrypt.get)
  if x.display.isSome: result["display"] = %(x.display.get)

proc parse*(_: typedesc[VncInfo2], n: JsonNode): VncInfo2 =
  result = default(VncInfo2)
  result.id = n["id"].getStr
  result.server = (n["server"]).getElems.mapIt(parse(typedesc[VncServerInfo2], it))
  result.clients = (n["clients"]).getElems.mapIt(parse(typedesc[VncClientInfo], it))
  result.auth = parse(typedesc[VncPrimaryAuth], n["auth"])
  if n.hasKey("vencrypt") and n["vencrypt"].kind != JNull:
    result.vencrypt = some(parse(typedesc[VncVencryptSubAuth], n["vencrypt"]))
  if n.hasKey("display") and n["display"].kind != JNull:
    result.display = some(n["display"].getStr)

proc `%`*(x: MouseInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["index"] = %(x.index)
  result["current"] = %(x.current)
  result["absolute"] = %(x.absolute)

proc parse*(_: typedesc[MouseInfo], n: JsonNode): MouseInfo =
  result = default(MouseInfo)
  result.name = n["name"].getStr
  result.index = int64(n["index"].getBiggestInt)
  result.current = n["current"].getBool
  result.absolute = n["absolute"].getBool

proc `%`*(x: QKeyCode): JsonNode = %($x)
proc parse*(_: typedesc[QKeyCode], n: JsonNode): QKeyCode =
  let s = n.getStr
  case s
  of "unmapped": QKeyCode.Unmapped
  of "shift": QKeyCode.Shift
  of "shift_r": QKeyCode.ShiftR
  of "alt": QKeyCode.Alt
  of "alt_r": QKeyCode.AltR
  of "ctrl": QKeyCode.Ctrl
  of "ctrl_r": QKeyCode.CtrlR
  of "menu": QKeyCode.Menu
  of "esc": QKeyCode.Esc
  of "1": QKeyCode.V1
  of "2": QKeyCode.V2
  of "3": QKeyCode.V3
  of "4": QKeyCode.V4
  of "5": QKeyCode.V5
  of "6": QKeyCode.V6
  of "7": QKeyCode.V7
  of "8": QKeyCode.V8
  of "9": QKeyCode.V9
  of "0": QKeyCode.V0
  of "minus": QKeyCode.Minus
  of "equal": QKeyCode.Equal
  of "backspace": QKeyCode.Backspace
  of "tab": QKeyCode.Tab
  of "q": QKeyCode.Q
  of "w": QKeyCode.W
  of "e": QKeyCode.E
  of "r": QKeyCode.R
  of "t": QKeyCode.T
  of "y": QKeyCode.Y
  of "u": QKeyCode.U
  of "i": QKeyCode.I
  of "o": QKeyCode.O
  of "p": QKeyCode.P
  of "bracket_left": QKeyCode.BracketLeft
  of "bracket_right": QKeyCode.BracketRight
  of "ret": QKeyCode.Ret
  of "a": QKeyCode.A
  of "s": QKeyCode.S
  of "d": QKeyCode.D
  of "f": QKeyCode.F
  of "g": QKeyCode.G
  of "h": QKeyCode.H
  of "j": QKeyCode.J
  of "k": QKeyCode.K
  of "l": QKeyCode.L
  of "semicolon": QKeyCode.Semicolon
  of "apostrophe": QKeyCode.Apostrophe
  of "grave_accent": QKeyCode.GraveAccent
  of "backslash": QKeyCode.Backslash
  of "z": QKeyCode.Z
  of "x": QKeyCode.X
  of "c": QKeyCode.C
  of "v": QKeyCode.V
  of "b": QKeyCode.B
  of "n": QKeyCode.N
  of "m": QKeyCode.M
  of "comma": QKeyCode.Comma
  of "dot": QKeyCode.Dot
  of "slash": QKeyCode.Slash
  of "asterisk": QKeyCode.Asterisk
  of "spc": QKeyCode.Spc
  of "caps_lock": QKeyCode.CapsLock
  of "f1": QKeyCode.F1
  of "f2": QKeyCode.F2
  of "f3": QKeyCode.F3
  of "f4": QKeyCode.F4
  of "f5": QKeyCode.F5
  of "f6": QKeyCode.F6
  of "f7": QKeyCode.F7
  of "f8": QKeyCode.F8
  of "f9": QKeyCode.F9
  of "f10": QKeyCode.F10
  of "num_lock": QKeyCode.NumLock
  of "scroll_lock": QKeyCode.ScrollLock
  of "kp_divide": QKeyCode.KpDivide
  of "kp_multiply": QKeyCode.KpMultiply
  of "kp_subtract": QKeyCode.KpSubtract
  of "kp_add": QKeyCode.KpAdd
  of "kp_enter": QKeyCode.KpEnter
  of "kp_decimal": QKeyCode.KpDecimal
  of "sysrq": QKeyCode.Sysrq
  of "kp_0": QKeyCode.Kp0
  of "kp_1": QKeyCode.Kp1
  of "kp_2": QKeyCode.Kp2
  of "kp_3": QKeyCode.Kp3
  of "kp_4": QKeyCode.Kp4
  of "kp_5": QKeyCode.Kp5
  of "kp_6": QKeyCode.Kp6
  of "kp_7": QKeyCode.Kp7
  of "kp_8": QKeyCode.Kp8
  of "kp_9": QKeyCode.Kp9
  of "less": QKeyCode.Less
  of "f11": QKeyCode.F11
  of "f12": QKeyCode.F12
  of "print": QKeyCode.Print
  of "home": QKeyCode.Home
  of "pgup": QKeyCode.Pgup
  of "pgdn": QKeyCode.Pgdn
  of "end": QKeyCode.End
  of "left": QKeyCode.Left
  of "up": QKeyCode.Up
  of "down": QKeyCode.Down
  of "right": QKeyCode.Right
  of "insert": QKeyCode.Insert
  of "delete": QKeyCode.Delete
  of "stop": QKeyCode.Stop
  of "again": QKeyCode.Again
  of "props": QKeyCode.Props
  of "undo": QKeyCode.Undo
  of "front": QKeyCode.Front
  of "copy": QKeyCode.Copy
  of "open": QKeyCode.Open
  of "paste": QKeyCode.Paste
  of "find": QKeyCode.Find
  of "cut": QKeyCode.Cut
  of "lf": QKeyCode.Lf
  of "help": QKeyCode.Help
  of "meta_l": QKeyCode.MetaL
  of "meta_r": QKeyCode.MetaR
  of "compose": QKeyCode.Compose
  of "pause": QKeyCode.Pause
  of "ro": QKeyCode.Ro
  of "hiragana": QKeyCode.Hiragana
  of "henkan": QKeyCode.Henkan
  of "yen": QKeyCode.Yen
  of "muhenkan": QKeyCode.Muhenkan
  of "katakanahiragana": QKeyCode.Katakanahiragana
  of "kp_comma": QKeyCode.KpComma
  of "kp_equals": QKeyCode.KpEquals
  of "power": QKeyCode.Power
  of "sleep": QKeyCode.Sleep
  of "wake": QKeyCode.Wake
  of "audionext": QKeyCode.Audionext
  of "audioprev": QKeyCode.Audioprev
  of "audiostop": QKeyCode.Audiostop
  of "audioplay": QKeyCode.Audioplay
  of "audiomute": QKeyCode.Audiomute
  of "volumeup": QKeyCode.Volumeup
  of "volumedown": QKeyCode.Volumedown
  of "mediaselect": QKeyCode.Mediaselect
  of "mail": QKeyCode.Mail
  of "calculator": QKeyCode.Calculator
  of "computer": QKeyCode.Computer
  of "ac_home": QKeyCode.AcHome
  of "ac_back": QKeyCode.AcBack
  of "ac_forward": QKeyCode.AcForward
  of "ac_refresh": QKeyCode.AcRefresh
  of "ac_bookmarks": QKeyCode.AcBookmarks
  of "lang1": QKeyCode.Lang1
  of "lang2": QKeyCode.Lang2
  of "f13": QKeyCode.F13
  of "f14": QKeyCode.F14
  of "f15": QKeyCode.F15
  of "f16": QKeyCode.F16
  of "f17": QKeyCode.F17
  of "f18": QKeyCode.F18
  of "f19": QKeyCode.F19
  of "f20": QKeyCode.F20
  of "f21": QKeyCode.F21
  of "f22": QKeyCode.F22
  of "f23": QKeyCode.F23
  of "f24": QKeyCode.F24
  else: raise newException(ValueError, "unknown QKeyCode: " & s)

proc `%`*(x: KeyValueKind): JsonNode = %($x)
proc parse*(_: typedesc[KeyValueKind], n: JsonNode): KeyValueKind =
  let s = n.getStr
  case s
  of "number": KeyValueKind.Number
  of "qcode": KeyValueKind.Qcode
  else: raise newException(ValueError, "unknown KeyValueKind: " & s)

proc `%`*(x: IntWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[IntWrapper], n: JsonNode): IntWrapper =
  result = default(IntWrapper)
  result.data = int64(n["data"].getBiggestInt)

proc `%`*(x: QKeyCodeWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[QKeyCodeWrapper], n: JsonNode): QKeyCodeWrapper =
  result = default(QKeyCodeWrapper)
  result.data = parse(typedesc[QKeyCode], n["data"])

proc `%`*(x: KeyValue): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of KeyValueKind.Number:
    let sub = %(x.number)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of KeyValueKind.Qcode:
    let sub = %(x.qcode)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[KeyValue], n: JsonNode): KeyValue =
  result = default(KeyValue)
  let tag = parse(typedesc[KeyValueKind], n["type"])
  case tag
  of KeyValueKind.Number:
    result = KeyValue(`type`: tag, number: parse(typedesc[IntWrapper], n))
  of KeyValueKind.Qcode:
    result = KeyValue(`type`: tag, qcode: parse(typedesc[QKeyCodeWrapper], n))

proc `%`*(x: InputButton): JsonNode = %($x)
proc parse*(_: typedesc[InputButton], n: JsonNode): InputButton =
  let s = n.getStr
  case s
  of "left": InputButton.Left
  of "middle": InputButton.Middle
  of "right": InputButton.Right
  of "wheel-up": InputButton.WheelUp
  of "wheel-down": InputButton.WheelDown
  of "side": InputButton.Side
  of "extra": InputButton.Extra
  of "wheel-left": InputButton.WheelLeft
  of "wheel-right": InputButton.WheelRight
  of "touch": InputButton.Touch
  else: raise newException(ValueError, "unknown InputButton: " & s)

proc `%`*(x: InputAxis): JsonNode = %($x)
proc parse*(_: typedesc[InputAxis], n: JsonNode): InputAxis =
  let s = n.getStr
  case s
  of "x": InputAxis.X
  of "y": InputAxis.Y
  else: raise newException(ValueError, "unknown InputAxis: " & s)

proc `%`*(x: InputMultiTouchType): JsonNode = %($x)
proc parse*(_: typedesc[InputMultiTouchType], n: JsonNode): InputMultiTouchType =
  let s = n.getStr
  case s
  of "begin": InputMultiTouchType.Begin
  of "update": InputMultiTouchType.Update
  of "end": InputMultiTouchType.End
  of "cancel": InputMultiTouchType.Cancel
  of "data": InputMultiTouchType.Data
  else: raise newException(ValueError, "unknown InputMultiTouchType: " & s)

proc `%`*(x: InputKeyEvent): JsonNode =
  result = newJObject()
  result["key"] = %(x.key)
  result["down"] = %(x.down)

proc parse*(_: typedesc[InputKeyEvent], n: JsonNode): InputKeyEvent =
  result = default(InputKeyEvent)
  result.key = parse(typedesc[KeyValue], n["key"])
  result.down = n["down"].getBool

proc `%`*(x: InputBtnEvent): JsonNode =
  result = newJObject()
  result["button"] = %(x.button)
  result["down"] = %(x.down)

proc parse*(_: typedesc[InputBtnEvent], n: JsonNode): InputBtnEvent =
  result = default(InputBtnEvent)
  result.button = parse(typedesc[InputButton], n["button"])
  result.down = n["down"].getBool

proc `%`*(x: InputMoveEvent): JsonNode =
  result = newJObject()
  result["axis"] = %(x.axis)
  result["value"] = %(x.value)

proc parse*(_: typedesc[InputMoveEvent], n: JsonNode): InputMoveEvent =
  result = default(InputMoveEvent)
  result.axis = parse(typedesc[InputAxis], n["axis"])
  result.value = int64(n["value"].getBiggestInt)

proc `%`*(x: InputMultiTouchEvent): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)
  result["slot"] = %(x.slot)
  result["tracking-id"] = %(x.trackingId)
  result["axis"] = %(x.axis)
  result["value"] = %(x.value)

proc parse*(_: typedesc[InputMultiTouchEvent], n: JsonNode): InputMultiTouchEvent =
  result = default(InputMultiTouchEvent)
  result.`type` = parse(typedesc[InputMultiTouchType], n["type"])
  result.slot = int64(n["slot"].getBiggestInt)
  result.trackingId = int64(n["tracking-id"].getBiggestInt)
  result.axis = parse(typedesc[InputAxis], n["axis"])
  result.value = int64(n["value"].getBiggestInt)

proc `%`*(x: InputEventKind): JsonNode = %($x)
proc parse*(_: typedesc[InputEventKind], n: JsonNode): InputEventKind =
  let s = n.getStr
  case s
  of "key": InputEventKind.Key
  of "btn": InputEventKind.Btn
  of "rel": InputEventKind.Rel
  of "abs": InputEventKind.Abs
  of "mtt": InputEventKind.Mtt
  else: raise newException(ValueError, "unknown InputEventKind: " & s)

proc `%`*(x: InputKeyEventWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[InputKeyEventWrapper], n: JsonNode): InputKeyEventWrapper =
  result = default(InputKeyEventWrapper)
  result.data = parse(typedesc[InputKeyEvent], n["data"])

proc `%`*(x: InputBtnEventWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[InputBtnEventWrapper], n: JsonNode): InputBtnEventWrapper =
  result = default(InputBtnEventWrapper)
  result.data = parse(typedesc[InputBtnEvent], n["data"])

proc `%`*(x: InputMoveEventWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[InputMoveEventWrapper], n: JsonNode): InputMoveEventWrapper =
  result = default(InputMoveEventWrapper)
  result.data = parse(typedesc[InputMoveEvent], n["data"])

proc `%`*(x: InputMultiTouchEventWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[InputMultiTouchEventWrapper], n: JsonNode): InputMultiTouchEventWrapper =
  result = default(InputMultiTouchEventWrapper)
  result.data = parse(typedesc[InputMultiTouchEvent], n["data"])

proc `%`*(x: InputEvent): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of InputEventKind.Key:
    let sub = %(x.key)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of InputEventKind.Btn:
    let sub = %(x.btn)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of InputEventKind.Rel:
    let sub = %(x.rel)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of InputEventKind.Abs:
    let sub = %(x.abs)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of InputEventKind.Mtt:
    let sub = %(x.mtt)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[InputEvent], n: JsonNode): InputEvent =
  result = default(InputEvent)
  let tag = parse(typedesc[InputEventKind], n["type"])
  case tag
  of InputEventKind.Key:
    result = InputEvent(`type`: tag, key: parse(typedesc[InputKeyEventWrapper], n))
  of InputEventKind.Btn:
    result = InputEvent(`type`: tag, btn: parse(typedesc[InputBtnEventWrapper], n))
  of InputEventKind.Rel:
    result = InputEvent(`type`: tag, rel: parse(typedesc[InputMoveEventWrapper], n))
  of InputEventKind.Abs:
    result = InputEvent(`type`: tag, abs: parse(typedesc[InputMoveEventWrapper], n))
  of InputEventKind.Mtt:
    result = InputEvent(`type`: tag, mtt: parse(typedesc[InputMultiTouchEventWrapper], n))

proc `%`*(x: DisplayGTK): JsonNode =
  result = newJObject()
  if x.grabOnHover.isSome: result["grab-on-hover"] = %(x.grabOnHover.get)
  if x.zoomToFit.isSome: result["zoom-to-fit"] = %(x.zoomToFit.get)
  if x.showTabs.isSome: result["show-tabs"] = %(x.showTabs.get)
  if x.showMenubar.isSome: result["show-menubar"] = %(x.showMenubar.get)
  if x.keepAspectRatio.isSome: result["keep-aspect-ratio"] = %(x.keepAspectRatio.get)
  if x.scale.isSome: result["scale"] = %(x.scale.get)

proc parse*(_: typedesc[DisplayGTK], n: JsonNode): DisplayGTK =
  result = default(DisplayGTK)
  if n.hasKey("grab-on-hover") and n["grab-on-hover"].kind != JNull:
    result.grabOnHover = some(n["grab-on-hover"].getBool)
  if n.hasKey("zoom-to-fit") and n["zoom-to-fit"].kind != JNull:
    result.zoomToFit = some(n["zoom-to-fit"].getBool)
  if n.hasKey("show-tabs") and n["show-tabs"].kind != JNull:
    result.showTabs = some(n["show-tabs"].getBool)
  if n.hasKey("show-menubar") and n["show-menubar"].kind != JNull:
    result.showMenubar = some(n["show-menubar"].getBool)
  if n.hasKey("keep-aspect-ratio") and n["keep-aspect-ratio"].kind != JNull:
    result.keepAspectRatio = some(n["keep-aspect-ratio"].getBool)
  if n.hasKey("scale") and n["scale"].kind != JNull:
    result.scale = some((if n["scale"].kind == JInt: float64(n["scale"].getBiggestInt) else: float64(n["scale"].getFloat)))

proc `%`*(x: DisplayEGLHeadless): JsonNode =
  result = newJObject()
  if x.rendernode.isSome: result["rendernode"] = %(x.rendernode.get)

proc parse*(_: typedesc[DisplayEGLHeadless], n: JsonNode): DisplayEGLHeadless =
  result = default(DisplayEGLHeadless)
  if n.hasKey("rendernode") and n["rendernode"].kind != JNull:
    result.rendernode = some(n["rendernode"].getStr)

proc `%`*(x: DisplayDBus): JsonNode =
  result = newJObject()
  if x.rendernode.isSome: result["rendernode"] = %(x.rendernode.get)
  if x.`addr`.isSome: result["addr"] = %(x.`addr`.get)
  if x.p2p.isSome: result["p2p"] = %(x.p2p.get)
  if x.audiodev.isSome: result["audiodev"] = %(x.audiodev.get)

proc parse*(_: typedesc[DisplayDBus], n: JsonNode): DisplayDBus =
  result = default(DisplayDBus)
  if n.hasKey("rendernode") and n["rendernode"].kind != JNull:
    result.rendernode = some(n["rendernode"].getStr)
  if n.hasKey("addr") and n["addr"].kind != JNull:
    result.`addr` = some(n["addr"].getStr)
  if n.hasKey("p2p") and n["p2p"].kind != JNull:
    result.p2p = some(n["p2p"].getBool)
  if n.hasKey("audiodev") and n["audiodev"].kind != JNull:
    result.audiodev = some(n["audiodev"].getStr)

proc `%`*(x: DisplayGLMode): JsonNode = %($x)
proc parse*(_: typedesc[DisplayGLMode], n: JsonNode): DisplayGLMode =
  let s = n.getStr
  case s
  of "off": DisplayGLMode.Off
  of "on": DisplayGLMode.On
  of "core": DisplayGLMode.Core
  of "es": DisplayGLMode.Es
  else: raise newException(ValueError, "unknown DisplayGLMode: " & s)

proc `%`*(x: DisplayCurses): JsonNode =
  result = newJObject()
  if x.charset.isSome: result["charset"] = %(x.charset.get)

proc parse*(_: typedesc[DisplayCurses], n: JsonNode): DisplayCurses =
  result = default(DisplayCurses)
  if n.hasKey("charset") and n["charset"].kind != JNull:
    result.charset = some(n["charset"].getStr)

proc `%`*(x: DisplayCocoa): JsonNode =
  result = newJObject()
  if x.leftCommandKey.isSome: result["left-command-key"] = %(x.leftCommandKey.get)
  if x.fullGrab.isSome: result["full-grab"] = %(x.fullGrab.get)
  if x.swapOptCmd.isSome: result["swap-opt-cmd"] = %(x.swapOptCmd.get)
  if x.zoomToFit.isSome: result["zoom-to-fit"] = %(x.zoomToFit.get)
  if x.zoomInterpolation.isSome: result["zoom-interpolation"] = %(x.zoomInterpolation.get)

proc parse*(_: typedesc[DisplayCocoa], n: JsonNode): DisplayCocoa =
  result = default(DisplayCocoa)
  if n.hasKey("left-command-key") and n["left-command-key"].kind != JNull:
    result.leftCommandKey = some(n["left-command-key"].getBool)
  if n.hasKey("full-grab") and n["full-grab"].kind != JNull:
    result.fullGrab = some(n["full-grab"].getBool)
  if n.hasKey("swap-opt-cmd") and n["swap-opt-cmd"].kind != JNull:
    result.swapOptCmd = some(n["swap-opt-cmd"].getBool)
  if n.hasKey("zoom-to-fit") and n["zoom-to-fit"].kind != JNull:
    result.zoomToFit = some(n["zoom-to-fit"].getBool)
  if n.hasKey("zoom-interpolation") and n["zoom-interpolation"].kind != JNull:
    result.zoomInterpolation = some(n["zoom-interpolation"].getBool)

proc `%`*(x: HotKeyMod): JsonNode = %($x)
proc parse*(_: typedesc[HotKeyMod], n: JsonNode): HotKeyMod =
  let s = n.getStr
  case s
  of "lctrl-lalt": HotKeyMod.LctrlLalt
  of "lshift-lctrl-lalt": HotKeyMod.LshiftLctrlLalt
  of "rctrl": HotKeyMod.Rctrl
  else: raise newException(ValueError, "unknown HotKeyMod: " & s)

proc `%`*(x: DisplaySDL): JsonNode =
  result = newJObject()
  if x.grabMod.isSome: result["grab-mod"] = %(x.grabMod.get)

proc parse*(_: typedesc[DisplaySDL], n: JsonNode): DisplaySDL =
  result = default(DisplaySDL)
  if n.hasKey("grab-mod") and n["grab-mod"].kind != JNull:
    result.grabMod = some(parse(typedesc[HotKeyMod], n["grab-mod"]))

proc `%`*(x: DisplayType): JsonNode = %($x)
proc parse*(_: typedesc[DisplayType], n: JsonNode): DisplayType =
  let s = n.getStr
  case s
  of "default": DisplayType.Default
  of "none": DisplayType.None
  of "gtk": DisplayType.Gtk
  of "sdl": DisplayType.Sdl
  of "egl-headless": DisplayType.EglHeadless
  of "curses": DisplayType.Curses
  of "cocoa": DisplayType.Cocoa
  of "spice-app": DisplayType.SpiceApp
  of "dbus": DisplayType.Dbus
  else: raise newException(ValueError, "unknown DisplayType: " & s)

proc `%`*(x: DisplayOptions): JsonNode =
  result = newJObject()
  if x.fullScreen.isSome: result["full-screen"] = %(x.fullScreen.get)
  if x.windowClose.isSome: result["window-close"] = %(x.windowClose.get)
  if x.showCursor.isSome: result["show-cursor"] = %(x.showCursor.get)
  if x.gl.isSome: result["gl"] = %(x.gl.get)
  result["type"] = %($x.`type`)
  case x.`type`
  of DisplayType.Gtk:
    let sub = %(x.gtk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.Cocoa:
    let sub = %(x.cocoa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.Curses:
    let sub = %(x.curses)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.EglHeadless:
    let sub = %(x.eglHeadless)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.Dbus:
    let sub = %(x.dbus)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.Sdl:
    let sub = %(x.sdl)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of DisplayType.Default: discard
  of DisplayType.None: discard
  of DisplayType.SpiceApp: discard

proc parse*(_: typedesc[DisplayOptions], n: JsonNode): DisplayOptions =
  result = default(DisplayOptions)
  let tag = parse(typedesc[DisplayType], n["type"])
  case tag
  of DisplayType.Gtk:
    result = DisplayOptions(`type`: tag, gtk: parse(typedesc[DisplayGTK], n))
  of DisplayType.Cocoa:
    result = DisplayOptions(`type`: tag, cocoa: parse(typedesc[DisplayCocoa], n))
  of DisplayType.Curses:
    result = DisplayOptions(`type`: tag, curses: parse(typedesc[DisplayCurses], n))
  of DisplayType.EglHeadless:
    result = DisplayOptions(`type`: tag, eglHeadless: parse(typedesc[DisplayEGLHeadless], n))
  of DisplayType.Dbus:
    result = DisplayOptions(`type`: tag, dbus: parse(typedesc[DisplayDBus], n))
  of DisplayType.Sdl:
    result = DisplayOptions(`type`: tag, sdl: parse(typedesc[DisplaySDL], n))
  of DisplayType.Default:
    result = DisplayOptions(`type`: tag)
  of DisplayType.None:
    result = DisplayOptions(`type`: tag)
  of DisplayType.SpiceApp:
    result = DisplayOptions(`type`: tag)
  if n.hasKey("full-screen") and n["full-screen"].kind != JNull:
    result.fullScreen = some(n["full-screen"].getBool)
  if n.hasKey("window-close") and n["window-close"].kind != JNull:
    result.windowClose = some(n["window-close"].getBool)
  if n.hasKey("show-cursor") and n["show-cursor"].kind != JNull:
    result.showCursor = some(n["show-cursor"].getBool)
  if n.hasKey("gl") and n["gl"].kind != JNull:
    result.gl = some(parse(typedesc[DisplayGLMode], n["gl"]))

proc `%`*(x: DisplayReloadType): JsonNode = %($x)
proc parse*(_: typedesc[DisplayReloadType], n: JsonNode): DisplayReloadType =
  let s = n.getStr
  case s
  of "vnc": DisplayReloadType.Vnc
  else: raise newException(ValueError, "unknown DisplayReloadType: " & s)

proc `%`*(x: DisplayReloadOptionsVNC): JsonNode =
  result = newJObject()
  if x.tlsCerts.isSome: result["tls-certs"] = %(x.tlsCerts.get)

proc parse*(_: typedesc[DisplayReloadOptionsVNC], n: JsonNode): DisplayReloadOptionsVNC =
  result = default(DisplayReloadOptionsVNC)
  if n.hasKey("tls-certs") and n["tls-certs"].kind != JNull:
    result.tlsCerts = some(n["tls-certs"].getBool)

proc `%`*(x: DisplayReloadOptions): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of DisplayReloadType.Vnc:
    let sub = %(x.vnc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[DisplayReloadOptions], n: JsonNode): DisplayReloadOptions =
  result = default(DisplayReloadOptions)
  let tag = parse(typedesc[DisplayReloadType], n["type"])
  case tag
  of DisplayReloadType.Vnc:
    result = DisplayReloadOptions(`type`: tag, vnc: parse(typedesc[DisplayReloadOptionsVNC], n))

proc `%`*(x: DisplayUpdateType): JsonNode = %($x)
proc parse*(_: typedesc[DisplayUpdateType], n: JsonNode): DisplayUpdateType =
  let s = n.getStr
  case s
  of "vnc": DisplayUpdateType.Vnc
  else: raise newException(ValueError, "unknown DisplayUpdateType: " & s)

proc `%`*(x: DisplayUpdateOptionsVNC): JsonNode =
  result = newJObject()
  if x.addresses.isSome: result["addresses"] = %(x.addresses.get)

proc parse*(_: typedesc[DisplayUpdateOptionsVNC], n: JsonNode): DisplayUpdateOptionsVNC =
  result = default(DisplayUpdateOptionsVNC)
  if n.hasKey("addresses") and n["addresses"].kind != JNull:
    result.addresses = some((n["addresses"]).getElems.mapIt(parse(typedesc[SocketAddress], it)))

proc `%`*(x: DisplayUpdateOptions): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of DisplayUpdateType.Vnc:
    let sub = %(x.vnc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[DisplayUpdateOptions], n: JsonNode): DisplayUpdateOptions =
  result = default(DisplayUpdateOptions)
  let tag = parse(typedesc[DisplayUpdateType], n["type"])
  case tag
  of DisplayUpdateType.Vnc:
    result = DisplayUpdateOptions(`type`: tag, vnc: parse(typedesc[DisplayUpdateOptionsVNC], n))

proc `%`*(x: QAuthZListPolicy): JsonNode = %($x)
proc parse*(_: typedesc[QAuthZListPolicy], n: JsonNode): QAuthZListPolicy =
  let s = n.getStr
  case s
  of "deny": QAuthZListPolicy.Deny
  of "allow": QAuthZListPolicy.Allow
  else: raise newException(ValueError, "unknown QAuthZListPolicy: " & s)

proc `%`*(x: QAuthZListFormat): JsonNode = %($x)
proc parse*(_: typedesc[QAuthZListFormat], n: JsonNode): QAuthZListFormat =
  let s = n.getStr
  case s
  of "exact": QAuthZListFormat.Exact
  of "glob": QAuthZListFormat.Glob
  else: raise newException(ValueError, "unknown QAuthZListFormat: " & s)

proc `%`*(x: QAuthZListRule): JsonNode =
  result = newJObject()
  result["match"] = %(x.match)
  result["policy"] = %(x.policy)
  if x.format.isSome: result["format"] = %(x.format.get)

proc parse*(_: typedesc[QAuthZListRule], n: JsonNode): QAuthZListRule =
  result = default(QAuthZListRule)
  result.match = n["match"].getStr
  result.policy = parse(typedesc[QAuthZListPolicy], n["policy"])
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[QAuthZListFormat], n["format"]))

proc `%`*(x: AuthZListProperties): JsonNode =
  result = newJObject()
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.rules.isSome: result["rules"] = %(x.rules.get)

proc parse*(_: typedesc[AuthZListProperties], n: JsonNode): AuthZListProperties =
  result = default(AuthZListProperties)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[QAuthZListPolicy], n["policy"]))
  if n.hasKey("rules") and n["rules"].kind != JNull:
    result.rules = some((n["rules"]).getElems.mapIt(parse(typedesc[QAuthZListRule], it)))

proc `%`*(x: AuthZListFileProperties): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  if x.refresh.isSome: result["refresh"] = %(x.refresh.get)

proc parse*(_: typedesc[AuthZListFileProperties], n: JsonNode): AuthZListFileProperties =
  result = default(AuthZListFileProperties)
  result.filename = n["filename"].getStr
  if n.hasKey("refresh") and n["refresh"].kind != JNull:
    result.refresh = some(n["refresh"].getBool)

proc `%`*(x: AuthZPAMProperties): JsonNode =
  result = newJObject()
  result["service"] = %(x.service)

proc parse*(_: typedesc[AuthZPAMProperties], n: JsonNode): AuthZPAMProperties =
  result = default(AuthZPAMProperties)
  result.service = n["service"].getStr

proc `%`*(x: AuthZSimpleProperties): JsonNode =
  result = newJObject()
  result["identity"] = %(x.identity)

proc parse*(_: typedesc[AuthZSimpleProperties], n: JsonNode): AuthZSimpleProperties =
  result = default(AuthZSimpleProperties)
  result.identity = n["identity"].getStr

proc `%`*(x: MigrationStats): JsonNode =
  result = newJObject()
  result["transferred"] = %(x.transferred)
  result["remaining"] = %(x.remaining)
  result["total"] = %(x.total)
  result["duplicate"] = %(x.duplicate)
  result["normal"] = %(x.normal)
  result["normal-bytes"] = %(x.normalBytes)
  result["dirty-pages-rate"] = %(x.dirtyPagesRate)
  result["mbps"] = %(x.mbps)
  result["dirty-sync-count"] = %(x.dirtySyncCount)
  result["postcopy-requests"] = %(x.postcopyRequests)
  result["page-size"] = %(x.pageSize)
  result["multifd-bytes"] = %(x.multifdBytes)
  result["pages-per-second"] = %(x.pagesPerSecond)
  result["precopy-bytes"] = %(x.precopyBytes)
  result["downtime-bytes"] = %(x.downtimeBytes)
  result["postcopy-bytes"] = %(x.postcopyBytes)
  result["dirty-sync-missed-zero-copy"] = %(x.dirtySyncMissedZeroCopy)

proc parse*(_: typedesc[MigrationStats], n: JsonNode): MigrationStats =
  result = default(MigrationStats)
  result.transferred = int64(n["transferred"].getBiggestInt)
  result.remaining = int64(n["remaining"].getBiggestInt)
  result.total = int64(n["total"].getBiggestInt)
  result.duplicate = int64(n["duplicate"].getBiggestInt)
  result.normal = int64(n["normal"].getBiggestInt)
  result.normalBytes = int64(n["normal-bytes"].getBiggestInt)
  result.dirtyPagesRate = int64(n["dirty-pages-rate"].getBiggestInt)
  result.mbps = (if n["mbps"].kind == JInt: float64(n["mbps"].getBiggestInt) else: float64(n["mbps"].getFloat))
  result.dirtySyncCount = int64(n["dirty-sync-count"].getBiggestInt)
  result.postcopyRequests = int64(n["postcopy-requests"].getBiggestInt)
  result.pageSize = int64(n["page-size"].getBiggestInt)
  result.multifdBytes = cast[uint64](n["multifd-bytes"].getBiggestInt)
  result.pagesPerSecond = cast[uint64](n["pages-per-second"].getBiggestInt)
  result.precopyBytes = cast[uint64](n["precopy-bytes"].getBiggestInt)
  result.downtimeBytes = cast[uint64](n["downtime-bytes"].getBiggestInt)
  result.postcopyBytes = cast[uint64](n["postcopy-bytes"].getBiggestInt)
  result.dirtySyncMissedZeroCopy = cast[uint64](n["dirty-sync-missed-zero-copy"].getBiggestInt)

proc `%`*(x: XBZRLECacheStats): JsonNode =
  result = newJObject()
  result["cache-size"] = %(x.cacheSize)
  result["bytes"] = %(x.bytes)
  result["pages"] = %(x.pages)
  result["cache-miss"] = %(x.cacheMiss)
  result["cache-miss-rate"] = %(x.cacheMissRate)
  result["encoding-rate"] = %(x.encodingRate)
  result["overflow"] = %(x.overflow)

proc parse*(_: typedesc[XBZRLECacheStats], n: JsonNode): XBZRLECacheStats =
  result = default(XBZRLECacheStats)
  result.cacheSize = cast[uint64](n["cache-size"].getBiggestInt)
  result.bytes = int64(n["bytes"].getBiggestInt)
  result.pages = int64(n["pages"].getBiggestInt)
  result.cacheMiss = int64(n["cache-miss"].getBiggestInt)
  result.cacheMissRate = (if n["cache-miss-rate"].kind == JInt: float64(n["cache-miss-rate"].getBiggestInt) else: float64(n["cache-miss-rate"].getFloat))
  result.encodingRate = (if n["encoding-rate"].kind == JInt: float64(n["encoding-rate"].getBiggestInt) else: float64(n["encoding-rate"].getFloat))
  result.overflow = int64(n["overflow"].getBiggestInt)

proc `%`*(x: CompressionStats): JsonNode =
  result = newJObject()
  result["pages"] = %(x.pages)
  result["busy"] = %(x.busy)
  result["busy-rate"] = %(x.busyRate)
  result["compressed-size"] = %(x.compressedSize)
  result["compression-rate"] = %(x.compressionRate)

proc parse*(_: typedesc[CompressionStats], n: JsonNode): CompressionStats =
  result = default(CompressionStats)
  result.pages = int64(n["pages"].getBiggestInt)
  result.busy = int64(n["busy"].getBiggestInt)
  result.busyRate = (if n["busy-rate"].kind == JInt: float64(n["busy-rate"].getBiggestInt) else: float64(n["busy-rate"].getFloat))
  result.compressedSize = int64(n["compressed-size"].getBiggestInt)
  result.compressionRate = (if n["compression-rate"].kind == JInt: float64(n["compression-rate"].getBiggestInt) else: float64(n["compression-rate"].getFloat))

proc `%`*(x: MigrationStatus): JsonNode = %($x)
proc parse*(_: typedesc[MigrationStatus], n: JsonNode): MigrationStatus =
  let s = n.getStr
  case s
  of "none": MigrationStatus.None
  of "setup": MigrationStatus.Setup
  of "cancelling": MigrationStatus.Cancelling
  of "cancelled": MigrationStatus.Cancelled
  of "active": MigrationStatus.Active
  of "postcopy-device": MigrationStatus.PostcopyDevice
  of "postcopy-active": MigrationStatus.PostcopyActive
  of "postcopy-paused": MigrationStatus.PostcopyPaused
  of "postcopy-recover-setup": MigrationStatus.PostcopyRecoverSetup
  of "postcopy-recover": MigrationStatus.PostcopyRecover
  of "completed": MigrationStatus.Completed
  of "failing": MigrationStatus.Failing
  of "failed": MigrationStatus.Failed
  of "colo": MigrationStatus.Colo
  of "pre-switchover": MigrationStatus.PreSwitchover
  of "device": MigrationStatus.Device
  of "wait-unplug": MigrationStatus.WaitUnplug
  else: raise newException(ValueError, "unknown MigrationStatus: " & s)

proc `%`*(x: VfioStats): JsonNode =
  result = newJObject()
  result["transferred"] = %(x.transferred)

proc parse*(_: typedesc[VfioStats], n: JsonNode): VfioStats =
  result = default(VfioStats)
  result.transferred = int64(n["transferred"].getBiggestInt)

proc `%`*(x: MigrationInfo): JsonNode =
  result = newJObject()
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.ram.isSome: result["ram"] = %(x.ram.get)
  if x.vfio.isSome: result["vfio"] = %(x.vfio.get)
  if x.xbzrleCache.isSome: result["xbzrle-cache"] = %(x.xbzrleCache.get)
  if x.totalTime.isSome: result["total-time"] = %(x.totalTime.get)
  if x.expectedDowntime.isSome: result["expected-downtime"] = %(x.expectedDowntime.get)
  if x.downtime.isSome: result["downtime"] = %(x.downtime.get)
  if x.setupTime.isSome: result["setup-time"] = %(x.setupTime.get)
  if x.cpuThrottlePercentage.isSome: result["cpu-throttle-percentage"] = %(x.cpuThrottlePercentage.get)
  if x.errorDesc.isSome: result["error-desc"] = %(x.errorDesc.get)
  if x.blockedReasons.isSome: result["blocked-reasons"] = %(x.blockedReasons.get)
  if x.postcopyBlocktime.isSome: result["postcopy-blocktime"] = %(x.postcopyBlocktime.get)
  if x.postcopyVcpuBlocktime.isSome: result["postcopy-vcpu-blocktime"] = %(x.postcopyVcpuBlocktime.get)
  if x.postcopyLatency.isSome: result["postcopy-latency"] = %(x.postcopyLatency.get)
  if x.postcopyLatencyDist.isSome: result["postcopy-latency-dist"] = %(x.postcopyLatencyDist.get)
  if x.postcopyVcpuLatency.isSome: result["postcopy-vcpu-latency"] = %(x.postcopyVcpuLatency.get)
  if x.postcopyNonVcpuLatency.isSome: result["postcopy-non-vcpu-latency"] = %(x.postcopyNonVcpuLatency.get)
  if x.socketAddress.isSome: result["socket-address"] = %(x.socketAddress.get)
  if x.dirtyLimitThrottleTimePerRound.isSome: result["dirty-limit-throttle-time-per-round"] = %(x.dirtyLimitThrottleTimePerRound.get)
  if x.dirtyLimitRingFullTime.isSome: result["dirty-limit-ring-full-time"] = %(x.dirtyLimitRingFullTime.get)

proc parse*(_: typedesc[MigrationInfo], n: JsonNode): MigrationInfo =
  result = default(MigrationInfo)
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(parse(typedesc[MigrationStatus], n["status"]))
  if n.hasKey("ram") and n["ram"].kind != JNull:
    result.ram = some(parse(typedesc[MigrationStats], n["ram"]))
  if n.hasKey("vfio") and n["vfio"].kind != JNull:
    result.vfio = some(parse(typedesc[VfioStats], n["vfio"]))
  if n.hasKey("xbzrle-cache") and n["xbzrle-cache"].kind != JNull:
    result.xbzrleCache = some(parse(typedesc[XBZRLECacheStats], n["xbzrle-cache"]))
  if n.hasKey("total-time") and n["total-time"].kind != JNull:
    result.totalTime = some(int64(n["total-time"].getBiggestInt))
  if n.hasKey("expected-downtime") and n["expected-downtime"].kind != JNull:
    result.expectedDowntime = some(int64(n["expected-downtime"].getBiggestInt))
  if n.hasKey("downtime") and n["downtime"].kind != JNull:
    result.downtime = some(int64(n["downtime"].getBiggestInt))
  if n.hasKey("setup-time") and n["setup-time"].kind != JNull:
    result.setupTime = some(int64(n["setup-time"].getBiggestInt))
  if n.hasKey("cpu-throttle-percentage") and n["cpu-throttle-percentage"].kind != JNull:
    result.cpuThrottlePercentage = some(int64(n["cpu-throttle-percentage"].getBiggestInt))
  if n.hasKey("error-desc") and n["error-desc"].kind != JNull:
    result.errorDesc = some(n["error-desc"].getStr)
  if n.hasKey("blocked-reasons") and n["blocked-reasons"].kind != JNull:
    result.blockedReasons = some((n["blocked-reasons"]).getElems.mapIt(it.getStr))
  if n.hasKey("postcopy-blocktime") and n["postcopy-blocktime"].kind != JNull:
    result.postcopyBlocktime = some(uint32(n["postcopy-blocktime"].getBiggestInt))
  if n.hasKey("postcopy-vcpu-blocktime") and n["postcopy-vcpu-blocktime"].kind != JNull:
    result.postcopyVcpuBlocktime = some((n["postcopy-vcpu-blocktime"]).getElems.mapIt(uint32(it.getBiggestInt)))
  if n.hasKey("postcopy-latency") and n["postcopy-latency"].kind != JNull:
    result.postcopyLatency = some(cast[uint64](n["postcopy-latency"].getBiggestInt))
  if n.hasKey("postcopy-latency-dist") and n["postcopy-latency-dist"].kind != JNull:
    result.postcopyLatencyDist = some((n["postcopy-latency-dist"]).getElems.mapIt(cast[uint64](it.getBiggestInt)))
  if n.hasKey("postcopy-vcpu-latency") and n["postcopy-vcpu-latency"].kind != JNull:
    result.postcopyVcpuLatency = some((n["postcopy-vcpu-latency"]).getElems.mapIt(cast[uint64](it.getBiggestInt)))
  if n.hasKey("postcopy-non-vcpu-latency") and n["postcopy-non-vcpu-latency"].kind != JNull:
    result.postcopyNonVcpuLatency = some(cast[uint64](n["postcopy-non-vcpu-latency"].getBiggestInt))
  if n.hasKey("socket-address") and n["socket-address"].kind != JNull:
    result.socketAddress = some((n["socket-address"]).getElems.mapIt(parse(typedesc[SocketAddress], it)))
  if n.hasKey("dirty-limit-throttle-time-per-round") and n["dirty-limit-throttle-time-per-round"].kind != JNull:
    result.dirtyLimitThrottleTimePerRound = some(cast[uint64](n["dirty-limit-throttle-time-per-round"].getBiggestInt))
  if n.hasKey("dirty-limit-ring-full-time") and n["dirty-limit-ring-full-time"].kind != JNull:
    result.dirtyLimitRingFullTime = some(cast[uint64](n["dirty-limit-ring-full-time"].getBiggestInt))

proc `%`*(x: MigrationCapability): JsonNode = %($x)
proc parse*(_: typedesc[MigrationCapability], n: JsonNode): MigrationCapability =
  let s = n.getStr
  case s
  of "xbzrle": MigrationCapability.Xbzrle
  of "rdma-pin-all": MigrationCapability.RdmaPinAll
  of "auto-converge": MigrationCapability.AutoConverge
  of "events": MigrationCapability.Events
  of "postcopy-ram": MigrationCapability.PostcopyRam
  of "x-colo": MigrationCapability.XColo
  of "release-ram": MigrationCapability.ReleaseRam
  of "return-path": MigrationCapability.ReturnPath
  of "pause-before-switchover": MigrationCapability.PauseBeforeSwitchover
  of "multifd": MigrationCapability.Multifd
  of "dirty-bitmaps": MigrationCapability.DirtyBitmaps
  of "postcopy-blocktime": MigrationCapability.PostcopyBlocktime
  of "late-block-activate": MigrationCapability.LateBlockActivate
  of "x-ignore-shared": MigrationCapability.XIgnoreShared
  of "validate-uuid": MigrationCapability.ValidateUuid
  of "background-snapshot": MigrationCapability.BackgroundSnapshot
  of "zero-copy-send": MigrationCapability.ZeroCopySend
  of "postcopy-preempt": MigrationCapability.PostcopyPreempt
  of "switchover-ack": MigrationCapability.SwitchoverAck
  of "dirty-limit": MigrationCapability.DirtyLimit
  of "mapped-ram": MigrationCapability.MappedRam
  else: raise newException(ValueError, "unknown MigrationCapability: " & s)

proc `%`*(x: MigrationCapabilityStatus): JsonNode =
  result = newJObject()
  result["capability"] = %(x.capability)
  result["state"] = %(x.state)

proc parse*(_: typedesc[MigrationCapabilityStatus], n: JsonNode): MigrationCapabilityStatus =
  result = default(MigrationCapabilityStatus)
  result.capability = parse(typedesc[MigrationCapability], n["capability"])
  result.state = n["state"].getBool

proc `%`*(x: MultiFDCompression): JsonNode = %($x)
proc parse*(_: typedesc[MultiFDCompression], n: JsonNode): MultiFDCompression =
  let s = n.getStr
  case s
  of "none": MultiFDCompression.None
  of "zlib": MultiFDCompression.Zlib
  of "zstd": MultiFDCompression.Zstd
  of "qatzip": MultiFDCompression.Qatzip
  of "qpl": MultiFDCompression.Qpl
  of "uadk": MultiFDCompression.Uadk
  else: raise newException(ValueError, "unknown MultiFDCompression: " & s)

proc `%`*(x: MigMode): JsonNode = %($x)
proc parse*(_: typedesc[MigMode], n: JsonNode): MigMode =
  let s = n.getStr
  case s
  of "normal": MigMode.Normal
  of "cpr-reboot": MigMode.CprReboot
  of "cpr-transfer": MigMode.CprTransfer
  of "cpr-exec": MigMode.CprExec
  else: raise newException(ValueError, "unknown MigMode: " & s)

proc `%`*(x: ZeroPageDetection): JsonNode = %($x)
proc parse*(_: typedesc[ZeroPageDetection], n: JsonNode): ZeroPageDetection =
  let s = n.getStr
  case s
  of "none": ZeroPageDetection.None
  of "legacy": ZeroPageDetection.Legacy
  of "multifd": ZeroPageDetection.Multifd
  else: raise newException(ValueError, "unknown ZeroPageDetection: " & s)

proc `%`*(x: BitmapMigrationBitmapAliasTransform): JsonNode =
  result = newJObject()
  if x.persistent.isSome: result["persistent"] = %(x.persistent.get)

proc parse*(_: typedesc[BitmapMigrationBitmapAliasTransform], n: JsonNode): BitmapMigrationBitmapAliasTransform =
  result = default(BitmapMigrationBitmapAliasTransform)
  if n.hasKey("persistent") and n["persistent"].kind != JNull:
    result.persistent = some(n["persistent"].getBool)

proc `%`*(x: BitmapMigrationBitmapAlias): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["alias"] = %(x.alias)
  if x.transform.isSome: result["transform"] = %(x.transform.get)

proc parse*(_: typedesc[BitmapMigrationBitmapAlias], n: JsonNode): BitmapMigrationBitmapAlias =
  result = default(BitmapMigrationBitmapAlias)
  result.name = n["name"].getStr
  result.alias = n["alias"].getStr
  if n.hasKey("transform") and n["transform"].kind != JNull:
    result.transform = some(parse(typedesc[BitmapMigrationBitmapAliasTransform], n["transform"]))

proc `%`*(x: BitmapMigrationNodeAlias): JsonNode =
  result = newJObject()
  result["node-name"] = %(x.nodeName)
  result["alias"] = %(x.alias)
  result["bitmaps"] = %(x.bitmaps)

proc parse*(_: typedesc[BitmapMigrationNodeAlias], n: JsonNode): BitmapMigrationNodeAlias =
  result = default(BitmapMigrationNodeAlias)
  result.nodeName = n["node-name"].getStr
  result.alias = n["alias"].getStr
  result.bitmaps = (n["bitmaps"]).getElems.mapIt(parse(typedesc[BitmapMigrationBitmapAlias], it))

proc `%`*(x: MigrationParameter): JsonNode = %($x)
proc parse*(_: typedesc[MigrationParameter], n: JsonNode): MigrationParameter =
  let s = n.getStr
  case s
  of "announce-initial": MigrationParameter.AnnounceInitial
  of "announce-max": MigrationParameter.AnnounceMax
  of "announce-rounds": MigrationParameter.AnnounceRounds
  of "announce-step": MigrationParameter.AnnounceStep
  of "throttle-trigger-threshold": MigrationParameter.ThrottleTriggerThreshold
  of "cpu-throttle-initial": MigrationParameter.CpuThrottleInitial
  of "cpu-throttle-increment": MigrationParameter.CpuThrottleIncrement
  of "cpu-throttle-tailslow": MigrationParameter.CpuThrottleTailslow
  of "tls-creds": MigrationParameter.TlsCreds
  of "tls-hostname": MigrationParameter.TlsHostname
  of "tls-authz": MigrationParameter.TlsAuthz
  of "max-bandwidth": MigrationParameter.MaxBandwidth
  of "avail-switchover-bandwidth": MigrationParameter.AvailSwitchoverBandwidth
  of "downtime-limit": MigrationParameter.DowntimeLimit
  of "x-checkpoint-delay": MigrationParameter.XCheckpointDelay
  of "multifd-channels": MigrationParameter.MultifdChannels
  of "xbzrle-cache-size": MigrationParameter.XbzrleCacheSize
  of "max-postcopy-bandwidth": MigrationParameter.MaxPostcopyBandwidth
  of "max-cpu-throttle": MigrationParameter.MaxCpuThrottle
  of "multifd-compression": MigrationParameter.MultifdCompression
  of "multifd-zlib-level": MigrationParameter.MultifdZlibLevel
  of "multifd-zstd-level": MigrationParameter.MultifdZstdLevel
  of "multifd-qatzip-level": MigrationParameter.MultifdQatzipLevel
  of "block-bitmap-mapping": MigrationParameter.BlockBitmapMapping
  of "x-vcpu-dirty-limit-period": MigrationParameter.XVcpuDirtyLimitPeriod
  of "vcpu-dirty-limit": MigrationParameter.VcpuDirtyLimit
  of "mode": MigrationParameter.Mode
  of "zero-page-detection": MigrationParameter.ZeroPageDetection
  of "direct-io": MigrationParameter.DirectIo
  of "cpr-exec-command": MigrationParameter.CprExecCommand
  else: raise newException(ValueError, "unknown MigrationParameter: " & s)

proc `%`*(x: MigrationParameters): JsonNode =
  result = newJObject()
  if x.announceInitial.isSome: result["announce-initial"] = %(x.announceInitial.get)
  if x.announceMax.isSome: result["announce-max"] = %(x.announceMax.get)
  if x.announceRounds.isSome: result["announce-rounds"] = %(x.announceRounds.get)
  if x.announceStep.isSome: result["announce-step"] = %(x.announceStep.get)
  if x.throttleTriggerThreshold.isSome: result["throttle-trigger-threshold"] = %(x.throttleTriggerThreshold.get)
  if x.cpuThrottleInitial.isSome: result["cpu-throttle-initial"] = %(x.cpuThrottleInitial.get)
  if x.cpuThrottleIncrement.isSome: result["cpu-throttle-increment"] = %(x.cpuThrottleIncrement.get)
  if x.cpuThrottleTailslow.isSome: result["cpu-throttle-tailslow"] = %(x.cpuThrottleTailslow.get)
  if x.tlsCreds.isSome: result["tls-creds"] = %(x.tlsCreds.get)
  if x.tlsHostname.isSome: result["tls-hostname"] = %(x.tlsHostname.get)
  if x.tlsAuthz.isSome: result["tls-authz"] = %(x.tlsAuthz.get)
  if x.maxBandwidth.isSome: result["max-bandwidth"] = %(x.maxBandwidth.get)
  if x.availSwitchoverBandwidth.isSome: result["avail-switchover-bandwidth"] = %(x.availSwitchoverBandwidth.get)
  if x.downtimeLimit.isSome: result["downtime-limit"] = %(x.downtimeLimit.get)
  if x.xCheckpointDelay.isSome: result["x-checkpoint-delay"] = %(x.xCheckpointDelay.get)
  if x.multifdChannels.isSome: result["multifd-channels"] = %(x.multifdChannels.get)
  if x.xbzrleCacheSize.isSome: result["xbzrle-cache-size"] = %(x.xbzrleCacheSize.get)
  if x.maxPostcopyBandwidth.isSome: result["max-postcopy-bandwidth"] = %(x.maxPostcopyBandwidth.get)
  if x.maxCpuThrottle.isSome: result["max-cpu-throttle"] = %(x.maxCpuThrottle.get)
  if x.multifdCompression.isSome: result["multifd-compression"] = %(x.multifdCompression.get)
  if x.multifdZlibLevel.isSome: result["multifd-zlib-level"] = %(x.multifdZlibLevel.get)
  if x.multifdQatzipLevel.isSome: result["multifd-qatzip-level"] = %(x.multifdQatzipLevel.get)
  if x.multifdZstdLevel.isSome: result["multifd-zstd-level"] = %(x.multifdZstdLevel.get)
  if x.blockBitmapMapping.isSome: result["block-bitmap-mapping"] = %(x.blockBitmapMapping.get)
  if x.xVcpuDirtyLimitPeriod.isSome: result["x-vcpu-dirty-limit-period"] = %(x.xVcpuDirtyLimitPeriod.get)
  if x.vcpuDirtyLimit.isSome: result["vcpu-dirty-limit"] = %(x.vcpuDirtyLimit.get)
  if x.mode.isSome: result["mode"] = %(x.mode.get)
  if x.zeroPageDetection.isSome: result["zero-page-detection"] = %(x.zeroPageDetection.get)
  if x.directIo.isSome: result["direct-io"] = %(x.directIo.get)
  if x.cprExecCommand.isSome: result["cpr-exec-command"] = %(x.cprExecCommand.get)

proc parse*(_: typedesc[MigrationParameters], n: JsonNode): MigrationParameters =
  result = default(MigrationParameters)
  if n.hasKey("announce-initial") and n["announce-initial"].kind != JNull:
    result.announceInitial = some(cast[uint64](n["announce-initial"].getBiggestInt))
  if n.hasKey("announce-max") and n["announce-max"].kind != JNull:
    result.announceMax = some(cast[uint64](n["announce-max"].getBiggestInt))
  if n.hasKey("announce-rounds") and n["announce-rounds"].kind != JNull:
    result.announceRounds = some(cast[uint64](n["announce-rounds"].getBiggestInt))
  if n.hasKey("announce-step") and n["announce-step"].kind != JNull:
    result.announceStep = some(cast[uint64](n["announce-step"].getBiggestInt))
  if n.hasKey("throttle-trigger-threshold") and n["throttle-trigger-threshold"].kind != JNull:
    result.throttleTriggerThreshold = some(uint8(n["throttle-trigger-threshold"].getBiggestInt))
  if n.hasKey("cpu-throttle-initial") and n["cpu-throttle-initial"].kind != JNull:
    result.cpuThrottleInitial = some(uint8(n["cpu-throttle-initial"].getBiggestInt))
  if n.hasKey("cpu-throttle-increment") and n["cpu-throttle-increment"].kind != JNull:
    result.cpuThrottleIncrement = some(uint8(n["cpu-throttle-increment"].getBiggestInt))
  if n.hasKey("cpu-throttle-tailslow") and n["cpu-throttle-tailslow"].kind != JNull:
    result.cpuThrottleTailslow = some(n["cpu-throttle-tailslow"].getBool)
  if n.hasKey("tls-creds") and n["tls-creds"].kind != JNull:
    result.tlsCreds = some(parse(typedesc[StrOrNull], n["tls-creds"]))
  if n.hasKey("tls-hostname") and n["tls-hostname"].kind != JNull:
    result.tlsHostname = some(parse(typedesc[StrOrNull], n["tls-hostname"]))
  if n.hasKey("tls-authz") and n["tls-authz"].kind != JNull:
    result.tlsAuthz = some(parse(typedesc[StrOrNull], n["tls-authz"]))
  if n.hasKey("max-bandwidth") and n["max-bandwidth"].kind != JNull:
    result.maxBandwidth = some(cast[uint64](n["max-bandwidth"].getBiggestInt))
  if n.hasKey("avail-switchover-bandwidth") and n["avail-switchover-bandwidth"].kind != JNull:
    result.availSwitchoverBandwidth = some(cast[uint64](n["avail-switchover-bandwidth"].getBiggestInt))
  if n.hasKey("downtime-limit") and n["downtime-limit"].kind != JNull:
    result.downtimeLimit = some(cast[uint64](n["downtime-limit"].getBiggestInt))
  if n.hasKey("x-checkpoint-delay") and n["x-checkpoint-delay"].kind != JNull:
    result.xCheckpointDelay = some(uint32(n["x-checkpoint-delay"].getBiggestInt))
  if n.hasKey("multifd-channels") and n["multifd-channels"].kind != JNull:
    result.multifdChannels = some(uint8(n["multifd-channels"].getBiggestInt))
  if n.hasKey("xbzrle-cache-size") and n["xbzrle-cache-size"].kind != JNull:
    result.xbzrleCacheSize = some(cast[uint64](n["xbzrle-cache-size"].getBiggestInt))
  if n.hasKey("max-postcopy-bandwidth") and n["max-postcopy-bandwidth"].kind != JNull:
    result.maxPostcopyBandwidth = some(cast[uint64](n["max-postcopy-bandwidth"].getBiggestInt))
  if n.hasKey("max-cpu-throttle") and n["max-cpu-throttle"].kind != JNull:
    result.maxCpuThrottle = some(uint8(n["max-cpu-throttle"].getBiggestInt))
  if n.hasKey("multifd-compression") and n["multifd-compression"].kind != JNull:
    result.multifdCompression = some(parse(typedesc[MultiFDCompression], n["multifd-compression"]))
  if n.hasKey("multifd-zlib-level") and n["multifd-zlib-level"].kind != JNull:
    result.multifdZlibLevel = some(uint8(n["multifd-zlib-level"].getBiggestInt))
  if n.hasKey("multifd-qatzip-level") and n["multifd-qatzip-level"].kind != JNull:
    result.multifdQatzipLevel = some(uint8(n["multifd-qatzip-level"].getBiggestInt))
  if n.hasKey("multifd-zstd-level") and n["multifd-zstd-level"].kind != JNull:
    result.multifdZstdLevel = some(uint8(n["multifd-zstd-level"].getBiggestInt))
  if n.hasKey("block-bitmap-mapping") and n["block-bitmap-mapping"].kind != JNull:
    result.blockBitmapMapping = some((n["block-bitmap-mapping"]).getElems.mapIt(parse(typedesc[BitmapMigrationNodeAlias], it)))
  if n.hasKey("x-vcpu-dirty-limit-period") and n["x-vcpu-dirty-limit-period"].kind != JNull:
    result.xVcpuDirtyLimitPeriod = some(cast[uint64](n["x-vcpu-dirty-limit-period"].getBiggestInt))
  if n.hasKey("vcpu-dirty-limit") and n["vcpu-dirty-limit"].kind != JNull:
    result.vcpuDirtyLimit = some(cast[uint64](n["vcpu-dirty-limit"].getBiggestInt))
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[MigMode], n["mode"]))
  if n.hasKey("zero-page-detection") and n["zero-page-detection"].kind != JNull:
    result.zeroPageDetection = some(parse(typedesc[ZeroPageDetection], n["zero-page-detection"]))
  if n.hasKey("direct-io") and n["direct-io"].kind != JNull:
    result.directIo = some(n["direct-io"].getBool)
  if n.hasKey("cpr-exec-command") and n["cpr-exec-command"].kind != JNull:
    result.cprExecCommand = some((n["cpr-exec-command"]).getElems.mapIt(it.getStr))

proc `%`*(x: COLOMessage): JsonNode = %($x)
proc parse*(_: typedesc[COLOMessage], n: JsonNode): COLOMessage =
  let s = n.getStr
  case s
  of "checkpoint-ready": COLOMessage.CheckpointReady
  of "checkpoint-request": COLOMessage.CheckpointRequest
  of "checkpoint-reply": COLOMessage.CheckpointReply
  of "vmstate-send": COLOMessage.VmstateSend
  of "vmstate-size": COLOMessage.VmstateSize
  of "vmstate-received": COLOMessage.VmstateReceived
  of "vmstate-loaded": COLOMessage.VmstateLoaded
  else: raise newException(ValueError, "unknown COLOMessage: " & s)

proc `%`*(x: COLOMode): JsonNode = %($x)
proc parse*(_: typedesc[COLOMode], n: JsonNode): COLOMode =
  let s = n.getStr
  case s
  of "none": COLOMode.None
  of "primary": COLOMode.Primary
  of "secondary": COLOMode.Secondary
  else: raise newException(ValueError, "unknown COLOMode: " & s)

proc `%`*(x: FailoverStatus): JsonNode = %($x)
proc parse*(_: typedesc[FailoverStatus], n: JsonNode): FailoverStatus =
  let s = n.getStr
  case s
  of "none": FailoverStatus.None
  of "require": FailoverStatus.Require
  of "active": FailoverStatus.Active
  of "completed": FailoverStatus.Completed
  of "relaunch": FailoverStatus.Relaunch
  else: raise newException(ValueError, "unknown FailoverStatus: " & s)

proc `%`*(x: COLOExitReason): JsonNode = %($x)
proc parse*(_: typedesc[COLOExitReason], n: JsonNode): COLOExitReason =
  let s = n.getStr
  case s
  of "none": COLOExitReason.None
  of "request": COLOExitReason.Request
  of "error": COLOExitReason.Error
  of "processing": COLOExitReason.Processing
  else: raise newException(ValueError, "unknown COLOExitReason: " & s)

proc `%`*(x: MigrationAddressType): JsonNode = %($x)
proc parse*(_: typedesc[MigrationAddressType], n: JsonNode): MigrationAddressType =
  let s = n.getStr
  case s
  of "socket": MigrationAddressType.Socket
  of "exec": MigrationAddressType.Exec
  of "rdma": MigrationAddressType.Rdma
  of "file": MigrationAddressType.File
  else: raise newException(ValueError, "unknown MigrationAddressType: " & s)

proc `%`*(x: FileMigrationArgs): JsonNode =
  result = newJObject()
  result["filename"] = %(x.filename)
  result["offset"] = %(x.offset)

proc parse*(_: typedesc[FileMigrationArgs], n: JsonNode): FileMigrationArgs =
  result = default(FileMigrationArgs)
  result.filename = n["filename"].getStr
  result.offset = cast[uint64](n["offset"].getBiggestInt)

proc `%`*(x: MigrationExecCommand): JsonNode =
  result = newJObject()
  result["args"] = %(x.args)

proc parse*(_: typedesc[MigrationExecCommand], n: JsonNode): MigrationExecCommand =
  result = default(MigrationExecCommand)
  result.args = (n["args"]).getElems.mapIt(it.getStr)

proc `%`*(x: MigrationAddress): JsonNode =
  result = newJObject()
  result["transport"] = %($x.transport)
  case x.transport
  of MigrationAddressType.Socket:
    let sub = %(x.socket)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MigrationAddressType.Exec:
    let sub = %(x.exec)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MigrationAddressType.Rdma:
    let sub = %(x.rdma)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MigrationAddressType.File:
    let sub = %(x.file)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[MigrationAddress], n: JsonNode): MigrationAddress =
  result = default(MigrationAddress)
  let tag = parse(typedesc[MigrationAddressType], n["transport"])
  case tag
  of MigrationAddressType.Socket:
    result = MigrationAddress(transport: tag, socket: parse(typedesc[SocketAddress], n))
  of MigrationAddressType.Exec:
    result = MigrationAddress(transport: tag, exec: parse(typedesc[MigrationExecCommand], n))
  of MigrationAddressType.Rdma:
    result = MigrationAddress(transport: tag, rdma: parse(typedesc[InetSocketAddress], n))
  of MigrationAddressType.File:
    result = MigrationAddress(transport: tag, file: parse(typedesc[FileMigrationArgs], n))

proc `%`*(x: MigrationChannelType): JsonNode = %($x)
proc parse*(_: typedesc[MigrationChannelType], n: JsonNode): MigrationChannelType =
  let s = n.getStr
  case s
  of "main": MigrationChannelType.Main
  of "cpr": MigrationChannelType.Cpr
  else: raise newException(ValueError, "unknown MigrationChannelType: " & s)

proc `%`*(x: MigrationChannel): JsonNode =
  result = newJObject()
  result["channel-type"] = %(x.channelType)
  result["addr"] = %(x.`addr`)

proc parse*(_: typedesc[MigrationChannel], n: JsonNode): MigrationChannel =
  result = default(MigrationChannel)
  result.channelType = parse(typedesc[MigrationChannelType], n["channel-type"])
  result.`addr` = parse(typedesc[MigrationAddress], n["addr"])

proc `%`*(x: ReplicationStatus): JsonNode =
  result = newJObject()
  result["error"] = %(x.error)
  if x.desc.isSome: result["desc"] = %(x.desc.get)

proc parse*(_: typedesc[ReplicationStatus], n: JsonNode): ReplicationStatus =
  result = default(ReplicationStatus)
  result.error = n["error"].getBool
  if n.hasKey("desc") and n["desc"].kind != JNull:
    result.desc = some(n["desc"].getStr)

proc `%`*(x: COLOStatus): JsonNode =
  result = newJObject()
  result["mode"] = %(x.mode)
  result["last-mode"] = %(x.lastMode)
  result["reason"] = %(x.reason)

proc parse*(_: typedesc[COLOStatus], n: JsonNode): COLOStatus =
  result = default(COLOStatus)
  result.mode = parse(typedesc[COLOMode], n["mode"])
  result.lastMode = parse(typedesc[COLOMode], n["last-mode"])
  result.reason = parse(typedesc[COLOExitReason], n["reason"])

proc `%`*(x: DirtyRateVcpu): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["dirty-rate"] = %(x.dirtyRate)

proc parse*(_: typedesc[DirtyRateVcpu], n: JsonNode): DirtyRateVcpu =
  result = default(DirtyRateVcpu)
  result.id = int64(n["id"].getBiggestInt)
  result.dirtyRate = int64(n["dirty-rate"].getBiggestInt)

proc `%`*(x: DirtyRateStatus): JsonNode = %($x)
proc parse*(_: typedesc[DirtyRateStatus], n: JsonNode): DirtyRateStatus =
  let s = n.getStr
  case s
  of "unstarted": DirtyRateStatus.Unstarted
  of "measuring": DirtyRateStatus.Measuring
  of "measured": DirtyRateStatus.Measured
  else: raise newException(ValueError, "unknown DirtyRateStatus: " & s)

proc `%`*(x: DirtyRateMeasureMode): JsonNode = %($x)
proc parse*(_: typedesc[DirtyRateMeasureMode], n: JsonNode): DirtyRateMeasureMode =
  let s = n.getStr
  case s
  of "page-sampling": DirtyRateMeasureMode.PageSampling
  of "dirty-ring": DirtyRateMeasureMode.DirtyRing
  of "dirty-bitmap": DirtyRateMeasureMode.DirtyBitmap
  else: raise newException(ValueError, "unknown DirtyRateMeasureMode: " & s)

proc `%`*(x: TimeUnit): JsonNode = %($x)
proc parse*(_: typedesc[TimeUnit], n: JsonNode): TimeUnit =
  let s = n.getStr
  case s
  of "second": TimeUnit.Second
  of "millisecond": TimeUnit.Millisecond
  else: raise newException(ValueError, "unknown TimeUnit: " & s)

proc `%`*(x: DirtyRateInfo): JsonNode =
  result = newJObject()
  if x.dirtyRate.isSome: result["dirty-rate"] = %(x.dirtyRate.get)
  result["status"] = %(x.status)
  result["start-time"] = %(x.startTime)
  result["calc-time"] = %(x.calcTime)
  result["calc-time-unit"] = %(x.calcTimeUnit)
  result["sample-pages"] = %(x.samplePages)
  result["mode"] = %(x.mode)
  if x.vcpuDirtyRate.isSome: result["vcpu-dirty-rate"] = %(x.vcpuDirtyRate.get)

proc parse*(_: typedesc[DirtyRateInfo], n: JsonNode): DirtyRateInfo =
  result = default(DirtyRateInfo)
  if n.hasKey("dirty-rate") and n["dirty-rate"].kind != JNull:
    result.dirtyRate = some(int64(n["dirty-rate"].getBiggestInt))
  result.status = parse(typedesc[DirtyRateStatus], n["status"])
  result.startTime = int64(n["start-time"].getBiggestInt)
  result.calcTime = int64(n["calc-time"].getBiggestInt)
  result.calcTimeUnit = parse(typedesc[TimeUnit], n["calc-time-unit"])
  result.samplePages = cast[uint64](n["sample-pages"].getBiggestInt)
  result.mode = parse(typedesc[DirtyRateMeasureMode], n["mode"])
  if n.hasKey("vcpu-dirty-rate") and n["vcpu-dirty-rate"].kind != JNull:
    result.vcpuDirtyRate = some((n["vcpu-dirty-rate"]).getElems.mapIt(parse(typedesc[DirtyRateVcpu], it)))

proc `%`*(x: DirtyLimitInfo): JsonNode =
  result = newJObject()
  result["cpu-index"] = %(x.cpuIndex)
  result["limit-rate"] = %(x.limitRate)
  result["current-rate"] = %(x.currentRate)

proc parse*(_: typedesc[DirtyLimitInfo], n: JsonNode): DirtyLimitInfo =
  result = default(DirtyLimitInfo)
  result.cpuIndex = int64(n["cpu-index"].getBiggestInt)
  result.limitRate = cast[uint64](n["limit-rate"].getBiggestInt)
  result.currentRate = cast[uint64](n["current-rate"].getBiggestInt)

proc `%`*(x: Abort): JsonNode =
  result = newJObject()

proc parse*(_: typedesc[Abort], n: JsonNode): Abort =
  result = default(Abort)
  discard

proc `%`*(x: ActionCompletionMode): JsonNode = %($x)
proc parse*(_: typedesc[ActionCompletionMode], n: JsonNode): ActionCompletionMode =
  let s = n.getStr
  case s
  of "individual": ActionCompletionMode.Individual
  of "grouped": ActionCompletionMode.Grouped
  else: raise newException(ValueError, "unknown ActionCompletionMode: " & s)

proc `%`*(x: TransactionActionKind): JsonNode = %($x)
proc parse*(_: typedesc[TransactionActionKind], n: JsonNode): TransactionActionKind =
  let s = n.getStr
  case s
  of "abort": TransactionActionKind.Abort
  of "block-dirty-bitmap-add": TransactionActionKind.BlockDirtyBitmapAdd
  of "block-dirty-bitmap-remove": TransactionActionKind.BlockDirtyBitmapRemove
  of "block-dirty-bitmap-clear": TransactionActionKind.BlockDirtyBitmapClear
  of "block-dirty-bitmap-enable": TransactionActionKind.BlockDirtyBitmapEnable
  of "block-dirty-bitmap-disable": TransactionActionKind.BlockDirtyBitmapDisable
  of "block-dirty-bitmap-merge": TransactionActionKind.BlockDirtyBitmapMerge
  of "blockdev-backup": TransactionActionKind.BlockdevBackup
  of "blockdev-snapshot": TransactionActionKind.BlockdevSnapshot
  of "blockdev-snapshot-internal-sync": TransactionActionKind.BlockdevSnapshotInternalSync
  of "blockdev-snapshot-sync": TransactionActionKind.BlockdevSnapshotSync
  of "drive-backup": TransactionActionKind.DriveBackup
  else: raise newException(ValueError, "unknown TransactionActionKind: " & s)

proc `%`*(x: AbortWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[AbortWrapper], n: JsonNode): AbortWrapper =
  result = default(AbortWrapper)
  result.data = parse(typedesc[Abort], n["data"])

proc `%`*(x: BlockDirtyBitmapAddWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockDirtyBitmapAddWrapper], n: JsonNode): BlockDirtyBitmapAddWrapper =
  result = default(BlockDirtyBitmapAddWrapper)
  result.data = parse(typedesc[BlockDirtyBitmapAdd], n["data"])

proc `%`*(x: BlockDirtyBitmapWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockDirtyBitmapWrapper], n: JsonNode): BlockDirtyBitmapWrapper =
  result = default(BlockDirtyBitmapWrapper)
  result.data = parse(typedesc[BlockDirtyBitmap], n["data"])

proc `%`*(x: BlockDirtyBitmapMergeWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockDirtyBitmapMergeWrapper], n: JsonNode): BlockDirtyBitmapMergeWrapper =
  result = default(BlockDirtyBitmapMergeWrapper)
  result.data = parse(typedesc[BlockDirtyBitmapMerge], n["data"])

proc `%`*(x: BlockdevBackupWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockdevBackupWrapper], n: JsonNode): BlockdevBackupWrapper =
  result = default(BlockdevBackupWrapper)
  result.data = parse(typedesc[BlockdevBackup], n["data"])

proc `%`*(x: BlockdevSnapshotWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockdevSnapshotWrapper], n: JsonNode): BlockdevSnapshotWrapper =
  result = default(BlockdevSnapshotWrapper)
  result.data = parse(typedesc[BlockdevSnapshot], n["data"])

proc `%`*(x: BlockdevSnapshotInternalWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockdevSnapshotInternalWrapper], n: JsonNode): BlockdevSnapshotInternalWrapper =
  result = default(BlockdevSnapshotInternalWrapper)
  result.data = parse(typedesc[BlockdevSnapshotInternal], n["data"])

proc `%`*(x: BlockdevSnapshotSyncWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[BlockdevSnapshotSyncWrapper], n: JsonNode): BlockdevSnapshotSyncWrapper =
  result = default(BlockdevSnapshotSyncWrapper)
  result.data = parse(typedesc[BlockdevSnapshotSync], n["data"])

proc `%`*(x: DriveBackupWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[DriveBackupWrapper], n: JsonNode): DriveBackupWrapper =
  result = default(DriveBackupWrapper)
  result.data = parse(typedesc[DriveBackup], n["data"])

proc `%`*(x: TransactionAction): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of TransactionActionKind.Abort:
    let sub = %(x.abort)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapAdd:
    let sub = %(x.blockDirtyBitmapAdd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapRemove:
    let sub = %(x.blockDirtyBitmapRemove)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapClear:
    let sub = %(x.blockDirtyBitmapClear)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapEnable:
    let sub = %(x.blockDirtyBitmapEnable)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapDisable:
    let sub = %(x.blockDirtyBitmapDisable)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockDirtyBitmapMerge:
    let sub = %(x.blockDirtyBitmapMerge)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockdevBackup:
    let sub = %(x.blockdevBackup)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockdevSnapshot:
    let sub = %(x.blockdevSnapshot)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockdevSnapshotInternalSync:
    let sub = %(x.blockdevSnapshotInternalSync)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.BlockdevSnapshotSync:
    let sub = %(x.blockdevSnapshotSync)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of TransactionActionKind.DriveBackup:
    let sub = %(x.driveBackup)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[TransactionAction], n: JsonNode): TransactionAction =
  result = default(TransactionAction)
  let tag = parse(typedesc[TransactionActionKind], n["type"])
  case tag
  of TransactionActionKind.Abort:
    result = TransactionAction(`type`: tag, abort: parse(typedesc[AbortWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapAdd:
    result = TransactionAction(`type`: tag, blockDirtyBitmapAdd: parse(typedesc[BlockDirtyBitmapAddWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapRemove:
    result = TransactionAction(`type`: tag, blockDirtyBitmapRemove: parse(typedesc[BlockDirtyBitmapWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapClear:
    result = TransactionAction(`type`: tag, blockDirtyBitmapClear: parse(typedesc[BlockDirtyBitmapWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapEnable:
    result = TransactionAction(`type`: tag, blockDirtyBitmapEnable: parse(typedesc[BlockDirtyBitmapWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapDisable:
    result = TransactionAction(`type`: tag, blockDirtyBitmapDisable: parse(typedesc[BlockDirtyBitmapWrapper], n))
  of TransactionActionKind.BlockDirtyBitmapMerge:
    result = TransactionAction(`type`: tag, blockDirtyBitmapMerge: parse(typedesc[BlockDirtyBitmapMergeWrapper], n))
  of TransactionActionKind.BlockdevBackup:
    result = TransactionAction(`type`: tag, blockdevBackup: parse(typedesc[BlockdevBackupWrapper], n))
  of TransactionActionKind.BlockdevSnapshot:
    result = TransactionAction(`type`: tag, blockdevSnapshot: parse(typedesc[BlockdevSnapshotWrapper], n))
  of TransactionActionKind.BlockdevSnapshotInternalSync:
    result = TransactionAction(`type`: tag, blockdevSnapshotInternalSync: parse(typedesc[BlockdevSnapshotInternalWrapper], n))
  of TransactionActionKind.BlockdevSnapshotSync:
    result = TransactionAction(`type`: tag, blockdevSnapshotSync: parse(typedesc[BlockdevSnapshotSyncWrapper], n))
  of TransactionActionKind.DriveBackup:
    result = TransactionAction(`type`: tag, driveBackup: parse(typedesc[DriveBackupWrapper], n))

proc `%`*(x: TransactionProperties): JsonNode =
  result = newJObject()
  if x.completionMode.isSome: result["completion-mode"] = %(x.completionMode.get)

proc parse*(_: typedesc[TransactionProperties], n: JsonNode): TransactionProperties =
  result = default(TransactionProperties)
  if n.hasKey("completion-mode") and n["completion-mode"].kind != JNull:
    result.completionMode = some(parse(typedesc[ActionCompletionMode], n["completion-mode"]))

proc `%`*(x: TraceEventState): JsonNode = %($x)
proc parse*(_: typedesc[TraceEventState], n: JsonNode): TraceEventState =
  let s = n.getStr
  case s
  of "unavailable": TraceEventState.Unavailable
  of "disabled": TraceEventState.Disabled
  of "enabled": TraceEventState.Enabled
  else: raise newException(ValueError, "unknown TraceEventState: " & s)

proc `%`*(x: TraceEventInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["state"] = %(x.state)

proc parse*(_: typedesc[TraceEventInfo], n: JsonNode): TraceEventInfo =
  result = default(TraceEventInfo)
  result.name = n["name"].getStr
  result.state = parse(typedesc[TraceEventState], n["state"])

proc `%`*(x: CompatPolicyInput): JsonNode = %($x)
proc parse*(_: typedesc[CompatPolicyInput], n: JsonNode): CompatPolicyInput =
  let s = n.getStr
  case s
  of "accept": CompatPolicyInput.Accept
  of "reject": CompatPolicyInput.Reject
  of "crash": CompatPolicyInput.Crash
  else: raise newException(ValueError, "unknown CompatPolicyInput: " & s)

proc `%`*(x: CompatPolicyOutput): JsonNode = %($x)
proc parse*(_: typedesc[CompatPolicyOutput], n: JsonNode): CompatPolicyOutput =
  let s = n.getStr
  case s
  of "accept": CompatPolicyOutput.Accept
  of "hide": CompatPolicyOutput.Hide
  else: raise newException(ValueError, "unknown CompatPolicyOutput: " & s)

proc `%`*(x: CompatPolicy): JsonNode =
  result = newJObject()
  if x.deprecatedInput.isSome: result["deprecated-input"] = %(x.deprecatedInput.get)
  if x.deprecatedOutput.isSome: result["deprecated-output"] = %(x.deprecatedOutput.get)
  if x.unstableInput.isSome: result["unstable-input"] = %(x.unstableInput.get)
  if x.unstableOutput.isSome: result["unstable-output"] = %(x.unstableOutput.get)

proc parse*(_: typedesc[CompatPolicy], n: JsonNode): CompatPolicy =
  result = default(CompatPolicy)
  if n.hasKey("deprecated-input") and n["deprecated-input"].kind != JNull:
    result.deprecatedInput = some(parse(typedesc[CompatPolicyInput], n["deprecated-input"]))
  if n.hasKey("deprecated-output") and n["deprecated-output"].kind != JNull:
    result.deprecatedOutput = some(parse(typedesc[CompatPolicyOutput], n["deprecated-output"]))
  if n.hasKey("unstable-input") and n["unstable-input"].kind != JNull:
    result.unstableInput = some(parse(typedesc[CompatPolicyInput], n["unstable-input"]))
  if n.hasKey("unstable-output") and n["unstable-output"].kind != JNull:
    result.unstableOutput = some(parse(typedesc[CompatPolicyOutput], n["unstable-output"]))

proc `%`*(x: QMPCapability): JsonNode = %($x)
proc parse*(_: typedesc[QMPCapability], n: JsonNode): QMPCapability =
  let s = n.getStr
  case s
  of "oob": QMPCapability.Oob
  else: raise newException(ValueError, "unknown QMPCapability: " & s)

proc `%`*(x: VersionTriple): JsonNode =
  result = newJObject()
  result["major"] = %(x.major)
  result["minor"] = %(x.minor)
  result["micro"] = %(x.micro)

proc parse*(_: typedesc[VersionTriple], n: JsonNode): VersionTriple =
  result = default(VersionTriple)
  result.major = int64(n["major"].getBiggestInt)
  result.minor = int64(n["minor"].getBiggestInt)
  result.micro = int64(n["micro"].getBiggestInt)

proc `%`*(x: VersionInfo): JsonNode =
  result = newJObject()
  result["qemu"] = %(x.qemu)
  result["package"] = %(x.package)

proc parse*(_: typedesc[VersionInfo], n: JsonNode): VersionInfo =
  result = default(VersionInfo)
  result.qemu = parse(typedesc[VersionTriple], n["qemu"])
  result.package = n["package"].getStr

proc `%`*(x: CommandInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)

proc parse*(_: typedesc[CommandInfo], n: JsonNode): CommandInfo =
  result = default(CommandInfo)
  result.name = n["name"].getStr

proc `%`*(x: MonitorMode): JsonNode = %($x)
proc parse*(_: typedesc[MonitorMode], n: JsonNode): MonitorMode =
  let s = n.getStr
  case s
  of "readline": MonitorMode.Readline
  of "control": MonitorMode.Control
  else: raise newException(ValueError, "unknown MonitorMode: " & s)

proc `%`*(x: MonitorOptions): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  if x.mode.isSome: result["mode"] = %(x.mode.get)
  if x.pretty.isSome: result["pretty"] = %(x.pretty.get)
  result["chardev"] = %(x.chardev)

proc parse*(_: typedesc[MonitorOptions], n: JsonNode): MonitorOptions =
  result = default(MonitorOptions)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  if n.hasKey("mode") and n["mode"].kind != JNull:
    result.mode = some(parse(typedesc[MonitorMode], n["mode"]))
  if n.hasKey("pretty") and n["pretty"].kind != JNull:
    result.pretty = some(n["pretty"].getBool)
  result.chardev = n["chardev"].getStr

proc `%`*(x: SchemaMetaType): JsonNode = %($x)
proc parse*(_: typedesc[SchemaMetaType], n: JsonNode): SchemaMetaType =
  let s = n.getStr
  case s
  of "builtin": SchemaMetaType.Builtin
  of "enum": SchemaMetaType.Enum
  of "array": SchemaMetaType.Array
  of "object": SchemaMetaType.Object
  of "alternate": SchemaMetaType.Alternate
  of "command": SchemaMetaType.Command
  of "event": SchemaMetaType.Event
  else: raise newException(ValueError, "unknown SchemaMetaType: " & s)

proc `%`*(x: SchemaInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.features.isSome: result["features"] = %(x.features.get)
  result["meta-type"] = %($x.metaType)
  case x.metaType
  of SchemaMetaType.Builtin:
    let sub = %(x.builtin)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Enum:
    let sub = %(x.`enum`)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Array:
    let sub = %(x.array)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Object:
    let sub = %(x.`object`)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Alternate:
    let sub = %(x.alternate)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Command:
    let sub = %(x.command)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SchemaMetaType.Event:
    let sub = %(x.event)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[SchemaInfo], n: JsonNode): SchemaInfo =
  result = default(SchemaInfo)
  let tag = parse(typedesc[SchemaMetaType], n["meta-type"])
  case tag
  of SchemaMetaType.Builtin:
    result = SchemaInfo(metaType: tag, builtin: parse(typedesc[SchemaInfoBuiltin], n))
  of SchemaMetaType.Enum:
    result = SchemaInfo(metaType: tag, `enum`: parse(typedesc[SchemaInfoEnum], n))
  of SchemaMetaType.Array:
    result = SchemaInfo(metaType: tag, array: parse(typedesc[SchemaInfoArray], n))
  of SchemaMetaType.Object:
    result = SchemaInfo(metaType: tag, `object`: parse(typedesc[SchemaInfoObject], n))
  of SchemaMetaType.Alternate:
    result = SchemaInfo(metaType: tag, alternate: parse(typedesc[SchemaInfoAlternate], n))
  of SchemaMetaType.Command:
    result = SchemaInfo(metaType: tag, command: parse(typedesc[SchemaInfoCommand], n))
  of SchemaMetaType.Event:
    result = SchemaInfo(metaType: tag, event: parse(typedesc[SchemaInfoEvent], n))
  result.name = n["name"].getStr
  if n.hasKey("features") and n["features"].kind != JNull:
    result.features = some((n["features"]).getElems.mapIt(it.getStr))

proc `%`*(x: SchemaInfoBuiltin): JsonNode =
  result = newJObject()
  result["json-type"] = %(x.jsonType)

proc parse*(_: typedesc[SchemaInfoBuiltin], n: JsonNode): SchemaInfoBuiltin =
  result = default(SchemaInfoBuiltin)
  result.jsonType = parse(typedesc[JSONType], n["json-type"])

proc `%`*(x: JSONType): JsonNode = %($x)
proc parse*(_: typedesc[JSONType], n: JsonNode): JSONType =
  let s = n.getStr
  case s
  of "string": JSONType.String
  of "number": JSONType.Number
  of "int": JSONType.Int
  of "boolean": JSONType.Boolean
  of "null": JSONType.Null
  of "object": JSONType.Object
  of "array": JSONType.Array
  of "value": JSONType.Value
  else: raise newException(ValueError, "unknown JSONType: " & s)

proc `%`*(x: SchemaInfoEnum): JsonNode =
  result = newJObject()
  result["members"] = %(x.members)
  result["values"] = %(x.values)

proc parse*(_: typedesc[SchemaInfoEnum], n: JsonNode): SchemaInfoEnum =
  result = default(SchemaInfoEnum)
  result.members = (n["members"]).getElems.mapIt(parse(typedesc[SchemaInfoEnumMember], it))
  result.values = (n["values"]).getElems.mapIt(it.getStr)

proc `%`*(x: SchemaInfoEnumMember): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.features.isSome: result["features"] = %(x.features.get)

proc parse*(_: typedesc[SchemaInfoEnumMember], n: JsonNode): SchemaInfoEnumMember =
  result = default(SchemaInfoEnumMember)
  result.name = n["name"].getStr
  if n.hasKey("features") and n["features"].kind != JNull:
    result.features = some((n["features"]).getElems.mapIt(it.getStr))

proc `%`*(x: SchemaInfoArray): JsonNode =
  result = newJObject()
  result["element-type"] = %(x.elementType)

proc parse*(_: typedesc[SchemaInfoArray], n: JsonNode): SchemaInfoArray =
  result = default(SchemaInfoArray)
  result.elementType = n["element-type"].getStr

proc `%`*(x: SchemaInfoObject): JsonNode =
  result = newJObject()
  result["members"] = %(x.members)
  if x.tag.isSome: result["tag"] = %(x.tag.get)
  if x.variants.isSome: result["variants"] = %(x.variants.get)

proc parse*(_: typedesc[SchemaInfoObject], n: JsonNode): SchemaInfoObject =
  result = default(SchemaInfoObject)
  result.members = (n["members"]).getElems.mapIt(parse(typedesc[SchemaInfoObjectMember], it))
  if n.hasKey("tag") and n["tag"].kind != JNull:
    result.tag = some(n["tag"].getStr)
  if n.hasKey("variants") and n["variants"].kind != JNull:
    result.variants = some((n["variants"]).getElems.mapIt(parse(typedesc[SchemaInfoObjectVariant], it)))

proc `%`*(x: SchemaInfoObjectMember): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["type"] = %(x.`type`)
  if x.default.isSome: result["default"] = %(x.default.get)
  if x.features.isSome: result["features"] = %(x.features.get)

proc parse*(_: typedesc[SchemaInfoObjectMember], n: JsonNode): SchemaInfoObjectMember =
  result = default(SchemaInfoObjectMember)
  result.name = n["name"].getStr
  result.`type` = n["type"].getStr
  if n.hasKey("default") and n["default"].kind != JNull:
    result.default = some(n["default"])
  if n.hasKey("features") and n["features"].kind != JNull:
    result.features = some((n["features"]).getElems.mapIt(it.getStr))

proc `%`*(x: SchemaInfoObjectVariant): JsonNode =
  result = newJObject()
  result["case"] = %(x.`case`)
  result["type"] = %(x.`type`)

proc parse*(_: typedesc[SchemaInfoObjectVariant], n: JsonNode): SchemaInfoObjectVariant =
  result = default(SchemaInfoObjectVariant)
  result.`case` = n["case"].getStr
  result.`type` = n["type"].getStr

proc `%`*(x: SchemaInfoAlternate): JsonNode =
  result = newJObject()
  result["members"] = %(x.members)

proc parse*(_: typedesc[SchemaInfoAlternate], n: JsonNode): SchemaInfoAlternate =
  result = default(SchemaInfoAlternate)
  result.members = (n["members"]).getElems.mapIt(parse(typedesc[SchemaInfoAlternateMember], it))

proc `%`*(x: SchemaInfoAlternateMember): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)

proc parse*(_: typedesc[SchemaInfoAlternateMember], n: JsonNode): SchemaInfoAlternateMember =
  result = default(SchemaInfoAlternateMember)
  result.`type` = n["type"].getStr

proc `%`*(x: SchemaInfoCommand): JsonNode =
  result = newJObject()
  result["arg-type"] = %(x.argType)
  result["ret-type"] = %(x.retType)
  if x.allowOob.isSome: result["allow-oob"] = %(x.allowOob.get)

proc parse*(_: typedesc[SchemaInfoCommand], n: JsonNode): SchemaInfoCommand =
  result = default(SchemaInfoCommand)
  result.argType = n["arg-type"].getStr
  result.retType = n["ret-type"].getStr
  if n.hasKey("allow-oob") and n["allow-oob"].kind != JNull:
    result.allowOob = some(n["allow-oob"].getBool)

proc `%`*(x: SchemaInfoEvent): JsonNode =
  result = newJObject()
  result["arg-type"] = %(x.argType)

proc parse*(_: typedesc[SchemaInfoEvent], n: JsonNode): SchemaInfoEvent =
  result = default(SchemaInfoEvent)
  result.argType = n["arg-type"].getStr

proc `%`*(x: ObjectPropertyInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["type"] = %(x.`type`)
  if x.description.isSome: result["description"] = %(x.description.get)
  if x.defaultValue.isSome: result["default-value"] = %(x.defaultValue.get)

proc parse*(_: typedesc[ObjectPropertyInfo], n: JsonNode): ObjectPropertyInfo =
  result = default(ObjectPropertyInfo)
  result.name = n["name"].getStr
  result.`type` = n["type"].getStr
  if n.hasKey("description") and n["description"].kind != JNull:
    result.description = some(n["description"].getStr)
  if n.hasKey("default-value") and n["default-value"].kind != JNull:
    result.defaultValue = some(n["default-value"])

proc `%`*(x: ObjectPropertyValue): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["type"] = %(x.`type`)
  if x.value.isSome: result["value"] = %(x.value.get)

proc parse*(_: typedesc[ObjectPropertyValue], n: JsonNode): ObjectPropertyValue =
  result = default(ObjectPropertyValue)
  result.name = n["name"].getStr
  result.`type` = n["type"].getStr
  if n.hasKey("value") and n["value"].kind != JNull:
    result.value = some(n["value"])

proc `%`*(x: ObjectPropertiesValues): JsonNode =
  result = newJObject()
  result["properties"] = %(x.properties)

proc parse*(_: typedesc[ObjectPropertiesValues], n: JsonNode): ObjectPropertiesValues =
  result = default(ObjectPropertiesValues)
  result.properties = (n["properties"]).getElems.mapIt(parse(typedesc[ObjectPropertyValue], it))

proc `%`*(x: ObjectTypeInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.abstract.isSome: result["abstract"] = %(x.abstract.get)
  if x.parent.isSome: result["parent"] = %(x.parent.get)

proc parse*(_: typedesc[ObjectTypeInfo], n: JsonNode): ObjectTypeInfo =
  result = default(ObjectTypeInfo)
  result.name = n["name"].getStr
  if n.hasKey("abstract") and n["abstract"].kind != JNull:
    result.abstract = some(n["abstract"].getBool)
  if n.hasKey("parent") and n["parent"].kind != JNull:
    result.parent = some(n["parent"].getStr)

proc `%`*(x: CanHostSocketcanProperties): JsonNode =
  result = newJObject()
  result["if"] = %(x.`if`)
  result["canbus"] = %(x.canbus)

proc parse*(_: typedesc[CanHostSocketcanProperties], n: JsonNode): CanHostSocketcanProperties =
  result = default(CanHostSocketcanProperties)
  result.`if` = n["if"].getStr
  result.canbus = n["canbus"].getStr

proc `%`*(x: ColoCompareProperties): JsonNode =
  result = newJObject()
  result["primary_in"] = %(x.primaryIn)
  result["secondary_in"] = %(x.secondaryIn)
  result["outdev"] = %(x.outdev)
  result["iothread"] = %(x.iothread)
  if x.notifyDev.isSome: result["notify_dev"] = %(x.notifyDev.get)
  if x.compareTimeout.isSome: result["compare_timeout"] = %(x.compareTimeout.get)
  if x.expiredScanCycle.isSome: result["expired_scan_cycle"] = %(x.expiredScanCycle.get)
  if x.maxQueueSize.isSome: result["max_queue_size"] = %(x.maxQueueSize.get)
  if x.vnetHdrSupport.isSome: result["vnet_hdr_support"] = %(x.vnetHdrSupport.get)

proc parse*(_: typedesc[ColoCompareProperties], n: JsonNode): ColoCompareProperties =
  result = default(ColoCompareProperties)
  result.primaryIn = n["primary_in"].getStr
  result.secondaryIn = n["secondary_in"].getStr
  result.outdev = n["outdev"].getStr
  result.iothread = n["iothread"].getStr
  if n.hasKey("notify_dev") and n["notify_dev"].kind != JNull:
    result.notifyDev = some(n["notify_dev"].getStr)
  if n.hasKey("compare_timeout") and n["compare_timeout"].kind != JNull:
    result.compareTimeout = some(cast[uint64](n["compare_timeout"].getBiggestInt))
  if n.hasKey("expired_scan_cycle") and n["expired_scan_cycle"].kind != JNull:
    result.expiredScanCycle = some(uint32(n["expired_scan_cycle"].getBiggestInt))
  if n.hasKey("max_queue_size") and n["max_queue_size"].kind != JNull:
    result.maxQueueSize = some(uint32(n["max_queue_size"].getBiggestInt))
  if n.hasKey("vnet_hdr_support") and n["vnet_hdr_support"].kind != JNull:
    result.vnetHdrSupport = some(n["vnet_hdr_support"].getBool)

proc `%`*(x: CryptodevBackendProperties): JsonNode =
  result = newJObject()
  if x.queues.isSome: result["queues"] = %(x.queues.get)
  if x.throttleBps.isSome: result["throttle-bps"] = %(x.throttleBps.get)
  if x.throttleOps.isSome: result["throttle-ops"] = %(x.throttleOps.get)

proc parse*(_: typedesc[CryptodevBackendProperties], n: JsonNode): CryptodevBackendProperties =
  result = default(CryptodevBackendProperties)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(uint32(n["queues"].getBiggestInt))
  if n.hasKey("throttle-bps") and n["throttle-bps"].kind != JNull:
    result.throttleBps = some(cast[uint64](n["throttle-bps"].getBiggestInt))
  if n.hasKey("throttle-ops") and n["throttle-ops"].kind != JNull:
    result.throttleOps = some(cast[uint64](n["throttle-ops"].getBiggestInt))

proc `%`*(x: CryptodevVhostUserProperties): JsonNode =
  result = newJObject()
  if x.queues.isSome: result["queues"] = %(x.queues.get)
  if x.throttleBps.isSome: result["throttle-bps"] = %(x.throttleBps.get)
  if x.throttleOps.isSome: result["throttle-ops"] = %(x.throttleOps.get)
  result["chardev"] = %(x.chardev)

proc parse*(_: typedesc[CryptodevVhostUserProperties], n: JsonNode): CryptodevVhostUserProperties =
  result = default(CryptodevVhostUserProperties)
  if n.hasKey("queues") and n["queues"].kind != JNull:
    result.queues = some(uint32(n["queues"].getBiggestInt))
  if n.hasKey("throttle-bps") and n["throttle-bps"].kind != JNull:
    result.throttleBps = some(cast[uint64](n["throttle-bps"].getBiggestInt))
  if n.hasKey("throttle-ops") and n["throttle-ops"].kind != JNull:
    result.throttleOps = some(cast[uint64](n["throttle-ops"].getBiggestInt))
  result.chardev = n["chardev"].getStr

proc `%`*(x: DBusVMStateProperties): JsonNode =
  result = newJObject()
  result["addr"] = %(x.`addr`)
  if x.idList.isSome: result["id-list"] = %(x.idList.get)

proc parse*(_: typedesc[DBusVMStateProperties], n: JsonNode): DBusVMStateProperties =
  result = default(DBusVMStateProperties)
  result.`addr` = n["addr"].getStr
  if n.hasKey("id-list") and n["id-list"].kind != JNull:
    result.idList = some(n["id-list"].getStr)

proc `%`*(x: NetfilterInsert): JsonNode = %($x)
proc parse*(_: typedesc[NetfilterInsert], n: JsonNode): NetfilterInsert =
  let s = n.getStr
  case s
  of "before": NetfilterInsert.Before
  of "behind": NetfilterInsert.Behind
  else: raise newException(ValueError, "unknown NetfilterInsert: " & s)

proc `%`*(x: NetfilterProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)

proc parse*(_: typedesc[NetfilterProperties], n: JsonNode): NetfilterProperties =
  result = default(NetfilterProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))

proc `%`*(x: FilterBufferProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)
  result["interval"] = %(x.interval)

proc parse*(_: typedesc[FilterBufferProperties], n: JsonNode): FilterBufferProperties =
  result = default(FilterBufferProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))
  result.interval = uint32(n["interval"].getBiggestInt)

proc `%`*(x: FilterDumpProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)
  result["file"] = %(x.file)
  if x.maxlen.isSome: result["maxlen"] = %(x.maxlen.get)

proc parse*(_: typedesc[FilterDumpProperties], n: JsonNode): FilterDumpProperties =
  result = default(FilterDumpProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))
  result.file = n["file"].getStr
  if n.hasKey("maxlen") and n["maxlen"].kind != JNull:
    result.maxlen = some(uint32(n["maxlen"].getBiggestInt))

proc `%`*(x: FilterMirrorProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)
  result["outdev"] = %(x.outdev)
  if x.vnetHdrSupport.isSome: result["vnet_hdr_support"] = %(x.vnetHdrSupport.get)

proc parse*(_: typedesc[FilterMirrorProperties], n: JsonNode): FilterMirrorProperties =
  result = default(FilterMirrorProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))
  result.outdev = n["outdev"].getStr
  if n.hasKey("vnet_hdr_support") and n["vnet_hdr_support"].kind != JNull:
    result.vnetHdrSupport = some(n["vnet_hdr_support"].getBool)

proc `%`*(x: FilterRedirectorProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)
  if x.indev.isSome: result["indev"] = %(x.indev.get)
  if x.outdev.isSome: result["outdev"] = %(x.outdev.get)
  if x.vnetHdrSupport.isSome: result["vnet_hdr_support"] = %(x.vnetHdrSupport.get)

proc parse*(_: typedesc[FilterRedirectorProperties], n: JsonNode): FilterRedirectorProperties =
  result = default(FilterRedirectorProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))
  if n.hasKey("indev") and n["indev"].kind != JNull:
    result.indev = some(n["indev"].getStr)
  if n.hasKey("outdev") and n["outdev"].kind != JNull:
    result.outdev = some(n["outdev"].getStr)
  if n.hasKey("vnet_hdr_support") and n["vnet_hdr_support"].kind != JNull:
    result.vnetHdrSupport = some(n["vnet_hdr_support"].getBool)

proc `%`*(x: FilterRewriterProperties): JsonNode =
  result = newJObject()
  result["netdev"] = %(x.netdev)
  if x.queue.isSome: result["queue"] = %(x.queue.get)
  if x.status.isSome: result["status"] = %(x.status.get)
  if x.position.isSome: result["position"] = %(x.position.get)
  if x.insert.isSome: result["insert"] = %(x.insert.get)
  if x.vnetHdrSupport.isSome: result["vnet_hdr_support"] = %(x.vnetHdrSupport.get)

proc parse*(_: typedesc[FilterRewriterProperties], n: JsonNode): FilterRewriterProperties =
  result = default(FilterRewriterProperties)
  result.netdev = n["netdev"].getStr
  if n.hasKey("queue") and n["queue"].kind != JNull:
    result.queue = some(parse(typedesc[NetFilterDirection], n["queue"]))
  if n.hasKey("status") and n["status"].kind != JNull:
    result.status = some(n["status"].getStr)
  if n.hasKey("position") and n["position"].kind != JNull:
    result.position = some(n["position"].getStr)
  if n.hasKey("insert") and n["insert"].kind != JNull:
    result.insert = some(parse(typedesc[NetfilterInsert], n["insert"]))
  if n.hasKey("vnet_hdr_support") and n["vnet_hdr_support"].kind != JNull:
    result.vnetHdrSupport = some(n["vnet_hdr_support"].getBool)

proc `%`*(x: InputBarrierProperties): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.server.isSome: result["server"] = %(x.server.get)
  if x.port.isSome: result["port"] = %(x.port.get)
  if x.xOrigin.isSome: result["x-origin"] = %(x.xOrigin.get)
  if x.yOrigin.isSome: result["y-origin"] = %(x.yOrigin.get)
  if x.width.isSome: result["width"] = %(x.width.get)
  if x.height.isSome: result["height"] = %(x.height.get)

proc parse*(_: typedesc[InputBarrierProperties], n: JsonNode): InputBarrierProperties =
  result = default(InputBarrierProperties)
  result.name = n["name"].getStr
  if n.hasKey("server") and n["server"].kind != JNull:
    result.server = some(n["server"].getStr)
  if n.hasKey("port") and n["port"].kind != JNull:
    result.port = some(n["port"].getStr)
  if n.hasKey("x-origin") and n["x-origin"].kind != JNull:
    result.xOrigin = some(n["x-origin"].getStr)
  if n.hasKey("y-origin") and n["y-origin"].kind != JNull:
    result.yOrigin = some(n["y-origin"].getStr)
  if n.hasKey("width") and n["width"].kind != JNull:
    result.width = some(n["width"].getStr)
  if n.hasKey("height") and n["height"].kind != JNull:
    result.height = some(n["height"].getStr)

proc `%`*(x: InputLinuxProperties): JsonNode =
  result = newJObject()
  result["evdev"] = %(x.evdev)
  if x.grabAll.isSome: result["grab_all"] = %(x.grabAll.get)
  if x.repeat.isSome: result["repeat"] = %(x.repeat.get)
  if x.grabToggle.isSome: result["grab-toggle"] = %(x.grabToggle.get)

proc parse*(_: typedesc[InputLinuxProperties], n: JsonNode): InputLinuxProperties =
  result = default(InputLinuxProperties)
  result.evdev = n["evdev"].getStr
  if n.hasKey("grab_all") and n["grab_all"].kind != JNull:
    result.grabAll = some(n["grab_all"].getBool)
  if n.hasKey("repeat") and n["repeat"].kind != JNull:
    result.repeat = some(n["repeat"].getBool)
  if n.hasKey("grab-toggle") and n["grab-toggle"].kind != JNull:
    result.grabToggle = some(parse(typedesc[GrabToggleKeys], n["grab-toggle"]))

proc `%`*(x: EventLoopBaseProperties): JsonNode =
  result = newJObject()
  if x.aioMaxBatch.isSome: result["aio-max-batch"] = %(x.aioMaxBatch.get)
  if x.threadPoolMin.isSome: result["thread-pool-min"] = %(x.threadPoolMin.get)
  if x.threadPoolMax.isSome: result["thread-pool-max"] = %(x.threadPoolMax.get)

proc parse*(_: typedesc[EventLoopBaseProperties], n: JsonNode): EventLoopBaseProperties =
  result = default(EventLoopBaseProperties)
  if n.hasKey("aio-max-batch") and n["aio-max-batch"].kind != JNull:
    result.aioMaxBatch = some(int64(n["aio-max-batch"].getBiggestInt))
  if n.hasKey("thread-pool-min") and n["thread-pool-min"].kind != JNull:
    result.threadPoolMin = some(int64(n["thread-pool-min"].getBiggestInt))
  if n.hasKey("thread-pool-max") and n["thread-pool-max"].kind != JNull:
    result.threadPoolMax = some(int64(n["thread-pool-max"].getBiggestInt))

proc `%`*(x: IothreadProperties): JsonNode =
  result = newJObject()
  if x.aioMaxBatch.isSome: result["aio-max-batch"] = %(x.aioMaxBatch.get)
  if x.threadPoolMin.isSome: result["thread-pool-min"] = %(x.threadPoolMin.get)
  if x.threadPoolMax.isSome: result["thread-pool-max"] = %(x.threadPoolMax.get)
  if x.pollMaxNs.isSome: result["poll-max-ns"] = %(x.pollMaxNs.get)
  if x.pollGrow.isSome: result["poll-grow"] = %(x.pollGrow.get)
  if x.pollShrink.isSome: result["poll-shrink"] = %(x.pollShrink.get)

proc parse*(_: typedesc[IothreadProperties], n: JsonNode): IothreadProperties =
  result = default(IothreadProperties)
  if n.hasKey("aio-max-batch") and n["aio-max-batch"].kind != JNull:
    result.aioMaxBatch = some(int64(n["aio-max-batch"].getBiggestInt))
  if n.hasKey("thread-pool-min") and n["thread-pool-min"].kind != JNull:
    result.threadPoolMin = some(int64(n["thread-pool-min"].getBiggestInt))
  if n.hasKey("thread-pool-max") and n["thread-pool-max"].kind != JNull:
    result.threadPoolMax = some(int64(n["thread-pool-max"].getBiggestInt))
  if n.hasKey("poll-max-ns") and n["poll-max-ns"].kind != JNull:
    result.pollMaxNs = some(int64(n["poll-max-ns"].getBiggestInt))
  if n.hasKey("poll-grow") and n["poll-grow"].kind != JNull:
    result.pollGrow = some(int64(n["poll-grow"].getBiggestInt))
  if n.hasKey("poll-shrink") and n["poll-shrink"].kind != JNull:
    result.pollShrink = some(int64(n["poll-shrink"].getBiggestInt))

proc `%`*(x: MainLoopProperties): JsonNode =
  result = newJObject()
  if x.aioMaxBatch.isSome: result["aio-max-batch"] = %(x.aioMaxBatch.get)
  if x.threadPoolMin.isSome: result["thread-pool-min"] = %(x.threadPoolMin.get)
  if x.threadPoolMax.isSome: result["thread-pool-max"] = %(x.threadPoolMax.get)

proc parse*(_: typedesc[MainLoopProperties], n: JsonNode): MainLoopProperties =
  result = default(MainLoopProperties)
  if n.hasKey("aio-max-batch") and n["aio-max-batch"].kind != JNull:
    result.aioMaxBatch = some(int64(n["aio-max-batch"].getBiggestInt))
  if n.hasKey("thread-pool-min") and n["thread-pool-min"].kind != JNull:
    result.threadPoolMin = some(int64(n["thread-pool-min"].getBiggestInt))
  if n.hasKey("thread-pool-max") and n["thread-pool-max"].kind != JNull:
    result.threadPoolMax = some(int64(n["thread-pool-max"].getBiggestInt))

proc `%`*(x: MemoryBackendProperties): JsonNode =
  result = newJObject()
  if x.dump.isSome: result["dump"] = %(x.dump.get)
  if x.hostNodes.isSome: result["host-nodes"] = %(x.hostNodes.get)
  if x.merge.isSome: result["merge"] = %(x.merge.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.prealloc.isSome: result["prealloc"] = %(x.prealloc.get)
  if x.preallocThreads.isSome: result["prealloc-threads"] = %(x.preallocThreads.get)
  if x.preallocContext.isSome: result["prealloc-context"] = %(x.preallocContext.get)
  if x.share.isSome: result["share"] = %(x.share.get)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["size"] = %(x.size)
  if x.xUseCanonicalPathForRamblockId.isSome: result["x-use-canonical-path-for-ramblock-id"] = %(x.xUseCanonicalPathForRamblockId.get)

proc parse*(_: typedesc[MemoryBackendProperties], n: JsonNode): MemoryBackendProperties =
  result = default(MemoryBackendProperties)
  if n.hasKey("dump") and n["dump"].kind != JNull:
    result.dump = some(n["dump"].getBool)
  if n.hasKey("host-nodes") and n["host-nodes"].kind != JNull:
    result.hostNodes = some((n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("merge") and n["merge"].kind != JNull:
    result.merge = some(n["merge"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[HostMemPolicy], n["policy"]))
  if n.hasKey("prealloc") and n["prealloc"].kind != JNull:
    result.prealloc = some(n["prealloc"].getBool)
  if n.hasKey("prealloc-threads") and n["prealloc-threads"].kind != JNull:
    result.preallocThreads = some(uint32(n["prealloc-threads"].getBiggestInt))
  if n.hasKey("prealloc-context") and n["prealloc-context"].kind != JNull:
    result.preallocContext = some(n["prealloc-context"].getStr)
  if n.hasKey("share") and n["share"].kind != JNull:
    result.share = some(n["share"].getBool)
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("x-use-canonical-path-for-ramblock-id") and n["x-use-canonical-path-for-ramblock-id"].kind != JNull:
    result.xUseCanonicalPathForRamblockId = some(n["x-use-canonical-path-for-ramblock-id"].getBool)

proc `%`*(x: MemoryBackendFileProperties): JsonNode =
  result = newJObject()
  if x.dump.isSome: result["dump"] = %(x.dump.get)
  if x.hostNodes.isSome: result["host-nodes"] = %(x.hostNodes.get)
  if x.merge.isSome: result["merge"] = %(x.merge.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.prealloc.isSome: result["prealloc"] = %(x.prealloc.get)
  if x.preallocThreads.isSome: result["prealloc-threads"] = %(x.preallocThreads.get)
  if x.preallocContext.isSome: result["prealloc-context"] = %(x.preallocContext.get)
  if x.share.isSome: result["share"] = %(x.share.get)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["size"] = %(x.size)
  if x.xUseCanonicalPathForRamblockId.isSome: result["x-use-canonical-path-for-ramblock-id"] = %(x.xUseCanonicalPathForRamblockId.get)
  if x.align.isSome: result["align"] = %(x.align.get)
  if x.offset.isSome: result["offset"] = %(x.offset.get)
  if x.discardData.isSome: result["discard-data"] = %(x.discardData.get)
  result["mem-path"] = %(x.memPath)
  if x.pmem.isSome: result["pmem"] = %(x.pmem.get)
  if x.readonly.isSome: result["readonly"] = %(x.readonly.get)
  if x.rom.isSome: result["rom"] = %(x.rom.get)

proc parse*(_: typedesc[MemoryBackendFileProperties], n: JsonNode): MemoryBackendFileProperties =
  result = default(MemoryBackendFileProperties)
  if n.hasKey("dump") and n["dump"].kind != JNull:
    result.dump = some(n["dump"].getBool)
  if n.hasKey("host-nodes") and n["host-nodes"].kind != JNull:
    result.hostNodes = some((n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("merge") and n["merge"].kind != JNull:
    result.merge = some(n["merge"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[HostMemPolicy], n["policy"]))
  if n.hasKey("prealloc") and n["prealloc"].kind != JNull:
    result.prealloc = some(n["prealloc"].getBool)
  if n.hasKey("prealloc-threads") and n["prealloc-threads"].kind != JNull:
    result.preallocThreads = some(uint32(n["prealloc-threads"].getBiggestInt))
  if n.hasKey("prealloc-context") and n["prealloc-context"].kind != JNull:
    result.preallocContext = some(n["prealloc-context"].getStr)
  if n.hasKey("share") and n["share"].kind != JNull:
    result.share = some(n["share"].getBool)
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("x-use-canonical-path-for-ramblock-id") and n["x-use-canonical-path-for-ramblock-id"].kind != JNull:
    result.xUseCanonicalPathForRamblockId = some(n["x-use-canonical-path-for-ramblock-id"].getBool)
  if n.hasKey("align") and n["align"].kind != JNull:
    result.align = some(cast[uint64](n["align"].getBiggestInt))
  if n.hasKey("offset") and n["offset"].kind != JNull:
    result.offset = some(cast[uint64](n["offset"].getBiggestInt))
  if n.hasKey("discard-data") and n["discard-data"].kind != JNull:
    result.discardData = some(n["discard-data"].getBool)
  result.memPath = n["mem-path"].getStr
  if n.hasKey("pmem") and n["pmem"].kind != JNull:
    result.pmem = some(n["pmem"].getBool)
  if n.hasKey("readonly") and n["readonly"].kind != JNull:
    result.readonly = some(n["readonly"].getBool)
  if n.hasKey("rom") and n["rom"].kind != JNull:
    result.rom = some(parse(typedesc[OnOffAuto], n["rom"]))

proc `%`*(x: MemoryBackendMemfdProperties): JsonNode =
  result = newJObject()
  if x.dump.isSome: result["dump"] = %(x.dump.get)
  if x.hostNodes.isSome: result["host-nodes"] = %(x.hostNodes.get)
  if x.merge.isSome: result["merge"] = %(x.merge.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.prealloc.isSome: result["prealloc"] = %(x.prealloc.get)
  if x.preallocThreads.isSome: result["prealloc-threads"] = %(x.preallocThreads.get)
  if x.preallocContext.isSome: result["prealloc-context"] = %(x.preallocContext.get)
  if x.share.isSome: result["share"] = %(x.share.get)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["size"] = %(x.size)
  if x.xUseCanonicalPathForRamblockId.isSome: result["x-use-canonical-path-for-ramblock-id"] = %(x.xUseCanonicalPathForRamblockId.get)
  if x.hugetlb.isSome: result["hugetlb"] = %(x.hugetlb.get)
  if x.hugetlbsize.isSome: result["hugetlbsize"] = %(x.hugetlbsize.get)
  if x.seal.isSome: result["seal"] = %(x.seal.get)

proc parse*(_: typedesc[MemoryBackendMemfdProperties], n: JsonNode): MemoryBackendMemfdProperties =
  result = default(MemoryBackendMemfdProperties)
  if n.hasKey("dump") and n["dump"].kind != JNull:
    result.dump = some(n["dump"].getBool)
  if n.hasKey("host-nodes") and n["host-nodes"].kind != JNull:
    result.hostNodes = some((n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("merge") and n["merge"].kind != JNull:
    result.merge = some(n["merge"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[HostMemPolicy], n["policy"]))
  if n.hasKey("prealloc") and n["prealloc"].kind != JNull:
    result.prealloc = some(n["prealloc"].getBool)
  if n.hasKey("prealloc-threads") and n["prealloc-threads"].kind != JNull:
    result.preallocThreads = some(uint32(n["prealloc-threads"].getBiggestInt))
  if n.hasKey("prealloc-context") and n["prealloc-context"].kind != JNull:
    result.preallocContext = some(n["prealloc-context"].getStr)
  if n.hasKey("share") and n["share"].kind != JNull:
    result.share = some(n["share"].getBool)
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("x-use-canonical-path-for-ramblock-id") and n["x-use-canonical-path-for-ramblock-id"].kind != JNull:
    result.xUseCanonicalPathForRamblockId = some(n["x-use-canonical-path-for-ramblock-id"].getBool)
  if n.hasKey("hugetlb") and n["hugetlb"].kind != JNull:
    result.hugetlb = some(n["hugetlb"].getBool)
  if n.hasKey("hugetlbsize") and n["hugetlbsize"].kind != JNull:
    result.hugetlbsize = some(cast[uint64](n["hugetlbsize"].getBiggestInt))
  if n.hasKey("seal") and n["seal"].kind != JNull:
    result.seal = some(n["seal"].getBool)

proc `%`*(x: MemoryBackendShmProperties): JsonNode =
  result = newJObject()
  if x.dump.isSome: result["dump"] = %(x.dump.get)
  if x.hostNodes.isSome: result["host-nodes"] = %(x.hostNodes.get)
  if x.merge.isSome: result["merge"] = %(x.merge.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.prealloc.isSome: result["prealloc"] = %(x.prealloc.get)
  if x.preallocThreads.isSome: result["prealloc-threads"] = %(x.preallocThreads.get)
  if x.preallocContext.isSome: result["prealloc-context"] = %(x.preallocContext.get)
  if x.share.isSome: result["share"] = %(x.share.get)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["size"] = %(x.size)
  if x.xUseCanonicalPathForRamblockId.isSome: result["x-use-canonical-path-for-ramblock-id"] = %(x.xUseCanonicalPathForRamblockId.get)

proc parse*(_: typedesc[MemoryBackendShmProperties], n: JsonNode): MemoryBackendShmProperties =
  result = default(MemoryBackendShmProperties)
  if n.hasKey("dump") and n["dump"].kind != JNull:
    result.dump = some(n["dump"].getBool)
  if n.hasKey("host-nodes") and n["host-nodes"].kind != JNull:
    result.hostNodes = some((n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("merge") and n["merge"].kind != JNull:
    result.merge = some(n["merge"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[HostMemPolicy], n["policy"]))
  if n.hasKey("prealloc") and n["prealloc"].kind != JNull:
    result.prealloc = some(n["prealloc"].getBool)
  if n.hasKey("prealloc-threads") and n["prealloc-threads"].kind != JNull:
    result.preallocThreads = some(uint32(n["prealloc-threads"].getBiggestInt))
  if n.hasKey("prealloc-context") and n["prealloc-context"].kind != JNull:
    result.preallocContext = some(n["prealloc-context"].getStr)
  if n.hasKey("share") and n["share"].kind != JNull:
    result.share = some(n["share"].getBool)
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("x-use-canonical-path-for-ramblock-id") and n["x-use-canonical-path-for-ramblock-id"].kind != JNull:
    result.xUseCanonicalPathForRamblockId = some(n["x-use-canonical-path-for-ramblock-id"].getBool)

proc `%`*(x: MemoryBackendEpcProperties): JsonNode =
  result = newJObject()
  if x.dump.isSome: result["dump"] = %(x.dump.get)
  if x.hostNodes.isSome: result["host-nodes"] = %(x.hostNodes.get)
  if x.merge.isSome: result["merge"] = %(x.merge.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.prealloc.isSome: result["prealloc"] = %(x.prealloc.get)
  if x.preallocThreads.isSome: result["prealloc-threads"] = %(x.preallocThreads.get)
  if x.preallocContext.isSome: result["prealloc-context"] = %(x.preallocContext.get)
  if x.share.isSome: result["share"] = %(x.share.get)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["size"] = %(x.size)
  if x.xUseCanonicalPathForRamblockId.isSome: result["x-use-canonical-path-for-ramblock-id"] = %(x.xUseCanonicalPathForRamblockId.get)

proc parse*(_: typedesc[MemoryBackendEpcProperties], n: JsonNode): MemoryBackendEpcProperties =
  result = default(MemoryBackendEpcProperties)
  if n.hasKey("dump") and n["dump"].kind != JNull:
    result.dump = some(n["dump"].getBool)
  if n.hasKey("host-nodes") and n["host-nodes"].kind != JNull:
    result.hostNodes = some((n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("merge") and n["merge"].kind != JNull:
    result.merge = some(n["merge"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(parse(typedesc[HostMemPolicy], n["policy"]))
  if n.hasKey("prealloc") and n["prealloc"].kind != JNull:
    result.prealloc = some(n["prealloc"].getBool)
  if n.hasKey("prealloc-threads") and n["prealloc-threads"].kind != JNull:
    result.preallocThreads = some(uint32(n["prealloc-threads"].getBiggestInt))
  if n.hasKey("prealloc-context") and n["prealloc-context"].kind != JNull:
    result.preallocContext = some(n["prealloc-context"].getStr)
  if n.hasKey("share") and n["share"].kind != JNull:
    result.share = some(n["share"].getBool)
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("x-use-canonical-path-for-ramblock-id") and n["x-use-canonical-path-for-ramblock-id"].kind != JNull:
    result.xUseCanonicalPathForRamblockId = some(n["x-use-canonical-path-for-ramblock-id"].getBool)

proc `%`*(x: PrManagerHelperProperties): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)

proc parse*(_: typedesc[PrManagerHelperProperties], n: JsonNode): PrManagerHelperProperties =
  result = default(PrManagerHelperProperties)
  result.path = n["path"].getStr

proc `%`*(x: QtestProperties): JsonNode =
  result = newJObject()
  result["chardev"] = %(x.chardev)
  if x.log.isSome: result["log"] = %(x.log.get)

proc parse*(_: typedesc[QtestProperties], n: JsonNode): QtestProperties =
  result = default(QtestProperties)
  result.chardev = n["chardev"].getStr
  if n.hasKey("log") and n["log"].kind != JNull:
    result.log = some(n["log"].getStr)

proc `%`*(x: RemoteObjectProperties): JsonNode =
  result = newJObject()
  result["fd"] = %(x.fd)
  result["devid"] = %(x.devid)

proc parse*(_: typedesc[RemoteObjectProperties], n: JsonNode): RemoteObjectProperties =
  result = default(RemoteObjectProperties)
  result.fd = n["fd"].getStr
  result.devid = n["devid"].getStr

proc `%`*(x: VfioUserServerProperties): JsonNode =
  result = newJObject()
  result["socket"] = %(x.socket)
  result["device"] = %(x.device)

proc parse*(_: typedesc[VfioUserServerProperties], n: JsonNode): VfioUserServerProperties =
  result = default(VfioUserServerProperties)
  result.socket = parse(typedesc[SocketAddress], n["socket"])
  result.device = n["device"].getStr

proc `%`*(x: IOMMUFDProperties): JsonNode =
  result = newJObject()
  if x.fd.isSome: result["fd"] = %(x.fd.get)

proc parse*(_: typedesc[IOMMUFDProperties], n: JsonNode): IOMMUFDProperties =
  result = default(IOMMUFDProperties)
  if n.hasKey("fd") and n["fd"].kind != JNull:
    result.fd = some(n["fd"].getStr)

proc `%`*(x: AcpiGenericInitiatorProperties): JsonNode =
  result = newJObject()
  result["pci-dev"] = %(x.pciDev)
  result["node"] = %(x.node)

proc parse*(_: typedesc[AcpiGenericInitiatorProperties], n: JsonNode): AcpiGenericInitiatorProperties =
  result = default(AcpiGenericInitiatorProperties)
  result.pciDev = n["pci-dev"].getStr
  result.node = uint32(n["node"].getBiggestInt)

proc `%`*(x: AcpiGenericPortProperties): JsonNode =
  result = newJObject()
  result["pci-bus"] = %(x.pciBus)
  result["node"] = %(x.node)

proc parse*(_: typedesc[AcpiGenericPortProperties], n: JsonNode): AcpiGenericPortProperties =
  result = default(AcpiGenericPortProperties)
  result.pciBus = n["pci-bus"].getStr
  result.node = uint32(n["node"].getBiggestInt)

proc `%`*(x: RngProperties): JsonNode =
  result = newJObject()
  if x.opened.isSome: result["opened"] = %(x.opened.get)

proc parse*(_: typedesc[RngProperties], n: JsonNode): RngProperties =
  result = default(RngProperties)
  if n.hasKey("opened") and n["opened"].kind != JNull:
    result.opened = some(n["opened"].getBool)

proc `%`*(x: RngEgdProperties): JsonNode =
  result = newJObject()
  if x.opened.isSome: result["opened"] = %(x.opened.get)
  result["chardev"] = %(x.chardev)

proc parse*(_: typedesc[RngEgdProperties], n: JsonNode): RngEgdProperties =
  result = default(RngEgdProperties)
  if n.hasKey("opened") and n["opened"].kind != JNull:
    result.opened = some(n["opened"].getBool)
  result.chardev = n["chardev"].getStr

proc `%`*(x: RngRandomProperties): JsonNode =
  result = newJObject()
  if x.opened.isSome: result["opened"] = %(x.opened.get)
  if x.filename.isSome: result["filename"] = %(x.filename.get)

proc parse*(_: typedesc[RngRandomProperties], n: JsonNode): RngRandomProperties =
  result = default(RngRandomProperties)
  if n.hasKey("opened") and n["opened"].kind != JNull:
    result.opened = some(n["opened"].getBool)
  if n.hasKey("filename") and n["filename"].kind != JNull:
    result.filename = some(n["filename"].getStr)

proc `%`*(x: IgvmCfgProperties): JsonNode =
  result = newJObject()
  result["file"] = %(x.file)

proc parse*(_: typedesc[IgvmCfgProperties], n: JsonNode): IgvmCfgProperties =
  result = default(IgvmCfgProperties)
  result.file = n["file"].getStr

proc `%`*(x: SevCommonProperties): JsonNode =
  result = newJObject()
  if x.sevDevice.isSome: result["sev-device"] = %(x.sevDevice.get)
  if x.cbitpos.isSome: result["cbitpos"] = %(x.cbitpos.get)
  result["reduced-phys-bits"] = %(x.reducedPhysBits)
  if x.kernelHashes.isSome: result["kernel-hashes"] = %(x.kernelHashes.get)

proc parse*(_: typedesc[SevCommonProperties], n: JsonNode): SevCommonProperties =
  result = default(SevCommonProperties)
  if n.hasKey("sev-device") and n["sev-device"].kind != JNull:
    result.sevDevice = some(n["sev-device"].getStr)
  if n.hasKey("cbitpos") and n["cbitpos"].kind != JNull:
    result.cbitpos = some(uint32(n["cbitpos"].getBiggestInt))
  result.reducedPhysBits = uint32(n["reduced-phys-bits"].getBiggestInt)
  if n.hasKey("kernel-hashes") and n["kernel-hashes"].kind != JNull:
    result.kernelHashes = some(n["kernel-hashes"].getBool)

proc `%`*(x: SevGuestProperties): JsonNode =
  result = newJObject()
  if x.sevDevice.isSome: result["sev-device"] = %(x.sevDevice.get)
  if x.cbitpos.isSome: result["cbitpos"] = %(x.cbitpos.get)
  result["reduced-phys-bits"] = %(x.reducedPhysBits)
  if x.kernelHashes.isSome: result["kernel-hashes"] = %(x.kernelHashes.get)
  if x.dhCertFile.isSome: result["dh-cert-file"] = %(x.dhCertFile.get)
  if x.sessionFile.isSome: result["session-file"] = %(x.sessionFile.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.handle.isSome: result["handle"] = %(x.handle.get)
  if x.legacyVmType.isSome: result["legacy-vm-type"] = %(x.legacyVmType.get)

proc parse*(_: typedesc[SevGuestProperties], n: JsonNode): SevGuestProperties =
  result = default(SevGuestProperties)
  if n.hasKey("sev-device") and n["sev-device"].kind != JNull:
    result.sevDevice = some(n["sev-device"].getStr)
  if n.hasKey("cbitpos") and n["cbitpos"].kind != JNull:
    result.cbitpos = some(uint32(n["cbitpos"].getBiggestInt))
  result.reducedPhysBits = uint32(n["reduced-phys-bits"].getBiggestInt)
  if n.hasKey("kernel-hashes") and n["kernel-hashes"].kind != JNull:
    result.kernelHashes = some(n["kernel-hashes"].getBool)
  if n.hasKey("dh-cert-file") and n["dh-cert-file"].kind != JNull:
    result.dhCertFile = some(n["dh-cert-file"].getStr)
  if n.hasKey("session-file") and n["session-file"].kind != JNull:
    result.sessionFile = some(n["session-file"].getStr)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(uint32(n["policy"].getBiggestInt))
  if n.hasKey("handle") and n["handle"].kind != JNull:
    result.handle = some(uint32(n["handle"].getBiggestInt))
  if n.hasKey("legacy-vm-type") and n["legacy-vm-type"].kind != JNull:
    result.legacyVmType = some(parse(typedesc[OnOffAuto], n["legacy-vm-type"]))

proc `%`*(x: SevSnpGuestProperties): JsonNode =
  result = newJObject()
  if x.sevDevice.isSome: result["sev-device"] = %(x.sevDevice.get)
  if x.cbitpos.isSome: result["cbitpos"] = %(x.cbitpos.get)
  result["reduced-phys-bits"] = %(x.reducedPhysBits)
  if x.kernelHashes.isSome: result["kernel-hashes"] = %(x.kernelHashes.get)
  if x.policy.isSome: result["policy"] = %(x.policy.get)
  if x.guestVisibleWorkarounds.isSome: result["guest-visible-workarounds"] = %(x.guestVisibleWorkarounds.get)
  if x.idBlock.isSome: result["id-block"] = %(x.idBlock.get)
  if x.idAuth.isSome: result["id-auth"] = %(x.idAuth.get)
  if x.authorKeyEnabled.isSome: result["author-key-enabled"] = %(x.authorKeyEnabled.get)
  if x.hostData.isSome: result["host-data"] = %(x.hostData.get)
  if x.vcekDisabled.isSome: result["vcek-disabled"] = %(x.vcekDisabled.get)

proc parse*(_: typedesc[SevSnpGuestProperties], n: JsonNode): SevSnpGuestProperties =
  result = default(SevSnpGuestProperties)
  if n.hasKey("sev-device") and n["sev-device"].kind != JNull:
    result.sevDevice = some(n["sev-device"].getStr)
  if n.hasKey("cbitpos") and n["cbitpos"].kind != JNull:
    result.cbitpos = some(uint32(n["cbitpos"].getBiggestInt))
  result.reducedPhysBits = uint32(n["reduced-phys-bits"].getBiggestInt)
  if n.hasKey("kernel-hashes") and n["kernel-hashes"].kind != JNull:
    result.kernelHashes = some(n["kernel-hashes"].getBool)
  if n.hasKey("policy") and n["policy"].kind != JNull:
    result.policy = some(cast[uint64](n["policy"].getBiggestInt))
  if n.hasKey("guest-visible-workarounds") and n["guest-visible-workarounds"].kind != JNull:
    result.guestVisibleWorkarounds = some(n["guest-visible-workarounds"].getStr)
  if n.hasKey("id-block") and n["id-block"].kind != JNull:
    result.idBlock = some(n["id-block"].getStr)
  if n.hasKey("id-auth") and n["id-auth"].kind != JNull:
    result.idAuth = some(n["id-auth"].getStr)
  if n.hasKey("author-key-enabled") and n["author-key-enabled"].kind != JNull:
    result.authorKeyEnabled = some(n["author-key-enabled"].getBool)
  if n.hasKey("host-data") and n["host-data"].kind != JNull:
    result.hostData = some(n["host-data"].getStr)
  if n.hasKey("vcek-disabled") and n["vcek-disabled"].kind != JNull:
    result.vcekDisabled = some(n["vcek-disabled"].getBool)

proc `%`*(x: TdxGuestProperties): JsonNode =
  result = newJObject()
  if x.attributes.isSome: result["attributes"] = %(x.attributes.get)
  if x.septVeDisable.isSome: result["sept-ve-disable"] = %(x.septVeDisable.get)
  if x.mrconfigid.isSome: result["mrconfigid"] = %(x.mrconfigid.get)
  if x.mrowner.isSome: result["mrowner"] = %(x.mrowner.get)
  if x.mrownerconfig.isSome: result["mrownerconfig"] = %(x.mrownerconfig.get)
  if x.quoteGenerationSocket.isSome: result["quote-generation-socket"] = %(x.quoteGenerationSocket.get)

proc parse*(_: typedesc[TdxGuestProperties], n: JsonNode): TdxGuestProperties =
  result = default(TdxGuestProperties)
  if n.hasKey("attributes") and n["attributes"].kind != JNull:
    result.attributes = some(cast[uint64](n["attributes"].getBiggestInt))
  if n.hasKey("sept-ve-disable") and n["sept-ve-disable"].kind != JNull:
    result.septVeDisable = some(n["sept-ve-disable"].getBool)
  if n.hasKey("mrconfigid") and n["mrconfigid"].kind != JNull:
    result.mrconfigid = some(n["mrconfigid"].getStr)
  if n.hasKey("mrowner") and n["mrowner"].kind != JNull:
    result.mrowner = some(n["mrowner"].getStr)
  if n.hasKey("mrownerconfig") and n["mrownerconfig"].kind != JNull:
    result.mrownerconfig = some(n["mrownerconfig"].getStr)
  if n.hasKey("quote-generation-socket") and n["quote-generation-socket"].kind != JNull:
    result.quoteGenerationSocket = some(parse(typedesc[SocketAddress], n["quote-generation-socket"]))

proc `%`*(x: ThreadContextProperties): JsonNode =
  result = newJObject()
  if x.cpuAffinity.isSome: result["cpu-affinity"] = %(x.cpuAffinity.get)
  if x.nodeAffinity.isSome: result["node-affinity"] = %(x.nodeAffinity.get)

proc parse*(_: typedesc[ThreadContextProperties], n: JsonNode): ThreadContextProperties =
  result = default(ThreadContextProperties)
  if n.hasKey("cpu-affinity") and n["cpu-affinity"].kind != JNull:
    result.cpuAffinity = some((n["cpu-affinity"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("node-affinity") and n["node-affinity"].kind != JNull:
    result.nodeAffinity = some((n["node-affinity"]).getElems.mapIt(uint16(it.getBiggestInt)))

proc `%`*(x: ObjectType): JsonNode = %($x)
proc parse*(_: typedesc[ObjectType], n: JsonNode): ObjectType =
  let s = n.getStr
  case s
  of "acpi-generic-initiator": ObjectType.AcpiGenericInitiator
  of "acpi-generic-port": ObjectType.AcpiGenericPort
  of "authz-list": ObjectType.AuthzList
  of "authz-listfile": ObjectType.AuthzListfile
  of "authz-pam": ObjectType.AuthzPam
  of "authz-simple": ObjectType.AuthzSimple
  of "can-bus": ObjectType.CanBus
  of "can-host-socketcan": ObjectType.CanHostSocketcan
  of "colo-compare": ObjectType.ColoCompare
  of "cryptodev-backend": ObjectType.CryptodevBackend
  of "cryptodev-backend-builtin": ObjectType.CryptodevBackendBuiltin
  of "cryptodev-backend-lkcf": ObjectType.CryptodevBackendLkcf
  of "cryptodev-vhost-user": ObjectType.CryptodevVhostUser
  of "dbus-vmstate": ObjectType.DbusVmstate
  of "filter-buffer": ObjectType.FilterBuffer
  of "filter-dump": ObjectType.FilterDump
  of "filter-mirror": ObjectType.FilterMirror
  of "filter-redirector": ObjectType.FilterRedirector
  of "filter-replay": ObjectType.FilterReplay
  of "filter-rewriter": ObjectType.FilterRewriter
  of "igvm-cfg": ObjectType.IgvmCfg
  of "input-barrier": ObjectType.InputBarrier
  of "input-linux": ObjectType.InputLinux
  of "iommufd": ObjectType.Iommufd
  of "iothread": ObjectType.Iothread
  of "main-loop": ObjectType.MainLoop
  of "memory-backend-epc": ObjectType.MemoryBackendEpc
  of "memory-backend-file": ObjectType.MemoryBackendFile
  of "memory-backend-memfd": ObjectType.MemoryBackendMemfd
  of "memory-backend-ram": ObjectType.MemoryBackendRam
  of "memory-backend-shm": ObjectType.MemoryBackendShm
  of "pef-guest": ObjectType.PefGuest
  of "pr-manager-helper": ObjectType.PrManagerHelper
  of "qtest": ObjectType.Qtest
  of "rng-builtin": ObjectType.RngBuiltin
  of "rng-egd": ObjectType.RngEgd
  of "rng-random": ObjectType.RngRandom
  of "secret": ObjectType.Secret
  of "secret_keyring": ObjectType.SecretKeyring
  of "sev-guest": ObjectType.SevGuest
  of "sev-snp-guest": ObjectType.SevSnpGuest
  of "thread-context": ObjectType.ThreadContext
  of "s390-pv-guest": ObjectType.S390PvGuest
  of "tdx-guest": ObjectType.TdxGuest
  of "throttle-group": ObjectType.ThrottleGroup
  of "tls-creds-anon": ObjectType.TlsCredsAnon
  of "tls-creds-psk": ObjectType.TlsCredsPsk
  of "tls-creds-x509": ObjectType.TlsCredsX509
  of "tls-cipher-suites": ObjectType.TlsCipherSuites
  of "x-remote-object": ObjectType.XRemoteObject
  of "x-vfio-user-server": ObjectType.XVfioUserServer
  else: raise newException(ValueError, "unknown ObjectType: " & s)

proc `%`*(x: ObjectOptions): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["qom-type"] = %($x.qomType)
  case x.qomType
  of ObjectType.AcpiGenericInitiator:
    let sub = %(x.acpiGenericInitiator)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.AcpiGenericPort:
    let sub = %(x.acpiGenericPort)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.AuthzList:
    let sub = %(x.authzList)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.AuthzListfile:
    let sub = %(x.authzListfile)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.AuthzPam:
    let sub = %(x.authzPam)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.AuthzSimple:
    let sub = %(x.authzSimple)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CanHostSocketcan:
    let sub = %(x.canHostSocketcan)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.ColoCompare:
    let sub = %(x.coloCompare)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CryptodevBackend:
    let sub = %(x.cryptodevBackend)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CryptodevBackendBuiltin:
    let sub = %(x.cryptodevBackendBuiltin)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CryptodevBackendLkcf:
    let sub = %(x.cryptodevBackendLkcf)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CryptodevVhostUser:
    let sub = %(x.cryptodevVhostUser)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.DbusVmstate:
    let sub = %(x.dbusVmstate)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterBuffer:
    let sub = %(x.filterBuffer)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterDump:
    let sub = %(x.filterDump)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterMirror:
    let sub = %(x.filterMirror)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterRedirector:
    let sub = %(x.filterRedirector)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterReplay:
    let sub = %(x.filterReplay)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.FilterRewriter:
    let sub = %(x.filterRewriter)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.IgvmCfg:
    let sub = %(x.igvmCfg)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.InputBarrier:
    let sub = %(x.inputBarrier)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.InputLinux:
    let sub = %(x.inputLinux)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.Iommufd:
    let sub = %(x.iommufd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.Iothread:
    let sub = %(x.iothread)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MainLoop:
    let sub = %(x.mainLoop)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MemoryBackendEpc:
    let sub = %(x.memoryBackendEpc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MemoryBackendFile:
    let sub = %(x.memoryBackendFile)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MemoryBackendMemfd:
    let sub = %(x.memoryBackendMemfd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MemoryBackendRam:
    let sub = %(x.memoryBackendRam)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.MemoryBackendShm:
    let sub = %(x.memoryBackendShm)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.PrManagerHelper:
    let sub = %(x.prManagerHelper)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.Qtest:
    let sub = %(x.qtest)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.RngBuiltin:
    let sub = %(x.rngBuiltin)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.RngEgd:
    let sub = %(x.rngEgd)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.RngRandom:
    let sub = %(x.rngRandom)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.Secret:
    let sub = %(x.secret)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.SecretKeyring:
    let sub = %(x.secretKeyring)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.SevGuest:
    let sub = %(x.sevGuest)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.SevSnpGuest:
    let sub = %(x.sevSnpGuest)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.TdxGuest:
    let sub = %(x.tdxGuest)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.ThreadContext:
    let sub = %(x.threadContext)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.ThrottleGroup:
    let sub = %(x.throttleGroup)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.TlsCredsAnon:
    let sub = %(x.tlsCredsAnon)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.TlsCredsPsk:
    let sub = %(x.tlsCredsPsk)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.TlsCredsX509:
    let sub = %(x.tlsCredsX509)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.TlsCipherSuites:
    let sub = %(x.tlsCipherSuites)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.XRemoteObject:
    let sub = %(x.xRemoteObject)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.XVfioUserServer:
    let sub = %(x.xVfioUserServer)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of ObjectType.CanBus: discard
  of ObjectType.PefGuest: discard
  of ObjectType.S390PvGuest: discard

proc parse*(_: typedesc[ObjectOptions], n: JsonNode): ObjectOptions =
  result = default(ObjectOptions)
  let tag = parse(typedesc[ObjectType], n["qom-type"])
  case tag
  of ObjectType.AcpiGenericInitiator:
    result = ObjectOptions(qomType: tag, acpiGenericInitiator: parse(typedesc[AcpiGenericInitiatorProperties], n))
  of ObjectType.AcpiGenericPort:
    result = ObjectOptions(qomType: tag, acpiGenericPort: parse(typedesc[AcpiGenericPortProperties], n))
  of ObjectType.AuthzList:
    result = ObjectOptions(qomType: tag, authzList: parse(typedesc[AuthZListProperties], n))
  of ObjectType.AuthzListfile:
    result = ObjectOptions(qomType: tag, authzListfile: parse(typedesc[AuthZListFileProperties], n))
  of ObjectType.AuthzPam:
    result = ObjectOptions(qomType: tag, authzPam: parse(typedesc[AuthZPAMProperties], n))
  of ObjectType.AuthzSimple:
    result = ObjectOptions(qomType: tag, authzSimple: parse(typedesc[AuthZSimpleProperties], n))
  of ObjectType.CanHostSocketcan:
    result = ObjectOptions(qomType: tag, canHostSocketcan: parse(typedesc[CanHostSocketcanProperties], n))
  of ObjectType.ColoCompare:
    result = ObjectOptions(qomType: tag, coloCompare: parse(typedesc[ColoCompareProperties], n))
  of ObjectType.CryptodevBackend:
    result = ObjectOptions(qomType: tag, cryptodevBackend: parse(typedesc[CryptodevBackendProperties], n))
  of ObjectType.CryptodevBackendBuiltin:
    result = ObjectOptions(qomType: tag, cryptodevBackendBuiltin: parse(typedesc[CryptodevBackendProperties], n))
  of ObjectType.CryptodevBackendLkcf:
    result = ObjectOptions(qomType: tag, cryptodevBackendLkcf: parse(typedesc[CryptodevBackendProperties], n))
  of ObjectType.CryptodevVhostUser:
    result = ObjectOptions(qomType: tag, cryptodevVhostUser: parse(typedesc[CryptodevVhostUserProperties], n))
  of ObjectType.DbusVmstate:
    result = ObjectOptions(qomType: tag, dbusVmstate: parse(typedesc[DBusVMStateProperties], n))
  of ObjectType.FilterBuffer:
    result = ObjectOptions(qomType: tag, filterBuffer: parse(typedesc[FilterBufferProperties], n))
  of ObjectType.FilterDump:
    result = ObjectOptions(qomType: tag, filterDump: parse(typedesc[FilterDumpProperties], n))
  of ObjectType.FilterMirror:
    result = ObjectOptions(qomType: tag, filterMirror: parse(typedesc[FilterMirrorProperties], n))
  of ObjectType.FilterRedirector:
    result = ObjectOptions(qomType: tag, filterRedirector: parse(typedesc[FilterRedirectorProperties], n))
  of ObjectType.FilterReplay:
    result = ObjectOptions(qomType: tag, filterReplay: parse(typedesc[NetfilterProperties], n))
  of ObjectType.FilterRewriter:
    result = ObjectOptions(qomType: tag, filterRewriter: parse(typedesc[FilterRewriterProperties], n))
  of ObjectType.IgvmCfg:
    result = ObjectOptions(qomType: tag, igvmCfg: parse(typedesc[IgvmCfgProperties], n))
  of ObjectType.InputBarrier:
    result = ObjectOptions(qomType: tag, inputBarrier: parse(typedesc[InputBarrierProperties], n))
  of ObjectType.InputLinux:
    result = ObjectOptions(qomType: tag, inputLinux: parse(typedesc[InputLinuxProperties], n))
  of ObjectType.Iommufd:
    result = ObjectOptions(qomType: tag, iommufd: parse(typedesc[IOMMUFDProperties], n))
  of ObjectType.Iothread:
    result = ObjectOptions(qomType: tag, iothread: parse(typedesc[IothreadProperties], n))
  of ObjectType.MainLoop:
    result = ObjectOptions(qomType: tag, mainLoop: parse(typedesc[MainLoopProperties], n))
  of ObjectType.MemoryBackendEpc:
    result = ObjectOptions(qomType: tag, memoryBackendEpc: parse(typedesc[MemoryBackendEpcProperties], n))
  of ObjectType.MemoryBackendFile:
    result = ObjectOptions(qomType: tag, memoryBackendFile: parse(typedesc[MemoryBackendFileProperties], n))
  of ObjectType.MemoryBackendMemfd:
    result = ObjectOptions(qomType: tag, memoryBackendMemfd: parse(typedesc[MemoryBackendMemfdProperties], n))
  of ObjectType.MemoryBackendRam:
    result = ObjectOptions(qomType: tag, memoryBackendRam: parse(typedesc[MemoryBackendProperties], n))
  of ObjectType.MemoryBackendShm:
    result = ObjectOptions(qomType: tag, memoryBackendShm: parse(typedesc[MemoryBackendShmProperties], n))
  of ObjectType.PrManagerHelper:
    result = ObjectOptions(qomType: tag, prManagerHelper: parse(typedesc[PrManagerHelperProperties], n))
  of ObjectType.Qtest:
    result = ObjectOptions(qomType: tag, qtest: parse(typedesc[QtestProperties], n))
  of ObjectType.RngBuiltin:
    result = ObjectOptions(qomType: tag, rngBuiltin: parse(typedesc[RngProperties], n))
  of ObjectType.RngEgd:
    result = ObjectOptions(qomType: tag, rngEgd: parse(typedesc[RngEgdProperties], n))
  of ObjectType.RngRandom:
    result = ObjectOptions(qomType: tag, rngRandom: parse(typedesc[RngRandomProperties], n))
  of ObjectType.Secret:
    result = ObjectOptions(qomType: tag, secret: parse(typedesc[SecretProperties], n))
  of ObjectType.SecretKeyring:
    result = ObjectOptions(qomType: tag, secretKeyring: parse(typedesc[SecretKeyringProperties], n))
  of ObjectType.SevGuest:
    result = ObjectOptions(qomType: tag, sevGuest: parse(typedesc[SevGuestProperties], n))
  of ObjectType.SevSnpGuest:
    result = ObjectOptions(qomType: tag, sevSnpGuest: parse(typedesc[SevSnpGuestProperties], n))
  of ObjectType.TdxGuest:
    result = ObjectOptions(qomType: tag, tdxGuest: parse(typedesc[TdxGuestProperties], n))
  of ObjectType.ThreadContext:
    result = ObjectOptions(qomType: tag, threadContext: parse(typedesc[ThreadContextProperties], n))
  of ObjectType.ThrottleGroup:
    result = ObjectOptions(qomType: tag, throttleGroup: parse(typedesc[ThrottleGroupProperties], n))
  of ObjectType.TlsCredsAnon:
    result = ObjectOptions(qomType: tag, tlsCredsAnon: parse(typedesc[TlsCredsAnonProperties], n))
  of ObjectType.TlsCredsPsk:
    result = ObjectOptions(qomType: tag, tlsCredsPsk: parse(typedesc[TlsCredsPskProperties], n))
  of ObjectType.TlsCredsX509:
    result = ObjectOptions(qomType: tag, tlsCredsX509: parse(typedesc[TlsCredsX509Properties], n))
  of ObjectType.TlsCipherSuites:
    result = ObjectOptions(qomType: tag, tlsCipherSuites: parse(typedesc[TlsCredsProperties], n))
  of ObjectType.XRemoteObject:
    result = ObjectOptions(qomType: tag, xRemoteObject: parse(typedesc[RemoteObjectProperties], n))
  of ObjectType.XVfioUserServer:
    result = ObjectOptions(qomType: tag, xVfioUserServer: parse(typedesc[VfioUserServerProperties], n))
  of ObjectType.CanBus:
    result = ObjectOptions(qomType: tag)
  of ObjectType.PefGuest:
    result = ObjectOptions(qomType: tag)
  of ObjectType.S390PvGuest:
    result = ObjectOptions(qomType: tag)
  result.id = n["id"].getStr

proc `%`*(x: S390CpuEntitlement): JsonNode = %($x)
proc parse*(_: typedesc[S390CpuEntitlement], n: JsonNode): S390CpuEntitlement =
  let s = n.getStr
  case s
  of "auto": S390CpuEntitlement.Auto
  of "low": S390CpuEntitlement.Low
  of "medium": S390CpuEntitlement.Medium
  of "high": S390CpuEntitlement.High
  else: raise newException(ValueError, "unknown S390CpuEntitlement: " & s)

proc `%`*(x: CpuTopologyLevel): JsonNode = %($x)
proc parse*(_: typedesc[CpuTopologyLevel], n: JsonNode): CpuTopologyLevel =
  let s = n.getStr
  case s
  of "thread": CpuTopologyLevel.Thread
  of "core": CpuTopologyLevel.Core
  of "module": CpuTopologyLevel.Module
  of "cluster": CpuTopologyLevel.Cluster
  of "die": CpuTopologyLevel.Die
  of "socket": CpuTopologyLevel.Socket
  of "book": CpuTopologyLevel.Book
  of "drawer": CpuTopologyLevel.Drawer
  of "default": CpuTopologyLevel.Default
  else: raise newException(ValueError, "unknown CpuTopologyLevel: " & s)

proc `%`*(x: CacheLevelAndType): JsonNode = %($x)
proc parse*(_: typedesc[CacheLevelAndType], n: JsonNode): CacheLevelAndType =
  let s = n.getStr
  case s
  of "l1d": CacheLevelAndType.L1d
  of "l1i": CacheLevelAndType.L1i
  of "l2": CacheLevelAndType.L2
  of "l3": CacheLevelAndType.L3
  else: raise newException(ValueError, "unknown CacheLevelAndType: " & s)

proc `%`*(x: SmpCacheProperties): JsonNode =
  result = newJObject()
  result["cache"] = %(x.cache)
  result["topology"] = %(x.topology)

proc parse*(_: typedesc[SmpCacheProperties], n: JsonNode): SmpCacheProperties =
  result = default(SmpCacheProperties)
  result.cache = parse(typedesc[CacheLevelAndType], n["cache"])
  result.topology = parse(typedesc[CpuTopologyLevel], n["topology"])

proc `%`*(x: SmpCachePropertiesWrapper): JsonNode =
  result = newJObject()
  result["caches"] = %(x.caches)

proc parse*(_: typedesc[SmpCachePropertiesWrapper], n: JsonNode): SmpCachePropertiesWrapper =
  result = default(SmpCachePropertiesWrapper)
  result.caches = (n["caches"]).getElems.mapIt(parse(typedesc[SmpCacheProperties], it))

proc `%`*(x: SysEmuTarget): JsonNode = %($x)
proc parse*(_: typedesc[SysEmuTarget], n: JsonNode): SysEmuTarget =
  let s = n.getStr
  case s
  of "aarch64": SysEmuTarget.Aarch64
  of "alpha": SysEmuTarget.Alpha
  of "arm": SysEmuTarget.Arm
  of "avr": SysEmuTarget.Avr
  of "hexagon": SysEmuTarget.Hexagon
  of "hppa": SysEmuTarget.Hppa
  of "i386": SysEmuTarget.I386
  of "loongarch64": SysEmuTarget.Loongarch64
  of "m68k": SysEmuTarget.M68k
  of "microblaze": SysEmuTarget.Microblaze
  of "mips": SysEmuTarget.Mips
  of "mips64": SysEmuTarget.Mips64
  of "mips64el": SysEmuTarget.Mips64el
  of "mipsel": SysEmuTarget.Mipsel
  of "or1k": SysEmuTarget.Or1k
  of "ppc": SysEmuTarget.Ppc
  of "ppc64": SysEmuTarget.Ppc64
  of "riscv32": SysEmuTarget.Riscv32
  of "riscv64": SysEmuTarget.Riscv64
  of "rx": SysEmuTarget.Rx
  of "s390x": SysEmuTarget.S390x
  of "sh4": SysEmuTarget.Sh4
  of "sh4eb": SysEmuTarget.Sh4eb
  of "sparc": SysEmuTarget.Sparc
  of "sparc64": SysEmuTarget.Sparc64
  of "tricore": SysEmuTarget.Tricore
  of "x86_64": SysEmuTarget.X8664
  of "xtensa": SysEmuTarget.Xtensa
  of "xtensaeb": SysEmuTarget.Xtensaeb
  else: raise newException(ValueError, "unknown SysEmuTarget: " & s)

proc `%`*(x: S390CpuState): JsonNode = %($x)
proc parse*(_: typedesc[S390CpuState], n: JsonNode): S390CpuState =
  let s = n.getStr
  case s
  of "uninitialized": S390CpuState.Uninitialized
  of "stopped": S390CpuState.Stopped
  of "check-stop": S390CpuState.CheckStop
  of "operating": S390CpuState.Operating
  of "load": S390CpuState.Load
  else: raise newException(ValueError, "unknown S390CpuState: " & s)

proc `%`*(x: CpuInfoS390): JsonNode =
  result = newJObject()
  result["cpu-state"] = %(x.cpuState)
  if x.dedicated.isSome: result["dedicated"] = %(x.dedicated.get)
  if x.entitlement.isSome: result["entitlement"] = %(x.entitlement.get)

proc parse*(_: typedesc[CpuInfoS390], n: JsonNode): CpuInfoS390 =
  result = default(CpuInfoS390)
  result.cpuState = parse(typedesc[S390CpuState], n["cpu-state"])
  if n.hasKey("dedicated") and n["dedicated"].kind != JNull:
    result.dedicated = some(n["dedicated"].getBool)
  if n.hasKey("entitlement") and n["entitlement"].kind != JNull:
    result.entitlement = some(parse(typedesc[S390CpuEntitlement], n["entitlement"]))

proc `%`*(x: CpuInfoFast): JsonNode =
  result = newJObject()
  result["cpu-index"] = %(x.cpuIndex)
  result["qom-type"] = %(x.qomType)
  result["qom-path"] = %(x.qomPath)
  result["thread-id"] = %(x.threadId)
  if x.props.isSome: result["props"] = %(x.props.get)
  result["target"] = %($x.target)
  case x.target
  of SysEmuTarget.S390x:
    let sub = %(x.s390x)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SysEmuTarget.Aarch64: discard
  of SysEmuTarget.Alpha: discard
  of SysEmuTarget.Arm: discard
  of SysEmuTarget.Avr: discard
  of SysEmuTarget.Hexagon: discard
  of SysEmuTarget.Hppa: discard
  of SysEmuTarget.I386: discard
  of SysEmuTarget.Loongarch64: discard
  of SysEmuTarget.M68k: discard
  of SysEmuTarget.Microblaze: discard
  of SysEmuTarget.Mips: discard
  of SysEmuTarget.Mips64: discard
  of SysEmuTarget.Mips64el: discard
  of SysEmuTarget.Mipsel: discard
  of SysEmuTarget.Or1k: discard
  of SysEmuTarget.Ppc: discard
  of SysEmuTarget.Ppc64: discard
  of SysEmuTarget.Riscv32: discard
  of SysEmuTarget.Riscv64: discard
  of SysEmuTarget.Rx: discard
  of SysEmuTarget.Sh4: discard
  of SysEmuTarget.Sh4eb: discard
  of SysEmuTarget.Sparc: discard
  of SysEmuTarget.Sparc64: discard
  of SysEmuTarget.Tricore: discard
  of SysEmuTarget.X8664: discard
  of SysEmuTarget.Xtensa: discard
  of SysEmuTarget.Xtensaeb: discard

proc parse*(_: typedesc[CpuInfoFast], n: JsonNode): CpuInfoFast =
  result = default(CpuInfoFast)
  let tag = parse(typedesc[SysEmuTarget], n["target"])
  case tag
  of SysEmuTarget.S390x:
    result = CpuInfoFast(target: tag, s390x: parse(typedesc[CpuInfoS390], n))
  of SysEmuTarget.Aarch64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Alpha:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Arm:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Avr:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Hexagon:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Hppa:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.I386:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Loongarch64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.M68k:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Microblaze:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Mips:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Mips64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Mips64el:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Mipsel:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Or1k:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Ppc:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Ppc64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Riscv32:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Riscv64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Rx:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Sh4:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Sh4eb:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Sparc:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Sparc64:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Tricore:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.X8664:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Xtensa:
    result = CpuInfoFast(target: tag)
  of SysEmuTarget.Xtensaeb:
    result = CpuInfoFast(target: tag)
  result.cpuIndex = int64(n["cpu-index"].getBiggestInt)
  result.qomType = n["qom-type"].getStr
  result.qomPath = n["qom-path"].getStr
  result.threadId = int64(n["thread-id"].getBiggestInt)
  if n.hasKey("props") and n["props"].kind != JNull:
    result.props = some(parse(typedesc[CpuInstanceProperties], n["props"]))

proc `%`*(x: CompatProperty): JsonNode =
  result = newJObject()
  result["qom-type"] = %(x.qomType)
  result["property"] = %(x.property)
  result["value"] = %(x.value)

proc parse*(_: typedesc[CompatProperty], n: JsonNode): CompatProperty =
  result = default(CompatProperty)
  result.qomType = n["qom-type"].getStr
  result.property = n["property"].getStr
  result.value = n["value"].getStr

proc `%`*(x: MachineInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.alias.isSome: result["alias"] = %(x.alias.get)
  if x.isDefault.isSome: result["is-default"] = %(x.isDefault.get)
  result["cpu-max"] = %(x.cpuMax)
  result["hotpluggable-cpus"] = %(x.hotpluggableCpus)
  result["numa-mem-supported"] = %(x.numaMemSupported)
  result["deprecated"] = %(x.deprecated)
  if x.defaultCpuType.isSome: result["default-cpu-type"] = %(x.defaultCpuType.get)
  if x.defaultRamId.isSome: result["default-ram-id"] = %(x.defaultRamId.get)
  result["acpi"] = %(x.acpi)
  if x.compatProps.isSome: result["compat-props"] = %(x.compatProps.get)

proc parse*(_: typedesc[MachineInfo], n: JsonNode): MachineInfo =
  result = default(MachineInfo)
  result.name = n["name"].getStr
  if n.hasKey("alias") and n["alias"].kind != JNull:
    result.alias = some(n["alias"].getStr)
  if n.hasKey("is-default") and n["is-default"].kind != JNull:
    result.isDefault = some(n["is-default"].getBool)
  result.cpuMax = int64(n["cpu-max"].getBiggestInt)
  result.hotpluggableCpus = n["hotpluggable-cpus"].getBool
  result.numaMemSupported = n["numa-mem-supported"].getBool
  result.deprecated = n["deprecated"].getBool
  if n.hasKey("default-cpu-type") and n["default-cpu-type"].kind != JNull:
    result.defaultCpuType = some(n["default-cpu-type"].getStr)
  if n.hasKey("default-ram-id") and n["default-ram-id"].kind != JNull:
    result.defaultRamId = some(n["default-ram-id"].getStr)
  result.acpi = n["acpi"].getBool
  if n.hasKey("compat-props") and n["compat-props"].kind != JNull:
    result.compatProps = some((n["compat-props"]).getElems.mapIt(parse(typedesc[CompatProperty], it)))

proc `%`*(x: CurrentMachineParams): JsonNode =
  result = newJObject()
  result["wakeup-suspend-support"] = %(x.wakeupSuspendSupport)

proc parse*(_: typedesc[CurrentMachineParams], n: JsonNode): CurrentMachineParams =
  result = default(CurrentMachineParams)
  result.wakeupSuspendSupport = n["wakeup-suspend-support"].getBool

proc `%`*(x: QemuTargetInfo): JsonNode =
  result = newJObject()
  result["arch"] = %(x.arch)

proc parse*(_: typedesc[QemuTargetInfo], n: JsonNode): QemuTargetInfo =
  result = default(QemuTargetInfo)
  result.arch = parse(typedesc[SysEmuTarget], n["arch"])

proc `%`*(x: UuidInfo): JsonNode =
  result = newJObject()
  result["UUID"] = %(x.UUID)

proc parse*(_: typedesc[UuidInfo], n: JsonNode): UuidInfo =
  result = default(UuidInfo)
  result.UUID = n["UUID"].getStr

proc `%`*(x: GuidInfo): JsonNode =
  result = newJObject()
  result["guid"] = %(x.guid)

proc parse*(_: typedesc[GuidInfo], n: JsonNode): GuidInfo =
  result = default(GuidInfo)
  result.guid = n["guid"].getStr

proc `%`*(x: LostTickPolicy): JsonNode = %($x)
proc parse*(_: typedesc[LostTickPolicy], n: JsonNode): LostTickPolicy =
  let s = n.getStr
  case s
  of "discard": LostTickPolicy.Discard
  of "delay": LostTickPolicy.Delay
  of "slew": LostTickPolicy.Slew
  else: raise newException(ValueError, "unknown LostTickPolicy: " & s)

proc `%`*(x: NumaOptionsType): JsonNode = %($x)
proc parse*(_: typedesc[NumaOptionsType], n: JsonNode): NumaOptionsType =
  let s = n.getStr
  case s
  of "node": NumaOptionsType.Node
  of "dist": NumaOptionsType.Dist
  of "cpu": NumaOptionsType.Cpu
  of "hmat-lb": NumaOptionsType.HmatLb
  of "hmat-cache": NumaOptionsType.HmatCache
  else: raise newException(ValueError, "unknown NumaOptionsType: " & s)

proc `%`*(x: NumaOptions): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of NumaOptionsType.Node:
    let sub = %(x.node)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NumaOptionsType.Dist:
    let sub = %(x.dist)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NumaOptionsType.Cpu:
    let sub = %(x.cpu)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NumaOptionsType.HmatLb:
    let sub = %(x.hmatLb)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of NumaOptionsType.HmatCache:
    let sub = %(x.hmatCache)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[NumaOptions], n: JsonNode): NumaOptions =
  result = default(NumaOptions)
  let tag = parse(typedesc[NumaOptionsType], n["type"])
  case tag
  of NumaOptionsType.Node:
    result = NumaOptions(`type`: tag, node: parse(typedesc[NumaNodeOptions], n))
  of NumaOptionsType.Dist:
    result = NumaOptions(`type`: tag, dist: parse(typedesc[NumaDistOptions], n))
  of NumaOptionsType.Cpu:
    result = NumaOptions(`type`: tag, cpu: parse(typedesc[NumaCpuOptions], n))
  of NumaOptionsType.HmatLb:
    result = NumaOptions(`type`: tag, hmatLb: parse(typedesc[NumaHmatLBOptions], n))
  of NumaOptionsType.HmatCache:
    result = NumaOptions(`type`: tag, hmatCache: parse(typedesc[NumaHmatCacheOptions], n))

proc `%`*(x: NumaNodeOptions): JsonNode =
  result = newJObject()
  if x.nodeid.isSome: result["nodeid"] = %(x.nodeid.get)
  if x.cpus.isSome: result["cpus"] = %(x.cpus.get)
  if x.mem.isSome: result["mem"] = %(x.mem.get)
  if x.memdev.isSome: result["memdev"] = %(x.memdev.get)
  if x.initiator.isSome: result["initiator"] = %(x.initiator.get)

proc parse*(_: typedesc[NumaNodeOptions], n: JsonNode): NumaNodeOptions =
  result = default(NumaNodeOptions)
  if n.hasKey("nodeid") and n["nodeid"].kind != JNull:
    result.nodeid = some(uint16(n["nodeid"].getBiggestInt))
  if n.hasKey("cpus") and n["cpus"].kind != JNull:
    result.cpus = some((n["cpus"]).getElems.mapIt(uint16(it.getBiggestInt)))
  if n.hasKey("mem") and n["mem"].kind != JNull:
    result.mem = some(cast[uint64](n["mem"].getBiggestInt))
  if n.hasKey("memdev") and n["memdev"].kind != JNull:
    result.memdev = some(n["memdev"].getStr)
  if n.hasKey("initiator") and n["initiator"].kind != JNull:
    result.initiator = some(uint16(n["initiator"].getBiggestInt))

proc `%`*(x: NumaDistOptions): JsonNode =
  result = newJObject()
  result["src"] = %(x.src)
  result["dst"] = %(x.dst)
  result["val"] = %(x.val)

proc parse*(_: typedesc[NumaDistOptions], n: JsonNode): NumaDistOptions =
  result = default(NumaDistOptions)
  result.src = uint16(n["src"].getBiggestInt)
  result.dst = uint16(n["dst"].getBiggestInt)
  result.val = uint8(n["val"].getBiggestInt)

proc `%`*(x: CXLFixedMemoryWindowOptions): JsonNode =
  result = newJObject()
  result["size"] = %(x.size)
  if x.interleaveGranularity.isSome: result["interleave-granularity"] = %(x.interleaveGranularity.get)
  result["targets"] = %(x.targets)

proc parse*(_: typedesc[CXLFixedMemoryWindowOptions], n: JsonNode): CXLFixedMemoryWindowOptions =
  result = default(CXLFixedMemoryWindowOptions)
  result.size = cast[uint64](n["size"].getBiggestInt)
  if n.hasKey("interleave-granularity") and n["interleave-granularity"].kind != JNull:
    result.interleaveGranularity = some(cast[uint64](n["interleave-granularity"].getBiggestInt))
  result.targets = (n["targets"]).getElems.mapIt(it.getStr)

proc `%`*(x: CXLFMWProperties): JsonNode =
  result = newJObject()
  result["cxl-fmw"] = %(x.cxlFmw)

proc parse*(_: typedesc[CXLFMWProperties], n: JsonNode): CXLFMWProperties =
  result = default(CXLFMWProperties)
  result.cxlFmw = (n["cxl-fmw"]).getElems.mapIt(parse(typedesc[CXLFixedMemoryWindowOptions], it))

proc `%`*(x: X86CPURegister32): JsonNode = %($x)
proc parse*(_: typedesc[X86CPURegister32], n: JsonNode): X86CPURegister32 =
  let s = n.getStr
  case s
  of "EAX": X86CPURegister32.EAX
  of "EBX": X86CPURegister32.EBX
  of "ECX": X86CPURegister32.ECX
  of "EDX": X86CPURegister32.EDX
  of "ESP": X86CPURegister32.ESP
  of "EBP": X86CPURegister32.EBP
  of "ESI": X86CPURegister32.ESI
  of "EDI": X86CPURegister32.EDI
  else: raise newException(ValueError, "unknown X86CPURegister32: " & s)

proc `%`*(x: X86CPUFeatureWordInfo): JsonNode =
  result = newJObject()
  result["cpuid-input-eax"] = %(x.cpuidInputEax)
  if x.cpuidInputEcx.isSome: result["cpuid-input-ecx"] = %(x.cpuidInputEcx.get)
  result["cpuid-register"] = %(x.cpuidRegister)
  result["features"] = %(x.features)

proc parse*(_: typedesc[X86CPUFeatureWordInfo], n: JsonNode): X86CPUFeatureWordInfo =
  result = default(X86CPUFeatureWordInfo)
  result.cpuidInputEax = int64(n["cpuid-input-eax"].getBiggestInt)
  if n.hasKey("cpuid-input-ecx") and n["cpuid-input-ecx"].kind != JNull:
    result.cpuidInputEcx = some(int64(n["cpuid-input-ecx"].getBiggestInt))
  result.cpuidRegister = parse(typedesc[X86CPURegister32], n["cpuid-register"])
  result.features = int64(n["features"].getBiggestInt)

proc `%`*(x: DummyForceArrays): JsonNode =
  result = newJObject()
  result["unused"] = %(x.unused)

proc parse*(_: typedesc[DummyForceArrays], n: JsonNode): DummyForceArrays =
  result = default(DummyForceArrays)
  result.unused = (n["unused"]).getElems.mapIt(parse(typedesc[X86CPUFeatureWordInfo], it))

proc `%`*(x: NumaCpuOptions): JsonNode =
  result = newJObject()
  if x.nodeId.isSome: result["node-id"] = %(x.nodeId.get)
  if x.drawerId.isSome: result["drawer-id"] = %(x.drawerId.get)
  if x.bookId.isSome: result["book-id"] = %(x.bookId.get)
  if x.socketId.isSome: result["socket-id"] = %(x.socketId.get)
  if x.dieId.isSome: result["die-id"] = %(x.dieId.get)
  if x.clusterId.isSome: result["cluster-id"] = %(x.clusterId.get)
  if x.moduleId.isSome: result["module-id"] = %(x.moduleId.get)
  if x.coreId.isSome: result["core-id"] = %(x.coreId.get)
  if x.threadId.isSome: result["thread-id"] = %(x.threadId.get)

proc parse*(_: typedesc[NumaCpuOptions], n: JsonNode): NumaCpuOptions =
  result = default(NumaCpuOptions)
  if n.hasKey("node-id") and n["node-id"].kind != JNull:
    result.nodeId = some(int64(n["node-id"].getBiggestInt))
  if n.hasKey("drawer-id") and n["drawer-id"].kind != JNull:
    result.drawerId = some(int64(n["drawer-id"].getBiggestInt))
  if n.hasKey("book-id") and n["book-id"].kind != JNull:
    result.bookId = some(int64(n["book-id"].getBiggestInt))
  if n.hasKey("socket-id") and n["socket-id"].kind != JNull:
    result.socketId = some(int64(n["socket-id"].getBiggestInt))
  if n.hasKey("die-id") and n["die-id"].kind != JNull:
    result.dieId = some(int64(n["die-id"].getBiggestInt))
  if n.hasKey("cluster-id") and n["cluster-id"].kind != JNull:
    result.clusterId = some(int64(n["cluster-id"].getBiggestInt))
  if n.hasKey("module-id") and n["module-id"].kind != JNull:
    result.moduleId = some(int64(n["module-id"].getBiggestInt))
  if n.hasKey("core-id") and n["core-id"].kind != JNull:
    result.coreId = some(int64(n["core-id"].getBiggestInt))
  if n.hasKey("thread-id") and n["thread-id"].kind != JNull:
    result.threadId = some(int64(n["thread-id"].getBiggestInt))

proc `%`*(x: HmatLBMemoryHierarchy): JsonNode = %($x)
proc parse*(_: typedesc[HmatLBMemoryHierarchy], n: JsonNode): HmatLBMemoryHierarchy =
  let s = n.getStr
  case s
  of "memory": HmatLBMemoryHierarchy.Memory
  of "first-level": HmatLBMemoryHierarchy.FirstLevel
  of "second-level": HmatLBMemoryHierarchy.SecondLevel
  of "third-level": HmatLBMemoryHierarchy.ThirdLevel
  else: raise newException(ValueError, "unknown HmatLBMemoryHierarchy: " & s)

proc `%`*(x: HmatLBDataType): JsonNode = %($x)
proc parse*(_: typedesc[HmatLBDataType], n: JsonNode): HmatLBDataType =
  let s = n.getStr
  case s
  of "access-latency": HmatLBDataType.AccessLatency
  of "read-latency": HmatLBDataType.ReadLatency
  of "write-latency": HmatLBDataType.WriteLatency
  of "access-bandwidth": HmatLBDataType.AccessBandwidth
  of "read-bandwidth": HmatLBDataType.ReadBandwidth
  of "write-bandwidth": HmatLBDataType.WriteBandwidth
  else: raise newException(ValueError, "unknown HmatLBDataType: " & s)

proc `%`*(x: NumaHmatLBOptions): JsonNode =
  result = newJObject()
  result["initiator"] = %(x.initiator)
  result["target"] = %(x.target)
  result["hierarchy"] = %(x.hierarchy)
  result["data-type"] = %(x.dataType)
  if x.latency.isSome: result["latency"] = %(x.latency.get)
  if x.bandwidth.isSome: result["bandwidth"] = %(x.bandwidth.get)

proc parse*(_: typedesc[NumaHmatLBOptions], n: JsonNode): NumaHmatLBOptions =
  result = default(NumaHmatLBOptions)
  result.initiator = uint16(n["initiator"].getBiggestInt)
  result.target = uint16(n["target"].getBiggestInt)
  result.hierarchy = parse(typedesc[HmatLBMemoryHierarchy], n["hierarchy"])
  result.dataType = parse(typedesc[HmatLBDataType], n["data-type"])
  if n.hasKey("latency") and n["latency"].kind != JNull:
    result.latency = some(cast[uint64](n["latency"].getBiggestInt))
  if n.hasKey("bandwidth") and n["bandwidth"].kind != JNull:
    result.bandwidth = some(cast[uint64](n["bandwidth"].getBiggestInt))

proc `%`*(x: HmatCacheAssociativity): JsonNode = %($x)
proc parse*(_: typedesc[HmatCacheAssociativity], n: JsonNode): HmatCacheAssociativity =
  let s = n.getStr
  case s
  of "none": HmatCacheAssociativity.None
  of "direct": HmatCacheAssociativity.Direct
  of "complex": HmatCacheAssociativity.Complex
  else: raise newException(ValueError, "unknown HmatCacheAssociativity: " & s)

proc `%`*(x: HmatCacheWritePolicy): JsonNode = %($x)
proc parse*(_: typedesc[HmatCacheWritePolicy], n: JsonNode): HmatCacheWritePolicy =
  let s = n.getStr
  case s
  of "none": HmatCacheWritePolicy.None
  of "write-back": HmatCacheWritePolicy.WriteBack
  of "write-through": HmatCacheWritePolicy.WriteThrough
  else: raise newException(ValueError, "unknown HmatCacheWritePolicy: " & s)

proc `%`*(x: NumaHmatCacheOptions): JsonNode =
  result = newJObject()
  result["node-id"] = %(x.nodeId)
  result["size"] = %(x.size)
  result["level"] = %(x.level)
  result["associativity"] = %(x.associativity)
  result["policy"] = %(x.policy)
  result["line"] = %(x.line)

proc parse*(_: typedesc[NumaHmatCacheOptions], n: JsonNode): NumaHmatCacheOptions =
  result = default(NumaHmatCacheOptions)
  result.nodeId = uint32(n["node-id"].getBiggestInt)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.level = uint8(n["level"].getBiggestInt)
  result.associativity = parse(typedesc[HmatCacheAssociativity], n["associativity"])
  result.policy = parse(typedesc[HmatCacheWritePolicy], n["policy"])
  result.line = uint16(n["line"].getBiggestInt)

proc `%`*(x: Memdev): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  result["size"] = %(x.size)
  result["merge"] = %(x.merge)
  result["dump"] = %(x.dump)
  result["prealloc"] = %(x.prealloc)
  result["share"] = %(x.share)
  if x.reserve.isSome: result["reserve"] = %(x.reserve.get)
  result["host-nodes"] = %(x.hostNodes)
  result["policy"] = %(x.policy)

proc parse*(_: typedesc[Memdev], n: JsonNode): Memdev =
  result = default(Memdev)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.merge = n["merge"].getBool
  result.dump = n["dump"].getBool
  result.prealloc = n["prealloc"].getBool
  result.share = n["share"].getBool
  if n.hasKey("reserve") and n["reserve"].kind != JNull:
    result.reserve = some(n["reserve"].getBool)
  result.hostNodes = (n["host-nodes"]).getElems.mapIt(uint16(it.getBiggestInt))
  result.policy = parse(typedesc[HostMemPolicy], n["policy"])

proc `%`*(x: CpuInstanceProperties): JsonNode =
  result = newJObject()
  if x.nodeId.isSome: result["node-id"] = %(x.nodeId.get)
  if x.drawerId.isSome: result["drawer-id"] = %(x.drawerId.get)
  if x.bookId.isSome: result["book-id"] = %(x.bookId.get)
  if x.socketId.isSome: result["socket-id"] = %(x.socketId.get)
  if x.dieId.isSome: result["die-id"] = %(x.dieId.get)
  if x.clusterId.isSome: result["cluster-id"] = %(x.clusterId.get)
  if x.moduleId.isSome: result["module-id"] = %(x.moduleId.get)
  if x.coreId.isSome: result["core-id"] = %(x.coreId.get)
  if x.threadId.isSome: result["thread-id"] = %(x.threadId.get)

proc parse*(_: typedesc[CpuInstanceProperties], n: JsonNode): CpuInstanceProperties =
  result = default(CpuInstanceProperties)
  if n.hasKey("node-id") and n["node-id"].kind != JNull:
    result.nodeId = some(int64(n["node-id"].getBiggestInt))
  if n.hasKey("drawer-id") and n["drawer-id"].kind != JNull:
    result.drawerId = some(int64(n["drawer-id"].getBiggestInt))
  if n.hasKey("book-id") and n["book-id"].kind != JNull:
    result.bookId = some(int64(n["book-id"].getBiggestInt))
  if n.hasKey("socket-id") and n["socket-id"].kind != JNull:
    result.socketId = some(int64(n["socket-id"].getBiggestInt))
  if n.hasKey("die-id") and n["die-id"].kind != JNull:
    result.dieId = some(int64(n["die-id"].getBiggestInt))
  if n.hasKey("cluster-id") and n["cluster-id"].kind != JNull:
    result.clusterId = some(int64(n["cluster-id"].getBiggestInt))
  if n.hasKey("module-id") and n["module-id"].kind != JNull:
    result.moduleId = some(int64(n["module-id"].getBiggestInt))
  if n.hasKey("core-id") and n["core-id"].kind != JNull:
    result.coreId = some(int64(n["core-id"].getBiggestInt))
  if n.hasKey("thread-id") and n["thread-id"].kind != JNull:
    result.threadId = some(int64(n["thread-id"].getBiggestInt))

proc `%`*(x: HotpluggableCPU): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)
  result["vcpus-count"] = %(x.vcpusCount)
  result["props"] = %(x.props)
  if x.qomPath.isSome: result["qom-path"] = %(x.qomPath.get)

proc parse*(_: typedesc[HotpluggableCPU], n: JsonNode): HotpluggableCPU =
  result = default(HotpluggableCPU)
  result.`type` = n["type"].getStr
  result.vcpusCount = int64(n["vcpus-count"].getBiggestInt)
  result.props = parse(typedesc[CpuInstanceProperties], n["props"])
  if n.hasKey("qom-path") and n["qom-path"].kind != JNull:
    result.qomPath = some(n["qom-path"].getStr)

proc `%`*(x: BalloonInfo): JsonNode =
  result = newJObject()
  result["actual"] = %(x.actual)

proc parse*(_: typedesc[BalloonInfo], n: JsonNode): BalloonInfo =
  result = default(BalloonInfo)
  result.actual = int64(n["actual"].getBiggestInt)

proc `%`*(x: HvBalloonInfo): JsonNode =
  result = newJObject()
  result["committed"] = %(x.committed)
  result["available"] = %(x.available)

proc parse*(_: typedesc[HvBalloonInfo], n: JsonNode): HvBalloonInfo =
  result = default(HvBalloonInfo)
  result.committed = cast[uint64](n["committed"].getBiggestInt)
  result.available = cast[uint64](n["available"].getBiggestInt)

proc `%`*(x: MemoryInfo): JsonNode =
  result = newJObject()
  result["base-memory"] = %(x.baseMemory)
  if x.pluggedMemory.isSome: result["plugged-memory"] = %(x.pluggedMemory.get)

proc parse*(_: typedesc[MemoryInfo], n: JsonNode): MemoryInfo =
  result = default(MemoryInfo)
  result.baseMemory = cast[uint64](n["base-memory"].getBiggestInt)
  if n.hasKey("plugged-memory") and n["plugged-memory"].kind != JNull:
    result.pluggedMemory = some(cast[uint64](n["plugged-memory"].getBiggestInt))

proc `%`*(x: PCDIMMDeviceInfo): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  result["addr"] = %(x.`addr`)
  result["size"] = %(x.size)
  result["slot"] = %(x.slot)
  result["node"] = %(x.node)
  result["memdev"] = %(x.memdev)
  result["hotplugged"] = %(x.hotplugged)
  result["hotpluggable"] = %(x.hotpluggable)

proc parse*(_: typedesc[PCDIMMDeviceInfo], n: JsonNode): PCDIMMDeviceInfo =
  result = default(PCDIMMDeviceInfo)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.`addr` = int64(n["addr"].getBiggestInt)
  result.size = int64(n["size"].getBiggestInt)
  result.slot = int64(n["slot"].getBiggestInt)
  result.node = int64(n["node"].getBiggestInt)
  result.memdev = n["memdev"].getStr
  result.hotplugged = n["hotplugged"].getBool
  result.hotpluggable = n["hotpluggable"].getBool

proc `%`*(x: VirtioPMEMDeviceInfo): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  result["memaddr"] = %(x.memaddr)
  result["size"] = %(x.size)
  result["memdev"] = %(x.memdev)

proc parse*(_: typedesc[VirtioPMEMDeviceInfo], n: JsonNode): VirtioPMEMDeviceInfo =
  result = default(VirtioPMEMDeviceInfo)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.memaddr = cast[uint64](n["memaddr"].getBiggestInt)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.memdev = n["memdev"].getStr

proc `%`*(x: VirtioMEMDeviceInfo): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  result["memaddr"] = %(x.memaddr)
  result["requested-size"] = %(x.requestedSize)
  result["size"] = %(x.size)
  result["max-size"] = %(x.maxSize)
  result["block-size"] = %(x.blockSize)
  result["node"] = %(x.node)
  result["memdev"] = %(x.memdev)

proc parse*(_: typedesc[VirtioMEMDeviceInfo], n: JsonNode): VirtioMEMDeviceInfo =
  result = default(VirtioMEMDeviceInfo)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.memaddr = cast[uint64](n["memaddr"].getBiggestInt)
  result.requestedSize = cast[uint64](n["requested-size"].getBiggestInt)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.maxSize = cast[uint64](n["max-size"].getBiggestInt)
  result.blockSize = cast[uint64](n["block-size"].getBiggestInt)
  result.node = int64(n["node"].getBiggestInt)
  result.memdev = n["memdev"].getStr

proc `%`*(x: SgxEPCDeviceInfo): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  result["memaddr"] = %(x.memaddr)
  result["size"] = %(x.size)
  result["node"] = %(x.node)
  result["memdev"] = %(x.memdev)

proc parse*(_: typedesc[SgxEPCDeviceInfo], n: JsonNode): SgxEPCDeviceInfo =
  result = default(SgxEPCDeviceInfo)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  result.memaddr = cast[uint64](n["memaddr"].getBiggestInt)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.node = int64(n["node"].getBiggestInt)
  result.memdev = n["memdev"].getStr

proc `%`*(x: HvBalloonDeviceInfo): JsonNode =
  result = newJObject()
  if x.id.isSome: result["id"] = %(x.id.get)
  if x.memaddr.isSome: result["memaddr"] = %(x.memaddr.get)
  result["max-size"] = %(x.maxSize)
  if x.memdev.isSome: result["memdev"] = %(x.memdev.get)

proc parse*(_: typedesc[HvBalloonDeviceInfo], n: JsonNode): HvBalloonDeviceInfo =
  result = default(HvBalloonDeviceInfo)
  if n.hasKey("id") and n["id"].kind != JNull:
    result.id = some(n["id"].getStr)
  if n.hasKey("memaddr") and n["memaddr"].kind != JNull:
    result.memaddr = some(cast[uint64](n["memaddr"].getBiggestInt))
  result.maxSize = cast[uint64](n["max-size"].getBiggestInt)
  if n.hasKey("memdev") and n["memdev"].kind != JNull:
    result.memdev = some(n["memdev"].getStr)

proc `%`*(x: MemoryDeviceInfoKind): JsonNode = %($x)
proc parse*(_: typedesc[MemoryDeviceInfoKind], n: JsonNode): MemoryDeviceInfoKind =
  let s = n.getStr
  case s
  of "dimm": MemoryDeviceInfoKind.Dimm
  of "nvdimm": MemoryDeviceInfoKind.Nvdimm
  of "virtio-pmem": MemoryDeviceInfoKind.VirtioPmem
  of "virtio-mem": MemoryDeviceInfoKind.VirtioMem
  of "sgx-epc": MemoryDeviceInfoKind.SgxEpc
  of "hv-balloon": MemoryDeviceInfoKind.HvBalloon
  else: raise newException(ValueError, "unknown MemoryDeviceInfoKind: " & s)

proc `%`*(x: PCDIMMDeviceInfoWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[PCDIMMDeviceInfoWrapper], n: JsonNode): PCDIMMDeviceInfoWrapper =
  result = default(PCDIMMDeviceInfoWrapper)
  result.data = parse(typedesc[PCDIMMDeviceInfo], n["data"])

proc `%`*(x: VirtioPMEMDeviceInfoWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[VirtioPMEMDeviceInfoWrapper], n: JsonNode): VirtioPMEMDeviceInfoWrapper =
  result = default(VirtioPMEMDeviceInfoWrapper)
  result.data = parse(typedesc[VirtioPMEMDeviceInfo], n["data"])

proc `%`*(x: VirtioMEMDeviceInfoWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[VirtioMEMDeviceInfoWrapper], n: JsonNode): VirtioMEMDeviceInfoWrapper =
  result = default(VirtioMEMDeviceInfoWrapper)
  result.data = parse(typedesc[VirtioMEMDeviceInfo], n["data"])

proc `%`*(x: SgxEPCDeviceInfoWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[SgxEPCDeviceInfoWrapper], n: JsonNode): SgxEPCDeviceInfoWrapper =
  result = default(SgxEPCDeviceInfoWrapper)
  result.data = parse(typedesc[SgxEPCDeviceInfo], n["data"])

proc `%`*(x: HvBalloonDeviceInfoWrapper): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[HvBalloonDeviceInfoWrapper], n: JsonNode): HvBalloonDeviceInfoWrapper =
  result = default(HvBalloonDeviceInfoWrapper)
  result.data = parse(typedesc[HvBalloonDeviceInfo], n["data"])

proc `%`*(x: MemoryDeviceInfo): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of MemoryDeviceInfoKind.Dimm:
    let sub = %(x.dimm)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MemoryDeviceInfoKind.Nvdimm:
    let sub = %(x.nvdimm)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MemoryDeviceInfoKind.VirtioPmem:
    let sub = %(x.virtioPmem)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MemoryDeviceInfoKind.VirtioMem:
    let sub = %(x.virtioMem)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MemoryDeviceInfoKind.SgxEpc:
    let sub = %(x.sgxEpc)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of MemoryDeviceInfoKind.HvBalloon:
    let sub = %(x.hvBalloon)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[MemoryDeviceInfo], n: JsonNode): MemoryDeviceInfo =
  result = default(MemoryDeviceInfo)
  let tag = parse(typedesc[MemoryDeviceInfoKind], n["type"])
  case tag
  of MemoryDeviceInfoKind.Dimm:
    result = MemoryDeviceInfo(`type`: tag, dimm: parse(typedesc[PCDIMMDeviceInfoWrapper], n))
  of MemoryDeviceInfoKind.Nvdimm:
    result = MemoryDeviceInfo(`type`: tag, nvdimm: parse(typedesc[PCDIMMDeviceInfoWrapper], n))
  of MemoryDeviceInfoKind.VirtioPmem:
    result = MemoryDeviceInfo(`type`: tag, virtioPmem: parse(typedesc[VirtioPMEMDeviceInfoWrapper], n))
  of MemoryDeviceInfoKind.VirtioMem:
    result = MemoryDeviceInfo(`type`: tag, virtioMem: parse(typedesc[VirtioMEMDeviceInfoWrapper], n))
  of MemoryDeviceInfoKind.SgxEpc:
    result = MemoryDeviceInfo(`type`: tag, sgxEpc: parse(typedesc[SgxEPCDeviceInfoWrapper], n))
  of MemoryDeviceInfoKind.HvBalloon:
    result = MemoryDeviceInfo(`type`: tag, hvBalloon: parse(typedesc[HvBalloonDeviceInfoWrapper], n))

proc `%`*(x: SgxEPC): JsonNode =
  result = newJObject()
  result["memdev"] = %(x.memdev)
  result["node"] = %(x.node)

proc parse*(_: typedesc[SgxEPC], n: JsonNode): SgxEPC =
  result = default(SgxEPC)
  result.memdev = n["memdev"].getStr
  result.node = int64(n["node"].getBiggestInt)

proc `%`*(x: SgxEPCProperties): JsonNode =
  result = newJObject()
  result["sgx-epc"] = %(x.sgxEpc)

proc parse*(_: typedesc[SgxEPCProperties], n: JsonNode): SgxEPCProperties =
  result = default(SgxEPCProperties)
  result.sgxEpc = (n["sgx-epc"]).getElems.mapIt(parse(typedesc[SgxEPC], it))

proc `%`*(x: BootConfiguration): JsonNode =
  result = newJObject()
  if x.order.isSome: result["order"] = %(x.order.get)
  if x.once.isSome: result["once"] = %(x.once.get)
  if x.menu.isSome: result["menu"] = %(x.menu.get)
  if x.splash.isSome: result["splash"] = %(x.splash.get)
  if x.splashTime.isSome: result["splash-time"] = %(x.splashTime.get)
  if x.rebootTimeout.isSome: result["reboot-timeout"] = %(x.rebootTimeout.get)
  if x.strict.isSome: result["strict"] = %(x.strict.get)

proc parse*(_: typedesc[BootConfiguration], n: JsonNode): BootConfiguration =
  result = default(BootConfiguration)
  if n.hasKey("order") and n["order"].kind != JNull:
    result.order = some(n["order"].getStr)
  if n.hasKey("once") and n["once"].kind != JNull:
    result.once = some(n["once"].getStr)
  if n.hasKey("menu") and n["menu"].kind != JNull:
    result.menu = some(n["menu"].getBool)
  if n.hasKey("splash") and n["splash"].kind != JNull:
    result.splash = some(n["splash"].getStr)
  if n.hasKey("splash-time") and n["splash-time"].kind != JNull:
    result.splashTime = some(int64(n["splash-time"].getBiggestInt))
  if n.hasKey("reboot-timeout") and n["reboot-timeout"].kind != JNull:
    result.rebootTimeout = some(int64(n["reboot-timeout"].getBiggestInt))
  if n.hasKey("strict") and n["strict"].kind != JNull:
    result.strict = some(n["strict"].getBool)

proc `%`*(x: SMPConfiguration): JsonNode =
  result = newJObject()
  if x.cpus.isSome: result["cpus"] = %(x.cpus.get)
  if x.drawers.isSome: result["drawers"] = %(x.drawers.get)
  if x.books.isSome: result["books"] = %(x.books.get)
  if x.sockets.isSome: result["sockets"] = %(x.sockets.get)
  if x.dies.isSome: result["dies"] = %(x.dies.get)
  if x.clusters.isSome: result["clusters"] = %(x.clusters.get)
  if x.modules.isSome: result["modules"] = %(x.modules.get)
  if x.cores.isSome: result["cores"] = %(x.cores.get)
  if x.threads.isSome: result["threads"] = %(x.threads.get)
  if x.maxcpus.isSome: result["maxcpus"] = %(x.maxcpus.get)

proc parse*(_: typedesc[SMPConfiguration], n: JsonNode): SMPConfiguration =
  result = default(SMPConfiguration)
  if n.hasKey("cpus") and n["cpus"].kind != JNull:
    result.cpus = some(int64(n["cpus"].getBiggestInt))
  if n.hasKey("drawers") and n["drawers"].kind != JNull:
    result.drawers = some(int64(n["drawers"].getBiggestInt))
  if n.hasKey("books") and n["books"].kind != JNull:
    result.books = some(int64(n["books"].getBiggestInt))
  if n.hasKey("sockets") and n["sockets"].kind != JNull:
    result.sockets = some(int64(n["sockets"].getBiggestInt))
  if n.hasKey("dies") and n["dies"].kind != JNull:
    result.dies = some(int64(n["dies"].getBiggestInt))
  if n.hasKey("clusters") and n["clusters"].kind != JNull:
    result.clusters = some(int64(n["clusters"].getBiggestInt))
  if n.hasKey("modules") and n["modules"].kind != JNull:
    result.modules = some(int64(n["modules"].getBiggestInt))
  if n.hasKey("cores") and n["cores"].kind != JNull:
    result.cores = some(int64(n["cores"].getBiggestInt))
  if n.hasKey("threads") and n["threads"].kind != JNull:
    result.threads = some(int64(n["threads"].getBiggestInt))
  if n.hasKey("maxcpus") and n["maxcpus"].kind != JNull:
    result.maxcpus = some(int64(n["maxcpus"].getBiggestInt))

proc `%`*(x: SmbiosEntryPointType): JsonNode = %($x)
proc parse*(_: typedesc[SmbiosEntryPointType], n: JsonNode): SmbiosEntryPointType =
  let s = n.getStr
  case s
  of "32": SmbiosEntryPointType.V32
  of "64": SmbiosEntryPointType.V64
  of "auto": SmbiosEntryPointType.Auto
  else: raise newException(ValueError, "unknown SmbiosEntryPointType: " & s)

proc `%`*(x: MemorySizeConfiguration): JsonNode =
  result = newJObject()
  if x.size.isSome: result["size"] = %(x.size.get)
  if x.maxSize.isSome: result["max-size"] = %(x.maxSize.get)
  if x.slots.isSome: result["slots"] = %(x.slots.get)

proc parse*(_: typedesc[MemorySizeConfiguration], n: JsonNode): MemorySizeConfiguration =
  result = default(MemorySizeConfiguration)
  if n.hasKey("size") and n["size"].kind != JNull:
    result.size = some(cast[uint64](n["size"].getBiggestInt))
  if n.hasKey("max-size") and n["max-size"].kind != JNull:
    result.maxSize = some(cast[uint64](n["max-size"].getBiggestInt))
  if n.hasKey("slots") and n["slots"].kind != JNull:
    result.slots = some(cast[uint64](n["slots"].getBiggestInt))

proc `%`*(x: FirmwareLog): JsonNode =
  result = newJObject()
  if x.version.isSome: result["version"] = %(x.version.get)
  result["log"] = %(x.log)

proc parse*(_: typedesc[FirmwareLog], n: JsonNode): FirmwareLog =
  result = default(FirmwareLog)
  if n.hasKey("version") and n["version"].kind != JNull:
    result.version = some(n["version"].getStr)
  result.log = n["log"].getStr

proc `%`*(x: CpuModelInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.props.isSome: result["props"] = %(x.props.get)

proc parse*(_: typedesc[CpuModelInfo], n: JsonNode): CpuModelInfo =
  result = default(CpuModelInfo)
  result.name = n["name"].getStr
  if n.hasKey("props") and n["props"].kind != JNull:
    result.props = some(n["props"])

proc `%`*(x: CpuModelExpansionType): JsonNode = %($x)
proc parse*(_: typedesc[CpuModelExpansionType], n: JsonNode): CpuModelExpansionType =
  let s = n.getStr
  case s
  of "static": CpuModelExpansionType.Static
  of "full": CpuModelExpansionType.Full
  else: raise newException(ValueError, "unknown CpuModelExpansionType: " & s)

proc `%`*(x: CpuModelCompareResult): JsonNode = %($x)
proc parse*(_: typedesc[CpuModelCompareResult], n: JsonNode): CpuModelCompareResult =
  let s = n.getStr
  case s
  of "incompatible": CpuModelCompareResult.Incompatible
  of "identical": CpuModelCompareResult.Identical
  of "superset": CpuModelCompareResult.Superset
  of "subset": CpuModelCompareResult.Subset
  else: raise newException(ValueError, "unknown CpuModelCompareResult: " & s)

proc `%`*(x: CpuModelBaselineInfo): JsonNode =
  result = newJObject()
  result["model"] = %(x.model)

proc parse*(_: typedesc[CpuModelBaselineInfo], n: JsonNode): CpuModelBaselineInfo =
  result = default(CpuModelBaselineInfo)
  result.model = parse(typedesc[CpuModelInfo], n["model"])

proc `%`*(x: CpuModelCompareInfo): JsonNode =
  result = newJObject()
  result["result"] = %(x.result)
  result["responsible-properties"] = %(x.responsibleProperties)

proc parse*(_: typedesc[CpuModelCompareInfo], n: JsonNode): CpuModelCompareInfo =
  result = default(CpuModelCompareInfo)
  result.result = parse(typedesc[CpuModelCompareResult], n["result"])
  result.responsibleProperties = (n["responsible-properties"]).getElems.mapIt(it.getStr)

proc `%`*(x: CpuModelExpansionInfo): JsonNode =
  result = newJObject()
  result["model"] = %(x.model)
  if x.deprecatedProps.isSome: result["deprecated-props"] = %(x.deprecatedProps.get)

proc parse*(_: typedesc[CpuModelExpansionInfo], n: JsonNode): CpuModelExpansionInfo =
  result = default(CpuModelExpansionInfo)
  result.model = parse(typedesc[CpuModelInfo], n["model"])
  if n.hasKey("deprecated-props") and n["deprecated-props"].kind != JNull:
    result.deprecatedProps = some((n["deprecated-props"]).getElems.mapIt(it.getStr))

proc `%`*(x: CpuDefinitionInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.migrationSafe.isSome: result["migration-safe"] = %(x.migrationSafe.get)
  result["static"] = %(x.`static`)
  if x.unavailableFeatures.isSome: result["unavailable-features"] = %(x.unavailableFeatures.get)
  result["typename"] = %(x.typename)
  if x.aliasOf.isSome: result["alias-of"] = %(x.aliasOf.get)
  result["deprecated"] = %(x.deprecated)

proc parse*(_: typedesc[CpuDefinitionInfo], n: JsonNode): CpuDefinitionInfo =
  result = default(CpuDefinitionInfo)
  result.name = n["name"].getStr
  if n.hasKey("migration-safe") and n["migration-safe"].kind != JNull:
    result.migrationSafe = some(n["migration-safe"].getBool)
  result.`static` = n["static"].getBool
  if n.hasKey("unavailable-features") and n["unavailable-features"].kind != JNull:
    result.unavailableFeatures = some((n["unavailable-features"]).getElems.mapIt(it.getStr))
  result.typename = n["typename"].getStr
  if n.hasKey("alias-of") and n["alias-of"].kind != JNull:
    result.aliasOf = some(n["alias-of"].getStr)
  result.deprecated = n["deprecated"].getBool

proc `%`*(x: S390CpuPolarization): JsonNode = %($x)
proc parse*(_: typedesc[S390CpuPolarization], n: JsonNode): S390CpuPolarization =
  let s = n.getStr
  case s
  of "horizontal": S390CpuPolarization.Horizontal
  of "vertical": S390CpuPolarization.Vertical
  else: raise newException(ValueError, "unknown S390CpuPolarization: " & s)

proc `%`*(x: CpuPolarizationInfo): JsonNode =
  result = newJObject()
  result["polarization"] = %(x.polarization)

proc parse*(_: typedesc[CpuPolarizationInfo], n: JsonNode): CpuPolarizationInfo =
  result = default(CpuPolarizationInfo)
  result.polarization = parse(typedesc[S390CpuPolarization], n["polarization"])

proc `%`*(x: ReplayMode): JsonNode = %($x)
proc parse*(_: typedesc[ReplayMode], n: JsonNode): ReplayMode =
  let s = n.getStr
  case s
  of "none": ReplayMode.None
  of "record": ReplayMode.Record
  of "play": ReplayMode.Play
  else: raise newException(ValueError, "unknown ReplayMode: " & s)

proc `%`*(x: ReplayInfo): JsonNode =
  result = newJObject()
  result["mode"] = %(x.mode)
  if x.filename.isSome: result["filename"] = %(x.filename.get)
  result["icount"] = %(x.icount)

proc parse*(_: typedesc[ReplayInfo], n: JsonNode): ReplayInfo =
  result = default(ReplayInfo)
  result.mode = parse(typedesc[ReplayMode], n["mode"])
  if n.hasKey("filename") and n["filename"].kind != JNull:
    result.filename = some(n["filename"].getStr)
  result.icount = int64(n["icount"].getBiggestInt)

proc `%`*(x: YankInstanceType): JsonNode = %($x)
proc parse*(_: typedesc[YankInstanceType], n: JsonNode): YankInstanceType =
  let s = n.getStr
  case s
  of "block-node": YankInstanceType.BlockNode
  of "chardev": YankInstanceType.Chardev
  of "migration": YankInstanceType.Migration
  else: raise newException(ValueError, "unknown YankInstanceType: " & s)

proc `%`*(x: YankInstanceBlockNode): JsonNode =
  result = newJObject()
  result["node-name"] = %(x.nodeName)

proc parse*(_: typedesc[YankInstanceBlockNode], n: JsonNode): YankInstanceBlockNode =
  result = default(YankInstanceBlockNode)
  result.nodeName = n["node-name"].getStr

proc `%`*(x: YankInstanceChardev): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)

proc parse*(_: typedesc[YankInstanceChardev], n: JsonNode): YankInstanceChardev =
  result = default(YankInstanceChardev)
  result.id = n["id"].getStr

proc `%`*(x: YankInstance): JsonNode =
  result = newJObject()
  result["type"] = %($x.`type`)
  case x.`type`
  of YankInstanceType.BlockNode:
    let sub = %(x.blockNode)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of YankInstanceType.Chardev:
    let sub = %(x.chardev)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of YankInstanceType.Migration: discard

proc parse*(_: typedesc[YankInstance], n: JsonNode): YankInstance =
  result = default(YankInstance)
  let tag = parse(typedesc[YankInstanceType], n["type"])
  case tag
  of YankInstanceType.BlockNode:
    result = YankInstance(`type`: tag, blockNode: parse(typedesc[YankInstanceBlockNode], n))
  of YankInstanceType.Chardev:
    result = YankInstance(`type`: tag, chardev: parse(typedesc[YankInstanceChardev], n))
  of YankInstanceType.Migration:
    result = YankInstance(`type`: tag)

proc `%`*(x: NameInfo): JsonNode =
  result = newJObject()
  if x.name.isSome: result["name"] = %(x.name.get)

proc parse*(_: typedesc[NameInfo], n: JsonNode): NameInfo =
  result = default(NameInfo)
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)

proc `%`*(x: IOThreadInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["thread-id"] = %(x.threadId)
  result["poll-max-ns"] = %(x.pollMaxNs)
  result["poll-grow"] = %(x.pollGrow)
  result["poll-shrink"] = %(x.pollShrink)
  result["aio-max-batch"] = %(x.aioMaxBatch)

proc parse*(_: typedesc[IOThreadInfo], n: JsonNode): IOThreadInfo =
  result = default(IOThreadInfo)
  result.id = n["id"].getStr
  result.threadId = int64(n["thread-id"].getBiggestInt)
  result.pollMaxNs = int64(n["poll-max-ns"].getBiggestInt)
  result.pollGrow = int64(n["poll-grow"].getBiggestInt)
  result.pollShrink = int64(n["poll-shrink"].getBiggestInt)
  result.aioMaxBatch = int64(n["aio-max-batch"].getBiggestInt)

proc `%`*(x: AddfdInfo): JsonNode =
  result = newJObject()
  result["fdset-id"] = %(x.fdsetId)
  result["fd"] = %(x.fd)

proc parse*(_: typedesc[AddfdInfo], n: JsonNode): AddfdInfo =
  result = default(AddfdInfo)
  result.fdsetId = int64(n["fdset-id"].getBiggestInt)
  result.fd = int64(n["fd"].getBiggestInt)

proc `%`*(x: FdsetFdInfo): JsonNode =
  result = newJObject()
  result["fd"] = %(x.fd)
  if x.opaque.isSome: result["opaque"] = %(x.opaque.get)

proc parse*(_: typedesc[FdsetFdInfo], n: JsonNode): FdsetFdInfo =
  result = default(FdsetFdInfo)
  result.fd = int64(n["fd"].getBiggestInt)
  if n.hasKey("opaque") and n["opaque"].kind != JNull:
    result.opaque = some(n["opaque"].getStr)

proc `%`*(x: FdsetInfo): JsonNode =
  result = newJObject()
  result["fdset-id"] = %(x.fdsetId)
  result["fds"] = %(x.fds)

proc parse*(_: typedesc[FdsetInfo], n: JsonNode): FdsetInfo =
  result = default(FdsetInfo)
  result.fdsetId = int64(n["fdset-id"].getBiggestInt)
  result.fds = (n["fds"]).getElems.mapIt(parse(typedesc[FdsetFdInfo], it))

proc `%`*(x: CommandLineParameterType): JsonNode = %($x)
proc parse*(_: typedesc[CommandLineParameterType], n: JsonNode): CommandLineParameterType =
  let s = n.getStr
  case s
  of "string": CommandLineParameterType.String
  of "boolean": CommandLineParameterType.Boolean
  of "number": CommandLineParameterType.Number
  of "size": CommandLineParameterType.Size
  else: raise newException(ValueError, "unknown CommandLineParameterType: " & s)

proc `%`*(x: CommandLineParameterInfo): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["type"] = %(x.`type`)
  if x.help.isSome: result["help"] = %(x.help.get)
  if x.default.isSome: result["default"] = %(x.default.get)

proc parse*(_: typedesc[CommandLineParameterInfo], n: JsonNode): CommandLineParameterInfo =
  result = default(CommandLineParameterInfo)
  result.name = n["name"].getStr
  result.`type` = parse(typedesc[CommandLineParameterType], n["type"])
  if n.hasKey("help") and n["help"].kind != JNull:
    result.help = some(n["help"].getStr)
  if n.hasKey("default") and n["default"].kind != JNull:
    result.default = some(n["default"].getStr)

proc `%`*(x: CommandLineOptionInfo): JsonNode =
  result = newJObject()
  result["option"] = %(x.option)
  result["parameters"] = %(x.parameters)

proc parse*(_: typedesc[CommandLineOptionInfo], n: JsonNode): CommandLineOptionInfo =
  result = default(CommandLineOptionInfo)
  result.option = n["option"].getStr
  result.parameters = (n["parameters"]).getElems.mapIt(parse(typedesc[CommandLineParameterInfo], it))

proc `%`*(x: GICCapability): JsonNode =
  result = newJObject()
  result["version"] = %(x.version)
  result["emulated"] = %(x.emulated)
  result["kernel"] = %(x.kernel)

proc parse*(_: typedesc[GICCapability], n: JsonNode): GICCapability =
  result = default(GICCapability)
  result.version = int64(n["version"].getBiggestInt)
  result.emulated = n["emulated"].getBool
  result.kernel = n["kernel"].getBool

proc `%`*(x: SsidSizeMode): JsonNode = %($x)
proc parse*(_: typedesc[SsidSizeMode], n: JsonNode): SsidSizeMode =
  let s = n.getStr
  case s
  of "auto": SsidSizeMode.Auto
  of "0": SsidSizeMode.V0
  of "1": SsidSizeMode.V1
  of "2": SsidSizeMode.V2
  of "3": SsidSizeMode.V3
  of "4": SsidSizeMode.V4
  of "5": SsidSizeMode.V5
  of "6": SsidSizeMode.V6
  of "7": SsidSizeMode.V7
  of "8": SsidSizeMode.V8
  of "9": SsidSizeMode.V9
  of "10": SsidSizeMode.V10
  of "11": SsidSizeMode.V11
  of "12": SsidSizeMode.V12
  of "13": SsidSizeMode.V13
  of "14": SsidSizeMode.V14
  of "15": SsidSizeMode.V15
  of "16": SsidSizeMode.V16
  of "17": SsidSizeMode.V17
  of "18": SsidSizeMode.V18
  of "19": SsidSizeMode.V19
  of "20": SsidSizeMode.V20
  else: raise newException(ValueError, "unknown SsidSizeMode: " & s)

proc `%`*(x: OasMode): JsonNode = %($x)
proc parse*(_: typedesc[OasMode], n: JsonNode): OasMode =
  let s = n.getStr
  case s
  of "auto": OasMode.Auto
  of "32": OasMode.V32
  of "36": OasMode.V36
  of "40": OasMode.V40
  of "42": OasMode.V42
  of "44": OasMode.V44
  of "48": OasMode.V48
  of "52": OasMode.V52
  of "56": OasMode.V56
  else: raise newException(ValueError, "unknown OasMode: " & s)

proc `%`*(x: SevState): JsonNode = %($x)
proc parse*(_: typedesc[SevState], n: JsonNode): SevState =
  let s = n.getStr
  case s
  of "uninit": SevState.Uninit
  of "launch-update": SevState.LaunchUpdate
  of "launch-secret": SevState.LaunchSecret
  of "running": SevState.Running
  of "send-update": SevState.SendUpdate
  of "receive-update": SevState.ReceiveUpdate
  else: raise newException(ValueError, "unknown SevState: " & s)

proc `%`*(x: SevGuestType): JsonNode = %($x)
proc parse*(_: typedesc[SevGuestType], n: JsonNode): SevGuestType =
  let s = n.getStr
  case s
  of "sev": SevGuestType.Sev
  of "sev-snp": SevGuestType.SevSnp
  else: raise newException(ValueError, "unknown SevGuestType: " & s)

proc `%`*(x: SevGuestInfo): JsonNode =
  result = newJObject()
  result["policy"] = %(x.policy)
  result["handle"] = %(x.handle)

proc parse*(_: typedesc[SevGuestInfo], n: JsonNode): SevGuestInfo =
  result = default(SevGuestInfo)
  result.policy = uint32(n["policy"].getBiggestInt)
  result.handle = uint32(n["handle"].getBiggestInt)

proc `%`*(x: SevSnpGuestInfo): JsonNode =
  result = newJObject()
  result["snp-policy"] = %(x.snpPolicy)

proc parse*(_: typedesc[SevSnpGuestInfo], n: JsonNode): SevSnpGuestInfo =
  result = default(SevSnpGuestInfo)
  result.snpPolicy = cast[uint64](n["snp-policy"].getBiggestInt)

proc `%`*(x: SevInfo): JsonNode =
  result = newJObject()
  result["enabled"] = %(x.enabled)
  result["api-major"] = %(x.apiMajor)
  result["api-minor"] = %(x.apiMinor)
  result["build-id"] = %(x.buildId)
  result["state"] = %(x.state)
  result["sev-type"] = %($x.sevType)
  case x.sevType
  of SevGuestType.Sev:
    let sub = %(x.sev)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of SevGuestType.SevSnp:
    let sub = %(x.sevSnp)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[SevInfo], n: JsonNode): SevInfo =
  result = default(SevInfo)
  let tag = parse(typedesc[SevGuestType], n["sev-type"])
  case tag
  of SevGuestType.Sev:
    result = SevInfo(sevType: tag, sev: parse(typedesc[SevGuestInfo], n))
  of SevGuestType.SevSnp:
    result = SevInfo(sevType: tag, sevSnp: parse(typedesc[SevSnpGuestInfo], n))
  result.enabled = n["enabled"].getBool
  result.apiMajor = uint8(n["api-major"].getBiggestInt)
  result.apiMinor = uint8(n["api-minor"].getBiggestInt)
  result.buildId = uint8(n["build-id"].getBiggestInt)
  result.state = parse(typedesc[SevState], n["state"])

proc `%`*(x: SevLaunchMeasureInfo): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[SevLaunchMeasureInfo], n: JsonNode): SevLaunchMeasureInfo =
  result = default(SevLaunchMeasureInfo)
  result.data = n["data"].getStr

proc `%`*(x: SevCapability): JsonNode =
  result = newJObject()
  result["pdh"] = %(x.pdh)
  result["cert-chain"] = %(x.certChain)
  result["cpu0-id"] = %(x.cpu0Id)
  result["cbitpos"] = %(x.cbitpos)
  result["reduced-phys-bits"] = %(x.reducedPhysBits)

proc parse*(_: typedesc[SevCapability], n: JsonNode): SevCapability =
  result = default(SevCapability)
  result.pdh = n["pdh"].getStr
  result.certChain = n["cert-chain"].getStr
  result.cpu0Id = n["cpu0-id"].getStr
  result.cbitpos = int64(n["cbitpos"].getBiggestInt)
  result.reducedPhysBits = int64(n["reduced-phys-bits"].getBiggestInt)

proc `%`*(x: SevAttestationReport): JsonNode =
  result = newJObject()
  result["data"] = %(x.data)

proc parse*(_: typedesc[SevAttestationReport], n: JsonNode): SevAttestationReport =
  result = default(SevAttestationReport)
  result.data = n["data"].getStr

proc `%`*(x: SgxEpcSection): JsonNode =
  result = newJObject()
  result["node"] = %(x.node)
  result["size"] = %(x.size)

proc parse*(_: typedesc[SgxEpcSection], n: JsonNode): SgxEpcSection =
  result = default(SgxEpcSection)
  result.node = int64(n["node"].getBiggestInt)
  result.size = cast[uint64](n["size"].getBiggestInt)

proc `%`*(x: SgxInfo): JsonNode =
  result = newJObject()
  result["sgx"] = %(x.sgx)
  result["sgx1"] = %(x.sgx1)
  result["sgx2"] = %(x.sgx2)
  result["flc"] = %(x.flc)
  result["sections"] = %(x.sections)

proc parse*(_: typedesc[SgxInfo], n: JsonNode): SgxInfo =
  result = default(SgxInfo)
  result.sgx = n["sgx"].getBool
  result.sgx1 = n["sgx1"].getBool
  result.sgx2 = n["sgx2"].getBool
  result.flc = n["flc"].getBool
  result.sections = (n["sections"]).getElems.mapIt(parse(typedesc[SgxEpcSection], it))

proc `%`*(x: EvtchnPortType): JsonNode = %($x)
proc parse*(_: typedesc[EvtchnPortType], n: JsonNode): EvtchnPortType =
  let s = n.getStr
  case s
  of "closed": EvtchnPortType.Closed
  of "unbound": EvtchnPortType.Unbound
  of "interdomain": EvtchnPortType.Interdomain
  of "pirq": EvtchnPortType.Pirq
  of "virq": EvtchnPortType.Virq
  of "ipi": EvtchnPortType.Ipi
  else: raise newException(ValueError, "unknown EvtchnPortType: " & s)

proc `%`*(x: EvtchnInfo): JsonNode =
  result = newJObject()
  result["port"] = %(x.port)
  result["vcpu"] = %(x.vcpu)
  result["type"] = %(x.`type`)
  result["remote-domain"] = %(x.remoteDomain)
  result["target"] = %(x.target)
  result["pending"] = %(x.pending)
  result["masked"] = %(x.masked)

proc parse*(_: typedesc[EvtchnInfo], n: JsonNode): EvtchnInfo =
  result = default(EvtchnInfo)
  result.port = uint16(n["port"].getBiggestInt)
  result.vcpu = uint32(n["vcpu"].getBiggestInt)
  result.`type` = parse(typedesc[EvtchnPortType], n["type"])
  result.remoteDomain = n["remote-domain"].getStr
  result.target = uint16(n["target"].getBiggestInt)
  result.pending = n["pending"].getBool
  result.masked = n["masked"].getBool

proc `%`*(x: AudiodevPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)

proc parse*(_: typedesc[AudiodevPerDirectionOptions], n: JsonNode): AudiodevPerDirectionOptions =
  result = default(AudiodevPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))

proc `%`*(x: AudiodevGenericOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)

proc parse*(_: typedesc[AudiodevGenericOptions], n: JsonNode): AudiodevGenericOptions =
  result = default(AudiodevGenericOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPerDirectionOptions], n["out"]))

proc `%`*(x: AudiodevDBusOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.nsamples.isSome: result["nsamples"] = %(x.nsamples.get)

proc parse*(_: typedesc[AudiodevDBusOptions], n: JsonNode): AudiodevDBusOptions =
  result = default(AudiodevDBusOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPerDirectionOptions], n["out"]))
  if n.hasKey("nsamples") and n["nsamples"].kind != JNull:
    result.nsamples = some(uint32(n["nsamples"].getBiggestInt))

proc `%`*(x: AudiodevAlsaPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.dev.isSome: result["dev"] = %(x.dev.get)
  if x.periodLength.isSome: result["period-length"] = %(x.periodLength.get)
  if x.tryPoll.isSome: result["try-poll"] = %(x.tryPoll.get)

proc parse*(_: typedesc[AudiodevAlsaPerDirectionOptions], n: JsonNode): AudiodevAlsaPerDirectionOptions =
  result = default(AudiodevAlsaPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("dev") and n["dev"].kind != JNull:
    result.dev = some(n["dev"].getStr)
  if n.hasKey("period-length") and n["period-length"].kind != JNull:
    result.periodLength = some(uint32(n["period-length"].getBiggestInt))
  if n.hasKey("try-poll") and n["try-poll"].kind != JNull:
    result.tryPoll = some(n["try-poll"].getBool)

proc `%`*(x: AudiodevAlsaOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.threshold.isSome: result["threshold"] = %(x.threshold.get)

proc parse*(_: typedesc[AudiodevAlsaOptions], n: JsonNode): AudiodevAlsaOptions =
  result = default(AudiodevAlsaOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevAlsaPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevAlsaPerDirectionOptions], n["out"]))
  if n.hasKey("threshold") and n["threshold"].kind != JNull:
    result.threshold = some(uint32(n["threshold"].getBiggestInt))

proc `%`*(x: AudiodevSndioOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.dev.isSome: result["dev"] = %(x.dev.get)
  if x.latency.isSome: result["latency"] = %(x.latency.get)

proc parse*(_: typedesc[AudiodevSndioOptions], n: JsonNode): AudiodevSndioOptions =
  result = default(AudiodevSndioOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPerDirectionOptions], n["out"]))
  if n.hasKey("dev") and n["dev"].kind != JNull:
    result.dev = some(n["dev"].getStr)
  if n.hasKey("latency") and n["latency"].kind != JNull:
    result.latency = some(uint32(n["latency"].getBiggestInt))

proc `%`*(x: AudiodevCoreaudioPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.bufferCount.isSome: result["buffer-count"] = %(x.bufferCount.get)

proc parse*(_: typedesc[AudiodevCoreaudioPerDirectionOptions], n: JsonNode): AudiodevCoreaudioPerDirectionOptions =
  result = default(AudiodevCoreaudioPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("buffer-count") and n["buffer-count"].kind != JNull:
    result.bufferCount = some(uint32(n["buffer-count"].getBiggestInt))

proc `%`*(x: AudiodevCoreaudioOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)

proc parse*(_: typedesc[AudiodevCoreaudioOptions], n: JsonNode): AudiodevCoreaudioOptions =
  result = default(AudiodevCoreaudioOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevCoreaudioPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevCoreaudioPerDirectionOptions], n["out"]))

proc `%`*(x: AudiodevDsoundOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.latency.isSome: result["latency"] = %(x.latency.get)

proc parse*(_: typedesc[AudiodevDsoundOptions], n: JsonNode): AudiodevDsoundOptions =
  result = default(AudiodevDsoundOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPerDirectionOptions], n["out"]))
  if n.hasKey("latency") and n["latency"].kind != JNull:
    result.latency = some(uint32(n["latency"].getBiggestInt))

proc `%`*(x: AudiodevJackPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.serverName.isSome: result["server-name"] = %(x.serverName.get)
  if x.clientName.isSome: result["client-name"] = %(x.clientName.get)
  if x.connectPorts.isSome: result["connect-ports"] = %(x.connectPorts.get)
  if x.startServer.isSome: result["start-server"] = %(x.startServer.get)
  if x.exactName.isSome: result["exact-name"] = %(x.exactName.get)

proc parse*(_: typedesc[AudiodevJackPerDirectionOptions], n: JsonNode): AudiodevJackPerDirectionOptions =
  result = default(AudiodevJackPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("server-name") and n["server-name"].kind != JNull:
    result.serverName = some(n["server-name"].getStr)
  if n.hasKey("client-name") and n["client-name"].kind != JNull:
    result.clientName = some(n["client-name"].getStr)
  if n.hasKey("connect-ports") and n["connect-ports"].kind != JNull:
    result.connectPorts = some(n["connect-ports"].getStr)
  if n.hasKey("start-server") and n["start-server"].kind != JNull:
    result.startServer = some(n["start-server"].getBool)
  if n.hasKey("exact-name") and n["exact-name"].kind != JNull:
    result.exactName = some(n["exact-name"].getBool)

proc `%`*(x: AudiodevJackOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)

proc parse*(_: typedesc[AudiodevJackOptions], n: JsonNode): AudiodevJackOptions =
  result = default(AudiodevJackOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevJackPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevJackPerDirectionOptions], n["out"]))

proc `%`*(x: AudiodevOssPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.dev.isSome: result["dev"] = %(x.dev.get)
  if x.bufferCount.isSome: result["buffer-count"] = %(x.bufferCount.get)
  if x.tryPoll.isSome: result["try-poll"] = %(x.tryPoll.get)

proc parse*(_: typedesc[AudiodevOssPerDirectionOptions], n: JsonNode): AudiodevOssPerDirectionOptions =
  result = default(AudiodevOssPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("dev") and n["dev"].kind != JNull:
    result.dev = some(n["dev"].getStr)
  if n.hasKey("buffer-count") and n["buffer-count"].kind != JNull:
    result.bufferCount = some(uint32(n["buffer-count"].getBiggestInt))
  if n.hasKey("try-poll") and n["try-poll"].kind != JNull:
    result.tryPoll = some(n["try-poll"].getBool)

proc `%`*(x: AudiodevOssOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.tryMmap.isSome: result["try-mmap"] = %(x.tryMmap.get)
  if x.exclusive.isSome: result["exclusive"] = %(x.exclusive.get)
  if x.dspPolicy.isSome: result["dsp-policy"] = %(x.dspPolicy.get)

proc parse*(_: typedesc[AudiodevOssOptions], n: JsonNode): AudiodevOssOptions =
  result = default(AudiodevOssOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevOssPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevOssPerDirectionOptions], n["out"]))
  if n.hasKey("try-mmap") and n["try-mmap"].kind != JNull:
    result.tryMmap = some(n["try-mmap"].getBool)
  if n.hasKey("exclusive") and n["exclusive"].kind != JNull:
    result.exclusive = some(n["exclusive"].getBool)
  if n.hasKey("dsp-policy") and n["dsp-policy"].kind != JNull:
    result.dspPolicy = some(uint32(n["dsp-policy"].getBiggestInt))

proc `%`*(x: AudiodevPaPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.name.isSome: result["name"] = %(x.name.get)
  if x.streamName.isSome: result["stream-name"] = %(x.streamName.get)
  if x.latency.isSome: result["latency"] = %(x.latency.get)

proc parse*(_: typedesc[AudiodevPaPerDirectionOptions], n: JsonNode): AudiodevPaPerDirectionOptions =
  result = default(AudiodevPaPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  if n.hasKey("stream-name") and n["stream-name"].kind != JNull:
    result.streamName = some(n["stream-name"].getStr)
  if n.hasKey("latency") and n["latency"].kind != JNull:
    result.latency = some(uint32(n["latency"].getBiggestInt))

proc `%`*(x: AudiodevPaOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.server.isSome: result["server"] = %(x.server.get)

proc parse*(_: typedesc[AudiodevPaOptions], n: JsonNode): AudiodevPaOptions =
  result = default(AudiodevPaOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPaPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPaPerDirectionOptions], n["out"]))
  if n.hasKey("server") and n["server"].kind != JNull:
    result.server = some(n["server"].getStr)

proc `%`*(x: AudiodevPipewirePerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.name.isSome: result["name"] = %(x.name.get)
  if x.streamName.isSome: result["stream-name"] = %(x.streamName.get)
  if x.latency.isSome: result["latency"] = %(x.latency.get)

proc parse*(_: typedesc[AudiodevPipewirePerDirectionOptions], n: JsonNode): AudiodevPipewirePerDirectionOptions =
  result = default(AudiodevPipewirePerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("name") and n["name"].kind != JNull:
    result.name = some(n["name"].getStr)
  if n.hasKey("stream-name") and n["stream-name"].kind != JNull:
    result.streamName = some(n["stream-name"].getStr)
  if n.hasKey("latency") and n["latency"].kind != JNull:
    result.latency = some(uint32(n["latency"].getBiggestInt))

proc `%`*(x: AudiodevPipewireOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)

proc parse*(_: typedesc[AudiodevPipewireOptions], n: JsonNode): AudiodevPipewireOptions =
  result = default(AudiodevPipewireOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPipewirePerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPipewirePerDirectionOptions], n["out"]))

proc `%`*(x: AudiodevSdlPerDirectionOptions): JsonNode =
  result = newJObject()
  if x.mixingEngine.isSome: result["mixing-engine"] = %(x.mixingEngine.get)
  if x.fixedSettings.isSome: result["fixed-settings"] = %(x.fixedSettings.get)
  if x.frequency.isSome: result["frequency"] = %(x.frequency.get)
  if x.channels.isSome: result["channels"] = %(x.channels.get)
  if x.voices.isSome: result["voices"] = %(x.voices.get)
  if x.format.isSome: result["format"] = %(x.format.get)
  if x.bufferLength.isSome: result["buffer-length"] = %(x.bufferLength.get)
  if x.bufferCount.isSome: result["buffer-count"] = %(x.bufferCount.get)

proc parse*(_: typedesc[AudiodevSdlPerDirectionOptions], n: JsonNode): AudiodevSdlPerDirectionOptions =
  result = default(AudiodevSdlPerDirectionOptions)
  if n.hasKey("mixing-engine") and n["mixing-engine"].kind != JNull:
    result.mixingEngine = some(n["mixing-engine"].getBool)
  if n.hasKey("fixed-settings") and n["fixed-settings"].kind != JNull:
    result.fixedSettings = some(n["fixed-settings"].getBool)
  if n.hasKey("frequency") and n["frequency"].kind != JNull:
    result.frequency = some(uint32(n["frequency"].getBiggestInt))
  if n.hasKey("channels") and n["channels"].kind != JNull:
    result.channels = some(uint32(n["channels"].getBiggestInt))
  if n.hasKey("voices") and n["voices"].kind != JNull:
    result.voices = some(uint32(n["voices"].getBiggestInt))
  if n.hasKey("format") and n["format"].kind != JNull:
    result.format = some(parse(typedesc[AudioFormat], n["format"]))
  if n.hasKey("buffer-length") and n["buffer-length"].kind != JNull:
    result.bufferLength = some(uint32(n["buffer-length"].getBiggestInt))
  if n.hasKey("buffer-count") and n["buffer-count"].kind != JNull:
    result.bufferCount = some(uint32(n["buffer-count"].getBiggestInt))

proc `%`*(x: AudiodevSdlOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)

proc parse*(_: typedesc[AudiodevSdlOptions], n: JsonNode): AudiodevSdlOptions =
  result = default(AudiodevSdlOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevSdlPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevSdlPerDirectionOptions], n["out"]))

proc `%`*(x: AudiodevWavOptions): JsonNode =
  result = newJObject()
  if x.`in`.isSome: result["in"] = %(x.`in`.get)
  if x.`out`.isSome: result["out"] = %(x.`out`.get)
  if x.path.isSome: result["path"] = %(x.path.get)

proc parse*(_: typedesc[AudiodevWavOptions], n: JsonNode): AudiodevWavOptions =
  result = default(AudiodevWavOptions)
  if n.hasKey("in") and n["in"].kind != JNull:
    result.`in` = some(parse(typedesc[AudiodevPerDirectionOptions], n["in"]))
  if n.hasKey("out") and n["out"].kind != JNull:
    result.`out` = some(parse(typedesc[AudiodevPerDirectionOptions], n["out"]))
  if n.hasKey("path") and n["path"].kind != JNull:
    result.path = some(n["path"].getStr)

proc `%`*(x: AudioFormat): JsonNode = %($x)
proc parse*(_: typedesc[AudioFormat], n: JsonNode): AudioFormat =
  let s = n.getStr
  case s
  of "u8": AudioFormat.U8
  of "s8": AudioFormat.S8
  of "u16": AudioFormat.U16
  of "s16": AudioFormat.S16
  of "u32": AudioFormat.U32
  of "s32": AudioFormat.S32
  of "f32": AudioFormat.F32
  else: raise newException(ValueError, "unknown AudioFormat: " & s)

proc `%`*(x: AudiodevDriver): JsonNode = %($x)
proc parse*(_: typedesc[AudiodevDriver], n: JsonNode): AudiodevDriver =
  let s = n.getStr
  case s
  of "none": AudiodevDriver.None
  of "alsa": AudiodevDriver.Alsa
  of "coreaudio": AudiodevDriver.Coreaudio
  of "dbus": AudiodevDriver.Dbus
  of "dsound": AudiodevDriver.Dsound
  of "jack": AudiodevDriver.Jack
  of "oss": AudiodevDriver.Oss
  of "pa": AudiodevDriver.Pa
  of "pipewire": AudiodevDriver.Pipewire
  of "sdl": AudiodevDriver.Sdl
  of "sndio": AudiodevDriver.Sndio
  of "spice": AudiodevDriver.Spice
  of "wav": AudiodevDriver.Wav
  else: raise newException(ValueError, "unknown AudiodevDriver: " & s)

proc `%`*(x: Audiodev): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  if x.timerPeriod.isSome: result["timer-period"] = %(x.timerPeriod.get)
  result["driver"] = %($x.driver)
  case x.driver
  of AudiodevDriver.None:
    let sub = %(x.none)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Alsa:
    let sub = %(x.alsa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Coreaudio:
    let sub = %(x.coreaudio)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Dbus:
    let sub = %(x.dbus)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Dsound:
    let sub = %(x.dsound)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Jack:
    let sub = %(x.jack)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Oss:
    let sub = %(x.oss)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Pa:
    let sub = %(x.pa)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Pipewire:
    let sub = %(x.pipewire)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Sdl:
    let sub = %(x.sdl)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Sndio:
    let sub = %(x.sndio)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Spice:
    let sub = %(x.spice)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of AudiodevDriver.Wav:
    let sub = %(x.wav)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub

proc parse*(_: typedesc[Audiodev], n: JsonNode): Audiodev =
  result = default(Audiodev)
  let tag = parse(typedesc[AudiodevDriver], n["driver"])
  case tag
  of AudiodevDriver.None:
    result = Audiodev(driver: tag, none: parse(typedesc[AudiodevGenericOptions], n))
  of AudiodevDriver.Alsa:
    result = Audiodev(driver: tag, alsa: parse(typedesc[AudiodevAlsaOptions], n))
  of AudiodevDriver.Coreaudio:
    result = Audiodev(driver: tag, coreaudio: parse(typedesc[AudiodevCoreaudioOptions], n))
  of AudiodevDriver.Dbus:
    result = Audiodev(driver: tag, dbus: parse(typedesc[AudiodevDBusOptions], n))
  of AudiodevDriver.Dsound:
    result = Audiodev(driver: tag, dsound: parse(typedesc[AudiodevDsoundOptions], n))
  of AudiodevDriver.Jack:
    result = Audiodev(driver: tag, jack: parse(typedesc[AudiodevJackOptions], n))
  of AudiodevDriver.Oss:
    result = Audiodev(driver: tag, oss: parse(typedesc[AudiodevOssOptions], n))
  of AudiodevDriver.Pa:
    result = Audiodev(driver: tag, pa: parse(typedesc[AudiodevPaOptions], n))
  of AudiodevDriver.Pipewire:
    result = Audiodev(driver: tag, pipewire: parse(typedesc[AudiodevPipewireOptions], n))
  of AudiodevDriver.Sdl:
    result = Audiodev(driver: tag, sdl: parse(typedesc[AudiodevSdlOptions], n))
  of AudiodevDriver.Sndio:
    result = Audiodev(driver: tag, sndio: parse(typedesc[AudiodevSndioOptions], n))
  of AudiodevDriver.Spice:
    result = Audiodev(driver: tag, spice: parse(typedesc[AudiodevGenericOptions], n))
  of AudiodevDriver.Wav:
    result = Audiodev(driver: tag, wav: parse(typedesc[AudiodevWavOptions], n))
  result.id = n["id"].getStr
  if n.hasKey("timer-period") and n["timer-period"].kind != JNull:
    result.timerPeriod = some(uint32(n["timer-period"].getBiggestInt))

proc `%`*(x: AcpiTableOptions): JsonNode =
  result = newJObject()
  if x.sig.isSome: result["sig"] = %(x.sig.get)
  if x.rev.isSome: result["rev"] = %(x.rev.get)
  if x.oemId.isSome: result["oem_id"] = %(x.oemId.get)
  if x.oemTableId.isSome: result["oem_table_id"] = %(x.oemTableId.get)
  if x.oemRev.isSome: result["oem_rev"] = %(x.oemRev.get)
  if x.aslCompilerId.isSome: result["asl_compiler_id"] = %(x.aslCompilerId.get)
  if x.aslCompilerRev.isSome: result["asl_compiler_rev"] = %(x.aslCompilerRev.get)
  if x.file.isSome: result["file"] = %(x.file.get)
  if x.data.isSome: result["data"] = %(x.data.get)

proc parse*(_: typedesc[AcpiTableOptions], n: JsonNode): AcpiTableOptions =
  result = default(AcpiTableOptions)
  if n.hasKey("sig") and n["sig"].kind != JNull:
    result.sig = some(n["sig"].getStr)
  if n.hasKey("rev") and n["rev"].kind != JNull:
    result.rev = some(uint8(n["rev"].getBiggestInt))
  if n.hasKey("oem_id") and n["oem_id"].kind != JNull:
    result.oemId = some(n["oem_id"].getStr)
  if n.hasKey("oem_table_id") and n["oem_table_id"].kind != JNull:
    result.oemTableId = some(n["oem_table_id"].getStr)
  if n.hasKey("oem_rev") and n["oem_rev"].kind != JNull:
    result.oemRev = some(uint32(n["oem_rev"].getBiggestInt))
  if n.hasKey("asl_compiler_id") and n["asl_compiler_id"].kind != JNull:
    result.aslCompilerId = some(n["asl_compiler_id"].getStr)
  if n.hasKey("asl_compiler_rev") and n["asl_compiler_rev"].kind != JNull:
    result.aslCompilerRev = some(uint32(n["asl_compiler_rev"].getBiggestInt))
  if n.hasKey("file") and n["file"].kind != JNull:
    result.file = some(n["file"].getStr)
  if n.hasKey("data") and n["data"].kind != JNull:
    result.data = some(n["data"].getStr)

proc `%`*(x: ACPISlotType): JsonNode = %($x)
proc parse*(_: typedesc[ACPISlotType], n: JsonNode): ACPISlotType =
  let s = n.getStr
  case s
  of "DIMM": ACPISlotType.DIMM
  of "CPU": ACPISlotType.CPU
  else: raise newException(ValueError, "unknown ACPISlotType: " & s)

proc `%`*(x: ACPIOSTInfo): JsonNode =
  result = newJObject()
  if x.device.isSome: result["device"] = %(x.device.get)
  result["slot"] = %(x.slot)
  result["slot-type"] = %(x.slotType)
  result["source"] = %(x.source)
  result["status"] = %(x.status)

proc parse*(_: typedesc[ACPIOSTInfo], n: JsonNode): ACPIOSTInfo =
  result = default(ACPIOSTInfo)
  if n.hasKey("device") and n["device"].kind != JNull:
    result.device = some(n["device"].getStr)
  result.slot = n["slot"].getStr
  result.slotType = parse(typedesc[ACPISlotType], n["slot-type"])
  result.source = int64(n["source"].getBiggestInt)
  result.status = int64(n["status"].getBiggestInt)

proc `%`*(x: PciMemoryRange): JsonNode =
  result = newJObject()
  result["base"] = %(x.base)
  result["limit"] = %(x.limit)

proc parse*(_: typedesc[PciMemoryRange], n: JsonNode): PciMemoryRange =
  result = default(PciMemoryRange)
  result.base = int64(n["base"].getBiggestInt)
  result.limit = int64(n["limit"].getBiggestInt)

proc `%`*(x: PciMemoryRegion): JsonNode =
  result = newJObject()
  result["bar"] = %(x.bar)
  result["type"] = %(x.`type`)
  result["address"] = %(x.address)
  result["size"] = %(x.size)
  if x.prefetch.isSome: result["prefetch"] = %(x.prefetch.get)
  if x.memType64.isSome: result["mem_type_64"] = %(x.memType64.get)

proc parse*(_: typedesc[PciMemoryRegion], n: JsonNode): PciMemoryRegion =
  result = default(PciMemoryRegion)
  result.bar = int64(n["bar"].getBiggestInt)
  result.`type` = n["type"].getStr
  result.address = int64(n["address"].getBiggestInt)
  result.size = int64(n["size"].getBiggestInt)
  if n.hasKey("prefetch") and n["prefetch"].kind != JNull:
    result.prefetch = some(n["prefetch"].getBool)
  if n.hasKey("mem_type_64") and n["mem_type_64"].kind != JNull:
    result.memType64 = some(n["mem_type_64"].getBool)

proc `%`*(x: PciBusInfo): JsonNode =
  result = newJObject()
  result["number"] = %(x.number)
  result["secondary"] = %(x.secondary)
  result["subordinate"] = %(x.subordinate)
  result["io_range"] = %(x.ioRange)
  result["memory_range"] = %(x.memoryRange)
  result["prefetchable_range"] = %(x.prefetchableRange)

proc parse*(_: typedesc[PciBusInfo], n: JsonNode): PciBusInfo =
  result = default(PciBusInfo)
  result.number = int64(n["number"].getBiggestInt)
  result.secondary = int64(n["secondary"].getBiggestInt)
  result.subordinate = int64(n["subordinate"].getBiggestInt)
  result.ioRange = parse(typedesc[PciMemoryRange], n["io_range"])
  result.memoryRange = parse(typedesc[PciMemoryRange], n["memory_range"])
  result.prefetchableRange = parse(typedesc[PciMemoryRange], n["prefetchable_range"])

proc `%`*(x: PciBridgeInfo): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["bus"] = %(x.bus)
  if x.devices.isSome: result["devices"] = %(x.devices.get)

proc parse*(_: typedesc[PciBridgeInfo], n: JsonNode): PciBridgeInfo =
  if n.kind == JNull: return nil
  new(result)
  result.bus = parse(typedesc[PciBusInfo], n["bus"])
  if n.hasKey("devices") and n["devices"].kind != JNull:
    result.devices = some((n["devices"]).getElems.mapIt(parse(typedesc[PciDeviceInfo], it)))

proc `%`*(x: PciDeviceClass): JsonNode =
  result = newJObject()
  if x.desc.isSome: result["desc"] = %(x.desc.get)
  result["class"] = %(x.class)

proc parse*(_: typedesc[PciDeviceClass], n: JsonNode): PciDeviceClass =
  result = default(PciDeviceClass)
  if n.hasKey("desc") and n["desc"].kind != JNull:
    result.desc = some(n["desc"].getStr)
  result.class = int64(n["class"].getBiggestInt)

proc `%`*(x: PciDeviceId): JsonNode =
  result = newJObject()
  result["device"] = %(x.device)
  result["vendor"] = %(x.vendor)
  if x.subsystem.isSome: result["subsystem"] = %(x.subsystem.get)
  if x.subsystemVendor.isSome: result["subsystem-vendor"] = %(x.subsystemVendor.get)

proc parse*(_: typedesc[PciDeviceId], n: JsonNode): PciDeviceId =
  result = default(PciDeviceId)
  result.device = int64(n["device"].getBiggestInt)
  result.vendor = int64(n["vendor"].getBiggestInt)
  if n.hasKey("subsystem") and n["subsystem"].kind != JNull:
    result.subsystem = some(int64(n["subsystem"].getBiggestInt))
  if n.hasKey("subsystem-vendor") and n["subsystem-vendor"].kind != JNull:
    result.subsystemVendor = some(int64(n["subsystem-vendor"].getBiggestInt))

proc `%`*(x: PciDeviceInfo): JsonNode =
  if x.isNil: return newJNull()
  result = newJObject()
  result["bus"] = %(x.bus)
  result["slot"] = %(x.slot)
  result["function"] = %(x.function)
  result["class_info"] = %(x.classInfo)
  result["id"] = %(x.id)
  if x.irq.isSome: result["irq"] = %(x.irq.get)
  result["irq_pin"] = %(x.irqPin)
  result["qdev_id"] = %(x.qdevId)
  if x.pciBridge.isSome: result["pci_bridge"] = %(x.pciBridge.get)
  result["regions"] = %(x.regions)

proc parse*(_: typedesc[PciDeviceInfo], n: JsonNode): PciDeviceInfo =
  if n.kind == JNull: return nil
  new(result)
  result.bus = int64(n["bus"].getBiggestInt)
  result.slot = int64(n["slot"].getBiggestInt)
  result.function = int64(n["function"].getBiggestInt)
  result.classInfo = parse(typedesc[PciDeviceClass], n["class_info"])
  result.id = parse(typedesc[PciDeviceId], n["id"])
  if n.hasKey("irq") and n["irq"].kind != JNull:
    result.irq = some(int64(n["irq"].getBiggestInt))
  result.irqPin = int64(n["irq_pin"].getBiggestInt)
  result.qdevId = n["qdev_id"].getStr
  if n.hasKey("pci_bridge") and n["pci_bridge"].kind != JNull:
    result.pciBridge = some(parse(typedesc[PciBridgeInfo], n["pci_bridge"]))
  result.regions = (n["regions"]).getElems.mapIt(parse(typedesc[PciMemoryRegion], it))

proc `%`*(x: PciInfo): JsonNode =
  result = newJObject()
  result["bus"] = %(x.bus)
  result["devices"] = %(x.devices)

proc parse*(_: typedesc[PciInfo], n: JsonNode): PciInfo =
  result = default(PciInfo)
  result.bus = int64(n["bus"].getBiggestInt)
  result.devices = (n["devices"]).getElems.mapIt(parse(typedesc[PciDeviceInfo], it))

proc `%`*(x: StatsType): JsonNode = %($x)
proc parse*(_: typedesc[StatsType], n: JsonNode): StatsType =
  let s = n.getStr
  case s
  of "cumulative": StatsType.Cumulative
  of "instant": StatsType.Instant
  of "peak": StatsType.Peak
  of "linear-histogram": StatsType.LinearHistogram
  of "log2-histogram": StatsType.Log2Histogram
  else: raise newException(ValueError, "unknown StatsType: " & s)

proc `%`*(x: StatsUnit): JsonNode = %($x)
proc parse*(_: typedesc[StatsUnit], n: JsonNode): StatsUnit =
  let s = n.getStr
  case s
  of "bytes": StatsUnit.Bytes
  of "seconds": StatsUnit.Seconds
  of "cycles": StatsUnit.Cycles
  of "boolean": StatsUnit.Boolean
  else: raise newException(ValueError, "unknown StatsUnit: " & s)

proc `%`*(x: StatsProvider): JsonNode = %($x)
proc parse*(_: typedesc[StatsProvider], n: JsonNode): StatsProvider =
  let s = n.getStr
  case s
  of "kvm": StatsProvider.Kvm
  of "cryptodev": StatsProvider.Cryptodev
  else: raise newException(ValueError, "unknown StatsProvider: " & s)

proc `%`*(x: StatsTarget): JsonNode = %($x)
proc parse*(_: typedesc[StatsTarget], n: JsonNode): StatsTarget =
  let s = n.getStr
  case s
  of "vm": StatsTarget.Vm
  of "vcpu": StatsTarget.Vcpu
  of "cryptodev": StatsTarget.Cryptodev
  else: raise newException(ValueError, "unknown StatsTarget: " & s)

proc `%`*(x: StatsRequest): JsonNode =
  result = newJObject()
  result["provider"] = %(x.provider)
  if x.names.isSome: result["names"] = %(x.names.get)

proc parse*(_: typedesc[StatsRequest], n: JsonNode): StatsRequest =
  result = default(StatsRequest)
  result.provider = parse(typedesc[StatsProvider], n["provider"])
  if n.hasKey("names") and n["names"].kind != JNull:
    result.names = some((n["names"]).getElems.mapIt(it.getStr))

proc `%`*(x: StatsVCPUFilter): JsonNode =
  result = newJObject()
  if x.vcpus.isSome: result["vcpus"] = %(x.vcpus.get)

proc parse*(_: typedesc[StatsVCPUFilter], n: JsonNode): StatsVCPUFilter =
  result = default(StatsVCPUFilter)
  if n.hasKey("vcpus") and n["vcpus"].kind != JNull:
    result.vcpus = some((n["vcpus"]).getElems.mapIt(it.getStr))

proc `%`*(x: StatsFilter): JsonNode =
  result = newJObject()
  if x.providers.isSome: result["providers"] = %(x.providers.get)
  result["target"] = %($x.target)
  case x.target
  of StatsTarget.Vcpu:
    let sub = %(x.vcpu)
    if sub.kind == JObject:
      for k, v in sub.fields: result[k] = v
    else:
      result["data"] = sub
  of StatsTarget.Vm: discard
  of StatsTarget.Cryptodev: discard

proc parse*(_: typedesc[StatsFilter], n: JsonNode): StatsFilter =
  result = default(StatsFilter)
  let tag = parse(typedesc[StatsTarget], n["target"])
  case tag
  of StatsTarget.Vcpu:
    result = StatsFilter(target: tag, vcpu: parse(typedesc[StatsVCPUFilter], n))
  of StatsTarget.Vm:
    result = StatsFilter(target: tag)
  of StatsTarget.Cryptodev:
    result = StatsFilter(target: tag)
  if n.hasKey("providers") and n["providers"].kind != JNull:
    result.providers = some((n["providers"]).getElems.mapIt(parse(typedesc[StatsRequest], it)))

proc `%`*(x: StatsValue): JsonNode =
  case x.kind
  of StatsValueKind.Scalar: %(x.scalar)
  of StatsValueKind.Boolean: %(x.boolean)
  of StatsValueKind.List: %(x.list)

proc parse*(_: typedesc[StatsValue], n: JsonNode): StatsValue =
  result = default(StatsValue)
  if n.kind == JInt:
    result = StatsValue(kind: StatsValueKind.Scalar, scalar: cast[uint64](n.getBiggestInt))
  elif n.kind == JBool:
    result = StatsValue(kind: StatsValueKind.Boolean, boolean: n.getBool)
  elif n.kind == JArray:
    result = StatsValue(kind: StatsValueKind.List, list: (n).getElems.mapIt(cast[uint64](it.getBiggestInt)))
  else: raise newException(ValueError,
      "cannot decode StatsValue from JSON")

proc `%`*(x: Stats): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["value"] = %(x.value)

proc parse*(_: typedesc[Stats], n: JsonNode): Stats =
  result = default(Stats)
  result.name = n["name"].getStr
  result.value = parse(typedesc[StatsValue], n["value"])

proc `%`*(x: StatsResult): JsonNode =
  result = newJObject()
  result["provider"] = %(x.provider)
  if x.qomPath.isSome: result["qom-path"] = %(x.qomPath.get)
  result["stats"] = %(x.stats)

proc parse*(_: typedesc[StatsResult], n: JsonNode): StatsResult =
  result = default(StatsResult)
  result.provider = parse(typedesc[StatsProvider], n["provider"])
  if n.hasKey("qom-path") and n["qom-path"].kind != JNull:
    result.qomPath = some(n["qom-path"].getStr)
  result.stats = (n["stats"]).getElems.mapIt(parse(typedesc[Stats], it))

proc `%`*(x: StatsSchemaValue): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["type"] = %(x.`type`)
  if x.unit.isSome: result["unit"] = %(x.unit.get)
  if x.base.isSome: result["base"] = %(x.base.get)
  result["exponent"] = %(x.exponent)
  if x.bucketSize.isSome: result["bucket-size"] = %(x.bucketSize.get)

proc parse*(_: typedesc[StatsSchemaValue], n: JsonNode): StatsSchemaValue =
  result = default(StatsSchemaValue)
  result.name = n["name"].getStr
  result.`type` = parse(typedesc[StatsType], n["type"])
  if n.hasKey("unit") and n["unit"].kind != JNull:
    result.unit = some(parse(typedesc[StatsUnit], n["unit"]))
  if n.hasKey("base") and n["base"].kind != JNull:
    result.base = some(int8(n["base"].getBiggestInt))
  result.exponent = int16(n["exponent"].getBiggestInt)
  if n.hasKey("bucket-size") and n["bucket-size"].kind != JNull:
    result.bucketSize = some(uint32(n["bucket-size"].getBiggestInt))

proc `%`*(x: StatsSchema): JsonNode =
  result = newJObject()
  result["provider"] = %(x.provider)
  result["target"] = %(x.target)
  result["stats"] = %(x.stats)

proc parse*(_: typedesc[StatsSchema], n: JsonNode): StatsSchema =
  result = default(StatsSchema)
  result.provider = parse(typedesc[StatsProvider], n["provider"])
  result.target = parse(typedesc[StatsTarget], n["target"])
  result.stats = (n["stats"]).getElems.mapIt(parse(typedesc[StatsSchemaValue], it))

proc `%`*(x: VirtioInfo): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  result["name"] = %(x.name)

proc parse*(_: typedesc[VirtioInfo], n: JsonNode): VirtioInfo =
  result = default(VirtioInfo)
  result.path = n["path"].getStr
  result.name = n["name"].getStr

proc `%`*(x: VhostStatus): JsonNode =
  result = newJObject()
  result["n-mem-sections"] = %(x.nMemSections)
  result["n-tmp-sections"] = %(x.nTmpSections)
  result["nvqs"] = %(x.nvqs)
  result["vq-index"] = %(x.vqIndex)
  result["features"] = %(x.features)
  result["acked-features"] = %(x.ackedFeatures)
  result["backend-features"] = %(x.backendFeatures)
  result["protocol-features"] = %(x.protocolFeatures)
  result["max-queues"] = %(x.maxQueues)
  result["backend-cap"] = %(x.backendCap)
  result["log-enabled"] = %(x.logEnabled)
  result["log-size"] = %(x.logSize)

proc parse*(_: typedesc[VhostStatus], n: JsonNode): VhostStatus =
  result = default(VhostStatus)
  result.nMemSections = int64(n["n-mem-sections"].getBiggestInt)
  result.nTmpSections = int64(n["n-tmp-sections"].getBiggestInt)
  result.nvqs = uint32(n["nvqs"].getBiggestInt)
  result.vqIndex = int64(n["vq-index"].getBiggestInt)
  result.features = parse(typedesc[VirtioDeviceFeatures], n["features"])
  result.ackedFeatures = parse(typedesc[VirtioDeviceFeatures], n["acked-features"])
  result.backendFeatures = parse(typedesc[VirtioDeviceFeatures], n["backend-features"])
  result.protocolFeatures = parse(typedesc[VhostDeviceProtocols], n["protocol-features"])
  result.maxQueues = cast[uint64](n["max-queues"].getBiggestInt)
  result.backendCap = cast[uint64](n["backend-cap"].getBiggestInt)
  result.logEnabled = n["log-enabled"].getBool
  result.logSize = cast[uint64](n["log-size"].getBiggestInt)

proc `%`*(x: VirtioStatus): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["device-id"] = %(x.deviceId)
  result["vhost-started"] = %(x.vhostStarted)
  result["device-endian"] = %(x.deviceEndian)
  result["guest-features"] = %(x.guestFeatures)
  result["host-features"] = %(x.hostFeatures)
  result["backend-features"] = %(x.backendFeatures)
  result["num-vqs"] = %(x.numVqs)
  result["status"] = %(x.status)
  result["isr"] = %(x.isr)
  result["queue-sel"] = %(x.queueSel)
  result["vm-running"] = %(x.vmRunning)
  result["broken"] = %(x.broken)
  result["disabled"] = %(x.disabled)
  result["use-started"] = %(x.useStarted)
  result["started"] = %(x.started)
  result["start-on-kick"] = %(x.startOnKick)
  result["disable-legacy-check"] = %(x.disableLegacyCheck)
  result["bus-name"] = %(x.busName)
  result["use-guest-notifier-mask"] = %(x.useGuestNotifierMask)
  if x.vhostDev.isSome: result["vhost-dev"] = %(x.vhostDev.get)

proc parse*(_: typedesc[VirtioStatus], n: JsonNode): VirtioStatus =
  result = default(VirtioStatus)
  result.name = n["name"].getStr
  result.deviceId = uint16(n["device-id"].getBiggestInt)
  result.vhostStarted = n["vhost-started"].getBool
  result.deviceEndian = n["device-endian"].getStr
  result.guestFeatures = parse(typedesc[VirtioDeviceFeatures], n["guest-features"])
  result.hostFeatures = parse(typedesc[VirtioDeviceFeatures], n["host-features"])
  result.backendFeatures = parse(typedesc[VirtioDeviceFeatures], n["backend-features"])
  result.numVqs = int64(n["num-vqs"].getBiggestInt)
  result.status = parse(typedesc[VirtioDeviceStatus], n["status"])
  result.isr = uint8(n["isr"].getBiggestInt)
  result.queueSel = uint16(n["queue-sel"].getBiggestInt)
  result.vmRunning = n["vm-running"].getBool
  result.broken = n["broken"].getBool
  result.disabled = n["disabled"].getBool
  result.useStarted = n["use-started"].getBool
  result.started = n["started"].getBool
  result.startOnKick = n["start-on-kick"].getBool
  result.disableLegacyCheck = n["disable-legacy-check"].getBool
  result.busName = n["bus-name"].getStr
  result.useGuestNotifierMask = n["use-guest-notifier-mask"].getBool
  if n.hasKey("vhost-dev") and n["vhost-dev"].kind != JNull:
    result.vhostDev = some(parse(typedesc[VhostStatus], n["vhost-dev"]))

proc `%`*(x: VirtioDeviceStatus): JsonNode =
  result = newJObject()
  result["statuses"] = %(x.statuses)
  if x.unknownStatuses.isSome: result["unknown-statuses"] = %(x.unknownStatuses.get)

proc parse*(_: typedesc[VirtioDeviceStatus], n: JsonNode): VirtioDeviceStatus =
  result = default(VirtioDeviceStatus)
  result.statuses = (n["statuses"]).getElems.mapIt(it.getStr)
  if n.hasKey("unknown-statuses") and n["unknown-statuses"].kind != JNull:
    result.unknownStatuses = some(uint8(n["unknown-statuses"].getBiggestInt))

proc `%`*(x: VhostDeviceProtocols): JsonNode =
  result = newJObject()
  result["protocols"] = %(x.protocols)
  if x.unknownProtocols.isSome: result["unknown-protocols"] = %(x.unknownProtocols.get)

proc parse*(_: typedesc[VhostDeviceProtocols], n: JsonNode): VhostDeviceProtocols =
  result = default(VhostDeviceProtocols)
  result.protocols = (n["protocols"]).getElems.mapIt(it.getStr)
  if n.hasKey("unknown-protocols") and n["unknown-protocols"].kind != JNull:
    result.unknownProtocols = some(cast[uint64](n["unknown-protocols"].getBiggestInt))

proc `%`*(x: VirtioDeviceFeatures): JsonNode =
  result = newJObject()
  result["transports"] = %(x.transports)
  if x.devFeatures.isSome: result["dev-features"] = %(x.devFeatures.get)
  if x.unknownDevFeatures.isSome: result["unknown-dev-features"] = %(x.unknownDevFeatures.get)
  if x.unknownDevFeatures2.isSome: result["unknown-dev-features2"] = %(x.unknownDevFeatures2.get)

proc parse*(_: typedesc[VirtioDeviceFeatures], n: JsonNode): VirtioDeviceFeatures =
  result = default(VirtioDeviceFeatures)
  result.transports = (n["transports"]).getElems.mapIt(it.getStr)
  if n.hasKey("dev-features") and n["dev-features"].kind != JNull:
    result.devFeatures = some((n["dev-features"]).getElems.mapIt(it.getStr))
  if n.hasKey("unknown-dev-features") and n["unknown-dev-features"].kind != JNull:
    result.unknownDevFeatures = some(cast[uint64](n["unknown-dev-features"].getBiggestInt))
  if n.hasKey("unknown-dev-features2") and n["unknown-dev-features2"].kind != JNull:
    result.unknownDevFeatures2 = some(cast[uint64](n["unknown-dev-features2"].getBiggestInt))

proc `%`*(x: VirtQueueStatus): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["queue-index"] = %(x.queueIndex)
  result["inuse"] = %(x.inuse)
  result["vring-num"] = %(x.vringNum)
  result["vring-num-default"] = %(x.vringNumDefault)
  result["vring-align"] = %(x.vringAlign)
  result["vring-desc"] = %(x.vringDesc)
  result["vring-avail"] = %(x.vringAvail)
  result["vring-used"] = %(x.vringUsed)
  if x.lastAvailIdx.isSome: result["last-avail-idx"] = %(x.lastAvailIdx.get)
  if x.shadowAvailIdx.isSome: result["shadow-avail-idx"] = %(x.shadowAvailIdx.get)
  result["used-idx"] = %(x.usedIdx)
  result["signalled-used"] = %(x.signalledUsed)
  result["signalled-used-valid"] = %(x.signalledUsedValid)

proc parse*(_: typedesc[VirtQueueStatus], n: JsonNode): VirtQueueStatus =
  result = default(VirtQueueStatus)
  result.name = n["name"].getStr
  result.queueIndex = uint16(n["queue-index"].getBiggestInt)
  result.inuse = uint32(n["inuse"].getBiggestInt)
  result.vringNum = uint32(n["vring-num"].getBiggestInt)
  result.vringNumDefault = uint32(n["vring-num-default"].getBiggestInt)
  result.vringAlign = uint32(n["vring-align"].getBiggestInt)
  result.vringDesc = cast[uint64](n["vring-desc"].getBiggestInt)
  result.vringAvail = cast[uint64](n["vring-avail"].getBiggestInt)
  result.vringUsed = cast[uint64](n["vring-used"].getBiggestInt)
  if n.hasKey("last-avail-idx") and n["last-avail-idx"].kind != JNull:
    result.lastAvailIdx = some(uint16(n["last-avail-idx"].getBiggestInt))
  if n.hasKey("shadow-avail-idx") and n["shadow-avail-idx"].kind != JNull:
    result.shadowAvailIdx = some(uint16(n["shadow-avail-idx"].getBiggestInt))
  result.usedIdx = uint16(n["used-idx"].getBiggestInt)
  result.signalledUsed = uint16(n["signalled-used"].getBiggestInt)
  result.signalledUsedValid = n["signalled-used-valid"].getBool

proc `%`*(x: VirtVhostQueueStatus): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["kick"] = %(x.kick)
  result["call"] = %(x.call)
  result["desc"] = %(x.desc)
  result["avail"] = %(x.avail)
  result["used"] = %(x.used)
  result["num"] = %(x.num)
  result["desc-phys"] = %(x.descPhys)
  result["desc-size"] = %(x.descSize)
  result["avail-phys"] = %(x.availPhys)
  result["avail-size"] = %(x.availSize)
  result["used-phys"] = %(x.usedPhys)
  result["used-size"] = %(x.usedSize)

proc parse*(_: typedesc[VirtVhostQueueStatus], n: JsonNode): VirtVhostQueueStatus =
  result = default(VirtVhostQueueStatus)
  result.name = n["name"].getStr
  result.kick = int64(n["kick"].getBiggestInt)
  result.call = int64(n["call"].getBiggestInt)
  result.desc = cast[uint64](n["desc"].getBiggestInt)
  result.avail = cast[uint64](n["avail"].getBiggestInt)
  result.used = cast[uint64](n["used"].getBiggestInt)
  result.num = int64(n["num"].getBiggestInt)
  result.descPhys = cast[uint64](n["desc-phys"].getBiggestInt)
  result.descSize = uint32(n["desc-size"].getBiggestInt)
  result.availPhys = cast[uint64](n["avail-phys"].getBiggestInt)
  result.availSize = uint32(n["avail-size"].getBiggestInt)
  result.usedPhys = cast[uint64](n["used-phys"].getBiggestInt)
  result.usedSize = uint32(n["used-size"].getBiggestInt)

proc `%`*(x: VirtioRingDesc): JsonNode =
  result = newJObject()
  result["addr"] = %(x.`addr`)
  result["len"] = %(x.len)
  result["flags"] = %(x.flags)

proc parse*(_: typedesc[VirtioRingDesc], n: JsonNode): VirtioRingDesc =
  result = default(VirtioRingDesc)
  result.`addr` = cast[uint64](n["addr"].getBiggestInt)
  result.len = uint32(n["len"].getBiggestInt)
  result.flags = (n["flags"]).getElems.mapIt(it.getStr)

proc `%`*(x: VirtioRingAvail): JsonNode =
  result = newJObject()
  result["flags"] = %(x.flags)
  result["idx"] = %(x.idx)
  result["ring"] = %(x.ring)

proc parse*(_: typedesc[VirtioRingAvail], n: JsonNode): VirtioRingAvail =
  result = default(VirtioRingAvail)
  result.flags = uint16(n["flags"].getBiggestInt)
  result.idx = uint16(n["idx"].getBiggestInt)
  result.ring = uint16(n["ring"].getBiggestInt)

proc `%`*(x: VirtioRingUsed): JsonNode =
  result = newJObject()
  result["flags"] = %(x.flags)
  result["idx"] = %(x.idx)

proc parse*(_: typedesc[VirtioRingUsed], n: JsonNode): VirtioRingUsed =
  result = default(VirtioRingUsed)
  result.flags = uint16(n["flags"].getBiggestInt)
  result.idx = uint16(n["idx"].getBiggestInt)

proc `%`*(x: VirtioQueueElement): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  result["index"] = %(x.index)
  result["descs"] = %(x.descs)
  result["avail"] = %(x.avail)
  result["used"] = %(x.used)

proc parse*(_: typedesc[VirtioQueueElement], n: JsonNode): VirtioQueueElement =
  result = default(VirtioQueueElement)
  result.name = n["name"].getStr
  result.index = uint32(n["index"].getBiggestInt)
  result.descs = (n["descs"]).getElems.mapIt(parse(typedesc[VirtioRingDesc], it))
  result.avail = parse(typedesc[VirtioRingAvail], n["avail"])
  result.used = parse(typedesc[VirtioRingUsed], n["used"])

proc `%`*(x: IOThreadVirtQueueMapping): JsonNode =
  result = newJObject()
  result["iothread"] = %(x.iothread)
  if x.vqs.isSome: result["vqs"] = %(x.vqs.get)

proc parse*(_: typedesc[IOThreadVirtQueueMapping], n: JsonNode): IOThreadVirtQueueMapping =
  result = default(IOThreadVirtQueueMapping)
  result.iothread = n["iothread"].getStr
  if n.hasKey("vqs") and n["vqs"].kind != JNull:
    result.vqs = some((n["vqs"]).getElems.mapIt(uint16(it.getBiggestInt)))

proc `%`*(x: VirtIOGPUOutput): JsonNode =
  result = newJObject()
  result["name"] = %(x.name)
  if x.xres.isSome: result["xres"] = %(x.xres.get)
  if x.yres.isSome: result["yres"] = %(x.yres.get)

proc parse*(_: typedesc[VirtIOGPUOutput], n: JsonNode): VirtIOGPUOutput =
  result = default(VirtIOGPUOutput)
  result.name = n["name"].getStr
  if n.hasKey("xres") and n["xres"].kind != JNull:
    result.xres = some(uint16(n["xres"].getBiggestInt))
  if n.hasKey("yres") and n["yres"].kind != JNull:
    result.yres = some(uint16(n["yres"].getBiggestInt))

proc `%`*(x: DummyVirtioForceArrays): JsonNode =
  result = newJObject()
  result["unused-iothread-vq-mapping"] = %(x.unusedIothreadVqMapping)
  result["unused-virtio-gpu-output"] = %(x.unusedVirtioGpuOutput)

proc parse*(_: typedesc[DummyVirtioForceArrays], n: JsonNode): DummyVirtioForceArrays =
  result = default(DummyVirtioForceArrays)
  result.unusedIothreadVqMapping = (n["unused-iothread-vq-mapping"]).getElems.mapIt(parse(typedesc[IOThreadVirtQueueMapping], it))
  result.unusedVirtioGpuOutput = (n["unused-virtio-gpu-output"]).getElems.mapIt(parse(typedesc[VirtIOGPUOutput], it))

proc `%`*(x: GranuleMode): JsonNode = %($x)
proc parse*(_: typedesc[GranuleMode], n: JsonNode): GranuleMode =
  let s = n.getStr
  case s
  of "4k": GranuleMode.V4k
  of "8k": GranuleMode.V8k
  of "16k": GranuleMode.V16k
  of "64k": GranuleMode.V64k
  of "host": GranuleMode.Host
  else: raise newException(ValueError, "unknown GranuleMode: " & s)

proc `%`*(x: VMAppleVirtioBlkVariant): JsonNode = %($x)
proc parse*(_: typedesc[VMAppleVirtioBlkVariant], n: JsonNode): VMAppleVirtioBlkVariant =
  let s = n.getStr
  case s
  of "unspecified": VMAppleVirtioBlkVariant.Unspecified
  of "root": VMAppleVirtioBlkVariant.Root
  of "aux": VMAppleVirtioBlkVariant.Aux
  else: raise newException(ValueError, "unknown VMAppleVirtioBlkVariant: " & s)

proc `%`*(x: QapiVfioMigrationState): JsonNode = %($x)
proc parse*(_: typedesc[QapiVfioMigrationState], n: JsonNode): QapiVfioMigrationState =
  let s = n.getStr
  case s
  of "stop": QapiVfioMigrationState.Stop
  of "running": QapiVfioMigrationState.Running
  of "stop-copy": QapiVfioMigrationState.StopCopy
  of "resuming": QapiVfioMigrationState.Resuming
  of "running-p2p": QapiVfioMigrationState.RunningP2p
  of "pre-copy": QapiVfioMigrationState.PreCopy
  of "pre-copy-p2p": QapiVfioMigrationState.PreCopyP2p
  of "pre-copy-p2p-prepare": QapiVfioMigrationState.PreCopyP2pPrepare
  else: raise newException(ValueError, "unknown QapiVfioMigrationState: " & s)

proc `%`*(x: QCryptodevBackendAlgoType): JsonNode = %($x)
proc parse*(_: typedesc[QCryptodevBackendAlgoType], n: JsonNode): QCryptodevBackendAlgoType =
  let s = n.getStr
  case s
  of "sym": QCryptodevBackendAlgoType.Sym
  of "asym": QCryptodevBackendAlgoType.Asym
  else: raise newException(ValueError, "unknown QCryptodevBackendAlgoType: " & s)

proc `%`*(x: QCryptodevBackendServiceType): JsonNode = %($x)
proc parse*(_: typedesc[QCryptodevBackendServiceType], n: JsonNode): QCryptodevBackendServiceType =
  let s = n.getStr
  case s
  of "cipher": QCryptodevBackendServiceType.Cipher
  of "hash": QCryptodevBackendServiceType.Hash
  of "mac": QCryptodevBackendServiceType.Mac
  of "aead": QCryptodevBackendServiceType.Aead
  of "akcipher": QCryptodevBackendServiceType.Akcipher
  else: raise newException(ValueError, "unknown QCryptodevBackendServiceType: " & s)

proc `%`*(x: QCryptodevBackendType): JsonNode = %($x)
proc parse*(_: typedesc[QCryptodevBackendType], n: JsonNode): QCryptodevBackendType =
  let s = n.getStr
  case s
  of "builtin": QCryptodevBackendType.Builtin
  of "vhost-user": QCryptodevBackendType.VhostUser
  of "lkcf": QCryptodevBackendType.Lkcf
  else: raise newException(ValueError, "unknown QCryptodevBackendType: " & s)

proc `%`*(x: QCryptodevBackendClient): JsonNode =
  result = newJObject()
  result["queue"] = %(x.queue)
  result["type"] = %(x.`type`)

proc parse*(_: typedesc[QCryptodevBackendClient], n: JsonNode): QCryptodevBackendClient =
  result = default(QCryptodevBackendClient)
  result.queue = uint32(n["queue"].getBiggestInt)
  result.`type` = parse(typedesc[QCryptodevBackendType], n["type"])

proc `%`*(x: QCryptodevInfo): JsonNode =
  result = newJObject()
  result["id"] = %(x.id)
  result["service"] = %(x.service)
  result["client"] = %(x.client)

proc parse*(_: typedesc[QCryptodevInfo], n: JsonNode): QCryptodevInfo =
  result = default(QCryptodevInfo)
  result.id = n["id"].getStr
  result.service = (n["service"]).getElems.mapIt(parse(typedesc[QCryptodevBackendServiceType], it))
  result.client = (n["client"]).getElems.mapIt(parse(typedesc[QCryptodevBackendClient], it))

proc `%`*(x: CxlEventLog): JsonNode = %($x)
proc parse*(_: typedesc[CxlEventLog], n: JsonNode): CxlEventLog =
  let s = n.getStr
  case s
  of "informational": CxlEventLog.Informational
  of "warning": CxlEventLog.Warning
  of "failure": CxlEventLog.Failure
  of "fatal": CxlEventLog.Fatal
  else: raise newException(ValueError, "unknown CxlEventLog: " & s)

proc `%`*(x: CXLCommonEventBase): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  result["log"] = %(x.log)
  result["flags"] = %(x.flags)
  if x.maintOpClass.isSome: result["maint-op-class"] = %(x.maintOpClass.get)
  if x.maintOpSubclass.isSome: result["maint-op-subclass"] = %(x.maintOpSubclass.get)
  if x.ldId.isSome: result["ld-id"] = %(x.ldId.get)
  if x.headId.isSome: result["head-id"] = %(x.headId.get)

proc parse*(_: typedesc[CXLCommonEventBase], n: JsonNode): CXLCommonEventBase =
  result = default(CXLCommonEventBase)
  result.path = n["path"].getStr
  result.log = parse(typedesc[CxlEventLog], n["log"])
  result.flags = uint32(n["flags"].getBiggestInt)
  if n.hasKey("maint-op-class") and n["maint-op-class"].kind != JNull:
    result.maintOpClass = some(uint8(n["maint-op-class"].getBiggestInt))
  if n.hasKey("maint-op-subclass") and n["maint-op-subclass"].kind != JNull:
    result.maintOpSubclass = some(uint8(n["maint-op-subclass"].getBiggestInt))
  if n.hasKey("ld-id") and n["ld-id"].kind != JNull:
    result.ldId = some(uint16(n["ld-id"].getBiggestInt))
  if n.hasKey("head-id") and n["head-id"].kind != JNull:
    result.headId = some(uint8(n["head-id"].getBiggestInt))

proc `%`*(x: CXLGeneralMediaEvent): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  result["log"] = %(x.log)
  result["flags"] = %(x.flags)
  if x.maintOpClass.isSome: result["maint-op-class"] = %(x.maintOpClass.get)
  if x.maintOpSubclass.isSome: result["maint-op-subclass"] = %(x.maintOpSubclass.get)
  if x.ldId.isSome: result["ld-id"] = %(x.ldId.get)
  if x.headId.isSome: result["head-id"] = %(x.headId.get)
  result["dpa"] = %(x.dpa)
  result["descriptor"] = %(x.descriptor)
  result["type"] = %(x.`type`)
  result["transaction-type"] = %(x.transactionType)
  if x.channel.isSome: result["channel"] = %(x.channel.get)
  if x.rank.isSome: result["rank"] = %(x.rank.get)
  if x.device.isSome: result["device"] = %(x.device.get)
  if x.componentId.isSome: result["component-id"] = %(x.componentId.get)
  if x.isCompIdPldm.isSome: result["is-comp-id-pldm"] = %(x.isCompIdPldm.get)
  if x.cmeEvFlags.isSome: result["cme-ev-flags"] = %(x.cmeEvFlags.get)
  if x.cmeCount.isSome: result["cme-count"] = %(x.cmeCount.get)
  result["sub-type"] = %(x.subType)

proc parse*(_: typedesc[CXLGeneralMediaEvent], n: JsonNode): CXLGeneralMediaEvent =
  result = default(CXLGeneralMediaEvent)
  result.path = n["path"].getStr
  result.log = parse(typedesc[CxlEventLog], n["log"])
  result.flags = uint32(n["flags"].getBiggestInt)
  if n.hasKey("maint-op-class") and n["maint-op-class"].kind != JNull:
    result.maintOpClass = some(uint8(n["maint-op-class"].getBiggestInt))
  if n.hasKey("maint-op-subclass") and n["maint-op-subclass"].kind != JNull:
    result.maintOpSubclass = some(uint8(n["maint-op-subclass"].getBiggestInt))
  if n.hasKey("ld-id") and n["ld-id"].kind != JNull:
    result.ldId = some(uint16(n["ld-id"].getBiggestInt))
  if n.hasKey("head-id") and n["head-id"].kind != JNull:
    result.headId = some(uint8(n["head-id"].getBiggestInt))
  result.dpa = cast[uint64](n["dpa"].getBiggestInt)
  result.descriptor = uint8(n["descriptor"].getBiggestInt)
  result.`type` = uint8(n["type"].getBiggestInt)
  result.transactionType = uint8(n["transaction-type"].getBiggestInt)
  if n.hasKey("channel") and n["channel"].kind != JNull:
    result.channel = some(uint8(n["channel"].getBiggestInt))
  if n.hasKey("rank") and n["rank"].kind != JNull:
    result.rank = some(uint8(n["rank"].getBiggestInt))
  if n.hasKey("device") and n["device"].kind != JNull:
    result.device = some(uint32(n["device"].getBiggestInt))
  if n.hasKey("component-id") and n["component-id"].kind != JNull:
    result.componentId = some(n["component-id"].getStr)
  if n.hasKey("is-comp-id-pldm") and n["is-comp-id-pldm"].kind != JNull:
    result.isCompIdPldm = some(n["is-comp-id-pldm"].getBool)
  if n.hasKey("cme-ev-flags") and n["cme-ev-flags"].kind != JNull:
    result.cmeEvFlags = some(uint8(n["cme-ev-flags"].getBiggestInt))
  if n.hasKey("cme-count") and n["cme-count"].kind != JNull:
    result.cmeCount = some(uint32(n["cme-count"].getBiggestInt))
  result.subType = uint8(n["sub-type"].getBiggestInt)

proc `%`*(x: CXLDRAMEvent): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  result["log"] = %(x.log)
  result["flags"] = %(x.flags)
  if x.maintOpClass.isSome: result["maint-op-class"] = %(x.maintOpClass.get)
  if x.maintOpSubclass.isSome: result["maint-op-subclass"] = %(x.maintOpSubclass.get)
  if x.ldId.isSome: result["ld-id"] = %(x.ldId.get)
  if x.headId.isSome: result["head-id"] = %(x.headId.get)
  result["dpa"] = %(x.dpa)
  result["descriptor"] = %(x.descriptor)
  result["type"] = %(x.`type`)
  result["transaction-type"] = %(x.transactionType)
  if x.channel.isSome: result["channel"] = %(x.channel.get)
  if x.rank.isSome: result["rank"] = %(x.rank.get)
  if x.nibbleMask.isSome: result["nibble-mask"] = %(x.nibbleMask.get)
  if x.bankGroup.isSome: result["bank-group"] = %(x.bankGroup.get)
  if x.bank.isSome: result["bank"] = %(x.bank.get)
  if x.row.isSome: result["row"] = %(x.row.get)
  if x.column.isSome: result["column"] = %(x.column.get)
  if x.correctionMask.isSome: result["correction-mask"] = %(x.correctionMask.get)
  if x.componentId.isSome: result["component-id"] = %(x.componentId.get)
  if x.isCompIdPldm.isSome: result["is-comp-id-pldm"] = %(x.isCompIdPldm.get)
  if x.subChannel.isSome: result["sub-channel"] = %(x.subChannel.get)
  if x.cmeEvFlags.isSome: result["cme-ev-flags"] = %(x.cmeEvFlags.get)
  if x.cvmeCount.isSome: result["cvme-count"] = %(x.cvmeCount.get)
  result["sub-type"] = %(x.subType)

proc parse*(_: typedesc[CXLDRAMEvent], n: JsonNode): CXLDRAMEvent =
  result = default(CXLDRAMEvent)
  result.path = n["path"].getStr
  result.log = parse(typedesc[CxlEventLog], n["log"])
  result.flags = uint32(n["flags"].getBiggestInt)
  if n.hasKey("maint-op-class") and n["maint-op-class"].kind != JNull:
    result.maintOpClass = some(uint8(n["maint-op-class"].getBiggestInt))
  if n.hasKey("maint-op-subclass") and n["maint-op-subclass"].kind != JNull:
    result.maintOpSubclass = some(uint8(n["maint-op-subclass"].getBiggestInt))
  if n.hasKey("ld-id") and n["ld-id"].kind != JNull:
    result.ldId = some(uint16(n["ld-id"].getBiggestInt))
  if n.hasKey("head-id") and n["head-id"].kind != JNull:
    result.headId = some(uint8(n["head-id"].getBiggestInt))
  result.dpa = cast[uint64](n["dpa"].getBiggestInt)
  result.descriptor = uint8(n["descriptor"].getBiggestInt)
  result.`type` = uint8(n["type"].getBiggestInt)
  result.transactionType = uint8(n["transaction-type"].getBiggestInt)
  if n.hasKey("channel") and n["channel"].kind != JNull:
    result.channel = some(uint8(n["channel"].getBiggestInt))
  if n.hasKey("rank") and n["rank"].kind != JNull:
    result.rank = some(uint8(n["rank"].getBiggestInt))
  if n.hasKey("nibble-mask") and n["nibble-mask"].kind != JNull:
    result.nibbleMask = some(uint32(n["nibble-mask"].getBiggestInt))
  if n.hasKey("bank-group") and n["bank-group"].kind != JNull:
    result.bankGroup = some(uint8(n["bank-group"].getBiggestInt))
  if n.hasKey("bank") and n["bank"].kind != JNull:
    result.bank = some(uint8(n["bank"].getBiggestInt))
  if n.hasKey("row") and n["row"].kind != JNull:
    result.row = some(uint32(n["row"].getBiggestInt))
  if n.hasKey("column") and n["column"].kind != JNull:
    result.column = some(uint16(n["column"].getBiggestInt))
  if n.hasKey("correction-mask") and n["correction-mask"].kind != JNull:
    result.correctionMask = some((n["correction-mask"]).getElems.mapIt(cast[uint64](it.getBiggestInt)))
  if n.hasKey("component-id") and n["component-id"].kind != JNull:
    result.componentId = some(n["component-id"].getStr)
  if n.hasKey("is-comp-id-pldm") and n["is-comp-id-pldm"].kind != JNull:
    result.isCompIdPldm = some(n["is-comp-id-pldm"].getBool)
  if n.hasKey("sub-channel") and n["sub-channel"].kind != JNull:
    result.subChannel = some(uint8(n["sub-channel"].getBiggestInt))
  if n.hasKey("cme-ev-flags") and n["cme-ev-flags"].kind != JNull:
    result.cmeEvFlags = some(uint8(n["cme-ev-flags"].getBiggestInt))
  if n.hasKey("cvme-count") and n["cvme-count"].kind != JNull:
    result.cvmeCount = some(uint32(n["cvme-count"].getBiggestInt))
  result.subType = uint8(n["sub-type"].getBiggestInt)

proc `%`*(x: CXLMemModuleEvent): JsonNode =
  result = newJObject()
  result["path"] = %(x.path)
  result["log"] = %(x.log)
  result["flags"] = %(x.flags)
  if x.maintOpClass.isSome: result["maint-op-class"] = %(x.maintOpClass.get)
  if x.maintOpSubclass.isSome: result["maint-op-subclass"] = %(x.maintOpSubclass.get)
  if x.ldId.isSome: result["ld-id"] = %(x.ldId.get)
  if x.headId.isSome: result["head-id"] = %(x.headId.get)
  result["type"] = %(x.`type`)
  result["health-status"] = %(x.healthStatus)
  result["media-status"] = %(x.mediaStatus)
  result["additional-status"] = %(x.additionalStatus)
  result["life-used"] = %(x.lifeUsed)
  result["temperature"] = %(x.temperature)
  result["dirty-shutdown-count"] = %(x.dirtyShutdownCount)
  result["corrected-volatile-error-count"] = %(x.correctedVolatileErrorCount)
  result["corrected-persistent-error-count"] = %(x.correctedPersistentErrorCount)
  if x.componentId.isSome: result["component-id"] = %(x.componentId.get)
  if x.isCompIdPldm.isSome: result["is-comp-id-pldm"] = %(x.isCompIdPldm.get)
  result["sub-type"] = %(x.subType)

proc parse*(_: typedesc[CXLMemModuleEvent], n: JsonNode): CXLMemModuleEvent =
  result = default(CXLMemModuleEvent)
  result.path = n["path"].getStr
  result.log = parse(typedesc[CxlEventLog], n["log"])
  result.flags = uint32(n["flags"].getBiggestInt)
  if n.hasKey("maint-op-class") and n["maint-op-class"].kind != JNull:
    result.maintOpClass = some(uint8(n["maint-op-class"].getBiggestInt))
  if n.hasKey("maint-op-subclass") and n["maint-op-subclass"].kind != JNull:
    result.maintOpSubclass = some(uint8(n["maint-op-subclass"].getBiggestInt))
  if n.hasKey("ld-id") and n["ld-id"].kind != JNull:
    result.ldId = some(uint16(n["ld-id"].getBiggestInt))
  if n.hasKey("head-id") and n["head-id"].kind != JNull:
    result.headId = some(uint8(n["head-id"].getBiggestInt))
  result.`type` = uint8(n["type"].getBiggestInt)
  result.healthStatus = uint8(n["health-status"].getBiggestInt)
  result.mediaStatus = uint8(n["media-status"].getBiggestInt)
  result.additionalStatus = uint8(n["additional-status"].getBiggestInt)
  result.lifeUsed = uint8(n["life-used"].getBiggestInt)
  result.temperature = int16(n["temperature"].getBiggestInt)
  result.dirtyShutdownCount = uint32(n["dirty-shutdown-count"].getBiggestInt)
  result.correctedVolatileErrorCount = uint32(n["corrected-volatile-error-count"].getBiggestInt)
  result.correctedPersistentErrorCount = uint32(n["corrected-persistent-error-count"].getBiggestInt)
  if n.hasKey("component-id") and n["component-id"].kind != JNull:
    result.componentId = some(n["component-id"].getStr)
  if n.hasKey("is-comp-id-pldm") and n["is-comp-id-pldm"].kind != JNull:
    result.isCompIdPldm = some(n["is-comp-id-pldm"].getBool)
  result.subType = uint8(n["sub-type"].getBiggestInt)

proc `%`*(x: CxlUncorErrorType): JsonNode = %($x)
proc parse*(_: typedesc[CxlUncorErrorType], n: JsonNode): CxlUncorErrorType =
  let s = n.getStr
  case s
  of "cache-data-parity": CxlUncorErrorType.CacheDataParity
  of "cache-address-parity": CxlUncorErrorType.CacheAddressParity
  of "cache-be-parity": CxlUncorErrorType.CacheBeParity
  of "cache-data-ecc": CxlUncorErrorType.CacheDataEcc
  of "mem-data-parity": CxlUncorErrorType.MemDataParity
  of "mem-address-parity": CxlUncorErrorType.MemAddressParity
  of "mem-be-parity": CxlUncorErrorType.MemBeParity
  of "mem-data-ecc": CxlUncorErrorType.MemDataEcc
  of "reinit-threshold": CxlUncorErrorType.ReinitThreshold
  of "rsvd-encoding": CxlUncorErrorType.RsvdEncoding
  of "poison-received": CxlUncorErrorType.PoisonReceived
  of "receiver-overflow": CxlUncorErrorType.ReceiverOverflow
  of "internal": CxlUncorErrorType.Internal
  of "cxl-ide-tx": CxlUncorErrorType.CxlIdeTx
  of "cxl-ide-rx": CxlUncorErrorType.CxlIdeRx
  else: raise newException(ValueError, "unknown CxlUncorErrorType: " & s)

proc `%`*(x: CXLUncorErrorRecord): JsonNode =
  result = newJObject()
  result["type"] = %(x.`type`)
  result["header"] = %(x.header)

proc parse*(_: typedesc[CXLUncorErrorRecord], n: JsonNode): CXLUncorErrorRecord =
  result = default(CXLUncorErrorRecord)
  result.`type` = parse(typedesc[CxlUncorErrorType], n["type"])
  result.header = (n["header"]).getElems.mapIt(uint32(it.getBiggestInt))

proc `%`*(x: CxlCorErrorType): JsonNode = %($x)
proc parse*(_: typedesc[CxlCorErrorType], n: JsonNode): CxlCorErrorType =
  let s = n.getStr
  case s
  of "cache-data-ecc": CxlCorErrorType.CacheDataEcc
  of "mem-data-ecc": CxlCorErrorType.MemDataEcc
  of "crc-threshold": CxlCorErrorType.CrcThreshold
  of "retry-threshold": CxlCorErrorType.RetryThreshold
  of "cache-poison-received": CxlCorErrorType.CachePoisonReceived
  of "mem-poison-received": CxlCorErrorType.MemPoisonReceived
  of "physical": CxlCorErrorType.Physical
  else: raise newException(ValueError, "unknown CxlCorErrorType: " & s)

proc `%`*(x: CxlDynamicCapacityExtent): JsonNode =
  result = newJObject()
  result["offset"] = %(x.offset)
  result["len"] = %(x.len)

proc parse*(_: typedesc[CxlDynamicCapacityExtent], n: JsonNode): CxlDynamicCapacityExtent =
  result = default(CxlDynamicCapacityExtent)
  result.offset = cast[uint64](n["offset"].getBiggestInt)
  result.len = cast[uint64](n["len"].getBiggestInt)

proc `%`*(x: CxlExtentSelectionPolicy): JsonNode = %($x)
proc parse*(_: typedesc[CxlExtentSelectionPolicy], n: JsonNode): CxlExtentSelectionPolicy =
  let s = n.getStr
  case s
  of "free": CxlExtentSelectionPolicy.Free
  of "contiguous": CxlExtentSelectionPolicy.Contiguous
  of "prescriptive": CxlExtentSelectionPolicy.Prescriptive
  of "enable-shared-access": CxlExtentSelectionPolicy.EnableSharedAccess
  else: raise newException(ValueError, "unknown CxlExtentSelectionPolicy: " & s)

proc `%`*(x: CxlExtentRemovalPolicy): JsonNode = %($x)
proc parse*(_: typedesc[CxlExtentRemovalPolicy], n: JsonNode): CxlExtentRemovalPolicy =
  let s = n.getStr
  case s
  of "tag-based": CxlExtentRemovalPolicy.TagBased
  of "prescriptive": CxlExtentRemovalPolicy.Prescriptive
  else: raise newException(ValueError, "unknown CxlExtentRemovalPolicy: " & s)

proc `%`*(x: UefiVariable): JsonNode =
  result = newJObject()
  result["guid"] = %(x.guid)
  result["name"] = %(x.name)
  result["attr"] = %(x.attr)
  result["data"] = %(x.data)
  if x.time.isSome: result["time"] = %(x.time.get)
  if x.digest.isSome: result["digest"] = %(x.digest.get)

proc parse*(_: typedesc[UefiVariable], n: JsonNode): UefiVariable =
  result = default(UefiVariable)
  result.guid = n["guid"].getStr
  result.name = n["name"].getStr
  result.attr = int64(n["attr"].getBiggestInt)
  result.data = n["data"].getStr
  if n.hasKey("time") and n["time"].kind != JNull:
    result.time = some(n["time"].getStr)
  if n.hasKey("digest") and n["digest"].kind != JNull:
    result.digest = some(n["digest"].getStr)

proc `%`*(x: UefiVarStore): JsonNode =
  result = newJObject()
  result["version"] = %(x.version)
  result["variables"] = %(x.variables)

proc parse*(_: typedesc[UefiVarStore], n: JsonNode): UefiVarStore =
  result = default(UefiVarStore)
  result.version = int64(n["version"].getBiggestInt)
  result.variables = (n["variables"]).getElems.mapIt(parse(typedesc[UefiVariable], it))


type ShutdownEvent* = object
  guest*: bool
  reason*: ShutdownCause

proc name*(_: typedesc[ShutdownEvent]): string = "SHUTDOWN"
proc parse*(_: typedesc[ShutdownEvent], n: JsonNode): ShutdownEvent =
  result = default(ShutdownEvent)
  result.guest = n["guest"].getBool
  result.reason = parse(typedesc[ShutdownCause], n["reason"])

type PowerdownEvent* = object
  discard

proc name*(_: typedesc[PowerdownEvent]): string = "POWERDOWN"
proc parse*(_: typedesc[PowerdownEvent], n: JsonNode): PowerdownEvent =
  result = default(PowerdownEvent)

type ResetEvent* = object
  guest*: bool
  reason*: ShutdownCause

proc name*(_: typedesc[ResetEvent]): string = "RESET"
proc parse*(_: typedesc[ResetEvent], n: JsonNode): ResetEvent =
  result = default(ResetEvent)
  result.guest = n["guest"].getBool
  result.reason = parse(typedesc[ShutdownCause], n["reason"])

type StopEvent* = object
  discard

proc name*(_: typedesc[StopEvent]): string = "STOP"
proc parse*(_: typedesc[StopEvent], n: JsonNode): StopEvent =
  result = default(StopEvent)

type ResumeEvent* = object
  discard

proc name*(_: typedesc[ResumeEvent]): string = "RESUME"
proc parse*(_: typedesc[ResumeEvent], n: JsonNode): ResumeEvent =
  result = default(ResumeEvent)

type SuspendEvent* = object
  discard

proc name*(_: typedesc[SuspendEvent]): string = "SUSPEND"
proc parse*(_: typedesc[SuspendEvent], n: JsonNode): SuspendEvent =
  result = default(SuspendEvent)

type SuspendDiskEvent* = object
  discard

proc name*(_: typedesc[SuspendDiskEvent]): string = "SUSPEND_DISK"
proc parse*(_: typedesc[SuspendDiskEvent], n: JsonNode): SuspendDiskEvent =
  result = default(SuspendDiskEvent)

type WakeupEvent* = object
  discard

proc name*(_: typedesc[WakeupEvent]): string = "WAKEUP"
proc parse*(_: typedesc[WakeupEvent], n: JsonNode): WakeupEvent =
  result = default(WakeupEvent)

type WatchdogEvent* = object
  action*: WatchdogAction

proc name*(_: typedesc[WatchdogEvent]): string = "WATCHDOG"
proc parse*(_: typedesc[WatchdogEvent], n: JsonNode): WatchdogEvent =
  result = default(WatchdogEvent)
  result.action = parse(typedesc[WatchdogAction], n["action"])

type GuestPanickedEvent* = object
  action*: GuestPanicAction
  info*: Option[GuestPanicInformation]

proc name*(_: typedesc[GuestPanickedEvent]): string = "GUEST_PANICKED"
proc parse*(_: typedesc[GuestPanickedEvent], n: JsonNode): GuestPanickedEvent =
  result = default(GuestPanickedEvent)
  result.action = parse(typedesc[GuestPanicAction], n["action"])
  if n.hasKey("info"):
    result.info = some(parse(typedesc[GuestPanicInformation], n["info"]))

type GuestCrashloadedEvent* = object
  action*: GuestPanicAction
  info*: Option[GuestPanicInformation]

proc name*(_: typedesc[GuestCrashloadedEvent]): string = "GUEST_CRASHLOADED"
proc parse*(_: typedesc[GuestCrashloadedEvent], n: JsonNode): GuestCrashloadedEvent =
  result = default(GuestCrashloadedEvent)
  result.action = parse(typedesc[GuestPanicAction], n["action"])
  if n.hasKey("info"):
    result.info = some(parse(typedesc[GuestPanicInformation], n["info"]))

type GuestPvshutdownEvent* = object
  discard

proc name*(_: typedesc[GuestPvshutdownEvent]): string = "GUEST_PVSHUTDOWN"
proc parse*(_: typedesc[GuestPvshutdownEvent], n: JsonNode): GuestPvshutdownEvent =
  result = default(GuestPvshutdownEvent)

type MemoryFailureEvent* = object
  recipient*: MemoryFailureRecipient
  action*: MemoryFailureAction
  flags*: MemoryFailureFlags

proc name*(_: typedesc[MemoryFailureEvent]): string = "MEMORY_FAILURE"
proc parse*(_: typedesc[MemoryFailureEvent], n: JsonNode): MemoryFailureEvent =
  result = default(MemoryFailureEvent)
  result.recipient = parse(typedesc[MemoryFailureRecipient], n["recipient"])
  result.action = parse(typedesc[MemoryFailureAction], n["action"])
  result.flags = parse(typedesc[MemoryFailureFlags], n["flags"])

type JobStatusChangeEvent* = object
  id*: string
  status*: JobStatus

proc name*(_: typedesc[JobStatusChangeEvent]): string = "JOB_STATUS_CHANGE"
proc parse*(_: typedesc[JobStatusChangeEvent], n: JsonNode): JobStatusChangeEvent =
  result = default(JobStatusChangeEvent)
  result.id = n["id"].getStr
  result.status = parse(typedesc[JobStatus], n["status"])

type BlockImageCorruptedEvent* = object
  device*: string
  nodeName*: Option[string]
  msg*: string
  offset*: Option[int64]
  size*: Option[int64]
  fatal*: bool

proc name*(_: typedesc[BlockImageCorruptedEvent]): string = "BLOCK_IMAGE_CORRUPTED"
proc parse*(_: typedesc[BlockImageCorruptedEvent], n: JsonNode): BlockImageCorruptedEvent =
  result = default(BlockImageCorruptedEvent)
  result.device = n["device"].getStr
  if n.hasKey("node-name"):
    result.nodeName = some(n["node-name"].getStr)
  result.msg = n["msg"].getStr
  if n.hasKey("offset"):
    result.offset = some(int64(n["offset"].getBiggestInt))
  if n.hasKey("size"):
    result.size = some(int64(n["size"].getBiggestInt))
  result.fatal = n["fatal"].getBool

type BlockIoErrorEvent* = object
  qomPath*: string
  device*: string
  nodeName*: Option[string]
  operation*: IoOperationType
  action*: BlockErrorAction
  nospace*: Option[bool]
  reason*: string

proc name*(_: typedesc[BlockIoErrorEvent]): string = "BLOCK_IO_ERROR"
proc parse*(_: typedesc[BlockIoErrorEvent], n: JsonNode): BlockIoErrorEvent =
  result = default(BlockIoErrorEvent)
  result.qomPath = n["qom-path"].getStr
  result.device = n["device"].getStr
  if n.hasKey("node-name"):
    result.nodeName = some(n["node-name"].getStr)
  result.operation = parse(typedesc[IoOperationType], n["operation"])
  result.action = parse(typedesc[BlockErrorAction], n["action"])
  if n.hasKey("nospace"):
    result.nospace = some(n["nospace"].getBool)
  result.reason = n["reason"].getStr

type BlockJobCompletedEvent* = object
  `type`*: JobType
  device*: string
  len*: int64
  offset*: int64
  speed*: int64
  error*: Option[string]

proc name*(_: typedesc[BlockJobCompletedEvent]): string = "BLOCK_JOB_COMPLETED"
proc parse*(_: typedesc[BlockJobCompletedEvent], n: JsonNode): BlockJobCompletedEvent =
  result = default(BlockJobCompletedEvent)
  result.`type` = parse(typedesc[JobType], n["type"])
  result.device = n["device"].getStr
  result.len = int64(n["len"].getBiggestInt)
  result.offset = int64(n["offset"].getBiggestInt)
  result.speed = int64(n["speed"].getBiggestInt)
  if n.hasKey("error"):
    result.error = some(n["error"].getStr)

type BlockJobCancelledEvent* = object
  `type`*: JobType
  device*: string
  len*: int64
  offset*: int64
  speed*: int64

proc name*(_: typedesc[BlockJobCancelledEvent]): string = "BLOCK_JOB_CANCELLED"
proc parse*(_: typedesc[BlockJobCancelledEvent], n: JsonNode): BlockJobCancelledEvent =
  result = default(BlockJobCancelledEvent)
  result.`type` = parse(typedesc[JobType], n["type"])
  result.device = n["device"].getStr
  result.len = int64(n["len"].getBiggestInt)
  result.offset = int64(n["offset"].getBiggestInt)
  result.speed = int64(n["speed"].getBiggestInt)

type BlockJobErrorEvent* = object
  device*: string
  operation*: IoOperationType
  action*: BlockErrorAction

proc name*(_: typedesc[BlockJobErrorEvent]): string = "BLOCK_JOB_ERROR"
proc parse*(_: typedesc[BlockJobErrorEvent], n: JsonNode): BlockJobErrorEvent =
  result = default(BlockJobErrorEvent)
  result.device = n["device"].getStr
  result.operation = parse(typedesc[IoOperationType], n["operation"])
  result.action = parse(typedesc[BlockErrorAction], n["action"])

type BlockJobReadyEvent* = object
  `type`*: JobType
  device*: string
  len*: int64
  offset*: int64
  speed*: int64

proc name*(_: typedesc[BlockJobReadyEvent]): string = "BLOCK_JOB_READY"
proc parse*(_: typedesc[BlockJobReadyEvent], n: JsonNode): BlockJobReadyEvent =
  result = default(BlockJobReadyEvent)
  result.`type` = parse(typedesc[JobType], n["type"])
  result.device = n["device"].getStr
  result.len = int64(n["len"].getBiggestInt)
  result.offset = int64(n["offset"].getBiggestInt)
  result.speed = int64(n["speed"].getBiggestInt)

type BlockJobPendingEvent* = object
  `type`*: JobType
  id*: string

proc name*(_: typedesc[BlockJobPendingEvent]): string = "BLOCK_JOB_PENDING"
proc parse*(_: typedesc[BlockJobPendingEvent], n: JsonNode): BlockJobPendingEvent =
  result = default(BlockJobPendingEvent)
  result.`type` = parse(typedesc[JobType], n["type"])
  result.id = n["id"].getStr

type BlockWriteThresholdEvent* = object
  nodeName*: string
  amountExceeded*: uint64
  writeThreshold*: uint64

proc name*(_: typedesc[BlockWriteThresholdEvent]): string = "BLOCK_WRITE_THRESHOLD"
proc parse*(_: typedesc[BlockWriteThresholdEvent], n: JsonNode): BlockWriteThresholdEvent =
  result = default(BlockWriteThresholdEvent)
  result.nodeName = n["node-name"].getStr
  result.amountExceeded = cast[uint64](n["amount-exceeded"].getBiggestInt)
  result.writeThreshold = cast[uint64](n["write-threshold"].getBiggestInt)

type QuorumFailureEvent* = object
  reference*: string
  sectorNum*: int64
  sectorsCount*: int64

proc name*(_: typedesc[QuorumFailureEvent]): string = "QUORUM_FAILURE"
proc parse*(_: typedesc[QuorumFailureEvent], n: JsonNode): QuorumFailureEvent =
  result = default(QuorumFailureEvent)
  result.reference = n["reference"].getStr
  result.sectorNum = int64(n["sector-num"].getBiggestInt)
  result.sectorsCount = int64(n["sectors-count"].getBiggestInt)

type QuorumReportBadEvent* = object
  `type`*: QuorumOpType
  error*: Option[string]
  nodeName*: string
  sectorNum*: int64
  sectorsCount*: int64

proc name*(_: typedesc[QuorumReportBadEvent]): string = "QUORUM_REPORT_BAD"
proc parse*(_: typedesc[QuorumReportBadEvent], n: JsonNode): QuorumReportBadEvent =
  result = default(QuorumReportBadEvent)
  result.`type` = parse(typedesc[QuorumOpType], n["type"])
  if n.hasKey("error"):
    result.error = some(n["error"].getStr)
  result.nodeName = n["node-name"].getStr
  result.sectorNum = int64(n["sector-num"].getBiggestInt)
  result.sectorsCount = int64(n["sectors-count"].getBiggestInt)

type DeviceTrayMovedEvent* = object
  device*: string
  id*: string
  trayOpen*: bool

proc name*(_: typedesc[DeviceTrayMovedEvent]): string = "DEVICE_TRAY_MOVED"
proc parse*(_: typedesc[DeviceTrayMovedEvent], n: JsonNode): DeviceTrayMovedEvent =
  result = default(DeviceTrayMovedEvent)
  result.device = n["device"].getStr
  result.id = n["id"].getStr
  result.trayOpen = n["tray-open"].getBool

type PrManagerStatusChangedEvent* = object
  id*: string
  connected*: bool

proc name*(_: typedesc[PrManagerStatusChangedEvent]): string = "PR_MANAGER_STATUS_CHANGED"
proc parse*(_: typedesc[PrManagerStatusChangedEvent], n: JsonNode): PrManagerStatusChangedEvent =
  result = default(PrManagerStatusChangedEvent)
  result.id = n["id"].getStr
  result.connected = n["connected"].getBool

type BlockExportDeletedEvent* = object
  id*: string

proc name*(_: typedesc[BlockExportDeletedEvent]): string = "BLOCK_EXPORT_DELETED"
proc parse*(_: typedesc[BlockExportDeletedEvent], n: JsonNode): BlockExportDeletedEvent =
  result = default(BlockExportDeletedEvent)
  result.id = n["id"].getStr

type VserportChangeEvent* = object
  id*: string
  open*: bool

proc name*(_: typedesc[VserportChangeEvent]): string = "VSERPORT_CHANGE"
proc parse*(_: typedesc[VserportChangeEvent], n: JsonNode): VserportChangeEvent =
  result = default(VserportChangeEvent)
  result.id = n["id"].getStr
  result.open = n["open"].getBool

type DumpCompletedEvent* = object
  result*: DumpQueryResult
  error*: Option[string]

proc name*(_: typedesc[DumpCompletedEvent]): string = "DUMP_COMPLETED"
proc parse*(_: typedesc[DumpCompletedEvent], n: JsonNode): DumpCompletedEvent =
  result = default(DumpCompletedEvent)
  result.result = parse(typedesc[DumpQueryResult], n["result"])
  if n.hasKey("error"):
    result.error = some(n["error"].getStr)

type NicRxFilterChangedEvent* = object
  name*: Option[string]
  path*: string

proc name*(_: typedesc[NicRxFilterChangedEvent]): string = "NIC_RX_FILTER_CHANGED"
proc parse*(_: typedesc[NicRxFilterChangedEvent], n: JsonNode): NicRxFilterChangedEvent =
  result = default(NicRxFilterChangedEvent)
  if n.hasKey("name"):
    result.name = some(n["name"].getStr)
  result.path = n["path"].getStr

type FailoverNegotiatedEvent* = object
  deviceId*: string

proc name*(_: typedesc[FailoverNegotiatedEvent]): string = "FAILOVER_NEGOTIATED"
proc parse*(_: typedesc[FailoverNegotiatedEvent], n: JsonNode): FailoverNegotiatedEvent =
  result = default(FailoverNegotiatedEvent)
  result.deviceId = n["device-id"].getStr

type NetdevStreamConnectedEvent* = object
  netdevId*: string
  `addr`*: SocketAddress

proc name*(_: typedesc[NetdevStreamConnectedEvent]): string = "NETDEV_STREAM_CONNECTED"
proc parse*(_: typedesc[NetdevStreamConnectedEvent], n: JsonNode): NetdevStreamConnectedEvent =
  result = default(NetdevStreamConnectedEvent)
  result.netdevId = n["netdev-id"].getStr
  result.`addr` = parse(typedesc[SocketAddress], n["addr"])

type NetdevStreamDisconnectedEvent* = object
  netdevId*: string

proc name*(_: typedesc[NetdevStreamDisconnectedEvent]): string = "NETDEV_STREAM_DISCONNECTED"
proc parse*(_: typedesc[NetdevStreamDisconnectedEvent], n: JsonNode): NetdevStreamDisconnectedEvent =
  result = default(NetdevStreamDisconnectedEvent)
  result.netdevId = n["netdev-id"].getStr

type NetdevVhostUserConnectedEvent* = object
  netdevId*: string
  chardevId*: string

proc name*(_: typedesc[NetdevVhostUserConnectedEvent]): string = "NETDEV_VHOST_USER_CONNECTED"
proc parse*(_: typedesc[NetdevVhostUserConnectedEvent], n: JsonNode): NetdevVhostUserConnectedEvent =
  result = default(NetdevVhostUserConnectedEvent)
  result.netdevId = n["netdev-id"].getStr
  result.chardevId = n["chardev-id"].getStr

type NetdevVhostUserDisconnectedEvent* = object
  netdevId*: string

proc name*(_: typedesc[NetdevVhostUserDisconnectedEvent]): string = "NETDEV_VHOST_USER_DISCONNECTED"
proc parse*(_: typedesc[NetdevVhostUserDisconnectedEvent], n: JsonNode): NetdevVhostUserDisconnectedEvent =
  result = default(NetdevVhostUserDisconnectedEvent)
  result.netdevId = n["netdev-id"].getStr

type SpiceConnectedEvent* = object
  server*: SpiceBasicInfo
  client*: SpiceBasicInfo

proc name*(_: typedesc[SpiceConnectedEvent]): string = "SPICE_CONNECTED"
proc parse*(_: typedesc[SpiceConnectedEvent], n: JsonNode): SpiceConnectedEvent =
  result = default(SpiceConnectedEvent)
  result.server = parse(typedesc[SpiceBasicInfo], n["server"])
  result.client = parse(typedesc[SpiceBasicInfo], n["client"])

type SpiceInitializedEvent* = object
  server*: SpiceServerInfo
  client*: SpiceChannel

proc name*(_: typedesc[SpiceInitializedEvent]): string = "SPICE_INITIALIZED"
proc parse*(_: typedesc[SpiceInitializedEvent], n: JsonNode): SpiceInitializedEvent =
  result = default(SpiceInitializedEvent)
  result.server = parse(typedesc[SpiceServerInfo], n["server"])
  result.client = parse(typedesc[SpiceChannel], n["client"])

type SpiceDisconnectedEvent* = object
  server*: SpiceBasicInfo
  client*: SpiceBasicInfo

proc name*(_: typedesc[SpiceDisconnectedEvent]): string = "SPICE_DISCONNECTED"
proc parse*(_: typedesc[SpiceDisconnectedEvent], n: JsonNode): SpiceDisconnectedEvent =
  result = default(SpiceDisconnectedEvent)
  result.server = parse(typedesc[SpiceBasicInfo], n["server"])
  result.client = parse(typedesc[SpiceBasicInfo], n["client"])

type SpiceMigrateCompletedEvent* = object
  discard

proc name*(_: typedesc[SpiceMigrateCompletedEvent]): string = "SPICE_MIGRATE_COMPLETED"
proc parse*(_: typedesc[SpiceMigrateCompletedEvent], n: JsonNode): SpiceMigrateCompletedEvent =
  result = default(SpiceMigrateCompletedEvent)

type VncConnectedEvent* = object
  server*: VncServerInfo
  client*: VncBasicInfo

proc name*(_: typedesc[VncConnectedEvent]): string = "VNC_CONNECTED"
proc parse*(_: typedesc[VncConnectedEvent], n: JsonNode): VncConnectedEvent =
  result = default(VncConnectedEvent)
  result.server = parse(typedesc[VncServerInfo], n["server"])
  result.client = parse(typedesc[VncBasicInfo], n["client"])

type VncInitializedEvent* = object
  server*: VncServerInfo
  client*: VncClientInfo

proc name*(_: typedesc[VncInitializedEvent]): string = "VNC_INITIALIZED"
proc parse*(_: typedesc[VncInitializedEvent], n: JsonNode): VncInitializedEvent =
  result = default(VncInitializedEvent)
  result.server = parse(typedesc[VncServerInfo], n["server"])
  result.client = parse(typedesc[VncClientInfo], n["client"])

type VncDisconnectedEvent* = object
  server*: VncServerInfo
  client*: VncClientInfo

proc name*(_: typedesc[VncDisconnectedEvent]): string = "VNC_DISCONNECTED"
proc parse*(_: typedesc[VncDisconnectedEvent], n: JsonNode): VncDisconnectedEvent =
  result = default(VncDisconnectedEvent)
  result.server = parse(typedesc[VncServerInfo], n["server"])
  result.client = parse(typedesc[VncClientInfo], n["client"])

type MigrationEvent* = object
  status*: MigrationStatus

proc name*(_: typedesc[MigrationEvent]): string = "MIGRATION"
proc parse*(_: typedesc[MigrationEvent], n: JsonNode): MigrationEvent =
  result = default(MigrationEvent)
  result.status = parse(typedesc[MigrationStatus], n["status"])

type MigrationPassEvent* = object
  pass*: int64

proc name*(_: typedesc[MigrationPassEvent]): string = "MIGRATION_PASS"
proc parse*(_: typedesc[MigrationPassEvent], n: JsonNode): MigrationPassEvent =
  result = default(MigrationPassEvent)
  result.pass = int64(n["pass"].getBiggestInt)

type ColoExitEvent* = object
  mode*: COLOMode
  reason*: COLOExitReason

proc name*(_: typedesc[ColoExitEvent]): string = "COLO_EXIT"
proc parse*(_: typedesc[ColoExitEvent], n: JsonNode): ColoExitEvent =
  result = default(ColoExitEvent)
  result.mode = parse(typedesc[COLOMode], n["mode"])
  result.reason = parse(typedesc[COLOExitReason], n["reason"])

type UnplugPrimaryEvent* = object
  deviceId*: string

proc name*(_: typedesc[UnplugPrimaryEvent]): string = "UNPLUG_PRIMARY"
proc parse*(_: typedesc[UnplugPrimaryEvent], n: JsonNode): UnplugPrimaryEvent =
  result = default(UnplugPrimaryEvent)
  result.deviceId = n["device-id"].getStr

type DeviceDeletedEvent* = object
  device*: Option[string]
  path*: string

proc name*(_: typedesc[DeviceDeletedEvent]): string = "DEVICE_DELETED"
proc parse*(_: typedesc[DeviceDeletedEvent], n: JsonNode): DeviceDeletedEvent =
  result = default(DeviceDeletedEvent)
  if n.hasKey("device"):
    result.device = some(n["device"].getStr)
  result.path = n["path"].getStr

type DeviceUnplugGuestErrorEvent* = object
  device*: Option[string]
  path*: string

proc name*(_: typedesc[DeviceUnplugGuestErrorEvent]): string = "DEVICE_UNPLUG_GUEST_ERROR"
proc parse*(_: typedesc[DeviceUnplugGuestErrorEvent], n: JsonNode): DeviceUnplugGuestErrorEvent =
  result = default(DeviceUnplugGuestErrorEvent)
  if n.hasKey("device"):
    result.device = some(n["device"].getStr)
  result.path = n["path"].getStr

type BalloonChangeEvent* = object
  actual*: int64

proc name*(_: typedesc[BalloonChangeEvent]): string = "BALLOON_CHANGE"
proc parse*(_: typedesc[BalloonChangeEvent], n: JsonNode): BalloonChangeEvent =
  result = default(BalloonChangeEvent)
  result.actual = int64(n["actual"].getBiggestInt)

type HvBalloonStatusReportEvent* = object
  data*: HvBalloonInfo

proc name*(_: typedesc[HvBalloonStatusReportEvent]): string = "HV_BALLOON_STATUS_REPORT"
proc parse*(_: typedesc[HvBalloonStatusReportEvent], n: JsonNode): HvBalloonStatusReportEvent =
  result = default(HvBalloonStatusReportEvent)
  result.data = parse(typedesc[HvBalloonInfo], n)

type MemoryDeviceSizeChangeEvent* = object
  id*: Option[string]
  size*: uint64
  qomPath*: string

proc name*(_: typedesc[MemoryDeviceSizeChangeEvent]): string = "MEMORY_DEVICE_SIZE_CHANGE"
proc parse*(_: typedesc[MemoryDeviceSizeChangeEvent], n: JsonNode): MemoryDeviceSizeChangeEvent =
  result = default(MemoryDeviceSizeChangeEvent)
  if n.hasKey("id"):
    result.id = some(n["id"].getStr)
  result.size = cast[uint64](n["size"].getBiggestInt)
  result.qomPath = n["qom-path"].getStr

type CpuPolarizationChangeEvent* = object
  polarization*: S390CpuPolarization

proc name*(_: typedesc[CpuPolarizationChangeEvent]): string = "CPU_POLARIZATION_CHANGE"
proc parse*(_: typedesc[CpuPolarizationChangeEvent], n: JsonNode): CpuPolarizationChangeEvent =
  result = default(CpuPolarizationChangeEvent)
  result.polarization = parse(typedesc[S390CpuPolarization], n["polarization"])

type SclpCpiInfoAvailableEvent* = object
  discard

proc name*(_: typedesc[SclpCpiInfoAvailableEvent]): string = "SCLP_CPI_INFO_AVAILABLE"
proc parse*(_: typedesc[SclpCpiInfoAvailableEvent], n: JsonNode): SclpCpiInfoAvailableEvent =
  result = default(SclpCpiInfoAvailableEvent)

type RtcChangeEvent* = object
  offset*: int64
  qomPath*: string

proc name*(_: typedesc[RtcChangeEvent]): string = "RTC_CHANGE"
proc parse*(_: typedesc[RtcChangeEvent], n: JsonNode): RtcChangeEvent =
  result = default(RtcChangeEvent)
  result.offset = int64(n["offset"].getBiggestInt)
  result.qomPath = n["qom-path"].getStr

type VfuClientHangupEvent* = object
  vfuId*: string
  vfuQomPath*: string
  devId*: string
  devQomPath*: string

proc name*(_: typedesc[VfuClientHangupEvent]): string = "VFU_CLIENT_HANGUP"
proc parse*(_: typedesc[VfuClientHangupEvent], n: JsonNode): VfuClientHangupEvent =
  result = default(VfuClientHangupEvent)
  result.vfuId = n["vfu-id"].getStr
  result.vfuQomPath = n["vfu-qom-path"].getStr
  result.devId = n["dev-id"].getStr
  result.devQomPath = n["dev-qom-path"].getStr

type AcpiDeviceOstEvent* = object
  info*: ACPIOSTInfo

proc name*(_: typedesc[AcpiDeviceOstEvent]): string = "ACPI_DEVICE_OST"
proc parse*(_: typedesc[AcpiDeviceOstEvent], n: JsonNode): AcpiDeviceOstEvent =
  result = default(AcpiDeviceOstEvent)
  result.info = parse(typedesc[ACPIOSTInfo], n["info"])

type VfioMigrationEvent* = object
  deviceId*: string
  qomPath*: string
  deviceState*: QapiVfioMigrationState

proc name*(_: typedesc[VfioMigrationEvent]): string = "VFIO_MIGRATION"
proc parse*(_: typedesc[VfioMigrationEvent], n: JsonNode): VfioMigrationEvent =
  result = default(VfioMigrationEvent)
  result.deviceId = n["device-id"].getStr
  result.qomPath = n["qom-path"].getStr
  result.deviceState = parse(typedesc[QapiVfioMigrationState], n["device-state"])

proc queryStatus*(client: var QmpClient): StatusInfo =
  result = default(StatusInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-status", argsNode)
  result = parse(typedesc[StatusInfo], resp)

proc watchdogSetAction*(client: var QmpClient, action: WatchdogAction): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["action"] = %(action)
  let resp = client.execute("watchdog-set-action", argsNode)
  result = resp

proc setAction*(client: var QmpClient, reboot: Option[RebootAction] = none(RebootAction), shutdown: Option[ShutdownAction] = none(ShutdownAction), panic: Option[PanicAction] = none(PanicAction), watchdog: Option[WatchdogAction] = none(WatchdogAction)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if reboot.isSome: argsNode["reboot"] = %(reboot.get)
  if shutdown.isSome: argsNode["shutdown"] = %(shutdown.get)
  if panic.isSome: argsNode["panic"] = %(panic.get)
  if watchdog.isSome: argsNode["watchdog"] = %(watchdog.get)
  let resp = client.execute("set-action", argsNode)
  result = resp

proc jobPause*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-pause", argsNode)
  result = resp

proc jobResume*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-resume", argsNode)
  result = resp

proc jobCancel*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-cancel", argsNode)
  result = resp

proc jobComplete*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-complete", argsNode)
  result = resp

proc jobDismiss*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-dismiss", argsNode)
  result = resp

proc jobFinalize*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("job-finalize", argsNode)
  result = resp

proc queryJobs*(client: var QmpClient): seq[JobInfo] =
  result = default(seq[JobInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-jobs", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[JobInfo], it))

proc queryKvm*(client: var QmpClient): KvmInfo =
  result = default(KvmInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-kvm", argsNode)
  result = parse(typedesc[KvmInfo], resp)

proc xAccelStats*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-accel-stats", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc queryAccelerators*(client: var QmpClient): AcceleratorInfo =
  result = default(AcceleratorInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-accelerators", argsNode)
  result = parse(typedesc[AcceleratorInfo], resp)

proc queryBlock*(client: var QmpClient, flat: Option[bool] = none(bool)): seq[BlockInfo] =
  result = default(seq[BlockInfo])
  var argsNode = newJObject()
  if flat.isSome: argsNode["flat"] = %(flat.get)
  let resp = client.execute("query-block", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[BlockInfo], it))

proc queryBlockstats*(client: var QmpClient, queryNodes: Option[bool] = none(bool)): seq[BlockStats] =
  result = default(seq[BlockStats])
  var argsNode = newJObject()
  if queryNodes.isSome: argsNode["query-nodes"] = %(queryNodes.get)
  let resp = client.execute("query-blockstats", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[BlockStats], it))

proc queryBlockJobs*(client: var QmpClient): seq[BlockJobInfo] =
  result = default(seq[BlockJobInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-block-jobs", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[BlockJobInfo], it))

proc blockResize*(client: var QmpClient, device: Option[string] = none(string), nodeName: Option[string] = none(string), size: int64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if nodeName.isSome: argsNode["node-name"] = %(nodeName.get)
  argsNode["size"] = %(size)
  let resp = client.execute("block_resize", argsNode)
  result = resp

proc blockdevSnapshotSync*(client: var QmpClient, args: BlockdevSnapshotSync): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("blockdev-snapshot-sync", argsNode)
  result = resp

proc blockdevSnapshot*(client: var QmpClient, args: BlockdevSnapshot): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("blockdev-snapshot", argsNode)
  result = resp

proc changeBackingFile*(client: var QmpClient, device: string, imageNodeName: string, backingFile: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  argsNode["image-node-name"] = %(imageNodeName)
  argsNode["backing-file"] = %(backingFile)
  let resp = client.execute("change-backing-file", argsNode)
  result = resp

proc blockCommit*(client: var QmpClient, jobId: Option[string] = none(string), device: string, baseNode: Option[string] = none(string), base: Option[string] = none(string), topNode: Option[string] = none(string), top: Option[string] = none(string), backingFile: Option[string] = none(string), backingMaskProtocol: Option[bool] = none(bool), speed: Option[int64] = none(int64), onError: Option[BlockdevOnError] = none(BlockdevOnError), filterNodeName: Option[string] = none(string), autoFinalize: Option[bool] = none(bool), autoDismiss: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if jobId.isSome: argsNode["job-id"] = %(jobId.get)
  argsNode["device"] = %(device)
  if baseNode.isSome: argsNode["base-node"] = %(baseNode.get)
  if base.isSome: argsNode["base"] = %(base.get)
  if topNode.isSome: argsNode["top-node"] = %(topNode.get)
  if top.isSome: argsNode["top"] = %(top.get)
  if backingFile.isSome: argsNode["backing-file"] = %(backingFile.get)
  if backingMaskProtocol.isSome: argsNode["backing-mask-protocol"] = %(backingMaskProtocol.get)
  if speed.isSome: argsNode["speed"] = %(speed.get)
  if onError.isSome: argsNode["on-error"] = %(onError.get)
  if filterNodeName.isSome: argsNode["filter-node-name"] = %(filterNodeName.get)
  if autoFinalize.isSome: argsNode["auto-finalize"] = %(autoFinalize.get)
  if autoDismiss.isSome: argsNode["auto-dismiss"] = %(autoDismiss.get)
  let resp = client.execute("block-commit", argsNode)
  result = resp

proc driveBackup*(client: var QmpClient, args: DriveBackup): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("drive-backup", argsNode)
  result = resp

proc blockdevBackup*(client: var QmpClient, args: BlockdevBackup): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("blockdev-backup", argsNode)
  result = resp

proc queryNamedBlockNodes*(client: var QmpClient, flat: Option[bool] = none(bool)): seq[BlockDeviceInfo] =
  result = default(seq[BlockDeviceInfo])
  var argsNode = newJObject()
  if flat.isSome: argsNode["flat"] = %(flat.get)
  let resp = client.execute("query-named-block-nodes", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[BlockDeviceInfo], it))

proc xDebugQueryBlockGraph*(client: var QmpClient): XDbgBlockGraph =
  result = default(XDbgBlockGraph)
  var argsNode = newJObject()
  let resp = client.execute("x-debug-query-block-graph", argsNode)
  result = parse(typedesc[XDbgBlockGraph], resp)

proc driveMirror*(client: var QmpClient, args: DriveMirror): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("drive-mirror", argsNode)
  result = resp

proc blockDirtyBitmapAdd*(client: var QmpClient, args: BlockDirtyBitmapAdd): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-add", argsNode)
  result = resp

proc blockDirtyBitmapRemove*(client: var QmpClient, args: BlockDirtyBitmap): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-remove", argsNode)
  result = resp

proc blockDirtyBitmapClear*(client: var QmpClient, args: BlockDirtyBitmap): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-clear", argsNode)
  result = resp

proc blockDirtyBitmapEnable*(client: var QmpClient, args: BlockDirtyBitmap): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-enable", argsNode)
  result = resp

proc blockDirtyBitmapDisable*(client: var QmpClient, args: BlockDirtyBitmap): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-disable", argsNode)
  result = resp

proc blockDirtyBitmapMerge*(client: var QmpClient, args: BlockDirtyBitmapMerge): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-dirty-bitmap-merge", argsNode)
  result = resp

proc xDebugBlockDirtyBitmapSha256*(client: var QmpClient, args: BlockDirtyBitmap): BlockDirtyBitmapSha256 =
  result = default(BlockDirtyBitmapSha256)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("x-debug-block-dirty-bitmap-sha256", argsNode)
  result = parse(typedesc[BlockDirtyBitmapSha256], resp)

proc blockdevMirror*(client: var QmpClient, jobId: Option[string] = none(string), device: string, target: string, replaces: Option[string] = none(string), sync: MirrorSyncMode, speed: Option[int64] = none(int64), granularity: Option[uint32] = none(uint32), bufSize: Option[int64] = none(int64), onSourceError: Option[BlockdevOnError] = none(BlockdevOnError), onTargetError: Option[BlockdevOnError] = none(BlockdevOnError), filterNodeName: Option[string] = none(string), copyMode: Option[MirrorCopyMode] = none(MirrorCopyMode), autoFinalize: Option[bool] = none(bool), autoDismiss: Option[bool] = none(bool), targetIsZero: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if jobId.isSome: argsNode["job-id"] = %(jobId.get)
  argsNode["device"] = %(device)
  argsNode["target"] = %(target)
  if replaces.isSome: argsNode["replaces"] = %(replaces.get)
  argsNode["sync"] = %(sync)
  if speed.isSome: argsNode["speed"] = %(speed.get)
  if granularity.isSome: argsNode["granularity"] = %(granularity.get)
  if bufSize.isSome: argsNode["buf-size"] = %(bufSize.get)
  if onSourceError.isSome: argsNode["on-source-error"] = %(onSourceError.get)
  if onTargetError.isSome: argsNode["on-target-error"] = %(onTargetError.get)
  if filterNodeName.isSome: argsNode["filter-node-name"] = %(filterNodeName.get)
  if copyMode.isSome: argsNode["copy-mode"] = %(copyMode.get)
  if autoFinalize.isSome: argsNode["auto-finalize"] = %(autoFinalize.get)
  if autoDismiss.isSome: argsNode["auto-dismiss"] = %(autoDismiss.get)
  if targetIsZero.isSome: argsNode["target-is-zero"] = %(targetIsZero.get)
  let resp = client.execute("blockdev-mirror", argsNode)
  result = resp

proc blockStream*(client: var QmpClient, jobId: Option[string] = none(string), device: string, base: Option[string] = none(string), baseNode: Option[string] = none(string), backingFile: Option[string] = none(string), backingMaskProtocol: Option[bool] = none(bool), bottom: Option[string] = none(string), speed: Option[int64] = none(int64), onError: Option[BlockdevOnError] = none(BlockdevOnError), filterNodeName: Option[string] = none(string), autoFinalize: Option[bool] = none(bool), autoDismiss: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if jobId.isSome: argsNode["job-id"] = %(jobId.get)
  argsNode["device"] = %(device)
  if base.isSome: argsNode["base"] = %(base.get)
  if baseNode.isSome: argsNode["base-node"] = %(baseNode.get)
  if backingFile.isSome: argsNode["backing-file"] = %(backingFile.get)
  if backingMaskProtocol.isSome: argsNode["backing-mask-protocol"] = %(backingMaskProtocol.get)
  if bottom.isSome: argsNode["bottom"] = %(bottom.get)
  if speed.isSome: argsNode["speed"] = %(speed.get)
  if onError.isSome: argsNode["on-error"] = %(onError.get)
  if filterNodeName.isSome: argsNode["filter-node-name"] = %(filterNodeName.get)
  if autoFinalize.isSome: argsNode["auto-finalize"] = %(autoFinalize.get)
  if autoDismiss.isSome: argsNode["auto-dismiss"] = %(autoDismiss.get)
  let resp = client.execute("block-stream", argsNode)
  result = resp

proc blockJobSetSpeed*(client: var QmpClient, device: string, speed: int64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  argsNode["speed"] = %(speed)
  let resp = client.execute("block-job-set-speed", argsNode)
  result = resp

proc blockJobCancel*(client: var QmpClient, device: string, force: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  if force.isSome: argsNode["force"] = %(force.get)
  let resp = client.execute("block-job-cancel", argsNode)
  result = resp

proc blockJobPause*(client: var QmpClient, device: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  let resp = client.execute("block-job-pause", argsNode)
  result = resp

proc blockJobResume*(client: var QmpClient, device: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  let resp = client.execute("block-job-resume", argsNode)
  result = resp

proc blockJobComplete*(client: var QmpClient, device: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  let resp = client.execute("block-job-complete", argsNode)
  result = resp

proc blockJobDismiss*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("block-job-dismiss", argsNode)
  result = resp

proc blockJobFinalize*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("block-job-finalize", argsNode)
  result = resp

proc blockJobChange*(client: var QmpClient, args: BlockJobChangeOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-job-change", argsNode)
  result = resp

proc blockdevAdd*(client: var QmpClient, args: BlockdevOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("blockdev-add", argsNode)
  result = resp

proc blockdevReopen*(client: var QmpClient, options: seq[BlockdevOptions]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["options"] = %(options)
  let resp = client.execute("blockdev-reopen", argsNode)
  result = resp

proc blockdevDel*(client: var QmpClient, nodeName: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["node-name"] = %(nodeName)
  let resp = client.execute("blockdev-del", argsNode)
  result = resp

proc blockdevSetActive*(client: var QmpClient, nodeName: Option[string] = none(string), active: bool): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if nodeName.isSome: argsNode["node-name"] = %(nodeName.get)
  argsNode["active"] = %(active)
  let resp = client.execute("blockdev-set-active", argsNode)
  result = resp

proc blockdevCreate*(client: var QmpClient, jobId: string, options: BlockdevCreateOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["job-id"] = %(jobId)
  argsNode["options"] = %(options)
  let resp = client.execute("blockdev-create", argsNode)
  result = resp

proc xBlockdevAmend*(client: var QmpClient, jobId: string, nodeName: string, options: BlockdevAmendOptions, force: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["job-id"] = %(jobId)
  argsNode["node-name"] = %(nodeName)
  argsNode["options"] = %(options)
  if force.isSome: argsNode["force"] = %(force.get)
  let resp = client.execute("x-blockdev-amend", argsNode)
  result = resp

proc blockSetWriteThreshold*(client: var QmpClient, nodeName: string, writeThreshold: uint64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["node-name"] = %(nodeName)
  argsNode["write-threshold"] = %(writeThreshold)
  let resp = client.execute("block-set-write-threshold", argsNode)
  result = resp

proc xBlockdevChange*(client: var QmpClient, parent: string, child: Option[string] = none(string), node: Option[string] = none(string)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["parent"] = %(parent)
  if child.isSome: argsNode["child"] = %(child.get)
  if node.isSome: argsNode["node"] = %(node.get)
  let resp = client.execute("x-blockdev-change", argsNode)
  result = resp

proc xBlockdevSetIothread*(client: var QmpClient, nodeName: string, iothread: StrOrNull, force: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["node-name"] = %(nodeName)
  argsNode["iothread"] = %(iothread)
  if force.isSome: argsNode["force"] = %(force.get)
  let resp = client.execute("x-blockdev-set-iothread", argsNode)
  result = resp

proc blockdevSnapshotInternalSync*(client: var QmpClient, args: BlockdevSnapshotInternal): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("blockdev-snapshot-internal-sync", argsNode)
  result = resp

proc blockdevSnapshotDeleteInternalSync*(client: var QmpClient, device: string, id: Option[string] = none(string), name: Option[string] = none(string)): SnapshotInfo =
  result = default(SnapshotInfo)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  if id.isSome: argsNode["id"] = %(id.get)
  if name.isSome: argsNode["name"] = %(name.get)
  let resp = client.execute("blockdev-snapshot-delete-internal-sync", argsNode)
  result = parse(typedesc[SnapshotInfo], resp)

proc queryPrManagers*(client: var QmpClient): seq[PRManagerInfo] =
  result = default(seq[PRManagerInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-pr-managers", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[PRManagerInfo], it))

proc eject*(client: var QmpClient, device: Option[string] = none(string), id: Option[string] = none(string), force: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if id.isSome: argsNode["id"] = %(id.get)
  if force.isSome: argsNode["force"] = %(force.get)
  let resp = client.execute("eject", argsNode)
  result = resp

proc blockdevOpenTray*(client: var QmpClient, device: Option[string] = none(string), id: Option[string] = none(string), force: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if id.isSome: argsNode["id"] = %(id.get)
  if force.isSome: argsNode["force"] = %(force.get)
  let resp = client.execute("blockdev-open-tray", argsNode)
  result = resp

proc blockdevCloseTray*(client: var QmpClient, device: Option[string] = none(string), id: Option[string] = none(string)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if id.isSome: argsNode["id"] = %(id.get)
  let resp = client.execute("blockdev-close-tray", argsNode)
  result = resp

proc blockdevRemoveMedium*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("blockdev-remove-medium", argsNode)
  result = resp

proc blockdevInsertMedium*(client: var QmpClient, id: string, nodeName: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  argsNode["node-name"] = %(nodeName)
  let resp = client.execute("blockdev-insert-medium", argsNode)
  result = resp

proc blockdevChangeMedium*(client: var QmpClient, device: Option[string] = none(string), id: Option[string] = none(string), filename: string, format: Option[string] = none(string), force: Option[bool] = none(bool), readOnlyMode: Option[BlockdevChangeReadOnlyMode] = none(BlockdevChangeReadOnlyMode)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if id.isSome: argsNode["id"] = %(id.get)
  argsNode["filename"] = %(filename)
  if format.isSome: argsNode["format"] = %(format.get)
  if force.isSome: argsNode["force"] = %(force.get)
  if readOnlyMode.isSome: argsNode["read-only-mode"] = %(readOnlyMode.get)
  let resp = client.execute("blockdev-change-medium", argsNode)
  result = resp

proc blockSetIoThrottle*(client: var QmpClient, args: BlockIOThrottle): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block_set_io_throttle", argsNode)
  result = resp

proc blockLatencyHistogramSet*(client: var QmpClient, id: string, boundaries: Option[seq[uint64]] = none(seq[uint64]), boundariesRead: Option[seq[uint64]] = none(seq[uint64]), boundariesWrite: Option[seq[uint64]] = none(seq[uint64]), boundariesZap: Option[seq[uint64]] = none(seq[uint64]), boundariesFlush: Option[seq[uint64]] = none(seq[uint64])): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  if boundaries.isSome: argsNode["boundaries"] = %(boundaries.get)
  if boundariesRead.isSome: argsNode["boundaries-read"] = %(boundariesRead.get)
  if boundariesWrite.isSome: argsNode["boundaries-write"] = %(boundariesWrite.get)
  if boundariesZap.isSome: argsNode["boundaries-zap"] = %(boundariesZap.get)
  if boundariesFlush.isSome: argsNode["boundaries-flush"] = %(boundariesFlush.get)
  let resp = client.execute("block-latency-histogram-set", argsNode)
  result = resp

proc nbdServerStart*(client: var QmpClient, args: NbdServerOptionsLegacy): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("nbd-server-start", argsNode)
  result = resp

proc nbdServerAdd*(client: var QmpClient, args: NbdServerAddOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("nbd-server-add", argsNode)
  result = resp

proc nbdServerRemove*(client: var QmpClient, name: string, mode: Option[BlockExportRemoveMode] = none(BlockExportRemoveMode)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  if mode.isSome: argsNode["mode"] = %(mode.get)
  let resp = client.execute("nbd-server-remove", argsNode)
  result = resp

proc nbdServerStop*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("nbd-server-stop", argsNode)
  result = resp

proc blockExportAdd*(client: var QmpClient, args: BlockExportOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("block-export-add", argsNode)
  result = resp

proc blockExportDel*(client: var QmpClient, id: string, mode: Option[BlockExportRemoveMode] = none(BlockExportRemoveMode)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  if mode.isSome: argsNode["mode"] = %(mode.get)
  let resp = client.execute("block-export-del", argsNode)
  result = resp

proc queryBlockExports*(client: var QmpClient): seq[BlockExportInfo] =
  result = default(seq[BlockExportInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-block-exports", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[BlockExportInfo], it))

proc queryChardev*(client: var QmpClient): seq[ChardevInfo] =
  result = default(seq[ChardevInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-chardev", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ChardevInfo], it))

proc queryChardevBackends*(client: var QmpClient): seq[ChardevBackendInfo] =
  result = default(seq[ChardevBackendInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-chardev-backends", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ChardevBackendInfo], it))

proc ringbufWrite*(client: var QmpClient, device: string, data: string, format: Option[DataFormat] = none(DataFormat)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  argsNode["data"] = %(data)
  if format.isSome: argsNode["format"] = %(format.get)
  let resp = client.execute("ringbuf-write", argsNode)
  result = resp

proc ringbufRead*(client: var QmpClient, device: string, size: int64, format: Option[DataFormat] = none(DataFormat)): string =
  result = default(string)
  var argsNode = newJObject()
  argsNode["device"] = %(device)
  argsNode["size"] = %(size)
  if format.isSome: argsNode["format"] = %(format.get)
  let resp = client.execute("ringbuf-read", argsNode)
  result = resp.getStr

proc chardevAdd*(client: var QmpClient, id: string, backend: ChardevBackend): ChardevReturn =
  result = default(ChardevReturn)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  argsNode["backend"] = %(backend)
  let resp = client.execute("chardev-add", argsNode)
  result = parse(typedesc[ChardevReturn], resp)

proc chardevChange*(client: var QmpClient, id: string, backend: ChardevBackend): ChardevReturn =
  result = default(ChardevReturn)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  argsNode["backend"] = %(backend)
  let resp = client.execute("chardev-change", argsNode)
  result = parse(typedesc[ChardevReturn], resp)

proc chardevRemove*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("chardev-remove", argsNode)
  result = resp

proc chardevSendBreak*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("chardev-send-break", argsNode)
  result = resp

proc dumpGuestMemory*(client: var QmpClient, paging: bool, protocol: string, detach: Option[bool] = none(bool), begin: Option[int64] = none(int64), length: Option[int64] = none(int64), format: Option[DumpGuestMemoryFormat] = none(DumpGuestMemoryFormat)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["paging"] = %(paging)
  argsNode["protocol"] = %(protocol)
  if detach.isSome: argsNode["detach"] = %(detach.get)
  if begin.isSome: argsNode["begin"] = %(begin.get)
  if length.isSome: argsNode["length"] = %(length.get)
  if format.isSome: argsNode["format"] = %(format.get)
  let resp = client.execute("dump-guest-memory", argsNode)
  result = resp

proc queryDump*(client: var QmpClient): DumpQueryResult =
  result = default(DumpQueryResult)
  var argsNode = newJObject()
  let resp = client.execute("query-dump", argsNode)
  result = parse(typedesc[DumpQueryResult], resp)

proc queryDumpGuestMemoryCapability*(client: var QmpClient): DumpGuestMemoryCapability =
  result = default(DumpGuestMemoryCapability)
  var argsNode = newJObject()
  let resp = client.execute("query-dump-guest-memory-capability", argsNode)
  result = parse(typedesc[DumpGuestMemoryCapability], resp)

proc setLink*(client: var QmpClient, name: string, up: bool): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  argsNode["up"] = %(up)
  let resp = client.execute("set_link", argsNode)
  result = resp

proc netdevAdd*(client: var QmpClient, args: Netdev): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("netdev_add", argsNode)
  result = resp

proc netdevDel*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("netdev_del", argsNode)
  result = resp

proc queryRxFilter*(client: var QmpClient, name: Option[string] = none(string)): seq[RxFilterInfo] =
  result = default(seq[RxFilterInfo])
  var argsNode = newJObject()
  if name.isSome: argsNode["name"] = %(name.get)
  let resp = client.execute("query-rx-filter", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[RxFilterInfo], it))

proc announceSelf*(client: var QmpClient, args: AnnounceParameters): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("announce-self", argsNode)
  result = resp

proc requestEbpf*(client: var QmpClient, id: EbpfProgramID): EbpfObject =
  result = default(EbpfObject)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("request-ebpf", argsNode)
  result = parse(typedesc[EbpfObject], resp)

proc queryRocker*(client: var QmpClient, name: string): RockerSwitch =
  result = default(RockerSwitch)
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  let resp = client.execute("query-rocker", argsNode)
  result = parse(typedesc[RockerSwitch], resp)

proc queryRockerPorts*(client: var QmpClient, name: string): seq[RockerPort] =
  result = default(seq[RockerPort])
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  let resp = client.execute("query-rocker-ports", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[RockerPort], it))

proc queryRockerOfDpaFlows*(client: var QmpClient, name: string, tblId: Option[uint32] = none(uint32)): seq[RockerOfDpaFlow] =
  result = default(seq[RockerOfDpaFlow])
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  if tblId.isSome: argsNode["tbl-id"] = %(tblId.get)
  let resp = client.execute("query-rocker-of-dpa-flows", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[RockerOfDpaFlow], it))

proc queryRockerOfDpaGroups*(client: var QmpClient, name: string, `type`: Option[uint8] = none(uint8)): seq[RockerOfDpaGroup] =
  result = default(seq[RockerOfDpaGroup])
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  if `type`.isSome: argsNode["type"] = %(`type`.get)
  let resp = client.execute("query-rocker-of-dpa-groups", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[RockerOfDpaGroup], it))

proc queryTpmModels*(client: var QmpClient): seq[TpmModel] =
  result = default(seq[TpmModel])
  var argsNode = newJObject()
  let resp = client.execute("query-tpm-models", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[TpmModel], it))

proc queryTpmTypes*(client: var QmpClient): seq[TpmType] =
  result = default(seq[TpmType])
  var argsNode = newJObject()
  let resp = client.execute("query-tpm-types", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[TpmType], it))

proc queryTpm*(client: var QmpClient): seq[TPMInfo] =
  result = default(seq[TPMInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-tpm", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[TPMInfo], it))

proc setPassword*(client: var QmpClient, args: SetPasswordOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("set_password", argsNode)
  result = resp

proc expirePassword*(client: var QmpClient, args: ExpirePasswordOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("expire_password", argsNode)
  result = resp

proc screendump*(client: var QmpClient, filename: string, device: Option[string] = none(string), head: Option[int64] = none(int64), format: Option[ImageFormat] = none(ImageFormat)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["filename"] = %(filename)
  if device.isSome: argsNode["device"] = %(device.get)
  if head.isSome: argsNode["head"] = %(head.get)
  if format.isSome: argsNode["format"] = %(format.get)
  let resp = client.execute("screendump", argsNode)
  result = resp

proc querySpice*(client: var QmpClient): SpiceInfo =
  result = default(SpiceInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-spice", argsNode)
  result = parse(typedesc[SpiceInfo], resp)

proc queryVnc*(client: var QmpClient): VncInfo =
  result = default(VncInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-vnc", argsNode)
  result = parse(typedesc[VncInfo], resp)

proc queryVncServers*(client: var QmpClient): seq[VncInfo2] =
  result = default(seq[VncInfo2])
  var argsNode = newJObject()
  let resp = client.execute("query-vnc-servers", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[VncInfo2], it))

proc changeVncPassword*(client: var QmpClient, password: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["password"] = %(password)
  let resp = client.execute("change-vnc-password", argsNode)
  result = resp

proc queryMice*(client: var QmpClient): seq[MouseInfo] =
  result = default(seq[MouseInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-mice", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[MouseInfo], it))

proc sendKey*(client: var QmpClient, keys: seq[KeyValue], holdTime: Option[int64] = none(int64)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["keys"] = %(keys)
  if holdTime.isSome: argsNode["hold-time"] = %(holdTime.get)
  let resp = client.execute("send-key", argsNode)
  result = resp

proc inputSendEvent*(client: var QmpClient, device: Option[string] = none(string), head: Option[int64] = none(int64), events: seq[InputEvent]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if device.isSome: argsNode["device"] = %(device.get)
  if head.isSome: argsNode["head"] = %(head.get)
  argsNode["events"] = %(events)
  let resp = client.execute("input-send-event", argsNode)
  result = resp

proc queryDisplayOptions*(client: var QmpClient): DisplayOptions =
  result = default(DisplayOptions)
  var argsNode = newJObject()
  let resp = client.execute("query-display-options", argsNode)
  result = parse(typedesc[DisplayOptions], resp)

proc displayReload*(client: var QmpClient, args: DisplayReloadOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("display-reload", argsNode)
  result = resp

proc displayUpdate*(client: var QmpClient, args: DisplayUpdateOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("display-update", argsNode)
  result = resp

proc clientMigrateInfo*(client: var QmpClient, protocol: string, hostname: string, port: Option[int64] = none(int64), tlsPort: Option[int64] = none(int64), certSubject: Option[string] = none(string)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["protocol"] = %(protocol)
  argsNode["hostname"] = %(hostname)
  if port.isSome: argsNode["port"] = %(port.get)
  if tlsPort.isSome: argsNode["tls-port"] = %(tlsPort.get)
  if certSubject.isSome: argsNode["cert-subject"] = %(certSubject.get)
  let resp = client.execute("client_migrate_info", argsNode)
  result = resp

proc queryMigrate*(client: var QmpClient): MigrationInfo =
  result = default(MigrationInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-migrate", argsNode)
  result = parse(typedesc[MigrationInfo], resp)

proc migrateSetCapabilities*(client: var QmpClient, capabilities: seq[MigrationCapabilityStatus]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["capabilities"] = %(capabilities)
  let resp = client.execute("migrate-set-capabilities", argsNode)
  result = resp

proc queryMigrateCapabilities*(client: var QmpClient): seq[MigrationCapabilityStatus] =
  result = default(seq[MigrationCapabilityStatus])
  var argsNode = newJObject()
  let resp = client.execute("query-migrate-capabilities", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[MigrationCapabilityStatus], it))

proc migrateSetParameters*(client: var QmpClient, args: MigrationParameters): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("migrate-set-parameters", argsNode)
  result = resp

proc queryMigrateParameters*(client: var QmpClient): MigrationParameters =
  result = default(MigrationParameters)
  var argsNode = newJObject()
  let resp = client.execute("query-migrate-parameters", argsNode)
  result = parse(typedesc[MigrationParameters], resp)

proc migrateStartPostcopy*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("migrate-start-postcopy", argsNode)
  result = resp

proc xColoLostHeartbeat*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("x-colo-lost-heartbeat", argsNode)
  result = resp

proc migrateCancel*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("migrate_cancel", argsNode)
  result = resp

proc migrateContinue*(client: var QmpClient, state: MigrationStatus): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["state"] = %(state)
  let resp = client.execute("migrate-continue", argsNode)
  result = resp

proc migrate*(client: var QmpClient, uri: Option[string] = none(string), channels: Option[seq[MigrationChannel]] = none(seq[MigrationChannel]), resume: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if uri.isSome: argsNode["uri"] = %(uri.get)
  if channels.isSome: argsNode["channels"] = %(channels.get)
  if resume.isSome: argsNode["resume"] = %(resume.get)
  let resp = client.execute("migrate", argsNode)
  result = resp

proc migrateIncoming*(client: var QmpClient, uri: Option[string] = none(string), channels: Option[seq[MigrationChannel]] = none(seq[MigrationChannel]), exitOnError: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if uri.isSome: argsNode["uri"] = %(uri.get)
  if channels.isSome: argsNode["channels"] = %(channels.get)
  if exitOnError.isSome: argsNode["exit-on-error"] = %(exitOnError.get)
  let resp = client.execute("migrate-incoming", argsNode)
  result = resp

proc xenSaveDevicesState*(client: var QmpClient, filename: string, live: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["filename"] = %(filename)
  if live.isSome: argsNode["live"] = %(live.get)
  let resp = client.execute("xen-save-devices-state", argsNode)
  result = resp

proc xenSetGlobalDirtyLog*(client: var QmpClient, enable: bool): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["enable"] = %(enable)
  let resp = client.execute("xen-set-global-dirty-log", argsNode)
  result = resp

proc xenLoadDevicesState*(client: var QmpClient, filename: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["filename"] = %(filename)
  let resp = client.execute("xen-load-devices-state", argsNode)
  result = resp

proc xenSetReplication*(client: var QmpClient, enable: bool, primary: bool, failover: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["enable"] = %(enable)
  argsNode["primary"] = %(primary)
  if failover.isSome: argsNode["failover"] = %(failover.get)
  let resp = client.execute("xen-set-replication", argsNode)
  result = resp

proc queryXenReplicationStatus*(client: var QmpClient): ReplicationStatus =
  result = default(ReplicationStatus)
  var argsNode = newJObject()
  let resp = client.execute("query-xen-replication-status", argsNode)
  result = parse(typedesc[ReplicationStatus], resp)

proc xenColoDoCheckpoint*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("xen-colo-do-checkpoint", argsNode)
  result = resp

proc queryColoStatus*(client: var QmpClient): COLOStatus =
  result = default(COLOStatus)
  var argsNode = newJObject()
  let resp = client.execute("query-colo-status", argsNode)
  result = parse(typedesc[COLOStatus], resp)

proc migrateRecover*(client: var QmpClient, uri: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["uri"] = %(uri)
  let resp = client.execute("migrate-recover", argsNode)
  result = resp

proc migratePause*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("migrate-pause", argsNode)
  result = resp

proc calcDirtyRate*(client: var QmpClient, calcTime: int64, calcTimeUnit: Option[TimeUnit] = none(TimeUnit), samplePages: Option[int64] = none(int64), mode: Option[DirtyRateMeasureMode] = none(DirtyRateMeasureMode)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["calc-time"] = %(calcTime)
  if calcTimeUnit.isSome: argsNode["calc-time-unit"] = %(calcTimeUnit.get)
  if samplePages.isSome: argsNode["sample-pages"] = %(samplePages.get)
  if mode.isSome: argsNode["mode"] = %(mode.get)
  let resp = client.execute("calc-dirty-rate", argsNode)
  result = resp

proc queryDirtyRate*(client: var QmpClient, calcTimeUnit: Option[TimeUnit] = none(TimeUnit)): DirtyRateInfo =
  result = default(DirtyRateInfo)
  var argsNode = newJObject()
  if calcTimeUnit.isSome: argsNode["calc-time-unit"] = %(calcTimeUnit.get)
  let resp = client.execute("query-dirty-rate", argsNode)
  result = parse(typedesc[DirtyRateInfo], resp)

proc setVcpuDirtyLimit*(client: var QmpClient, cpuIndex: Option[int64] = none(int64), dirtyRate: uint64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if cpuIndex.isSome: argsNode["cpu-index"] = %(cpuIndex.get)
  argsNode["dirty-rate"] = %(dirtyRate)
  let resp = client.execute("set-vcpu-dirty-limit", argsNode)
  result = resp

proc cancelVcpuDirtyLimit*(client: var QmpClient, cpuIndex: Option[int64] = none(int64)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if cpuIndex.isSome: argsNode["cpu-index"] = %(cpuIndex.get)
  let resp = client.execute("cancel-vcpu-dirty-limit", argsNode)
  result = resp

proc queryVcpuDirtyLimit*(client: var QmpClient): seq[DirtyLimitInfo] =
  result = default(seq[DirtyLimitInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-vcpu-dirty-limit", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[DirtyLimitInfo], it))

proc snapshotSave*(client: var QmpClient, jobId: string, tag: string, vmstate: string, devices: seq[string]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["job-id"] = %(jobId)
  argsNode["tag"] = %(tag)
  argsNode["vmstate"] = %(vmstate)
  argsNode["devices"] = %(devices)
  let resp = client.execute("snapshot-save", argsNode)
  result = resp

proc snapshotLoad*(client: var QmpClient, jobId: string, tag: string, vmstate: string, devices: seq[string]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["job-id"] = %(jobId)
  argsNode["tag"] = %(tag)
  argsNode["vmstate"] = %(vmstate)
  argsNode["devices"] = %(devices)
  let resp = client.execute("snapshot-load", argsNode)
  result = resp

proc snapshotDelete*(client: var QmpClient, jobId: string, tag: string, devices: seq[string]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["job-id"] = %(jobId)
  argsNode["tag"] = %(tag)
  argsNode["devices"] = %(devices)
  let resp = client.execute("snapshot-delete", argsNode)
  result = resp

proc transaction*(client: var QmpClient, actions: seq[TransactionAction], properties: Option[TransactionProperties] = none(TransactionProperties)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["actions"] = %(actions)
  if properties.isSome: argsNode["properties"] = %(properties.get)
  let resp = client.execute("transaction", argsNode)
  result = resp

proc traceEventGetState*(client: var QmpClient, name: string): seq[TraceEventInfo] =
  result = default(seq[TraceEventInfo])
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  let resp = client.execute("trace-event-get-state", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[TraceEventInfo], it))

proc traceEventSetState*(client: var QmpClient, name: string, enable: bool, ignoreUnavailable: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["name"] = %(name)
  argsNode["enable"] = %(enable)
  if ignoreUnavailable.isSome: argsNode["ignore-unavailable"] = %(ignoreUnavailable.get)
  let resp = client.execute("trace-event-set-state", argsNode)
  result = resp

proc qmpCapabilities*(client: var QmpClient, enable: Option[seq[QMPCapability]] = none(seq[QMPCapability])): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  if enable.isSome: argsNode["enable"] = %(enable.get)
  let resp = client.execute("qmp_capabilities", argsNode)
  result = resp

proc queryVersion*(client: var QmpClient): VersionInfo =
  result = default(VersionInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-version", argsNode)
  result = parse(typedesc[VersionInfo], resp)

proc queryCommands*(client: var QmpClient): seq[CommandInfo] =
  result = default(seq[CommandInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-commands", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[CommandInfo], it))

proc quit*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("quit", argsNode)
  result = resp

proc queryQmpSchema*(client: var QmpClient): seq[SchemaInfo] =
  result = default(seq[SchemaInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-qmp-schema", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[SchemaInfo], it))

proc qomList*(client: var QmpClient, path: string): seq[ObjectPropertyInfo] =
  result = default(seq[ObjectPropertyInfo])
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  let resp = client.execute("qom-list", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ObjectPropertyInfo], it))

proc qomGet*(client: var QmpClient, path: string, property: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["property"] = %(property)
  let resp = client.execute("qom-get", argsNode)
  result = resp

proc qomListGet*(client: var QmpClient, paths: seq[string]): seq[ObjectPropertiesValues] =
  result = default(seq[ObjectPropertiesValues])
  var argsNode = newJObject()
  argsNode["paths"] = %(paths)
  let resp = client.execute("qom-list-get", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ObjectPropertiesValues], it))

proc qomSet*(client: var QmpClient, path: string, property: string, value: JsonNode): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["property"] = %(property)
  argsNode["value"] = %(value)
  let resp = client.execute("qom-set", argsNode)
  result = resp

proc qomListTypes*(client: var QmpClient, implements: Option[string] = none(string), abstract: Option[bool] = none(bool)): seq[ObjectTypeInfo] =
  result = default(seq[ObjectTypeInfo])
  var argsNode = newJObject()
  if implements.isSome: argsNode["implements"] = %(implements.get)
  if abstract.isSome: argsNode["abstract"] = %(abstract.get)
  let resp = client.execute("qom-list-types", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ObjectTypeInfo], it))

proc qomListProperties*(client: var QmpClient, typename: string): seq[ObjectPropertyInfo] =
  result = default(seq[ObjectPropertyInfo])
  var argsNode = newJObject()
  argsNode["typename"] = %(typename)
  let resp = client.execute("qom-list-properties", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ObjectPropertyInfo], it))

proc objectAdd*(client: var QmpClient, args: ObjectOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("object-add", argsNode)
  result = resp

proc objectDel*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("object-del", argsNode)
  result = resp

proc deviceListProperties*(client: var QmpClient, typename: string): seq[ObjectPropertyInfo] =
  result = default(seq[ObjectPropertyInfo])
  var argsNode = newJObject()
  argsNode["typename"] = %(typename)
  let resp = client.execute("device-list-properties", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ObjectPropertyInfo], it))

proc deviceDel*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("device_del", argsNode)
  result = resp

proc deviceSyncConfig*(client: var QmpClient, id: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["id"] = %(id)
  let resp = client.execute("device-sync-config", argsNode)
  result = resp

proc queryCpusFast*(client: var QmpClient): seq[CpuInfoFast] =
  result = default(seq[CpuInfoFast])
  var argsNode = newJObject()
  let resp = client.execute("query-cpus-fast", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[CpuInfoFast], it))

proc queryMachines*(client: var QmpClient, compatProps: Option[bool] = none(bool)): seq[MachineInfo] =
  result = default(seq[MachineInfo])
  var argsNode = newJObject()
  if compatProps.isSome: argsNode["compat-props"] = %(compatProps.get)
  let resp = client.execute("query-machines", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[MachineInfo], it))

proc queryCurrentMachine*(client: var QmpClient): CurrentMachineParams =
  result = default(CurrentMachineParams)
  var argsNode = newJObject()
  let resp = client.execute("query-current-machine", argsNode)
  result = parse(typedesc[CurrentMachineParams], resp)

proc queryTarget*(client: var QmpClient): QemuTargetInfo =
  result = default(QemuTargetInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-target", argsNode)
  result = parse(typedesc[QemuTargetInfo], resp)

proc queryUuid*(client: var QmpClient): UuidInfo =
  result = default(UuidInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-uuid", argsNode)
  result = parse(typedesc[UuidInfo], resp)

proc queryVmGenerationId*(client: var QmpClient): GuidInfo =
  result = default(GuidInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-vm-generation-id", argsNode)
  result = parse(typedesc[GuidInfo], resp)

proc systemReset*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("system_reset", argsNode)
  result = resp

proc systemPowerdown*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("system_powerdown", argsNode)
  result = resp

proc systemWakeup*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("system_wakeup", argsNode)
  result = resp

proc injectNmi*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("inject-nmi", argsNode)
  result = resp

proc memsave*(client: var QmpClient, val: uint64, size: uint64, filename: string, cpuIndex: Option[int64] = none(int64)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["val"] = %(val)
  argsNode["size"] = %(size)
  argsNode["filename"] = %(filename)
  if cpuIndex.isSome: argsNode["cpu-index"] = %(cpuIndex.get)
  let resp = client.execute("memsave", argsNode)
  result = resp

proc pmemsave*(client: var QmpClient, val: uint64, size: uint64, filename: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["val"] = %(val)
  argsNode["size"] = %(size)
  argsNode["filename"] = %(filename)
  let resp = client.execute("pmemsave", argsNode)
  result = resp

proc queryMemdev*(client: var QmpClient): seq[Memdev] =
  result = default(seq[Memdev])
  var argsNode = newJObject()
  let resp = client.execute("query-memdev", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[Memdev], it))

proc queryHotpluggableCpus*(client: var QmpClient): seq[HotpluggableCPU] =
  result = default(seq[HotpluggableCPU])
  var argsNode = newJObject()
  let resp = client.execute("query-hotpluggable-cpus", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[HotpluggableCPU], it))

proc setNumaNode*(client: var QmpClient, args: NumaOptions): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("set-numa-node", argsNode)
  result = resp

proc balloon*(client: var QmpClient, value: int64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["value"] = %(value)
  let resp = client.execute("balloon", argsNode)
  result = resp

proc queryBalloon*(client: var QmpClient): BalloonInfo =
  result = default(BalloonInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-balloon", argsNode)
  result = parse(typedesc[BalloonInfo], resp)

proc queryHvBalloonStatusReport*(client: var QmpClient): HvBalloonInfo =
  result = default(HvBalloonInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-hv-balloon-status-report", argsNode)
  result = parse(typedesc[HvBalloonInfo], resp)

proc queryMemorySizeSummary*(client: var QmpClient): MemoryInfo =
  result = default(MemoryInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-memory-size-summary", argsNode)
  result = parse(typedesc[MemoryInfo], resp)

proc queryMemoryDevices*(client: var QmpClient): seq[MemoryDeviceInfo] =
  result = default(seq[MemoryDeviceInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-memory-devices", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[MemoryDeviceInfo], it))

proc xQueryIrq*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-irq", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc xQueryJit*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-jit", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc xQueryNuma*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-numa", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc xQueryRamblock*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-ramblock", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc xQueryRoms*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-roms", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc xQueryUsb*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-usb", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc dumpdtb*(client: var QmpClient, filename: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["filename"] = %(filename)
  let resp = client.execute("dumpdtb", argsNode)
  result = resp

proc xQueryInterruptControllers*(client: var QmpClient): HumanReadableText =
  result = default(HumanReadableText)
  var argsNode = newJObject()
  let resp = client.execute("x-query-interrupt-controllers", argsNode)
  result = parse(typedesc[HumanReadableText], resp)

proc queryFirmwareLog*(client: var QmpClient, maxSize: Option[uint64] = none(uint64)): FirmwareLog =
  result = default(FirmwareLog)
  var argsNode = newJObject()
  if maxSize.isSome: argsNode["max-size"] = %(maxSize.get)
  let resp = client.execute("query-firmware-log", argsNode)
  result = parse(typedesc[FirmwareLog], resp)

proc dumpSkeys*(client: var QmpClient, filename: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["filename"] = %(filename)
  let resp = client.execute("dump-skeys", argsNode)
  result = resp

proc queryCpuModelComparison*(client: var QmpClient, modela: CpuModelInfo, modelb: CpuModelInfo): CpuModelCompareInfo =
  result = default(CpuModelCompareInfo)
  var argsNode = newJObject()
  argsNode["modela"] = %(modela)
  argsNode["modelb"] = %(modelb)
  let resp = client.execute("query-cpu-model-comparison", argsNode)
  result = parse(typedesc[CpuModelCompareInfo], resp)

proc queryCpuModelBaseline*(client: var QmpClient, modela: CpuModelInfo, modelb: CpuModelInfo): CpuModelBaselineInfo =
  result = default(CpuModelBaselineInfo)
  var argsNode = newJObject()
  argsNode["modela"] = %(modela)
  argsNode["modelb"] = %(modelb)
  let resp = client.execute("query-cpu-model-baseline", argsNode)
  result = parse(typedesc[CpuModelBaselineInfo], resp)

proc queryCpuModelExpansion*(client: var QmpClient, `type`: CpuModelExpansionType, model: CpuModelInfo): CpuModelExpansionInfo =
  result = default(CpuModelExpansionInfo)
  var argsNode = newJObject()
  argsNode["type"] = %(`type`)
  argsNode["model"] = %(model)
  let resp = client.execute("query-cpu-model-expansion", argsNode)
  result = parse(typedesc[CpuModelExpansionInfo], resp)

proc queryCpuDefinitions*(client: var QmpClient): seq[CpuDefinitionInfo] =
  result = default(seq[CpuDefinitionInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-cpu-definitions", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[CpuDefinitionInfo], it))

proc setCpuTopology*(client: var QmpClient, coreId: uint16, socketId: Option[uint16] = none(uint16), bookId: Option[uint16] = none(uint16), drawerId: Option[uint16] = none(uint16), entitlement: Option[S390CpuEntitlement] = none(S390CpuEntitlement), dedicated: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["core-id"] = %(coreId)
  if socketId.isSome: argsNode["socket-id"] = %(socketId.get)
  if bookId.isSome: argsNode["book-id"] = %(bookId.get)
  if drawerId.isSome: argsNode["drawer-id"] = %(drawerId.get)
  if entitlement.isSome: argsNode["entitlement"] = %(entitlement.get)
  if dedicated.isSome: argsNode["dedicated"] = %(dedicated.get)
  let resp = client.execute("set-cpu-topology", argsNode)
  result = resp

proc queryS390xCpuPolarization*(client: var QmpClient): CpuPolarizationInfo =
  result = default(CpuPolarizationInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-s390x-cpu-polarization", argsNode)
  result = parse(typedesc[CpuPolarizationInfo], resp)

proc queryReplay*(client: var QmpClient): ReplayInfo =
  result = default(ReplayInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-replay", argsNode)
  result = parse(typedesc[ReplayInfo], resp)

proc replayBreak*(client: var QmpClient, icount: int64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["icount"] = %(icount)
  let resp = client.execute("replay-break", argsNode)
  result = resp

proc replayDeleteBreak*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("replay-delete-break", argsNode)
  result = resp

proc replaySeek*(client: var QmpClient, icount: int64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["icount"] = %(icount)
  let resp = client.execute("replay-seek", argsNode)
  result = resp

proc yank*(client: var QmpClient, instances: seq[YankInstance]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["instances"] = %(instances)
  let resp = client.execute("yank", argsNode)
  result = resp

proc queryYank*(client: var QmpClient): seq[YankInstance] =
  result = default(seq[YankInstance])
  var argsNode = newJObject()
  let resp = client.execute("query-yank", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[YankInstance], it))

proc addClient*(client: var QmpClient, protocol: string, fdname: string, skipauth: Option[bool] = none(bool), tls: Option[bool] = none(bool)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["protocol"] = %(protocol)
  argsNode["fdname"] = %(fdname)
  if skipauth.isSome: argsNode["skipauth"] = %(skipauth.get)
  if tls.isSome: argsNode["tls"] = %(tls.get)
  let resp = client.execute("add_client", argsNode)
  result = resp

proc queryName*(client: var QmpClient): NameInfo =
  result = default(NameInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-name", argsNode)
  result = parse(typedesc[NameInfo], resp)

proc queryIothreads*(client: var QmpClient): seq[IOThreadInfo] =
  result = default(seq[IOThreadInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-iothreads", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[IOThreadInfo], it))

proc stop*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("stop", argsNode)
  result = resp

proc cont*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("cont", argsNode)
  result = resp

proc xExitPreconfig*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("x-exit-preconfig", argsNode)
  result = resp

proc humanMonitorCommand*(client: var QmpClient, commandLine: string, cpuIndex: Option[int64] = none(int64)): string =
  result = default(string)
  var argsNode = newJObject()
  argsNode["command-line"] = %(commandLine)
  if cpuIndex.isSome: argsNode["cpu-index"] = %(cpuIndex.get)
  let resp = client.execute("human-monitor-command", argsNode)
  result = resp.getStr

proc getfd*(client: var QmpClient, fdname: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["fdname"] = %(fdname)
  let resp = client.execute("getfd", argsNode)
  result = resp

proc getWin32Socket*(client: var QmpClient, info: string, fdname: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["info"] = %(info)
  argsNode["fdname"] = %(fdname)
  let resp = client.execute("get-win32-socket", argsNode)
  result = resp

proc closefd*(client: var QmpClient, fdname: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["fdname"] = %(fdname)
  let resp = client.execute("closefd", argsNode)
  result = resp

proc addFd*(client: var QmpClient, fdsetId: Option[int64] = none(int64), opaque: Option[string] = none(string)): AddfdInfo =
  result = default(AddfdInfo)
  var argsNode = newJObject()
  if fdsetId.isSome: argsNode["fdset-id"] = %(fdsetId.get)
  if opaque.isSome: argsNode["opaque"] = %(opaque.get)
  let resp = client.execute("add-fd", argsNode)
  result = parse(typedesc[AddfdInfo], resp)

proc removeFd*(client: var QmpClient, fdsetId: int64, fd: Option[int64] = none(int64)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["fdset-id"] = %(fdsetId)
  if fd.isSome: argsNode["fd"] = %(fd.get)
  let resp = client.execute("remove-fd", argsNode)
  result = resp

proc queryFdsets*(client: var QmpClient): seq[FdsetInfo] =
  result = default(seq[FdsetInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-fdsets", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[FdsetInfo], it))

proc queryCommandLineOptions*(client: var QmpClient, option: Option[string] = none(string)): seq[CommandLineOptionInfo] =
  result = default(seq[CommandLineOptionInfo])
  var argsNode = newJObject()
  if option.isSome: argsNode["option"] = %(option.get)
  let resp = client.execute("query-command-line-options", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[CommandLineOptionInfo], it))

proc queryGicCapabilities*(client: var QmpClient): seq[GICCapability] =
  result = default(seq[GICCapability])
  var argsNode = newJObject()
  let resp = client.execute("query-gic-capabilities", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[GICCapability], it))

proc rtcResetReinjection*(client: var QmpClient): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let resp = client.execute("rtc-reset-reinjection", argsNode)
  result = resp

proc querySev*(client: var QmpClient): SevInfo =
  result = default(SevInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-sev", argsNode)
  result = parse(typedesc[SevInfo], resp)

proc querySevLaunchMeasure*(client: var QmpClient): SevLaunchMeasureInfo =
  result = default(SevLaunchMeasureInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-sev-launch-measure", argsNode)
  result = parse(typedesc[SevLaunchMeasureInfo], resp)

proc querySevCapabilities*(client: var QmpClient): SevCapability =
  result = default(SevCapability)
  var argsNode = newJObject()
  let resp = client.execute("query-sev-capabilities", argsNode)
  result = parse(typedesc[SevCapability], resp)

proc sevInjectLaunchSecret*(client: var QmpClient, packetHeader: string, secret: string, gpa: Option[uint64] = none(uint64)): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["packet-header"] = %(packetHeader)
  argsNode["secret"] = %(secret)
  if gpa.isSome: argsNode["gpa"] = %(gpa.get)
  let resp = client.execute("sev-inject-launch-secret", argsNode)
  result = resp

proc querySevAttestationReport*(client: var QmpClient, mnonce: string): SevAttestationReport =
  result = default(SevAttestationReport)
  var argsNode = newJObject()
  argsNode["mnonce"] = %(mnonce)
  let resp = client.execute("query-sev-attestation-report", argsNode)
  result = parse(typedesc[SevAttestationReport], resp)

proc querySgx*(client: var QmpClient): SgxInfo =
  result = default(SgxInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-sgx", argsNode)
  result = parse(typedesc[SgxInfo], resp)

proc querySgxCapabilities*(client: var QmpClient): SgxInfo =
  result = default(SgxInfo)
  var argsNode = newJObject()
  let resp = client.execute("query-sgx-capabilities", argsNode)
  result = parse(typedesc[SgxInfo], resp)

proc xenEventList*(client: var QmpClient): seq[EvtchnInfo] =
  result = default(seq[EvtchnInfo])
  var argsNode = newJObject()
  let resp = client.execute("xen-event-list", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[EvtchnInfo], it))

proc xenEventInject*(client: var QmpClient, port: uint32): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["port"] = %(port)
  let resp = client.execute("xen-event-inject", argsNode)
  result = resp

proc queryAudiodevs*(client: var QmpClient): seq[Audiodev] =
  result = default(seq[Audiodev])
  var argsNode = newJObject()
  let resp = client.execute("query-audiodevs", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[Audiodev], it))

proc queryAcpiOspmStatus*(client: var QmpClient): seq[ACPIOSTInfo] =
  result = default(seq[ACPIOSTInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-acpi-ospm-status", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[ACPIOSTInfo], it))

proc injectGhesV2Error*(client: var QmpClient, cper: string): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["cper"] = %(cper)
  let resp = client.execute("inject-ghes-v2-error", argsNode)
  result = resp

proc queryPci*(client: var QmpClient): seq[PciInfo] =
  result = default(seq[PciInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-pci", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[PciInfo], it))

proc queryStats*(client: var QmpClient, args: StatsFilter): seq[StatsResult] =
  result = default(seq[StatsResult])
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("query-stats", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[StatsResult], it))

proc queryStatsSchemas*(client: var QmpClient, provider: Option[StatsProvider] = none(StatsProvider)): seq[StatsSchema] =
  result = default(seq[StatsSchema])
  var argsNode = newJObject()
  if provider.isSome: argsNode["provider"] = %(provider.get)
  let resp = client.execute("query-stats-schemas", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[StatsSchema], it))

proc xQueryVirtio*(client: var QmpClient): seq[VirtioInfo] =
  result = default(seq[VirtioInfo])
  var argsNode = newJObject()
  let resp = client.execute("x-query-virtio", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[VirtioInfo], it))

proc xQueryVirtioStatus*(client: var QmpClient, path: string): VirtioStatus =
  result = default(VirtioStatus)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  let resp = client.execute("x-query-virtio-status", argsNode)
  result = parse(typedesc[VirtioStatus], resp)

proc xQueryVirtioQueueStatus*(client: var QmpClient, path: string, queue: uint16): VirtQueueStatus =
  result = default(VirtQueueStatus)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["queue"] = %(queue)
  let resp = client.execute("x-query-virtio-queue-status", argsNode)
  result = parse(typedesc[VirtQueueStatus], resp)

proc xQueryVirtioVhostQueueStatus*(client: var QmpClient, path: string, queue: uint16): VirtVhostQueueStatus =
  result = default(VirtVhostQueueStatus)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["queue"] = %(queue)
  let resp = client.execute("x-query-virtio-vhost-queue-status", argsNode)
  result = parse(typedesc[VirtVhostQueueStatus], resp)

proc xQueryVirtioQueueElement*(client: var QmpClient, path: string, queue: uint16, index: Option[uint16] = none(uint16)): VirtioQueueElement =
  result = default(VirtioQueueElement)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["queue"] = %(queue)
  if index.isSome: argsNode["index"] = %(index.get)
  let resp = client.execute("x-query-virtio-queue-element", argsNode)
  result = parse(typedesc[VirtioQueueElement], resp)

proc queryCryptodev*(client: var QmpClient): seq[QCryptodevInfo] =
  result = default(seq[QCryptodevInfo])
  var argsNode = newJObject()
  let resp = client.execute("query-cryptodev", argsNode)
  result = (resp).getElems.mapIt(parse(typedesc[QCryptodevInfo], it))

proc cxlInjectGeneralMediaEvent*(client: var QmpClient, args: CXLGeneralMediaEvent): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("cxl-inject-general-media-event", argsNode)
  result = resp

proc cxlInjectDramEvent*(client: var QmpClient, args: CXLDRAMEvent): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("cxl-inject-dram-event", argsNode)
  result = resp

proc cxlInjectMemoryModuleEvent*(client: var QmpClient, args: CXLMemModuleEvent): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  let sub = %(args)
  if sub.kind == JObject:
    for k, v in sub.fields: argsNode[k] = v
  let resp = client.execute("cxl-inject-memory-module-event", argsNode)
  result = resp

proc cxlInjectPoison*(client: var QmpClient, path: string, start: uint64, length: uint64): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["start"] = %(start)
  argsNode["length"] = %(length)
  let resp = client.execute("cxl-inject-poison", argsNode)
  result = resp

proc cxlInjectUncorrectableErrors*(client: var QmpClient, path: string, errors: seq[CXLUncorErrorRecord]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["errors"] = %(errors)
  let resp = client.execute("cxl-inject-uncorrectable-errors", argsNode)
  result = resp

proc cxlInjectCorrectableError*(client: var QmpClient, path: string, `type`: CxlCorErrorType): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["type"] = %(`type`)
  let resp = client.execute("cxl-inject-correctable-error", argsNode)
  result = resp

proc cxlAddDynamicCapacity*(client: var QmpClient, path: string, hostId: uint16, selectionPolicy: CxlExtentSelectionPolicy, region: uint8, tag: Option[string] = none(string), extents: seq[CxlDynamicCapacityExtent]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["host-id"] = %(hostId)
  argsNode["selection-policy"] = %(selectionPolicy)
  argsNode["region"] = %(region)
  if tag.isSome: argsNode["tag"] = %(tag.get)
  argsNode["extents"] = %(extents)
  let resp = client.execute("cxl-add-dynamic-capacity", argsNode)
  result = resp

proc cxlReleaseDynamicCapacity*(client: var QmpClient, path: string, hostId: uint16, removalPolicy: CxlExtentRemovalPolicy, forcedRemoval: Option[bool] = none(bool), sanitizeOnRelease: Option[bool] = none(bool), region: uint8, tag: Option[string] = none(string), extents: seq[CxlDynamicCapacityExtent]): JsonNode =
  result = default(JsonNode)
  var argsNode = newJObject()
  argsNode["path"] = %(path)
  argsNode["host-id"] = %(hostId)
  argsNode["removal-policy"] = %(removalPolicy)
  if forcedRemoval.isSome: argsNode["forced-removal"] = %(forcedRemoval.get)
  if sanitizeOnRelease.isSome: argsNode["sanitize-on-release"] = %(sanitizeOnRelease.get)
  argsNode["region"] = %(region)
  if tag.isSome: argsNode["tag"] = %(tag.get)
  argsNode["extents"] = %(extents)
  let resp = client.execute("cxl-release-dynamic-capacity", argsNode)
  result = resp

