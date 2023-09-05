

local chain_anim_name = "clothingtie"
local chain_anim_dict = "try_tie_positive_a"
local chain_anim_delay = 400

local watch_anim_name = "clothingtie"
local watch_anim_dict = "try_tie_positive_a"
local watch_anim_delay = 400



function use_chain_1(item, data)   
 
	use_chain_global(4, 0, data.name) -- Prop ID and Texture Variant

end 
exports('use_chain_1', use_chain_1)

function use_chain_2(item, data)    
	use_chain_global(5, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_chain_2', use_chain_2)
  
 
function use_chain_3(item, data)    
	use_chain_global(6, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_chain_3', use_chain_3)

function use_chain_4(item, data)    
	use_chain_global(7, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_chain_4', use_chain_4)
 

function use_chain_5(item, data)    
	use_chain_global(8, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_chain_5', use_chain_5)
   
 
function use_chain_global(id, texture, item)    

	local itemlabel = exports.ox_inventory:Items(item).label  
	local currentprop = GetPedPropIndex(PlayerPedId(), 7) 
	local currenttexture = GetPedPropTextureIndex(PlayerPedId(), 7)  
	if id == currentprop and texture == currenttexture then  
	
		PlayClothesAnims(chain_anim_name, chain_anim_dict, 1500)
		Wait(chain_anim_delay)
		SetPedPropIndex(PlayerPedId(), 7, 0, 0, 0) -- To Remove 
		lib.notify({
			title = 'Un-wore',
			description = 'You just un-wore '..itemlabel,
			type = 'error'
		}) 
	else
		PlayClothesAnims(chain_anim_name, chain_anim_dict, 1500)
		Wait(chain_anim_delay)
		SetPedPropIndex(PlayerPedId(), 7, id, texture , 0)  -- To wore
		lib.notify({
			title = 'wore',
			description = 'You just wore '..itemlabel ,
			type = 'success'
		}) 
		
	end
end 



function use_watch_1(item, data)    
	use_watch_global(4, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_watch_1', use_watch_1)

function use_watch_2(item, data)    
	use_watch_global(5, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_watch_2', use_watch_2)
  
 
function use_watch_3(item, data)    
	use_watch_global(6, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_watch_3', use_watch_3)

function use_watch_4(item, data)    
	use_watch_global(7, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_watch_4', use_watch_4)
 

function use_watch_5(item, data)    
	use_watch_global(8, 0, data.name) -- Prop ID and Texture Variant
end 
exports('use_watch_5', use_watch_5)
   
 
function use_watch_global(id, texture, item)    
	local itemlabel = exports.ox_inventory:Items(item).label 
	local currentprop = GetPedPropIndex(PlayerPedId(), 6) 
	local currenttexture = GetPedPropTextureIndex(PlayerPedId(), 6)  
	if id == currentprop and texture == currenttexture then  
		PlayClothesAnims(watch_anim_name, watch_anim_dict, 1500)
		Wait(watch_anim_delay)
		SetPedPropIndex(PlayerPedId(), 6, -1, -1, 2) -- To Remove  
		
		lib.notify({
			title = 'Un-wore',
			description = 'You just un-wore '..itemlabel,
			type = 'error'
		}) 
	else
		PlayClothesAnims(watch_anim_name, watch_anim_dict, 1500)
		Wait(watch_anim_delay)
		SetPedPropIndex(PlayerPedId(), 6, id, texture , 2)  -- To wore 
		lib.notify({
			title = 'wore',
			description = 'You just wore '..itemlabel ,
			type = 'success'
		}) 
	end
end 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

function PlayClothesAnims(dict, anim, wait)
    loadAnimDict(dict) 
    TaskPlayAnim(GetPlayerPed(-1), dict, anim, 8.0, 1.0, -1, 49, 0, 0, 0, 0 )
    Wait (wait)
    ClearPedSecondaryTask(PlayerPedId()) 
end