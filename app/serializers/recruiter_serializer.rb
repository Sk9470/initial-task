class RecruiterSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :company_address, :contact_number, :email
end
