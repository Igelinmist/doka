json.array!(@documents) do |document|
  json.extract! document, :id, :name, :registration_date
  json.url document_url(document, format: :json)
end
