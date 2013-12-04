json.array!(@gadgets) do |gadget|
  json.extract! gadget, :id, :name, :user_id, :function
  json.url gadget_url(gadget, format: :json)
end
