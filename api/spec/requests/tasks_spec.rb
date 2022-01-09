require 'rails_helper'

RSpec.describe 'TasksAPI' do
  let (:project) { create(:project) }
  describe '/v1/projects/{project_id}/tasks' do
    describe 'GET' do
      let (:tasks) { create_list(:task, 3, project_id: project.id) }
      it 'status code is 200' do
        get "/v1/projects/#{project.id}/tasks"
        expect(response.status).to eq 200
      end
    end
  end
end
