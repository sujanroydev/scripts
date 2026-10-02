# Scripts

A collection of cross-platform scripts and utilities for everyday development and system tasks.

## Platforms

```text
.
├── android/
│   ├── README.md
│   └── termux/
│       └── dl.sh
│
├── windows/
│   ├── README.md
│   └── powershell/
│       └── dl.ps1
│
└── README.md
```

## Download Utilities

The repository includes a `dl` command for downloading videos and audio using [yt-dlp](https://github.com/yt-dlp/yt-dlp).

Both implementations provide similar functionality across Android/Termux and Windows/PowerShell.

| Platform | Script                      | Shell         |
| -------- | --------------------------- | ------------- |
| Android  | `android/termux/dl.sh`      | Bash / Termux |
| Windows  | `windows/powershell/dl.ps1` | PowerShell    |

### Supported Formats

#### Video

```text
v       → 360p
_p      → best available quality
240p
360p
480p
720p
1080p
1440p
```

#### Audio

```text
a       → 128k
_k      → best available audio quality
64k
128k
256k
```

Both scripts support direct URLs and search queries.

### Examples

Video:

```bash
dl v "https://youtube.com/watch?v=..."
dl _p "https://youtube.com/watch?v=..."
dl 720p "lofi music"
```

Audio:

```bash
dl a "https://youtube.com/watch?v=..."
dl _k "https://youtube.com/watch?v=..."
dl 128k "some song"
```

## Platform Documentation

- **Android / Termux** — see [`android/README.md`](android/README.md)
- **Windows / PowerShell** — see [`windows/README.md`](windows/README.md)

## Requirements

The download scripts require:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- FFmpeg

Platform-specific installation and usage instructions are available in the respective README files.

## License

See the repository license for usage and distribution terms.
