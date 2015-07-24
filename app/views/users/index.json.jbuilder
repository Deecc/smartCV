json.array!(@users) do |user|
  json.extract! user, :id, :name, :rg, :cpf, :matricula, :departament_id
  json.url user_url(user, format: :json)
end
