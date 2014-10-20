class DocumentType < ActiveRecord::Base
  has_many :fields, class_name: "DocumentField"
  accepts_nested_attributes_for :fields, allow_destroy: true
end
