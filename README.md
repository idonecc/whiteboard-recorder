# Whiteboard Recorder

> A professional web-based whiteboard recording tool for creating tutorial videos, product demos, and async explanations.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Live Demo](https://img.shields.io/badge/demo-online-brightgreen)](https://aia.bj.cn/whiteboard-recorder)

Whiteboard Recorder combines a powerful whiteboard editor, webcam overlay, teleprompter, and slides system into one unified recording workspace. Perfect for educators, product managers, and content creators.

**Live Demo**: [https://aia.bj.cn/whiteboard-recorder](https://aia.bj.cn/whiteboard-recorder)

---

## ✨ Features

### 🎨 Whiteboard Editing
- Hand-drawn graphics with Excalidraw engine
- Text, shapes, arrows, frames
- Image import and library elements
- Infinite canvas with zoom and pan

### 📹 Recording System
- **Multiple Aspect Ratios**: 16:9 (YouTube), 4:3 (Classic), 3:4 (Instagram), 9:16 (TikTok), 1:1 (Square), Custom
- **Browser-based**: No software installation required
- **MP4 Export**: High-quality H.264 encoding
- **Recording Controls**: Pause/resume during recording

### 📽️ Slides & Presentation
- Organize content into slides by viewport
- Switch between slides during recording
- Keyboard navigation (← →)
- Slide preview strip

### 📷 Webcam Overlay
- Circular or square bubble
- Draggable positioning
- Adjustable size
- Background removal (experimental)

### 📜 Teleprompter
- Word-by-word highlighting
- Auto-scroll with voice following
- Lightweight mode
- Script persistence

### 🎨 Customization
- Light / Dark / System themes
- Chinese / English interface
- Custom backgrounds and colors
- Keyboard shortcuts

---

## 🚀 Quick Start

### Prerequisites

- **Node.js** 20+ and **npm** 10+
- **Modern Browser**: Chrome 90+ or Edge 90+ (required for recording APIs)
- **HTTPS** required for production (camera/mic permissions)

### Installation

```bash
# Clone repository
git clone https://github.com/idonecc/whiteboard-recorder.git
cd whiteboard-recorder

# Install dependencies
npm install

# Start dev server
npm run dev
```

Open `http://localhost:5173/whiteboard-recorder/` in your browser.

### First Recording

1. **Prepare Content**: Draw on the whiteboard or import images
2. **Add Slide**: Click the slides button (right side) to add recording viewport
3. **Enable Webcam** (optional): Click camera button, allow browser permissions
4. **Open Teleprompter** (optional): Paste your script
5. **Start Recording**: Click "● Record", choose aspect ratio
6. **Stop & Export**: Click stop button, download MP4 file

📖 **Detailed Guide**: See [Operation Guide](./public/docs/operation-guide.md) for step-by-step instructions.

---

## 🏗️ Build & Deploy

### Build for Production

```bash
npm run build
```

Output: `dist/` directory

Preview build locally:

```bash
npm run preview
```

### Deployment

This is a **static web app** – deploy to any hosting service:

| Platform | Config |
|----------|--------|
| **Vercel** | Auto-detected (Vite) |
| **Netlify** | Build: `npm run build`, Publish: `dist` |
| **GitHub Pages** | See [GitHub Actions workflow](.github/workflows/deploy.yml) |
| **Docker** | See [Dockerfile](./Dockerfile) |

**Important**: 
- Ensure HTTPS (browsers block camera/mic on HTTP)
- For subpath deployment, update `base` in `vite.config.ts`

### Docker Deployment

```bash
# Build image
docker build -t whiteboard-recorder .

# Run container
docker run -d -p 8080:80 whiteboard-recorder
```

Access at `http://localhost:8080`

---

## 🛠️ Tech Stack

- **Frontend**: React 19, TypeScript
- **Build Tool**: Vite 7
- **Whiteboard**: Excalidraw 0.18
- **Recording**: WebCodecs API, mp4-muxer
- **Video Processing**: FFmpeg.wasm (fallback)
- **Computer Vision**: MediaPipe Tasks Vision
- **Styling**: CSS Modules

---

## 📖 Documentation

- **[Operation Guide](./public/docs/operation-guide.md)**: Step-by-step usage instructions
- **[Deployment Guide](./DEPLOY.md)**: Server deployment details
- **[Third-Party Notices](./THIRD_PARTY_NOTICES.md)**: License attributions

---

## 🤔 FAQ

### Can I use it on mobile?

Currently optimized for desktop browsers. Mobile access shows a landing page with instructions. Mobile support is planned.

### Why can't I access camera/mic?

**Common solutions**:
1. Ensure page runs on `localhost` or HTTPS
2. Grant browser permissions when prompted
3. On macOS: System Settings → Privacy & Security → Camera/Microphone
4. Try Chrome/Edge (best compatibility)

### Recording export failed

**Troubleshooting**:
- Use latest Chrome/Edge
- Ensure viewport width/height are **even numbers** (H.264 requirement)
- Check available disk space
- Try disabling browser extensions

### How do I change the aspect ratio after creating slides?

Delete existing slides and create new ones with desired aspect ratio. Slides are viewport-specific.

### Can I record audio separately?

Currently records system audio + microphone together. For separate audio tracks, use external tools like OBS or Audacity.

---

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create feature branch (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Open Pull Request

---

## 📝 License

MIT License - see [LICENSE](./LICENSE) file for details.

This project uses open-source components under their respective licenses:

- **[Excalidraw](https://github.com/excalidraw/excalidraw)** (MIT): Whiteboard editing engine
- **[mp4-muxer](https://github.com/Vanilagy/mp4-muxer)** (MIT): Browser-side MP4 muxing
- **[MediaPipe](https://developers.google.com/mediapipe)** (Apache 2.0): Computer vision capabilities
- **[FFmpeg.wasm](https://github.com/ffmpegwasm/ffmpeg.wasm)** (MIT): Video processing fallback

See [THIRD_PARTY_NOTICES.md](./THIRD_PARTY_NOTICES.md) for complete list.

---

## 🙏 Acknowledgments

Special thanks to:
- [Excalidraw](https://excalidraw.com) team for the excellent whiteboard library
- [Excalicord](https://www.excalicord.com/) for workflow inspiration
- [smart-teleprompter](https://github.com/Voumellis/smart-teleprompter) for teleprompter concepts

---

## 📧 Support

- **Issues**: [GitHub Issues](https://github.com/idonecc/whiteboard-recorder/issues)
- **Discussions**: [GitHub Discussions](https://github.com/idonecc/whiteboard-recorder/discussions)

---

Made with ❤️ for educators and content creators
