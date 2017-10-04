module AuthenticationHelpers
  def log_in_user(resource_owner_id)
    user = Struct.new(:id)
    allow_any_instance_of(Shopping::Config).to receive(:current_user_method).and_return(lambda { user.new(resource_owner_id) })
  end

  def log_out_user
    allow_any_instance_of(Shopping::Config).to receive(:current_user_method).and_return(lambda { nil })
  end
end