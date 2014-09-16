# encoding: UTF-8

module Nab
  class S3Adapter
    attr_accessor :base_path

    def initialize(base_path = ".")
      AWS.config
      @base_path = "."
    end

    def get(uri)
      bucket_name = uri.host
      asset_name  = uri.path.gsub(/^\//, "") # remove leading slashes
      name        = File.basename asset_name
      remote_path = File.dirname asset_name
      local_path  = File.join @base_path,remote_path

      Log.debug "Bucket: #{bucket_name}"
      Log.debug "Asset name: #{asset_name}"
      Log.debug "Local path: #{local_path}"

      FileUtils.mkdir_p local_path

      s3     = AWS::S3.new
      bucket = s3.buckets[bucket_name]
      asset  = bucket.objects[asset_name]

      Log.info "Downloading #{File.join(bucket_name,asset_name)} to #{File.join(local_path,name)}"
      File.open(File.join(local_path,name), 'wb') do |file|
        asset.read do |chunk|
          file.write chunk
        end
      end
    end
  end
end
