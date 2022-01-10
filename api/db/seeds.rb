[
  "projects",
  "tasks",
  "task_providers",
  "task_status_histories"
].each do |table_name|
  ActiveRecord::Base.connection.execute("TRUNCATE TABLE #{table_name}")
end

# プロジェクト
project = Project.new(name: "Local Project")
project.save!

# タスクプロバイダ
task_provider = TaskProvider.new(
  project_id: project.id,
  name: "Panopticon",
  provider_kind: 1,
  organization: "yuya-okada527",
  repository: "panopticon"
)
task_provider.save!

api_task_provider = TaskProvider.new(
  project_id: project.id,
  name: "Panopticon API",
  provider_kind: 1,
  organization: "yuya-okada527",
  repository: "panopticon-api"
)
api_task_provider.save!

fe_task_provider = TaskProvider.new(
  project_id: project.id,
  name: "Panopticon FE",
  provider_kind: 1,
  organization: "yuya-okada527",
  repository: "panopticon-fe"
)
fe_task_provider.save!

# タスク
[
  {
    project_id: project.id,
    task_provider_id: api_task_provider.id,
    name: "task1",
    description: "# Task1\n\n- list1\n- list2",
    status: 1
  }
].each do |args|
  task = Task.new(**args)
  task.save!
  # タスクステータス履歴
  [
    {
      task_id: task.id,
      before_status: 0,
      after_status: 1
    }
  ].each do |args|
    history = TaskStatusHistory.new(**args)
    history.save!
  end
end
