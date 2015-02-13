# encoding: UTF-8

module Nab
  class S3Adapter
    attr_accessor :write_adapter, :strip_dirs

    def initialize
      AWS.config
      @write_adapter = FileWriter
      @strip_dirs = false
    end

    def get(uri,destination)
      bucket_name = uri.host
      s3          = AWS::S3.new
      bucket      = s3.buckets[bucket_name]
      asset       = bucket.objects[Util.path_from_uri(uri)]
      asset_name  = Util.path_from_uri(uri,strip_dirs)
      Nab::Log.info "Retrieving #{File.join(bucket_name,asset_name)}"
      store       = write_adapter.new(destination, asset_name)

      asset.read { |chunk| store.write chunk }
      store.close
    end
  end
end
