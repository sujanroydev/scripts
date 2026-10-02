function dl {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Format,

        [Parameter(Mandatory = $true, Position = 1)]
        [string]$Url
    )

    # Short aliases
    switch ($Format) {
        "v" { $Format = "360p" }
        "a" { $Format = "128k" }
    }

    # Validate input
    if ([string]::IsNullOrWhiteSpace($Format) -or [string]::IsNullOrWhiteSpace($Url)) {
        Write-Host "Usage: dl [format] [URL or search]"
        Write-Host ""
        Write-Host "Video: v _p 240p 360p 480p 720p 1080p 1440p"
        Write-Host "Audio: a _k 64k 128k 256k"
        return
    }

    # Track whether the input was a direct URL
    $IsUrl = $Url -match '^https?://'

    # If input isn't a URL, search YouTube
    if (-not $IsUrl) {
        $Url = "ytsearch1:$Url"
    }

    switch -Regex ($Format) {

        '^(_p|240p|360p|480p|720p|1080p|1440p)$' {
            $outputDir = "D:\Videos"
            New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

            if ($IsUrl) {
                $outputPath = "$outputDir\%(playlist_title|Downloads)s\%(playlist_index&{} - |)s%(title)s.%(ext)s"
            }
            else {
                $outputPath = "$outputDir\Downloads\%(title)s.%(ext)s"
            }

            # Best available video quality
            if ($Format -eq "_p") {
                yt-dlp `
                    -f "bestvideo+bestaudio/best" `
                    --merge-output-format mp4 `
                    -o "$outputPath" `
                    "$Url"

                return $LASTEXITCODE
            }

            # Fixed video quality
            $height = $Format -replace 'p$', ''

            yt-dlp `
                -f "bestvideo[height<=$height][vcodec^=avc1]+bestaudio[acodec^=mp4a]/bestvideo[height<=$height]+bestaudio/best[height<=$height]" `
                --merge-output-format mp4 `
                -o "$outputPath" `
                "$Url"

            return $LASTEXITCODE
        }

        '^(_k|64k|128k|256k)$' {
            $outputDir = "D:\Music"
            New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

            if ($IsUrl) {
                $outputPath = "$outputDir\%(playlist_title|Songs)s\%(playlist_index&{} - |)s%(title)s.%(ext)s"
            }
            else {
                $outputPath = "$outputDir\Songs\%(title)s.%(ext)s"
            }

            # Best MP3 quality
            if ($Format -eq "_k") {
                yt-dlp `
                    -f "bestaudio" `
                    -x `
                    --audio-format mp3 `
                    --audio-quality 0 `
                    -o "$outputPath" `
                    "$Url"

                return $LASTEXITCODE
            }

            # Fixed audio bitrate
            yt-dlp `
                -f "bestaudio" `
                -x `
                --audio-format mp3 `
                --audio-quality "$Format" `
                -o "$outputPath" `
                "$Url"

            return $LASTEXITCODE
        }

        default {
            Write-Host "Invalid format: $Format"
            Write-Host ""
            Write-Host "Video: v _p 240p 360p 480p 720p 1080p 1440p"
            Write-Host "Audio: a _k 64k 128k 256k"
            return 1
        }
    }
}
