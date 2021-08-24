module CustomTokenResponse
  def body
    user = User.find(@token.resource_owner_id)
    additional_data = {
      user: ActiveModelSerializers::SerializableResource.new(user).as_json
    }
    super.merge(additional_data)
  end
end
