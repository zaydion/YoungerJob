json.extract! company, :id, :name, :email, :phone_number, :address, :description, :created_at, :updated_at
json.url company_url(company, format: :json)
