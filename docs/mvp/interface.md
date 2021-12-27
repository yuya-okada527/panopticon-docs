# API インターフェース定義

## プロジェクト一覧

- /v1/projects
- プロジェクト一覧を返す

response

```json
[
  {
    "id": 0,
    "name": "name"
  }
]
```

## タスク一覧

- GET /v1/projects/{project_id}/tasks
- タスクの一覧を返す

request

- ?status=TODO&name=hoge

response

```json
[
  {
    "id": 0,
    "external_url": "https://github.com/...",
    "name": "name",
    "description": "description",
    "status": "TODO"
  }
]
```

- POST /v1/projects/{project_id}/tasks/orders
- タスクの順番を入れ替える

## タスク詳細

- GET /v1/projects/{project_id}/tasks/{task_id}
- タスクの詳細を返す

response

```json
{
  "id": 0,
  "external_url": "https://github.com/...",
  "name": "name",
  "description": "description",
  "status": "TODO",
  "position": 1
}
```

- POST /v1/projects/{project_id}/tasks
- タスクを作成する

request

```json
{
  "name": "name",
  "description": "description"
}
```

response

```json
{
  "id": 0
}
```

- PUT /v1/projects/{project_id}/tasks/{task_id}
- タスクを更新する

request

```json
{
  "name": "name",
  "description": "description"
}
```

response

```json
{
  "id": 0
}
```

- PUT /v1/projects/{project_id}/tasks/{task_id}/status
- タスクのステータスを更新する

request

```json
{
  "before_status": 1,
  "after_status": 2
}
```

response

```json
{
  "id": 0
}
```

## タスクプロバイダ

- GET /v1/projects/{project_id}/task_providers
- タスクプロバイダ一覧を取得する

response

```json
[
  {
    "id": 0,
    "name": "name",
    "provider_kind": "github",
    "provider_url": "https://github.com/..."
  }
]
```

- POST /v1/projects/{project_id}/task_providers
- タスクプロバイダを登録する

request

```json
{
  "name": "name",
  "provider_kind": "github",
  "provider_url": "https://github.com/..."
}
```

response

```json
{
  "id": 0
}
```

- POST /v1/projects/{project_id}/task_providers/{task_provider_id}/sync
- タスク情報をタスクプロバイダで更新する

request

```json
{
  "token": "token",
  "user_name": "user name"
}
```

- DELETE /v1/projects/{project_id}/task_providers/{task_provider_id}/sync
- タスクプロバイダを削除する
