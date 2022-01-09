require 'rails_helper'
RSpec.describe Project do
  let (:project) { create(:project) }
  it 'サンプル' do
    expect(project.name).to eq "test project"
  end
end
