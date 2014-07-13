describe 'User registration' do
  context 'invalid params' do
    it 'should not register' do
      post sign_up_api_users_path, user: attributes_for(:user, password_confirmation: 'wrong')
      expect(response).to_not be_success
    end
  end

  it 'should register' do
    post sign_up_api_users_path, user: attributes_for(:user)
    expect(response).to be_success
  end
end