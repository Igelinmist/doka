require_relative '../acceptance_helper'

feature 'User create new document type', %q(
  In order to store data of a new document type
  As an authenticated user with rights
  I want to be able create new document type
) do
  given(:user) { create :user }

  # scenario "Non authenticated user can't see any links of document type controls"
  # scenario "Authenticated user without rights can't see the links on edit, delete and create document type"
  # scenario 'Authenticated user with rights can create new document type'

  scenario 'Authenticated user can create new document type' do
    sign_in user
    click_on I18n.t('links.document_types')
    click_on I18n.t('document_types.index.new')
    fill_in I18n.t('activerecord.attributes.document_type.name'), with: 'New stencil'
  end
end
