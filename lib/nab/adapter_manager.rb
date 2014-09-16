# encoding: UTF-8

module Nab
  class AdapterManager

    def initialize
      @adapters = Hash.new
    end

    def get(type)
      if @adapters.key? type
        @adapters[type]
      else
        Log.debug "Loading adapter for #{type}"
        klass = Nab.const_get "#{type}Adapter"
        @adapters[type] = klass.new
      end
    end
  end
end
