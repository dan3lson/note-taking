require "viewpoint"
include Viewpoint::EWS

endpoint = "https://domain.com/ews/Exchange.asmx"
user = "username"
pwd = "password"

cli = Viewpoint::EWSClient.new(endpoint, user, pwd)

puts "hello world"
