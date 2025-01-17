-- Assuming you've included the path to lua-twilio in your Lua package.path
local twilio = require 'twilio'

-- Load Twilio credentials from environment variables or configuration file
local config = {
    account_sid = os.getenv("TWILIO_ACCOUNT_SID") or "YourAccountSID",
    auth_token = os.getenv("TWILIO_AUTH_TOKEN") or "YourAuthToken"
}

-- Initialize Twilio client
local sms = twilio.new(config.account_sid, config.auth_token)

-- Your specific string message
local message = "Beep beep!"

-- List of pager numbers (E.164 format, e.g., +970234567890 for 'Gaza' numbers). 
-- For a massive range, you'd need to have this list prepared, possibly from a database or file.
local pagerNumbers = {
    "+970234567890",
    "+970234567891",
    -- ... more numbers here
}

-- Function to send message to all pagers
local function sendToPagers(numbers, msg)
    for _, number in ipairs(numbers) do
        local ok, err = sms.send(number, msg)
        if not ok then
            print("Failed to send to " .. number .. ": " .. err)
        else
            print("Message sent to " .. number)
        end
    end
end

-- Execute the function to send the message
sendToPagers(pagerNumbers, message)
