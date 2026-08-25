#!/usr/bin/env python3
"""Generate Android mipmap and iOS AppIcon PNGs from assets/icon.svg geometry."""

from pathlib import Path

from PIL import Image, ImageDraw

ROOT = Path(__file__).resolve().parents[1]
ANDROID = ROOT / "native/android/app/src/main/res"
IOS = ROOT / "native/ios/Lens/Assets.xcassets/AppIcon.appiconset"


def paint(size: int) -> Image.Image:
    img = Image.new("RGBA", (size, size), (11, 11, 13, 255))
    draw = ImageDraw.Draw(img)
    s = size / 1024

    def ring(r, width, fill=(228, 221, 210, 255)):
        outer = r + width / 2
        inner = max(r - width / 2, 0)
        bbox_o = [size / 2 - outer, size / 2 - outer, size / 2 + outer, size / 2 + outer]
        bbox_i = [size / 2 - inner, size / 2 - inner, size / 2 + inner, size / 2 + inner]
        draw.ellipse(bbox_o, fill=fill)
        draw.ellipse(bbox_i, fill=(11, 11, 13, 255))

    ring(290 * s, 56 * s)
    ring(168 * s, 28 * s)
    cr = 46 * s
    draw.ellipse([size / 2 - cr, size / 2 - cr, size / 2 + cr, size / 2 + cr], fill=(228, 221, 210, 255))
    hr = 36 * s
    hx, hy = 404 * s, 404 * s
    draw.ellipse([hx - hr, hy - hr, hx + hr, hy + hr], fill=(243, 241, 236, 140))
    return img


def main() -> None:
    android = {
        "mipmap-mdpi": 48,
        "mipmap-hdpi": 72,
        "mipmap-xhdpi": 96,
        "mipmap-xxhdpi": 144,
        "mipmap-xxxhdpi": 192,
    }
    for folder, size in android.items():
        dest = ANDROID / folder
        dest.mkdir(parents=True, exist_ok=True)
        paint(size).save(dest / "ic_launcher.png")
        paint(size).save(dest / "ic_launcher_round.png")

    play = ANDROID / "mipmap-xxxhdpi"
    paint(512).save(ROOT / "native/android/play-icon.png")

    IOS.mkdir(parents=True, exist_ok=True)
    paint(1024).save(IOS / "AppIcon.png")
    print("icons written")


if __name__ == "__main__":
    main()
