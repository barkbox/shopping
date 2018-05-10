module AuthenticationHelpers
  def log_in_user(resource_owner_id, role=nil)
    user = Struct.new(:id, :role) do
      def is_shopping_admin?
        role == :admin
      end
    end
    allow_any_instance_of(Shopping::Config).to receive(:current_user_method).and_return(lambda { user.new(resource_owner_id, role) })
  end

  def log_out_user
    allow_any_instance_of(Shopping::Config).to receive(:current_user_method).and_return(lambda { nil })
  end
end
