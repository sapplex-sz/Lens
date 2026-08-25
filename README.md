# Lens

[English](./README.en.md) · 简体中文

<p>
  <a href="./LICENSE"><img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License"></a>
  <a href="https://github.com/freestylefly/awesome-gpt-image-2"><img src="https://img.shields.io/badge/data-awesome--gpt--image--2-violet.svg" alt="Data from awesome-gpt-image-2"></a>
  <a href="https://github.com/sapplex-sz/Lens"><img src="https://img.shields.io/badge/react-19-61dafb.svg" alt="React 19"></a>
</p>

Lens 是面向手机的 GPT-Image2 **图鉴客户端**：浏览案例、复制完整 Prompt、按分类筛选，收藏只存在这台设备上。

本仓库是**独立实现**的浏览端，不是 [freestylefly/awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2) 的官方项目，也未获得其作者背书。案例图、提示词和工业级模板均来自该 MIT 开源仓库。

完整官方画廊（含登录、生图、会员）仍在 [gpt-image2.canghe.ai](https://gpt-image2.canghe.ai/)。

## 功能

- **图库**：双列卡片、精选横滑、搜索标题 / 风格 / 提示词
- **模板**：工业级提示词模板，一键复制结构要点
- **收藏**：`localStorage` 本地保存，无需登录
- **详情**：底部抽屉查看大图、标签和完整 Prompt
- **中英**：跟随浏览器语言，可手动切换

## 快速开始

需要 Node.js 18 或更高版本。

```bash
git clone https://github.com/sapplex-sz/Lens.git
cd Lens
npm install
npm run dev
```

浏览器打开终端提示的本地地址即可。

```bash
npm run build      # 生产构建
npm run preview    # 预览构建结果
```

## 数据来源

Lens **不内置**案例文件。运行时从 jsDelivr 读取上游仓库的公开数据：

| 资源 | 地址 |
| --- | --- |
| 案例 JSON | `https://cdn.jsdelivr.net/gh/freestylefly/awesome-gpt-image-2@main/data/cases.json` |
| 模板 / 分类 | `https://cdn.jsdelivr.net/gh/freestylefly/awesome-gpt-image-2@main/data/style-library.json` |
| 案例图片 | 同上仓库的 `data/images/` |

可用环境变量覆盖数据根路径（需提供相同结构的 `cases.json` 与 `style-library.json`）：

```bash
VITE_DATA_BASE=https://your-cdn.example/data npm run dev
```

## 许可证

本仓库源代码以 **MIT License** 发布，版权归 **sapplex-sz** 所有。完整文本见 [LICENSE](./LICENSE)。

按 MIT 要求，分发本软件时必须保留版权声明和许可声明。

### 上游作品

Lens 在运行时使用 [awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2) 的数据与资源：

```
Copyright (c) 2026 freestylefly
Licensed under the MIT License
```

上游许可证全文已复制到 [THIRD_PARTY/awesome-gpt-image-2.LICENSE](./THIRD_PARTY/awesome-gpt-image-2.LICENSE)。署名与来源说明见 [NOTICE](./NOTICE)。

### 第三方案例

部分案例的提示词和配图最初来自公开社区作者。Lens 不主张对这些内容的所有权，也不保证其可用于商业用途。权利人如需下架，请先在[上游仓库](https://github.com/freestylefly/awesome-gpt-image-2)反馈；若问题出在本客户端，请开 Issue。

上游声明：<https://github.com/freestylefly/awesome-gpt-image-2/blob/main/docs/disclaimer.md>

## 免责声明

软件按「原样」提供，不附带任何明示或默示担保。详见 [LICENSE](./LICENSE) 中的 MIT 免责条款。

本项目：

- 不提供图像生成、账号或付费功能
- 不缓存、不转售上游案例资源
- 与苍何 / canghe.ai / awesome-gpt-image-2 维护者无官方关系

## 致谢

- [freestylefly](https://github.com/freestylefly) 与 [awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2) 贡献者整理了案例与模板
- 各案例原始作者（见每条案例的来源链接）
- [React](https://react.dev/)、[Vite](https://vite.dev/)、[lucide](https://lucide.dev/)

## 相关链接

- 本仓库：<https://github.com/sapplex-sz/Lens>
- 上游仓库：<https://github.com/freestylefly/awesome-gpt-image-2>
- 官方网站：<https://gpt-image2.canghe.ai/>
- 在 fork 上的 `/lens` 页面：<https://github.com/sapplex-sz/awesome-gpt-image-2>
