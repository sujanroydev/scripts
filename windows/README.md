# Windows

Windows scripts and utilities for **PowerShell**.

## Download Utility

`dl.ps1` provides a simple `dl` command for downloading videos and audio using `yt-dlp`.

### Features

- YouTube URLs and search queries
- Video downloads from 240p to 1440p
- Best-quality video with `_p`
- MP3 audio from 64k to 256k
- Best-quality audio with `_k`
- Playlist support
- Automatic output organization

## Setup

### 1. Install PowerShell

Windows 10 and Windows 11 already include PowerShell.

Open **PowerShell** and continue with the steps below.

### 2. Install yt-dlp

If you have `winget`:

```powershell
winget install yt-dlp
```

Verify:

```powershell
yt-dlp --version
```

### 3. Install FFmpeg

```powershell
winget install Gyan.FFmpeg
```

Verify:

```powershell
ffmpeg -version
```

### 4. Download the Script

You don't need Git.

Create a scripts directory:

```powershell
New-Item -ItemType Directory -Force -Path "$HOME\scripts" | Out-Null
```

Download the latest script:

```powershell
Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/sujanroydev/scripts/main/windows/powershell/dl.ps1" `
    -OutFile "$HOME\scripts\dl.ps1"
```

### 5. Load the Script

```powershell
. "$HOME\scripts\dl.ps1"
```

The `dl` command is now ready to use.

## Usage

```powershell
dl <format> <URL or search>
```

### Video

```powershell
dl v "https://youtube.com/watch?v=..."
dl _p "https://youtube.com/watch?v=..."
dl 360p "https://youtube.com/watch?v=..."
dl 720p "lofi music"
dl 1080p "https://youtube.com/watch?v=..."
```

| Format  | Description            |
| ------- | ---------------------- |
| `v`     | 360p                   |
| `_p`    | Best available quality |
| `240p`  | Up to 240p             |
| `360p`  | Up to 360p             |
| `480p`  | Up to 480p             |
| `720p`  | Up to 720p             |
| `1080p` | Up to 1080p            |
| `1440p` | Up to 1440p            |

### Audio

```powershell
dl a "https://youtube.com/watch?v=..."
dl _k "https://youtube.com/watch?v=..."
dl 64k "some song"
dl 128k "https://youtube.com/watch?v=..."
dl 256k "https://youtube.com/watch?v=..."
```

| Format | Description                  |
| ------ | ---------------------------- |
| `a`    | 128 kbps                     |
| `_k`   | Best available audio quality |
| `64k`  | 64 kbps                      |
| `128k` | 128 kbps                     |
| `256k` | 256 kbps                     |

## Search

You can use a search query instead of a URL:

```powershell
dl 720p "javascript tutorial"
dl 128k "song name"
```

The first YouTube search result is downloaded.

## Output

Videos are saved to:

```text
D:\Videos\
```

Audio is saved to:

```text
D:\Music\
```

Playlists are automatically organized into folders using their playlist name.

## Make `dl` Permanent

By default, `dl` is available only for the current PowerShell session.

To load it automatically whenever PowerShell starts, add the following to your PowerShell profile:

```powershell
Add-Content -Path $PROFILE -Value '. "$HOME\scripts\dl.ps1"'
```

If the profile directory does not exist, PowerShell can create it automatically:

```powershell
New-Item -ItemType File -Path $PROFILE -Force | Out-Null
Add-Content -Path $PROFILE -Value '. "$HOME\scripts\dl.ps1"'
```

Restart PowerShell or reload the profile:

```powershell
. $PROFILE
```

Now `dl` will be available whenever you open PowerShell.

## Update

Download the latest version of the script:

```powershell
Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/sujanroydev/scripts/main/windows/powershell/dl.ps1" `
    -OutFile "$HOME\scripts\dl.ps1"
```

Reload it:

```powershell
. "$HOME\scripts\dl.ps1"
```

Update `yt-dlp`:

```powershell
winget upgrade yt-dlp
```

Update FFmpeg:

```powershell
winget upgrade Gyan.FFmpeg
```

## Quick Setup

If you already have PowerShell and `winget`, run:

```powershell
winget install yt-dlp
winget install Gyan.FFmpeg

New-Item -ItemType Directory -Force -Path "$HOME\scripts" | Out-Null

Invoke-WebRequest `
    -Uri "https://raw.githubusercontent.com/sujanroydev/scripts/main/windows/powershell/dl.ps1" `
    -OutFile "$HOME\scripts\dl.ps1"

. "$HOME\scripts\dl.ps1"
```

Then:

```powershell
dl 720p "your video"
```
