class IndexDocumentsProperties < ActiveRecord::Migration
  def change
    add_hstore_index :documents, :properties, type: :gin
  end
end
