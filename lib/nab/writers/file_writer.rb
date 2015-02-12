# encoding: UTF-8

module Nab
  class FileWriter
    def initialize(destination, asset_name)
      full_path = File.join(destination,asset_name)
      FileUtils.mkdir_p File.dirname(full_path)

      Nab::Log.info "Writing to #{full_path}"
      @file = File.new(full_path,"wb")
    end

    def write data
      @file.write data
    end

    def close
      @file.close
    end
  end
end
