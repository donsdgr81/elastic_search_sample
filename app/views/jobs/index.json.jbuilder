json.array!(@jobs) do |job|
  json.extract! job, :job_title, :salary, :company, :description
  json.url job_url(job, format: :json)
end