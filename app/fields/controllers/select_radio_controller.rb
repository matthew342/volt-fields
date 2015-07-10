require 'fields/controllers/main_controller'

module Fields
  class SelectRadioController < MainController
    def options
      attrs.options.then do |options|
        if options[0].is_a?(Hash)
          options_hash = options
        else
          options_hash = options.collect { |option| {value: option, label: option }}
        end
        options_hash
      end
    end

    def selected?(option)
      option[:value] == model_inst.send(@field_name) ? true : false
    end

    def set(option)
      model_inst.send("#{@field_name}=", option[:value])
    end
  end
end
