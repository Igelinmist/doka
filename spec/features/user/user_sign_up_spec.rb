require_relative "../acceptance_helper"

feature 'Guest can sign up', %q(
  In order to receive access to application
  As a new user
  I want to be able sign up
) do

  given!(:user) { create :user }

  scenario 'New user fill registration fields and sign up' do
    visit '/'
    click_on I18n.t('actions.sign_up')
    fill_in 'Email', with: 'new_user@test.com'
    fill_in I18n.t('activerecord.attributes.user.password'), with: '12345678'
    fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: '12345678'
    within 'form' do
      click_on I18n.t('devise.registrations.new.submit')
    end

    expect(page).to have_content(I18n.t('devise.registrations.signed_up'))
  end

  scenario 'New user enter existing email' do
    visit '/'
    click_on I18n.t('actions.sign_up')
    fill_in 'Email', with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: '12345678'
    fill_in I18n.t('activerecord.attributes.user.password_confirmation'), with: '12345678'
    within 'form' do
      click_on I18n.t('devise.registrations.new.submit')
    end

    expect(page).to have_content('Email уже существует')
  end
  scenario 'New user enter existing email'
  scenario 'New user enter different password and confirmation'
end
