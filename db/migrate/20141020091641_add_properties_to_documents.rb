class AddPropertiesToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :properties, :hstore
  end
end
