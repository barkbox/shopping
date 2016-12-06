module Requests
  module JsonHelpers
    def nest_attributes attributes
      data = {}
      
      id = attributes.slice(:id)
      data[:id] = id if id.present?

      type = attributes.slice(:type)
      data[:type] = type if type.present?

      data[:attributes] = attributes
      
      { data: data }
    end
  end
end
