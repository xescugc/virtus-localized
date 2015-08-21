module Virtus
  class AttributeSet
    # Define a localized attribute reader method
    # @param [Attribute] attribute
    # @param [Symbol] method_name
    # @param [Symbol] visibility
    #
    # @return [undefined]
    #
    # @api private
    def define_localized_reader_method(attribute, method_name, visibility)
      define_method(method_name) { 
        attribute.get(self)["#{I18n.locale}"] rescue nil
      }
      send(visibility, method_name)
    end

    # Defines an localized attribute writer method
    #
    # @param [Attribute] attribute
    # @param [Symbol] method_name
    # @param [Symbol] visibility
    #
    # @return [undefined]
    #
    # @api private
    def define_localized_writer_method(attribute, method_name, visibility)
      define_method(method_name) { |value| 
        new = attribute.get(self)
        new ? (new["#{I18n.locale}"] = value) : (new = {"#{I18n.locale}" => value})
        attribute.set(self, new) 
      }
      send(visibility, method_name)
    end

  end
end
