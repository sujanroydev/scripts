dl() {
    local format="$1"
    local url="$2"
    local is_url=false

    case "$format" in
        v)
            format="360p"
            ;;
        a)
            format="128k"
            ;;
    esac

    if [ -z "$format" ] || [ -z "$url" ]; then
        echo "Usage: dl [format] [URL or search]"
        echo
        echo "Video: v _p 240p 360p 480p 720p 1080p 1440p"
        echo "Audio: a _k 64k 128k 256k"
        return 1
    fi

    if [[ "$url" =~ ^https?:// ]]; then
        is_url=true
    else
        url="ytsearch1:$url"
    fi

    case "$format" in
        _p|240p|360p|480p|720p|1080p|1440p)
            local height="${format%p}"

            if $is_url; then
                local path="/storage/emulated/0/Movies/%(playlist_title|Videos)s/%(playlist_index&{} - |)s%(title)s.%(ext)s"
            else
                local path="/storage/emulated/0/Movies/Videos/%(title)s.%(ext)s"
            fi

            mkdir -p "/storage/emulated/0/Movies"

            if [ "$format" = "_p" ]; then
                yt-dlp \
                    -f "bestvideo+bestaudio/best" \
                    --merge-output-format mp4 \
                    -o "$path" \
                    "$url"
                return $?
            fi

            yt-dlp \
                -f "bestvideo[height<=${height}][vcodec^=avc1]+bestaudio[acodec^=mp4a]/bestvideo[height<=${height}]+bestaudio/best[height<=${height}]" \
                --merge-output-format mp4 \
                -o "$path" \
                "$url"
            ;;

        _k|64k|128k|256k)
            if $is_url; then
                local path="/storage/emulated/0/Music/%(playlist_title|Songs)s/%(playlist_index&{} - |)s%(title)s.%(ext)s"
            else
                local path="/storage/emulated/0/Music/Songs/%(title)s.%(ext)s"
            fi

            mkdir -p "/storage/emulated/0/Music"

            if [ "$format" = "_k" ]; then
                yt-dlp \
                    -f "bestaudio" \
                    -x \
                    --audio-format mp3 \
                    --audio-quality 0 \
                    -o "$path" \
                    "$url"
                return $?
            fi

            yt-dlp \
                -f "bestaudio" \
                -x \
                --audio-format mp3 \
                --audio-quality "$format" \
                -o "$path" \
                "$url"
            ;;

        *)
            echo "Invalid format: $format"
            echo
            echo "Video: v _p 240p 360p 480p 720p 1080p 1440p"
            echo "Audio: a _k 64k 128k 256k"
            return 1
            ;;
    esac
}
