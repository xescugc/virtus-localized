module Virtus
  class Attribute

    def localized?
      options[:localized]
    end

    def define_accessor_methods(attribute_set)
      if self.localized?
        attribute_set.define_localized_reader_method(self, name,       options[:reader])
        attribute_set.define_localized_writer_method(self, "#{name}=", options[:writer])
      else
        attribute_set.define_reader_method(self, name,       options[:reader])
        attribute_set.define_writer_method(self, "#{name}=", options[:writer])
      end
    end

  end
end
