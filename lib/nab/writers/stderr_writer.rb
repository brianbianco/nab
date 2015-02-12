# encoding: UTF-8

module Nab
  class StderrWriter
    def initialize(destination, asset_name)
      Nab::Log.info "Writing to STDERR"
    end

    def write data
      STDERR.sync = true
      STDERR.print data
      STDERR.sync = false
    end

    def close
    end
  end
end
