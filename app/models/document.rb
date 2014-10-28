class Document < ActiveRecord::Base
  belongs_to :document_type
  store_accessor :properties

  validates :name, presence: true
  validate :validate_properties

  def validate_properties
    document_type.fields.each do |field|
      if field.required? && properties[field.name].blank?
        errors.add field.name, "must not be blank"
      end
    end
  end
end
