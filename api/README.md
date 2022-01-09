# Panopticon API

セルフモニタリングツール「Panopticon」のコア機能の API。

## 利用ツール

- 言語: Ruby3.0.2
- フレームワーク: Ruby on Rails6.1.4
- データベース: MySQL
- DB スキーマ管理: ridgepole
- JSON シリアライザ: jb
- HTTP クライアント: faraday
- テストフレームワーク: RSpec
- シード作成: factory-bot
- ドキュメント: OpenAPI

## 開発環境

- API: http://localhost:3000
- DB クライアント: http://localhost:8888
- Swagger UI: http://localhost:8081
- Metabase: http://localhost:3300

## コマンド

```bash
# 開発環境開始
$ make

# 開発環境終了
$ make down

# コンテナビルド
$ make build

# Gem更新
$ make update

# RSpec実行
$ make rspec

# Rails console起動
$ make console
```
