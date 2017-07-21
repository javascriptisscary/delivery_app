describe "the signin process", :type => :feature do
  before do
    @admin = User.create(email: 'admin@example.com', password: 'password', is_admin: 1, )
    @user = User.create(email: 'user@example.com', password: 'password', is_admin: 0)
  end

  it "signs me in" do
    visit '/'
    within(".login-form") do
      fill_in 'session_email', with: 'admin@example.com'
      fill_in 'session_password', with: 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'Admin Dash'
  end
  
  it "alerts me to wrong password" do
    visit '/'
    within(".login-form") do
      fill_in 'session_email', with: 'admin@example.com'
      fill_in 'session_password', with: 'wrong password'
    end
    click_button 'Login'
    expect(page).to have_content 'Username or Password is incorrect'
  end
  
  it "alerts me to not being an admin" do
    visit '/'
    within(".login-form") do
      fill_in 'session_email', with: 'user@example.com'
      fill_in 'session_password', with: 'password'
    end
    click_button 'Login'
    expect(page).to have_content 'You are not an admin. Nice Try.'
  end
    
end 