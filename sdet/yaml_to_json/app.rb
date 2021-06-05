require "yaml"
require "bundler"
Bundler.require

set :server, %w[webrick thin]

post "/to_json" do
  begin
    object = YAML.load(params[:body])
  rescue
    status 400
    return
  end

  to_json(object)
end

def to_json(obj)
  if obj.is_a? String
    %("#{obj}")
  elsif obj.is_a? TrueClass
    "true"
  elsif obj.is_a? FalseClass
    "false"
  elsif obj.is_a? Integer
    obj.to_s
  elsif obj.is_a? Hash
    body = obj.reduce("") do |result, value|
      result + %("#{value[0]}": #{to_json(value[1])})
    end

    "{#{body}}"
  elsif obj.is_a? Array
    body = obj.map {|o| to_json(o) }.join(",")

    "[#{body}]"
  end
end

