# encoding: UTF-8

module Nab
  class Client
    def run(options)

    Log.level options.log_level

    my_manager = AdapterManager.new
    ARGV.each do |a|
      uri = URI(a)
      adapter = my_manager.get(uri.scheme.capitalize)
      adapter.get(uri)
    end
    end
  end
end

