# Lens

GPT-Image2 手机图鉴。浏览 500+ 案例、复制完整 Prompt、按分类筛选，收藏保存在这台设备上。

数据来自开源项目 [freestylefly/awesome-gpt-image-2](https://github.com/freestylefly/awesome-gpt-image-2)（MIT）。

## 功能

- 图库：双列卡片、精选横滑、搜索与分类
- 模板：工业级提示词模板，一键复制要点
- 收藏：本地存储，无需登录
- 详情：底部抽屉查看大图和完整 Prompt

## 本地运行

```bash
npm install
npm run dev
```

构建：

```bash
npm run build
npm run preview
```

案例图和 JSON 默认从 jsDelivr 读取原仓库 `data/`。可用环境变量覆盖：

```bash
VITE_DATA_BASE=https://your-cdn.example/data npm run dev
```

## 说明

这是独立的手机优先浏览端，不包含原站的登录、生图和付费能力。完整画廊仍在 [gpt-image2.canghe.ai](https://gpt-image2.canghe.ai/)。
