<h1 align="center">Lens</h1>

<p align="center"><strong>Phone-first GPT-Image2 gallery</strong></p>

<p align="center">
  English · <a href="./README.md">简体中文</a>
</p>

<p align="center">
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href="https://github.com/freestylefly/awesome-gpt-image-2"><img src="https://img.shields.io/badge/data-awesome--gpt--image--2-violet.svg" alt="Data from awesome-gpt-image-2"></a>
  <a href="https://github.com/sapplex-sz/Lens"><img src="https://img.shields.io/badge/react-19-61dafb.svg" alt="React 19"></a>
</p>

Lens is a **phone-first gallery client** for GPT-Image2 cases: browse examples, copy full prompts, filter by category, and save favorites on this device only.

This repository is an **independent companion app**. It is not an official project of [freestylefly/awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2) and is not endorsed by its authors. Case images, prompts, and industrial templates come from that MIT-licensed repository.

The official product site (sign-in, generation, membership) remains at [gpt-image2.canghe.ai](https://gpt-image2.canghe.ai/).

## Features

- **Gallery**: two-column cards, featured strip, search by title / style / prompt
- **Templates**: industrial prompt templates with one-tap copy
- **Saved**: favorites in `localStorage`, no account required
- **Detail**: bottom sheet with large image, tags, and the full prompt
- **zh / en**: follows the browser language, with a manual toggle

## Quick start

Node.js 18+ is required.

```bash
git clone https://github.com/sapplex-sz/Lens.git
cd Lens
npm install
npm run dev
```

Open the local URL printed by Vite.

```bash
npm run build      # production build
npm run preview    # preview the build
```

## Android / iOS

The same gallery, wrapped in a native WebView. Projects live under [`native/`](./native/).

| Platform | How to open | Bundle ID |
| --- | --- | --- |
| [Android](./native/android/README.md) | Android Studio → `native/android` | `com.sapplex.lens` |
| [iOS](./native/ios/README.md) | Xcode on macOS → `native/ios/Lens.xcodeproj` | `com.sapplex.lens` |

```bash
npm run native:prepare   # build the web app and copy it into both www folders
```

Run Android from Android Studio on an emulator or device. iOS must be signed in Xcode on a Mac; this repository does not include a signed IPA. Play Store / App Store submission needs your own developer account.

## Data source

Lens does **not** vendor case files. At runtime it reads public data from jsDelivr:

| Resource | URL |
| --- | --- |
| Cases JSON | `https://cdn.jsdelivr.net/gh/freestylefly/awesome-gpt-image-2@main/data/cases.json` |
| Templates / categories | `https://cdn.jsdelivr.net/gh/freestylefly/awesome-gpt-image-2@main/data/style-library.json` |
| Case images | `data/images/` in the same repository |

Override the data root if you host the same JSON layout yourself:

```bash
VITE_DATA_BASE=https://your-cdn.example/data npm run dev
```

## License

The source code in this repository is released under the **MIT License**. Copyright **sapplex-sz**. See [LICENSE](./LICENSE).

The MIT License requires that the copyright notice and permission notice be included in all copies or substantial portions of the Software.

### Upstream work

Lens loads data and assets from [awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2) at runtime:

```
Copyright (c) 2026 freestylefly
Licensed under the MIT License
```

The upstream license text is copied at [THIRD_PARTY/awesome-gpt-image-2.LICENSE](./THIRD_PARTY/awesome-gpt-image-2.LICENSE). Attribution details are in [NOTICE](./NOTICE).

### Third-party cases

Some prompts and images originate from public community authors. Lens claims no ownership of that material and does not warrant it for commercial use. Rights holders should first contact the [upstream repository](https://github.com/freestylefly/awesome-gpt-image-2); open an Issue here if the problem is specific to this client.

Upstream disclaimer: <https://github.com/freestylefly/awesome-gpt-image-2/blob/main/docs/disclaimer.md>

## Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND. See the MIT disclaimer in [LICENSE](./LICENSE).

This project:

- does not provide image generation, accounts, or payments
- does not cache or resell upstream case assets
- has no official relationship with Canghe / canghe.ai / the awesome-gpt-image-2 maintainers

## Credits

- [freestylefly](https://github.com/freestylefly) and contributors to [awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2)
- Original authors of each case (see the source link on every item)
- [React](https://react.dev/), [Vite](https://vite.dev/), [lucide](https://lucide.dev/)

## Links

- This repository: <https://github.com/sapplex-sz/Lens>
- Upstream repository: <https://github.com/freestylefly/awesome-gpt-image-2>
- Official website: <https://gpt-image2.canghe.ai/>
- `/lens` page on the fork: <https://github.com/sapplex-sz/awesome-gpt-image-2>
