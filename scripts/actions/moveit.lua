require "/scripts/rect.lua"

function isBlockingInteractable(args, board)
	local bb = rect.translate(mcontroller.boundBox(), entity.position())
	local objs = world.entityQuery(rect.ll(bb), rect.ur(bb), {withoutEntityId = entity.id()})
	--sb.logInfo("Found %s objects within [(%s,%s), (%s,%s)]", #objs, bb[1], bb[2], bb[3], bb[4])
	for _, id in pairs(objs) do
		if world.isEntityInteractive(id) then
			--sb.logInfo("Move it!");
			return true
		end
	end
	return false
end