# 1st リリースインフラ設計

## 要件

満たしたいアーキテクチャ特性について検討する

## アーキテクチャ

### Front

- ホスティング: Vercel
- フレームワーク: Nuxt.js
- モニタリング: sentry

### API

- ホスティング(検討中):
  - PaaS:
    - Railway
      - https://docs.railway.app/
    - render.com
      - https://render.com/
  - CaaS:
    - okteto
      - https://www.okteto.com/
  - DBaaS:
    - PlanetScale
    - https://planetscale.com/
