# Windows

Windows-specific scripts and utilities for use with **PowerShell**.

## Contents

```text
windows/
└── powershell/
    └── dl.ps1
```

### PowerShell

`powershell/dl.ps1` provides a `dl` PowerShell function for downloading videos and audio using [`yt-dlp`](https://github.com/yt-dlp/yt-dlp).

It supports:

- YouTube URLs
- YouTube search queries
- Video downloads up to a specified resolution
- Best-quality video downloads
- MP3 audio downloads
- Configurable audio bitrates
- Playlist downloads
- Separate video and music directories

## Usage

Load the script in PowerShell:

```powershell
. .\windows\powershell\dl.ps1
```

Then use:

```powershell
dl <format> <URL or search>
```

### Video

```powershell
dl v "https://youtube.com/watch?v=..."
dl _p "https://youtube.com/watch?v=..."
dl 360p "https://youtube.com/watch?v=..."
dl 720p "https://youtube.com/watch?v=..."
dl 1080p "https://youtube.com/watch?v=..."
```

`v` is an alias for `360p`.

`_p` downloads the best available video quality.

Supported video formats:

```text
_p
240p
360p
480p
720p
1080p
1440p
```

### Audio

```powershell
dl a "https://youtube.com/watch?v=..."
dl _k "https://youtube.com/watch?v=..."
dl 64k "https://youtube.com/watch?v=..."
dl 128k "https://youtube.com/watch?v=..."
dl 256k "https://youtube.com/watch?v=..."
```

`a` is an alias for `128k`.

`_k` downloads the best available audio quality and converts it to MP3.

### Search

A URL is not required. A search query can be provided instead:

```powershell
dl 720p "lofi music"
dl 128k "some song"
```

The script uses `ytsearch1:` to download the first matching result.

## Output

Videos are stored in:

```text
D:\Videos\
```

Audio is stored in:

```text
D:\Music\
```

For direct URLs, playlist downloads are organized using the playlist title:

```text
D:\Videos\
└── Playlist Name\
    ├── 1 - Video 1.mp4
    ├── 2 - Video 2.mp4
    └── ...
```

For search queries:

```text
D:\Videos\
└── Downloads\
    └── Video.mp4
```

Audio follows the same structure:

```text
D:\Music\
├── Playlist Name\
│   ├── 1 - Song 1.mp3
│   └── ...
└── Songs\
    └── Song.mp3
```

## Requirements

Install **yt-dlp** and **FFmpeg**.

### yt-dlp

If Python is installed:

```powershell
py -m pip install -U yt-dlp
```

Verify:

```powershell
yt-dlp --version
```

### FFmpeg

Verify that FFmpeg is available:

```powershell
ffmpeg -version
```

If it is not installed, install it using your preferred Windows package manager or add an existing FFmpeg installation to `PATH`.

## Installation

Clone the repository:

```powershell
git clone <repository-url>
cd <repository>
```

Load the PowerShell script:

```powershell
. .\windows\powershell\dl.ps1
```

The leading `.` is important because the script defines a function in the current PowerShell session.

### Load Automatically

To make `dl` available automatically in new PowerShell sessions, add the following to your PowerShell profile:

```powershell
. "C:\path\to\windows\powershell\dl.ps1"
```

Check your profile location with:

```powershell
$PROFILE
```

If the profile does not exist:

```powershell
New-Item -ItemType File -Path $PROFILE -Force
```

## Notes

- Video downloads are merged into MP4.
- Video selection prefers H.264 video and AAC audio for compatibility when available.
- Audio is converted to MP3 using FFmpeg.
- `_p` and `_k` represent best available video and audio quality respectively.
- The script creates the required output directories automatically.
- Search downloads use the first YouTube search result.
