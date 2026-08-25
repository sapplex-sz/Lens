# Lens for iOS

SwiftUI + WKWebView shell. Bundle ID `com.sapplex.lens`, iOS 16+.

The gallery UI is the same Vite build as the website, copied into `Lens/www/`. Case images and JSON still load from jsDelivr at runtime.

An IPA cannot be produced on Linux. Open this project on a Mac with Xcode.

## Open in Xcode

1. On macOS, install Xcode 15 or newer from the Mac App Store.
2. Open `native/ios/Lens.xcodeproj`.
3. Select the **Lens** target → **Signing & Capabilities**.
4. Choose your Team. Xcode will create a development provisioning profile.
5. Pick an iPhone simulator or a connected device.
6. Press **Run** (⌘R).

To archive for TestFlight / App Store: **Product → Archive**, then distribute from the Organizer. You need an Apple Developer Program membership.

## Refresh the web bundle

From the repository root, after changing `src/`:

```bash
npm install
npm run native:prepare
```

Then rebuild in Xcode.

## Notes

- App Icon is `Assets.xcassets/AppIcon.appiconset/AppIcon.png` (1024×1024). Regenerate with `python3 scripts/generate-icons.py`.
- Local web files are served under the custom scheme `lens://localhost/` so `fetch()` to the HTTPS CDN is a normal cross-origin request.
