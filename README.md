# Whiteboard Recorder

> A web-based whiteboard recording tool for course explanations, product demos, and async communication.

This tool combines whiteboard, webcam, recording viewport, slides, library, and teleprompter in one workspace. Perfect for creating tutorial videos, product demos, course snippets, async explanations, and knowledge cards.

Live Demo: [https://aia.bj.cn/whiteboard-recorder](https://aia.bj.cn/whiteboard-recorder)

## Features

- **Whiteboard**: Based on Excalidraw, supports hand-drawn graphics, text, images, frames, and library items
- **Recording Viewport**: Supports 16:9, 4:3, 3:4, 9:16, 1:1, and custom aspect ratios
- **Slides**: Organize whiteboard content by recording viewport, switch between slides during recording
- **Webcam**: Webcam bubble with position/size adjustment, circular and square display modes
- **Teleprompter**: Script support, word-by-word highlighting, lightweight mode, and voice following
- **Library**: Personal library and public library entrance, add assets to whiteboard
- **Theme & Language**: Light, dark, system follow, Chinese / English support
- **Export**: Record and export video files in browser
- **Mobile Landing**: Shows web-only hint on mobile to avoid confusion

## Requirements

- Node.js 20 or higher
- npm 10 or higher
- Latest Chrome or Edge recommended (recording, webcam, and mic capabilities require browser permissions)
- `localhost` for local dev; HTTPS required for production deployment (browsers may block camera/mic/screen permissions on HTTP)

## Installation

```bash
git clone https://github.com/idonecc/whiteboard-recorder.git
cd whiteboard-recorder
npm install
```

## Local Development

Start dev server:

```bash
npm run dev
```

Open the URL shown in terminal with your desktop browser. First-time use of webcam, mic, or screen recording will prompt for permissions.

Basic workflow:

1. Organize content on whiteboard: draw, add text, import images, or add library elements
2. Click slides button on right side, add recording viewports
3. Open webcam, adjust position, size, and shape (circle/square)
4. Open teleprompter, paste script, enable word highlighting or voice following as needed
5. Click record, choose 16:9, 4:3, 3:4, 9:16, 1:1, or custom aspect ratio
6. Start recording, stop when done, and export video

For detailed guide see [public/docs/operation-guide.md](./public/docs/operation-guide.md).

## Build

```bash
npm run build
```

Build output goes to `dist/`.

Preview build locally:

```bash
npm run preview
```

## Deployment

This is a pure frontend web app. After build, deploy to any static hosting service.

Common config:

```text
Project root: .
Install command: npm install
Build command: npm run build
Output directory: dist
```

When deployed to production domain, ensure HTTPS access. Browser camera, mic, and screen recording capabilities are typically only available on `localhost` or HTTPS pages.

If deploying to a subpath (e.g., `https://example.com/tools/whiteboard/`), adjust Vite's `base` config accordingly, otherwise static asset paths may be incorrect. Default config assumes root path deployment.

## FAQ

### Can I use it on mobile?

Mobile access shows a landing page. Currently designed for desktop browsers, mobile experience is under development.

### Why can't I open camera, mic, or screen recording?

Ensure the page runs on `localhost` or HTTPS, and browser has granted camera, mic, and screen recording permissions. On macOS, also grant browser access to camera, mic, and screen recording in System Settings.

### Recording export failed?

Use latest Chrome or Edge, and ensure recording viewport width/height are even numbers. H.264 encoding typically requires even dimensions. The app attempts auto-correction, but use even numbers for custom dimensions.

## License

MIT License

This project uses open-source components under their respective licenses. See [THIRD_PARTY_NOTICES.md](./THIRD_PARTY_NOTICES.md) for details.

Key dependencies:
- [Excalidraw](https://github.com/excalidraw/excalidraw): Excellent open-source whiteboard editing
- [mp4-muxer](https://github.com/Vanilagy/mp4-muxer): Browser-side MP4 muxing
- [MediaPipe Tasks Vision](https://developers.google.com/mediapipe): Browser-side vision capabilities
