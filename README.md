# 🐳 SRT Docker image
Docker build for [SRT](https://github.com/Haivision/srt) on Alpine. Secure, Reliable, Transport.

- SRT 1.4.3
- Alpine 3.13


## Usage

- Pull image and run:
```

```

You can also run `srt-file-transmit` and `srt-tunnel`:
```

```


## Examples

### ffmpeg & ffplay

> You must have a version of ffmpeg compiled with SRT (`--enable-libsrt`)

- Run image:
```

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
