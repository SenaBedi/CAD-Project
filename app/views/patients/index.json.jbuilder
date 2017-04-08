json.array!(@patients) do |patient|
  json.extract! patient, :id, :firstname, :lastname, :DOB, :address, :phone, :infection
  json.url patient_url(patient, format: :json)
end
