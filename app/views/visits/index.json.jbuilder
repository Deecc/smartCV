json.array!(@visits) do |visit|
  json.extract! visit, :id, :name, :rg, :cpf, :departament_id, :user_id, :entrada, :saida, :empresa_id
  json.url visit_url(visit, format: :json)
end
