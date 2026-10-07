# Linux

Linux scripts and utilities for **Terminal**.

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
- Saves files to standard Linux `Videos` and `Music` directories

## Setup

### 1. Install Dependencies

Install `yt-dlp`, `ffmpeg`, and `curl`:

```bash
sudo dnf install -y yt-dlp ffmpeg curl
```

Verify the installation:

```bash
yt-dlp --version
ffmpeg -version
```

### 2. Download the Script

```bash
mkdir -p ~/.scripts

curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/linux/terminal/dl.sh -o ~/.scripts/dl.sh
```

### 3. Load the Script

```bash
grep -qxF '[ -f "$HOME/.scripts/dl.sh" ] && source "$HOME/.scripts/dl.sh"' ~/.bashrc || \
echo '[ -f "$HOME/.scripts/dl.sh" ] && source "$HOME/.scripts/dl.sh"' >> ~/.bashrc
source ~/.scripts/dl.sh
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
~/Videos/
```

Audio is saved to:

```text
~/Music/
```

Playlists are automatically organized into folders using their playlist name.

For example:

```text
~/Videos/<Playlist Name>/
~/Music/<Playlist Name>/
```

Search results are organized separately:

```text
~/Videos/Videos/
~/Music/Songs/
```

## Make `dl` Permanent

By default, `dl` is available only in the current terminal session after sourcing the script.

To load it automatically whenever Bash starts:

```bash
echo '[ -f "$HOME/.scripts/dl.sh" ] && source "$HOME/.scripts/dl.sh"' >> ~/.bashrc
```

Reload the shell:

```bash
source ~/.bashrc
```

Now `dl` will be available whenever you open a new Bash terminal.

## Update

Update the system packages, including `yt-dlp`:

```bash
sudo dnf upgrade yt-dlp ffmpeg
```

To update the `dl` script:

```bash
curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/linux/dl.sh \
    -o ~/.scripts/dl.sh

source ~/.scripts/dl.sh
```

## Quick Setup

If you already have Fedora installed, run:

```bash
sudo dnf install -y yt-dlp ffmpeg curl

mkdir -p ~/.scripts

curl -L https://raw.githubusercontent.com/sujanroydev/scripts/main/linux/dl.sh \
    -o ~/.scripts/dl.sh

echo '[ -f "$HOME/.scripts/dl.sh" ] && source "$HOME/.scripts/dl.sh"' >> ~/.bashrc

source ~/.bashrc
```

Then:

```bash
dl 720p "your video"
```
