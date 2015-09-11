json.array!(@reports) do |report|
  json.extract! report, :id, :company_id, :user_id, :visit_id, :department_id
  json.url report_url(report, format: :json)
end
