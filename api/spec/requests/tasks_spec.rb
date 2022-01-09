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

    end

  end
  describe '/v1/projects/{project_id}/tasks/{task_id}/sync' do
    describe 'PUT' do

    end
  end
end
