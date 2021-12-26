# API インターフェース定義

## プロジェクト一覧

- /v1/projects
- プロジェクト一覧を返す

## タスク一覧

- GET /v1/projects/{project_id}/tasks
- タスクの一覧を返す

- POST /v1/projects/{project_id}/tasks/orders
- タスクの順番を入れ替える

## タスク詳細

- GET /v1/projects/{project_id}/tasks/{task_id}
- タスクの詳細を返す

- POST /v1/projects/{project_id}/tasks
- タスクを作成する

- PUT /v1/projects/{project_id}/tasks/{task_id}
- タスクを更新する

- PUT /v1/projects/{project_id}/tasks/{task_id}/status
- タスクのステータスを更新する

## タスクプロバイダ

- GET /v1/projects/{project_id}/task_providers
- タスクプロバイダ一覧を取得する

- POST /v1/projects/{project_id}/task_providers
- タスクプロバイダを登録する

- PUT /v1/projects/{project_id}/task_providers/{task_provider_id}
- タスクプロバイダを更新する

- POST /v1/projects/{project_id}/task_providers/{task_provider_id}/sync
- タスク情報をタスクプロバイダで更新する
