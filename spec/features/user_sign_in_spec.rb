require_relative "acceptance_helper"

feature 'Non authorized user can sign in', %q(
  In order to work in application
  As a non authorized user
  I want to be able sign in
) do

  given!(:user) { create :user }

  scenario 'Existing user sign in' do
    visit '/'
    click_on I18n.t 'authorization.sign_in'
    fill_in 'Email', with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    click_on I18n.t('action.log_in')

    expect(page).to have_content I18n.t('devise.sessions.signed_in')
  end

  scenario 'User enter wrong email' do
    visit '/'
    click_on I18n.t 'authorization.sign_in'
    fill_in 'Email', with: 'wrong@test.com'
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    click_on I18n.t('action.log_in')

    expect(page).to have_content I18n.t('devise.failure.user.not_found_in_database')
  end
  scenario 'User enter wrong password' do
    visit '/'
    click_on I18n.t 'authorization.sign_in'
    fill_in 'Email', with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: 'bad_pwd'
    click_on I18n.t('action.log_in')

    expect(page).to have_content I18n.t('devise.failure.user.not_found_in_database')
  end
end
