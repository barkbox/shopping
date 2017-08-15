# This module allows the models included in the gem to call out to attr_accesible without
# having the protected attributes gem as a dependency. This enables box to use these 
# models without monkey patching, and the potential to use this gem in other applications
# that do not include the protected_attributes gem

module Shopping
  module AttributeAccessibleHelper
    def method_missing(name, *args, &block)
        return if name == :attr_accessible
        super(name, *args, &block)
    end
  end
end