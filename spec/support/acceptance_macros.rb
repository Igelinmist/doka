module AcceptanceMacros
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in I18n.t('activerecord.attributes.user.password'), with: user.password
    within 'form' do
      click_on I18n.t('devise.sessions.new.submit')
    end
  end
end
