json.array!(@visits) do |visit|
  json.extract! visit, :id, :name, :rg, :cpf, :department_id, :user_id, :entrada, :saida, :company_id
  json.url visit_url(visit, format: :json)
end
