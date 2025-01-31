﻿-- This file is subject to copyright - contact swampservers@gmail.com for more information.
ENT.Base = "base_brush"
ENT.Type = "brush"

function ENT:Initialize()
    self:SetSolid(SOLID_BBOX)
    self:SetCollisionBoundsWS(Vector(-10664 - 3496 - 5980), Vector(-10632, -3636, -6158))
    self:SetTrigger(true)
end

function ENT:StartTouch(other)
    if CurTime() - (other.PonyTPCooldown or 0) < 2 then return end
    other.PonyTPCooldown = CurTime()
    if other:GetClass() == "func_brush" then return end
    SendFromPonyWorld(other, false)
end
