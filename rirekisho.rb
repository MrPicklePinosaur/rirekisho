#!/usr/bin/ruby

# usage
# rirekisho.rb <data-file>

require "bundler/inline"
require "json"
require "erb"

gemfile do
    source 'https://rubygems.org'
    gem 'bigdecimal'
    gem 'json-schema'
    gem 'json-next'
end

def read_and_parse(filename, schema)
    handle = File.open(filename)
    contents = handle.read
    parsed = HANSON.parse(contents)

    puts JSON::Validator.fully_validate(schema, parsed, :strict => true)

    handle.close
    return parsed
end

if ARGV.length < 1
    STDERR.puts("No data file is passed")
    exit(1)
end

# read config file
config = read_and_parse("config.json", "schema/config.schema.json")
# puts config

for dataFile in ARGV
    resume = read_and_parse(dataFile, "schema/resume.schema.json")

    b = binding
    b.local_variable_set(:config, config)
    b.local_variable_set(:resume, resume)

    template = File.open("templates/resume_new.tex.erb").read
    renderer = ERB.new(template, 3, '-')
    puts output = renderer.result(b)

end
