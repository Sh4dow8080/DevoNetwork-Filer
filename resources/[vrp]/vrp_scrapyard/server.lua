local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_scrapyard")

RegisterServerEvent('scrapyard:checkjob')
AddEventHandler('scrapyard:checkjob', function()
	local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})

    if vRP.hasPermission({user_id,"repair.scrap"}) then --here check if you have permission
		TriggerClientEvent('scrapTheCar', source)
    else
		TriggerClientEvent('notMech', source)
    end
end)

RegisterServerEvent('scrapyard:payMeNow')
AddEventHandler('scrapyard:payMeNow', function(amount)
	local source = source
	local user_id = vRP.getUserId({source})
	if vRP.hasPermission({user_id,"repair.scrap"}) then
		if tonumber(amount) <= 2500 then
			vRP.giveBankMoney({user_id,amount})
		else
			print(GetPlayerName(source) .. "(".. user_id ..") prøvede at give flere penge end man kan få fra jobbet, er nok en modder.")	
		end
	else
		print(GetPlayerName(source) .. "(".. user_id ..") triggerede et money event uden at være mekaniker, er nok en modder.")
	end
	TriggerClientEvent("pNotify:SendNotification", source,{text = "Modtog <b style='color: #4E9350'>"..amount.." $</b>.", type = "success", queue = "global", timeout = 5000, layout = "centerRight",animation = {open = "gta_effects_fade_in", close = "gta_effects_fade_out"}})
end)

--[[

					Made by
  _______       _   _ ______ _____ ______ _____  
 |__   __|/\   | \ | |___  // ____|  ____|  __ \ 
    | |  /  \  |  \| |  / /| |    | |__  | |__) |
    | | / /\ \ | . ` | / / | |    |  __| |  _  / 
    | |/ ____ \| |\  |/ /__| |____| |____| | \ \ 
    |_/_/    \_\_| \_/_____|\_____|______|_|  \_\
	
				For ByHyperion.net
--]]
