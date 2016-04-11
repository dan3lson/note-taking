# This was an attempt to connect to the Exchange Web Services (EWS) API
# before this entire app was created and before we decided to connect to the
# Outlook API instead

require "viewpoint"
include Viewpoint::EWS

endpoint = "https://domain.com/ews/Exchange.asmx"
user = "username"
pwd = "password"

cli = Viewpoint::EWSClient.new(endpoint, user, pwd)
