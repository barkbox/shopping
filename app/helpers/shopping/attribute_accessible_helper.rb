module Shopping
  module AttributeAccessibleHelper
    def method_missing(name, *args, &block)
        return if name == :attr_accessible
        super(name, *args, &block)
    end
  end
end