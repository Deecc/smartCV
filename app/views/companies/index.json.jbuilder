json.array!(@companies) do |company|
  json.extract! company, :id, :nome, :telefone, :cnpj, :endereco, :numero, :complemento, :cep, :bairro, :cidade, :estado
  json.url company_url(company, format: :json)
end
