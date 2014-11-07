class IndexDocumentsProperties < ActiveRecord::Migration
  def change
    add_index :documents, :properties, using: :gin
  end
end
