require 'rails_helper'

RSpec.describe 'TaskProvidersAPI' do
  let (:project) { create(:project) }
  describe '/v1/projects/{project_id}/task_providers' do
    describe 'GET' do
      let (:task_provider) { create(:task_provider) }
      it 'status code is 200' do
        get "/v1/projects/#{project.id}/task_providers"
        expect(response.status).to eq 200
      end
    end
    describe 'POST' do

    end
  end
  describe '/v1/projects/{project_id}/task_providers/{task_provider_id}' do
    describe 'DELETE' do

    end
  end
  describe '/v1/projects/{project_id}/task_providers/{task_provider_id}/sync' do
    describe 'POST' do

    end
  end
end
