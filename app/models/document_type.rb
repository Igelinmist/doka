class DocumentType < ActiveRecord::Base
  has_many :fields, class_name: "DocumentField"
  has_many :documents
  accepts_nested_attributes_for :fields, allow_destroy: true
end
