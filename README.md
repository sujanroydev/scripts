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

This repository includes a `dl` command for downloading videos and audio using [yt-dlp](https://github.com/yt-dlp/yt-dlp).

The Android and Windows versions provide similar functionality for their respective platforms.

| Platform | Script                      | Shell         |
| -------- | --------------------------- | ------------- |
| Android  | `android/termux/dl.sh`      | Bash / Termux |
| Windows  | `windows/powershell/dl.ps1` | PowerShell    |

## Supported Formats

### Video

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

### Audio

```text
a       → 128k
_k      → best available audio quality

64k
128k
256k
```

Both scripts support direct URLs and search queries.

## Examples

### Video

```bash
dl v "https://youtube.com/watch?v=..."
dl _p "https://youtube.com/watch?v=..."
dl 720p "lofi music"
```

### Audio

```bash
dl a "https://youtube.com/watch?v=..."
dl _k "https://youtube.com/watch?v=..."
dl 128k "some song"
```

## Quick Setup

Choose your platform.

### Android / Termux

Install the required packages and download the script:

```bash
pkg update -y
pkg install -y python ffmpeg curl
termux-setup-storage
pip install -U yt-dlp

mkdir -p ~/scripts

curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/android/termux/dl.sh \
    -o ~/scripts/dl.sh

source ~/scripts/dl.sh
```

For detailed instructions:

[Android / Termux Setup](android/README.md)

### Windows / PowerShell

Install `yt-dlp` and FFmpeg:

```powershell
winget install yt-dlp
winget install Gyan.FFmpeg
```

Download and load the script:

```powershell
New-Item -ItemType Directory -Force -Path "$HOME\scripts" | Out-Null

Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/sujanroydev/scripts/main/windows/powershell/dl.ps1" `
    -OutFile "$HOME\scripts\dl.ps1"

. "$HOME\scripts/dl.ps1"
```

For detailed instructions:

[Windows / PowerShell Setup](windows/README.md)

## Output Locations

### Android

```text
Videos → /storage/emulated/0/Movies/
Audio  → /storage/emulated/0/Music/
```

### Windows

```text
Videos → D:\Videos\
Audio  → D:\Music\
```

The exact folder structure may vary depending on whether you download a direct URL, search result, or playlist.

## Requirements

The download utilities require:

- [yt-dlp](https://github.com/yt-dlp/yt-dlp)
- FFmpeg

Platform-specific installation and configuration instructions are available in:

- [Android / Termux README](android/README.md)
- [Windows / PowerShell README](windows/README.md)

## License

See the repository license for usage and distribution terms.
