json.extract! profile, :id, :first_name, :last_name, :middle_name, :username, :email, :address, :phone, :profession, :abn, :created_at, :updated_at
json.url profile_url(profile, format: :json)
