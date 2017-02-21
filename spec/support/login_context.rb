shared_context 'login_as_user' do
  before do
    user = create(:user)
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in(user)
    @request.session[:user_id] = user.id
    @user = user
  end
end
