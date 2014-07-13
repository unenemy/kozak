require 'rails_helper'

describe 'project requests' do

  it 'should return the list of projects' do
    projects = [create(:project), create(:project)]
    authorized_request :get, api_projects_path
    expect(json.count).to eq(2)
  end

end