require 'rails_helper'

describe 'ProjectsAPI' do
  describe '/v1/projects' do
    describe 'GET' do
      it 'status code is 200' do
        get '/v1/projects'
        expect(response.status).to eq 200
      end
    end
  end
end
