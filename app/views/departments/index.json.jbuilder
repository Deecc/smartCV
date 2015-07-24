json.array!(@departments) do |department|
  json.extract! department, :id, :nome, :descricao
  json.url department_url(department, format: :json)
end
