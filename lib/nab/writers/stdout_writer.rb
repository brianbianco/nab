# encoding: UTF-8

module Nab
  class StdoutWriter
    def initialize(destination, asset_name)
      Nab::Log.info "Writing to STDOUT"
    end

    def write data
      STDOUT.sync = true
      print data
      STDOUT.sync = false
    end

    def close
    end
  end
end
