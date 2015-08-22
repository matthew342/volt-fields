require 'fields/controllers/main_controller'

module Fields
  class TextController < MainController
    reactive_accessor :toggled

    def input_class_string
      class_string = ""
      if attrs.prepend_class
        class_string += 'input-group'
      else
        class_string += 'form-group'
      end
      if attrs.label && attrs.label_type == 'float'
        class_string += ' fg-float'
      end
      if errors
        class_string += ' has-error'
      elsif marked
        class_string += ' has-success'
      end
      class_string += ' has-feedback'
      class_string
    end

    def toggle_class
      value = model_inst.send(@field_name)
      unless value.nil? || value.blank?
        'fg-toggled'
      else
        toggled
      end
    end

    def toggle
      self.toggled = 'fg-toggled'
    end

    def blur
      self.toggled = ''
      super
    end
  end
end
