


local dname = "Server Status"
local dmessage = " **Server 1 er på vej op!** ```IP: 54.37.88.10:30001``` @here "
PerformHttpRequest('DIT_WEBHOOK_LINK', function(err, text, headers) end, 'POST', json.encode({username = dname, content = dmessage}), { ['Content-Type'] = 'application/json' })

