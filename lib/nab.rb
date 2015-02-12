## encoding: UTF-8

require 'aws-sdk-v1'
require 'aws-sdk'
require 'optparse'
require 'singleton'
require 'ostruct'
require 'uri'
require 'fileutils'

require_relative 'nab/adapter_manager'
require_relative 'nab/client.rb'
require_relative 'nab/logger.rb'
require_relative 'nab/version.rb'
require_relative 'nab/adapters/s3.rb'
require_relative 'nab/writers/file_writer.rb'
require_relative 'nab/writers/stdout_writer.rb'
require_relative 'nab/writers/stderr_writer.rb'
