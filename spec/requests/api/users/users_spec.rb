describe 'Users CRUD' do
  context 'user with role "user"' do
    it 'should not be able to change his role' do
      @user = create(:user)
      authorized_request :put, api_user_path(@user), { user: { role: 'admin' } }
      expect(response).to be_success
      expect(@user.reload.admin?).to eq(false)
    end

    it 'should not be able to update another user' do
      user = create(:user)
      authorized_request :put, api_user_path(user), { user: { email: Faker::Internet.email } }
      expect(response).to_not be_success
    end
  end

  context 'user with role "admin"' do
    it 'should be able to change other user role' do
      user = create(:user)
      admin = create(:user, :admin)
      @user = admin
      authorized_request :put, api_user_path(user), { user: { role: 'admin' } }
      expect(response).to be_success
      expect(user.reload.admin?).to eq(true)
    end
  end
end