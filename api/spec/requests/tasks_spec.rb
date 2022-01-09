require 'rails_helper'

RSpec.describe 'TasksAPI' do
  let (:project) { create(:project) }
  describe '/v1/projects/{project_id}/tasks' do
    describe 'GET' do
      let (:tasks) { create_list(:task, 3, project_id: project.id) }
      it 'status code is 200 ' do
        get "/v1/projects/#{project.id}/tasks"
        expect(response.status).to eq 200
      end
    end
    describe 'POST' do
      it 'status code is 200 and data creation verified' do
        expect {
          post "/v1/projects/#{project.id}/tasks", params: {
            name: "name",
            description: "description"
          }
        }.to change(Task, :count).by(+1)
        expect(response.status).to eq 200
      end
    end
  end
  describe '/v1/projects/{project_id}/tasks/{task_id}' do
    let (:task) { create(:task, project_id: project.id) }
    describe 'GET' do
      it 'status code is 200 and returned id is verified' do
        get "/v1/projects/#{project.id}/tasks/#{task.id}"
        json = JSON.parse(response.body)
        expect(response.status).to eq 200
        expect(json['id']).to eq task.id
      end
    end
    describe 'PUT' do
      it 'status code is 200 and task is properly updated' do
        put "/v1/projects/#{project.id}/tasks/#{task.id}", params: {
          name: "changed name",
          description: "changed description"
        }
        expect(response.status).to eq 200
        updated_task = Task.find(task.id)
        expect(updated_task.name).to eq "changed name"
        expect(updated_task.description).to eq "changed description"
      end
    end

  end
  describe '/v1/projects/{project_id}/tasks/{task_id}/status' do
    let (:task) { create(:task, project_id: project.id, status: 1) }
    describe 'PUT' do
      it 'status code is 200 and task status history is updated' do
        expect {
          put "/v1/projects/#{project.id}/tasks/#{task.id}/status", params: {
            before_status: "todo",
            after_status: "doing"
          }
        }.to change(TaskStatusHistory, :count).by(+1)
        expect(response.status).to eq 200
        updated_task = Task.find(task.id)
        expect(updated_task.status).to eq "doing"
      end
    end
  end
end
