# youtube-archiving-script
Bash script for archving youtube playlists/channels.
- [Installation](https://github.com/htmlgxn/youtube-archiving-script#installation)
- [Getting Started](https://github.com/htmlgxn/youtube-archiving-script#getting-started)
- [Usage](https://github.com/htmlgxn/youtube-archiving-script#usage)
- [License](https://github.com/htmlgxn/youtube-archiving-script#license)

## Installation

Install package [youtube-dl](https://github.com/ytdl-org/youtube-dl) if not installed already.

eg. (Arch + yay):
```console
$ yay -S youtube-dl
```

Clone the github repo to your desired directory
```console
$ cd path/to/dir
$ git clone https://github.com/htmlgxn/youtube-archiving-script.git
```
## Getting Started
### Edit archive.sh

Set the default storage path in which you would like to store the archive by replacing:
```bash
STORAGE_PATH="path/to/default/directory"
```
eg.
```bash
STORAGE_PATH="~/Videos/youtube_channels"
```

#### Optional:

Feel free to edit filename formatting here:
```bash
PATH_FILE+="/%(upload_date)s_%(title)s.%(ext)s"
```
See [supported youtube-dl output tempates](https://github.com/ytdl-org/youtube-dl#output-template).

Feel free to also edit the youtube-dl options flags here:
```bash
youtube-dl -o $PATH_FILE --download-archive $PATH_ARCHIVE -f best --add-metadata --all-subs --convert-subs srt --embed-subs --abort-on-unavailable-fragment --abort-on-error -i $LIST_ID
```

Finally, change how long the script sleeps before checking for new videos by changing:
```bash
sleep 1800
```
1800 seconds = 30 minutes by default.

### Edit list

In the list, it's one playlist/video per line.

Formatting is straightforward:
```
<URL/ID> <DIRECTORY>
```
eg.
```
xvFZjo5PgG0 cool_videos/rick
```
Hash comments are also allowed in the list.

## Usage

Run the script from the terminal
```console
$ bash path/to/youtube-archiving-script/archive.sh
```

Alternatively, run it in the background or from a script manager.

## License
[MIT](LICENSE)
