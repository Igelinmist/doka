class Document < ActiveRecord::Base
  belongs_to :document_type
  store_accessor :properties
end
