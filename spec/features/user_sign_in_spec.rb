require_relative "acceptance_helper"

feature 'Non authorized user can sign in', %q(
  In order to work in application
  As a non authorized user
  I want to be able sign in
) do
  scenario 'Existing user sign in' do
    user = User.create(email: 'test@test.com', password: '12345678', password_confirmation: '12345678')
    visit '/'
    click_on I18n.t 'authorization.sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on I18n.t('action.log_in')
    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end
  scenario 'Non existing user try to sign in'
end
