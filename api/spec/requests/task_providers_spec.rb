require 'rails_helper'

RSpec.describe 'TaskProvidersAPI' do
  let (:project) { create(:project) }
  describe '/v1/projects/{project_id}/task_providers' do
    describe 'GET' do
      let (:task_provider) { create(:task_provider, project_id: project.id) }
      it 'status code is 200' do
        get "/v1/projects/#{project.id}/task_providers"
        expect(response.status).to eq 200
      end
    end
    describe 'POST' do
      it 'status code is 200' do
        expect {
          post "/v1/projects/#{project.id}/task_providers", params: {
            name: "created name",
            provider_kind: "user"
          }
        }.to change(TaskProvider, :count).by(+1)
        expect(response.status).to eq 200
      end
    end
  end
  describe '/v1/projects/{project_id}/task_providers/{task_provider_id}' do
    let (:task_provider) { create(:task_provider, project_id: project.id) }
    describe 'DELETE' do
      it 'status code is 200' do
        delete "/v1/projects/#{project.id}/task_providers/#{task_provider.id}"
        expect(response.status).to eq 200
      end
      xit 'properly deleted?' do

      end
    end
  end
  describe '/v1/projects/{project_id}/task_providers/{task_provider_id}/sync' do
    describe 'POST' do
      xit 'syncは、外部APIをコールするので、テスト方法を検討' do

      end
    end
  end
end
