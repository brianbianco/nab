# -*- encoding: utf-8 -*-

lib = File.expand_path('../lib/',__FILE__)
$:.unshift lib unless $:.include?(lib)
require 'nab/version'

Gem::Specification.new do |spec|
  spec.name        = 'nab'
  spec.version     = Nab::VERSION
  spec.licenses    = ['Apache2']
  spec.authors     = ['Brian Bianco']
  spec.email       = ['brian.bianco@gmail.com']
  spec.homepage    = 'http://www.github.com/brianbianco/nab'
  spec.summary     = %q{A gem for downloading from different URI types}
  spec.description = %q{}

  spec.required_ruby_version     = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.3.6'

  spec.files = `git ls-files`.split($/)
  spec.test_files = spec.files.grep(%r{^spec/})

  spec.executables  = %w(nab)
  spec.require_paths = ["lib"]

  spec.add_dependency "aws-sdk", ">= 1.11.1"
end
