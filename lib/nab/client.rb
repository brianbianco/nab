# encoding: UTF-8

module Nab
  class Client
    def run(args,options)
      Log.level options.log_level

      Nab::Log.debug "Options received: #{options.inspect}"
      Nab::Log.debug "Arguments received: #{args.inspect}"

      if args.size < 1
        Nab::Log.fatal "No arguments specified"
        exit 1
      end

      manager = AdapterManager.new
      manager.write_adapter = options.write_adapter
      manager.strip_dirs = options.strip_dirs

      args.each do |a|
        uri = URI(a)
        adapter = manager.get uri.scheme.capitalize
        adapter.get uri,options.destination_dir
      end
    end
  end
end

