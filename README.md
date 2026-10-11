# Homebrew Tap

Official Homebrew tap for [frostymur](https://github.com/frostymur):

- **[aerofi](https://github.com/frostymur/aerofi)** — lightweight, keyboard- and mouse-driven script launcher for macOS
- **[aeroflow](https://github.com/frostymur/OmniWM)** — lightweight, config-driven tiling window manager for macOS (headless daemon)

## Installation

aerofi:

```bash
brew install frostymur/tap/aerofi
```

aeroflow:

```bash
brew install frostymur/aerofi/aeroflow
```

Or you can add the tap first and then install:

```bash
brew tap frostymur/tap
brew install aerofi
brew install aeroflow
```

aeroflow runs as a LaunchAgent:

```bash
brew services start aeroflow
```
aerofi can also run as a background service:

```bash
brew services start aerofi
```

## Issues and Documentation

Please refer to the [aerofi](https://github.com/frostymur/aerofi) and
[OmniWM](https://github.com/frostymur/OmniWM) repositories for full
documentation, source code, and issue tracking.
