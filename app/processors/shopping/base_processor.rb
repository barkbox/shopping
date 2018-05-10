module Shopping
  class BaseProcessor < JSONAPI::Processor
    def resource_owner_id
      context[:resource_owner].try(:id)
    end

    def current_user_is_admin?
      context[:resource_owner].try(:is_shopping_admin?)
    end
  end
end

