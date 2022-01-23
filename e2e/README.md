# E2E test for Panopticon

## 利用技術

- テストフレームワーク: playwright-test
  - https://playwright.dev/

## ディレクトリ構造

```
.
├── playwright-report            // テストレポート
│   └── ...
├── playwright.config.ts         // 設定
├── tests
│   ├── po                       // PageObjectModels
│   │   └── projects-page.ts
│   ├── scenarios                // テストシナリオ
│   │   ├── 01_projects.spec.ts
│   │   └── 02_tasks.spec.ts
│   └── utils                    // ユーティリティ
│       └── e2e-utils.ts
```
