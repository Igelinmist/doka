require_relative "acceptance_helper"

feature 'Non authorized user can sign in', %q(
  In order to work in application
  As a non authorized user
  I want to be able sign in
) do
  scenario 'Existing user sign in' do
    visit '/'
    click_on 'Sign in'
    fill_in 'Email', with: 'User1'
    fill_in 'Password', with: '12345678'
    click_on 'Sign in'
    expect(page).to have_content 'Successfull'
  end
  scenario 'Non existing user try to sign in'
end
