require 'rails_helper'
describe 'User authentication', type: :request do
  it 'should not authenticate' do
    user = create(:user)
    post sign_in_api_users_path, user: { email: user.email, password: 'fakepass' }
    expect(response).to_not be_success
    expect(response.status).to eq(400)
  end

  it 'should authenticate' do
    user = create(:user)
    post sign_in_api_users_path, user: { email: user.email, password: 'password' }
    expect(response).to be_success
    expect(response.body).to be_present
    expect(json).to have_key(:auth_token)
  end

  it 'should authenticate with valid token' do
    user = create(:user)
    token = user.tokens.create.token
    get api_projects_path, nil, { 'Authorization' => "Token token=\"#{token}\"" }
    expect(response).to be_success
  end

  it 'should not authenticate with unvalid token' do
    get api_projects_path, nil, { 'Authorization' => "Token token=anythingunvalid" }
    expect(response).to_not be_success
  end

  it 'should not authenticate with expired token' do
    user = create(:user)
    token = user.tokens.create
    token.update_attribute(:expires_at, 2.months.ago)
    get api_projects_path, nil, { 'Authorization' => "Token token=\"#{token.token}\"" }
    expect(response).to_not be_success
  end
end