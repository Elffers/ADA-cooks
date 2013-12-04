json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :user_id, :unit
  json.url ingredient_url(ingredient, format: :json)
end
