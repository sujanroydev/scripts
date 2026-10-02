# Android

Android-specific scripts and utilities for use with **Termux**.

## Contents

```text
android/
└── termux/
    └── dl.sh
```

### Termux

`termux/dl.sh` provides a `dl` Bash function for downloading videos and audio using [`yt-dlp`](https://github.com/yt-dlp/yt-dlp).

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

Load the script in Termux:

```bash
source termux/dl.sh
```

Then use:

```bash
dl <format> <URL or search>
```

### Video

```bash
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

```bash
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

```bash
dl 720p "lofi music"
dl 128k "some song"
```

The script uses `ytsearch1:` to download the first matching result.

## Output

Videos are stored in:

```text
/storage/emulated/0/Movies/
```

Audio is stored in:

```text
/storage/emulated/0/Music/
```

For direct URLs, playlist downloads are organized using the playlist title:

```text
Movies/
└── Playlist Name/
    ├── 1 - Video 1.mp4
    ├── 2 - Video 2.mp4
    └── ...
```

For search queries:

```text
Movies/
└── Videos/
    └── Video.mp4
```

Audio follows the same structure:

```text
Music/
├── Playlist Name/
│   ├── 1 - Song 1.mp3
│   └── ...
└── Songs/
    └── Song.mp3
```

## Requirements

Install `yt-dlp` and FFmpeg in Termux:

```bash
pkg update
pkg install python ffmpeg
pip install -U yt-dlp
```

Allow Termux to access Android storage:

```bash
termux-setup-storage
```

## Installation

Clone the repository and source the script:

```bash
git clone <repository-url>
cd <repository>/android/termux
source dl.sh
```

To make `dl` available automatically in new Termux sessions, source the script from:

```bash
~/.bashrc
```

For example:

```bash
source ~/path/to/android/termux/dl.sh
```

## Notes

- Video downloads are merged into MP4.
- Video selection prefers H.264 video and AAC audio for compatibility when available.
- Audio is converted to MP3 using FFmpeg.
- `_p` and `_k` represent best available video and audio quality respectively.
- The script creates the required Android storage directories automatically.
