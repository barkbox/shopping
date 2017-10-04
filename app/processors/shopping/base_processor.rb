module Shopping
  class BaseProcessor < JSONAPI::Processor
    def resource_owner_id
      context[:resource_owner].try(:id)
    end
  end
end

