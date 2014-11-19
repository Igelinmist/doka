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

  scenario 'Authenticated user can create new document type with every field type', js: true do
    sign_in user
    click_on I18n.t('links.document_types')
    click_on I18n.t('document_types.index.new')
    fill_in I18n.t('activerecord.attributes.document_type.name'), with: 'New stencil'
    click_on I18n.t('document_types.form.add_field')
    last_nested_fields = all('fieldset').last
    within(last_nested_fields) do
      find(:css, "select[id^='document_type_fields_attributes_'][id$='field_type']").set("text_field")
      find(:css, "input[id^='document_type_fields_attributes_'][id$='name']").set("TestAttribute")
      find(:css, "input[id^='document_type_fields_attributes_'][id$='required']").set(true)
    end
    click_on I18n.t('document_types.form.submit')

    expect(page).to have_content 'New stencil'
    expect(page).to have_content 'TestAttribute'
    expect(page).to have_content 'text_field'
    expect(page).to have_content(I18n.t('document_types.show.required'))
  end
end
