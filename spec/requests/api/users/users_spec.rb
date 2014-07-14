describe 'Users CRUD' do
  it 'should be able to get list of users' do
    @user = create(:user)
    10.times{ create(:user) }
    authorized_request :get, api_users_path
    expect(response).to be_success
    expect(json.size).to eq(User.count - 1)
  end

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

    it 'should be able to get user info' do
      user = create(:user)
      authorized_request :get, api_user_path(user)
      expect(response).to be_success
      [:username, :email, :role].each{|key| expect(json).to have_key(key)}
    end

    it 'should not be able to destroy user' do
      user = create(:user)
      authorized_request :delete, api_user_path(user)
      expect(response).to_not be_success
    end

    it 'should not be able to create new user' do
      authorized_request :post, api_users_path, { user: attributes_for(:user) }
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

    it 'should be able to update his pofile' do
      @user = create(:user)
      new_email = Faker::Internet.email
      authorized_request :put, api_user_path(@user), { user: { email: new_email } }
      expect(response).to be_success
      expect(@user.reload.email).to eq(new_email)
    end

    it 'should be able to delete any user' do
      user = create(:user)
      admin = create(:user, :admin)
      @user = admin
      authorized_request :delete, api_user_path(user)
      expect(response).to be_success
    end

    it 'should be able to create new user' do
      @user = create(:user, :admin)
      authorized_request :post, api_users_path, { user: attributes_for(:user) }
      expect(response).to be_success
      [:username, :email, :role].each{|key| expect(json).to have_key(key)}
    end

    it 'should not be able to create new user with unvalid params' do
      @user = create(:user, :admin)
      authorized_request :post, api_users_path, { user: attributes_for(:user, password_confirmation: 'wrong') }
      expect(response).to_not be_success
    end
  end
end