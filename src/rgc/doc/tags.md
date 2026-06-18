<!--
SPDX-FileCopyrightText: 2026 AddingSpaceTeam

SPDX-License-Identifier: MPL-2.0
-->

| Tag | Enums | Description |
|-----|-------|-------------|
| `(pass D . . . S)` | RgcStmt | pass declaration |
| `(module D . . S)` | RgcStmt | module declaration |
| `(stmts S*)` | RgcStmt, [Dummy]LowRgcStmt | statement list |
| `(input D T)` | RgcStmt | pass input declaration |
| `(output D T)` | RgcStmt | pass output declaration |
| `(use Y .Y)` | RgcStmt | module usage declaration |
| `(connect X X)` | RgcStmt | resource connection |
| `(external D T)` | RgcStmt | external resource declaration |
| `(present X)` | RgcStmt | module present sink |
| `(raster S*)` | RgcStmt | raster pass body |
| `(compute S*)` | RgcStmt | compute pass body |
| `(copy S*)` | RgcStmt | copy pass body |
| `(shader I Y)` | RgcStmt | shader binding |
| `(usage I A)` | RgcStmt | usage annotation |
| `(image T)` | RgcType | image resource, T is generic param, actually mostly hides imageViews, maybe it also need separated type |
| `(buffer T)` | RgcType | buffer resource of T |
| `(dot I I)` | RgcExpr | owner.resource |
| `(color A A A A)` | RgcExpr | RGBA clear color value |
| `(makeImage )` | [Dummy]LowRgcStmt | create image
| `(makeBuffer )` | [Dummy]LowRgcStmt | create buffer
| `(imageBarrier )` | [Dummy]LowRgcStmt | barrier for image
| `(bufferBarrier )` | [Dummy]LowRgcStmt | barrier for buffer
| `(attachmentColor R G B A)` | [Dummy]LowRgcExpr | color attachment
| `(attachmentDepth V)` | [Dummy]LowRgcExpr | depth attachment
