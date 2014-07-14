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
      current_email = user.email
      authorized_request :put, api_user_path(user), { user: { email: Faker::Internet.email } }
      expect(response).to_not be_success
      expect(user.reload.email).to eq(current_email)
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

    it 'should be able to update his pofile' do
      @user = create(:user)
      new_email = Faker::Internet.email
      authorized_request :put, api_user_path(@user), { user: { email: new_email } }
      expect(response).to be_success
      expect(@user.reload.email).to eq(new_email)
    end
  end
end