# Android

Android scripts and utilities for **Termux**.

## Download Utility

`dl.sh` provides a simple `dl` command for downloading videos and audio using `yt-dlp`.

### Features

- YouTube URLs and search queries
- Video downloads from 240p to 1440p
- Best-quality video with `_p`
- MP3 audio from 64k to 256k
- Best-quality audio with `_k`
- Playlist support
- Automatic output organization

## Setup

### 1. Install Termux

Install Termux from **F-Droid** or the official GitHub releases.

Then open Termux and run:

```bash
pkg update -y
pkg install -y python ffmpeg curl
```

### 2. Allow Storage Access

Run:

```bash
termux-setup-storage
```

Tap **Allow** when Android asks for permission.

### 3. Install yt-dlp

```bash
pip install -U yt-dlp
```

### 4. Download the Script

You don't need Git.

```bash
mkdir -p ~/scripts
curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/android/termux/dl.sh -o ~/scripts/dl.sh
```

### 5. Load the Script

```bash
echo 'source ~/scripts/dl.sh' >> ~/.bashrc
source ~/.bashrc
```

The `dl` command is now ready to use.

## Usage

```bash
dl <format> <URL or search>
```

### Video

```bash
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

```bash
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

```bash
dl 720p "javascript tutorial"
dl 128k "song name"
```

The first YouTube search result is downloaded.

## Output

Videos are saved to:

```text
/storage/emulated/0/Movies/
```

Audio is saved to:

```text
/storage/emulated/0/Music/
```

Playlists are automatically organized into folders using their playlist name.

## Make `dl` Permanent

By default, `dl` is available only for the current Termux session.

To load it automatically every time Termux starts:

```bash
echo 'source ~/scripts/dl.sh' >> ~/.bashrc
```

Reload the shell:

```bash
source ~/.bashrc
```

Now `dl` will be available whenever you open Termux.

## Update

To download the latest version of the script:

```bash
curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/android/termux/dl.sh -o ~/scripts/dl.sh

source ~/scripts/dl.sh
```

Update `yt-dlp` separately:

```bash
pip install -U yt-dlp
```

## Quick Setup

If you already have Termux installed, you can set everything up with:

```bash
pkg update -y
pkg install -y python ffmpeg curl
termux-setup-storage
pip install -U yt-dlp
mkdir -p ~/scripts
curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/android/termux/dl.sh -o ~/scripts/dl.sh
source ~/scripts/dl.sh
```

Then:

```bash
dl 720p "your video"
```
