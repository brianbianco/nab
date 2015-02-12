# encoding: UTF-8

module Nab
  class Client
    def run(options)
      Log.level options.log_level

      Nab::Log.debug "Options received: #{options.inspect}"

      if ARGV.size < 1
        Nab::Log.fatal "No arguments specified"
        exit 1
      end

      manager = AdapterManager.new
      manager.write_adapter = options.write_adapter
      manager.strip_dirs = options.strip_dirs

      ARGV.each do |a|
        uri = URI(a)
        adapter = manager.get uri.scheme.capitalize
        adapter.get uri,options.destination_dir
      end
    end
  end
end

