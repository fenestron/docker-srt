# 🐳 SRT Docker image

[![docker status](https://dockeri.co/image/fenestron/srt)](https://hub.docker.com/r/fenestron/srt)

Docker build for [SRT](https://github.com/Haivision/srt) on Alpine. Secure, Reliable, Transport.

- SRT 1.4.3
- Alpine 3.13


## Usage

- Pull image and run (transfer data between two SRT via `srt-live-transmit`):
```
docker run -it --rm -p 1234:1234/udp -p 1235:1235/udp fenestron/srt:latest srt-live-transmit srt://:1234 srt://:1235
```

You can also run `srt-file-transmit` and `srt-tunnel`:
```
docker run -it --rm fenestron/srt:latest srt-live-transmit
docker run -it --rm fenestron/srt:latest srt-tunnel
```


## Examples

### ffmpeg & ffplay

> You must have a version of ffmpeg compiled with SRT (`--enable-libsrt`)

- Run image:
```
docker run -it --rm -p 1234:1234/udp -p 1235:1235/udp fenestron/srt:latest srt-live-transmit srt://:1234 srt://:1235
```

- Stream file to `srt` via `ffmpeg:
```
ffmpeg -re -i file.mp4 -f mpegts srt://127.0.0.1:1234
```

- Play `srt` stream with `ffplay`:
```
ffplay srt://127.0.0.1:1235
```


### OBS

> You must have OBS Studio 25.0 or newer

- Set `Server`:
```
srt://127.0.0.1:1234
```

- Add `Media Source`:
```
srt://127.0.0.1:1235
```
