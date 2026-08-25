# Native apps

Lens on Android and iOS is the **same gallery** as the website, wrapped in a small WebView shell.

| Platform | Path | Open with | Bundle ID |
| --- | --- | --- | --- |
| Android | [android/](./android/) | Android Studio | `com.sapplex.lens` |
| iOS | [ios/](./ios/) | Xcode (macOS) | `com.sapplex.lens` |

Favorites stay in the WebView’s `localStorage` on that device. There is no account, push notification, or in-app purchase.

```bash
npm install
npm run native:prepare   # vite build + copy dist/ into both www folders
python3 scripts/generate-icons.py   # optional: refresh launcher / App Icon
```

Step-by-step: [Android](./android/README.md) · [iOS](./ios/README.md)
