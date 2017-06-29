#!/usr/bin/env ruby

require "uri"
require "net/https"
require "time"
require "rubygems"
require 'active_record'

LEAD_URL = "http://localhost:4000/leads"

uri = URI.parse(LEAD_URL)
http = Net::HTTP.new(uri.host, uri.port)

request = Net::HTTP::Post.new(uri.request_uri, 'Content-Type' => 'application/json')
request.body = {
  { address: "address 1", city: "city 1", price: 200000, value: 300000 }
  }
}.to_json

response = http.request(request)
puts response.body