module Nab
  module Util
    def self.path_from_uri(uri,strip_dirs=false)
      if strip_dirs
        File.basename(uri.path.gsub(/^\//, ""))
      else
        uri.path.gsub(/^\//, "") # remove leading slashes
      end
    end
  end
end
