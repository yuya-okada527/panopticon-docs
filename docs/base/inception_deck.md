# インセプションデッキ

## Why we are here?

自分自身のタスクの実施状況を記録し、改善するための簡易的なツールが欲しかったため

## Elevator pitch

自分自身のタスク実施状況を記録し、改善したい
自分向けの
Panopticon と言うプロダクトは、
セルフモニタリングツールである。
これは、タスク実施の履歴を記録することができ、
クラウドベースの TODO アプリと違い、ローカル PC 内で完結しているため、セキュリティ上のリスクが低い。
また、Excel などより簡易的で、可搬性と拡張性に優れるツールである。

## Solution

### アプリケーションの構成

- API
  - フレームワーク: Ruby on Rails
  - データベース: MySQL
  - DB スキーマ管理: ridgepole
    - https://github.com/ridgepcole/ridgepole
  - HTTP クライアント: faraday
    - https://github.com/lostisland/faraday
  - テストフレームワーク: Rspec
  - シード作成: factory-bot
  - ドキュメント: OpenAPI (具体的な方針は検討)
  - 静的解析: 要検討
- バッチ
  - API として、実装して Lambda から実行する
- フロント
  - フレームワーク: Nuxt.js
  - 状態管理: vuex
  - UI 構築: SCSS
  - HTTP クライアント: axios
  - テストフレームワーク: jest
  - 静的解析: ESLint
  - フォーマッター: Prettier
- BI ツール
  - metabase
    - https://www.metabase.com/
