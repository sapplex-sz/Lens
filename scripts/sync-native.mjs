import { cpSync, mkdirSync, rmSync, existsSync, writeFileSync } from "node:fs";
import { dirname, resolve } from "node:path";
import { fileURLToPath } from "node:url";

const root = dirname(dirname(fileURLToPath(import.meta.url)));
const dist = resolve(root, "dist");
const androidWww = resolve(root, "native/android/app/src/main/assets/www");
const iosWww = resolve(root, "native/ios/Lens/www");

if (!existsSync(dist)) {
  console.error("dist/ is missing. Run npm run build first.");
  process.exit(1);
}

function replaceWww(target) {
  rmSync(target, { recursive: true, force: true });
  mkdirSync(target, { recursive: true });
  cpSync(dist, target, { recursive: true });
}

replaceWww(androidWww);
replaceWww(iosWww);

writeFileSync(
  resolve(root, "native/.sync-stamp"),
  new Date().toISOString() + "\n",
);

console.log("Synced dist/ → native Android assets and iOS www/");
