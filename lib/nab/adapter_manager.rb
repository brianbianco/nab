# encoding: UTF-8

module Nab
  class AdapterManager
    attr_accessor :write_adapter, :strip_dirs

    def initialize
      @adapters = Hash.new
      @write_adapter = FileWriter
      @strip_dirs = nil
    end

    def get(type)
      if @adapters.key? type
        Nab::Log.debug "Retrieving cached adapter #{@adapters[type]}"
        @adapters[type]
      else
        klass = Nab.const_get "#{type}Adapter"
        Nab::Log.debug "Creating new #{type}Adapter"
        @adapters[type] = klass.new
        Nab::Log.debug "Setting write_adapter to #{write_adapter} for #{type}"
        @adapters[type].write_adapter = write_adapter
        Nab::Log.debug "Setting strip_dirs to #{strip_dirs} for #{type}"
        @adapters[type].strip_dirs = strip_dirs
        @adapters[type]
      end
    end
  end
end
