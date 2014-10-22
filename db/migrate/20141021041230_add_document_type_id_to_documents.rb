class AddDocumentTypeIdToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :document_type_id, :integer
    add_index :documents, :document_type_id
  end
end
