require 'fields/controllers/main_controller'

module Fields
  class SelectRadioController < MainController
    def options(optgroup_key)
      attrs.options.then do |attrs_options|
        if attrs_options.is_a?(Hash)
          get_optgroup_options(optgroup_key)
        elsif attrs_options.is_a?(Array)
          if attrs_options[0].is_a?(Hash)
            attrs_options
          else
            collect_options_hash(attrs_options)
          end
        else
        end
      end
    end

    def optgroups
      attrs.options.then do |attrs_options|
        if attrs_options.is_a?(Hash)
          attrs_options.keys
        else
          ['']
        end
      end
    end

    private

    # We know the promise is already resolved by the time these get called.
    def get_optgroup_options(key)
      attrs.options[key].then do |optgroup_options|
        if optgroup_options.is_a?(Array)
          collect_options_hash(optgroup_options)
        else
          optgroup_options
        end
      end
    end

    def collect_options_hash(options)
      options.collect { |option| {value: option, label: option }}
    end
  end
end
