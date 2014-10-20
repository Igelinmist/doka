class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.date :registration_date

      t.timestamps
    end
  end
end
