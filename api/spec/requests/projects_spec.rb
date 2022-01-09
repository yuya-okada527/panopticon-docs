require 'rails_helper'

RSpec.describe 'ProjectsAPI' do
  describe '/v1/projects' do
    describe 'GET' do
      it 'status code is 200' do
        get '/v1/projects'
        expect(response.status).to eq 200
      end
    end
    describe 'POST' do
      it 'status code is 200' do
        post '/v1/projects', params: {
          name: "test project2"
        }
        expect(response.status).to eq 200
      end
    end
  end
end
