json.array!(@users) do |user|
  json.extract! user, :id, :name, :rg, :cpf, :matricula, :department_id
  json.url user_url(user, format: :json)
end
