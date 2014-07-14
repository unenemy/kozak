require 'rails_helper'

describe 'project requests' do

  it 'should return the list of projects' do
    projects = [create(:project), create(:project)]
    authorized_request :get, api_projects_path
    expect(response).to be_success
    expect(json.count).to eq(2)
  end

  it 'should return project info' do
    project = create(:project)
    authorized_request :get, api_project_path(project)
    expect(response).to be_success
    expect(json).to have_key(:title)
  end
end