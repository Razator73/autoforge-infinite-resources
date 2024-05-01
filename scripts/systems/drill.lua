local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__New = ____lualib.__TS__New
local Map = ____lualib.Map
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["15"] = 4,["16"] = 4,["17"] = 5,["18"] = 5,["19"] = 7,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 12,["24"] = 12,["25"] = 27,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 25,["30"] = 28,["31"] = 27,["32"] = 13,["33"] = 13,["34"] = 13,["35"] = 13,["36"] = 13,["37"] = 13,["38"] = 13,["39"] = 32,["40"] = 32,["41"] = 32,["43"] = 32,["44"] = 38,["45"] = 39,["46"] = 40,["47"] = 32,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 42,["52"] = 47,["53"] = 48,["54"] = 50,["55"] = 47,["56"] = 53,["57"] = 54,["58"] = 55,["59"] = 56,["60"] = 57,["61"] = 58,["62"] = 59,["63"] = 60,["64"] = 61,["65"] = 62,["66"] = 63,["67"] = 64,["68"] = 53,["69"] = 67,["70"] = 32,["71"] = 69,["72"] = 70,["73"] = 70,["74"] = 70,["75"] = 70,["76"] = 71,["77"] = 72,["79"] = 67,["80"] = 76,["81"] = 32,["82"] = 78,["83"] = 76,["84"] = 81,["85"] = 82,["86"] = 84,["87"] = 85,["88"] = 86,["89"] = 87,["90"] = 88,["91"] = 89,["92"] = 90,["93"] = 91,["94"] = 93,["95"] = 94,["97"] = 96,["102"] = 101,["103"] = 81,["104"] = 104,["105"] = 105,["106"] = 107,["107"] = 109,["108"] = 110,["110"] = 113,["111"] = 115,["112"] = 116,["113"] = 117,["114"] = 118,["115"] = 119,["116"] = 120,["117"] = 121,["119"] = 123,["120"] = 123,["121"] = 123,["122"] = 123,["124"] = 126,["125"] = 104,["126"] = 129,["127"] = 130,["128"] = 131,["129"] = 132,["130"] = 134,["131"] = 135,["133"] = 138,["134"] = 140,["136"] = 143,["137"] = 144,["138"] = 145,["139"] = 146,["141"] = 148,["142"] = 149,["143"] = 150,["146"] = 153,["147"] = 129,["148"] = 156,["150"] = 157,["151"] = 157,["153"] = 158,["154"] = 158,["155"] = 159,["156"] = 160,["157"] = 161,["159"] = 158,["162"] = 157,["165"] = 164,["166"] = 156,["167"] = 167,["168"] = 168,["169"] = 169,["171"] = 167,["172"] = 173,["173"] = 174,["174"] = 175,["175"] = 176,["176"] = 177,["177"] = 178,["178"] = 179,["180"] = 181,["181"] = 182,["182"] = 183,["186"] = 188,["187"] = 189,["189"] = 191,["191"] = 173,["192"] = 195,["193"] = 196,["194"] = 195,["195"] = 199,["196"] = 200,["197"] = 199,["198"] = 203,["199"] = 204,["200"] = 205,["201"] = 206,["202"] = 207,["203"] = 208,["204"] = 209,["205"] = 210,["206"] = 211,["207"] = 212,["210"] = 203,["211"] = 217,["212"] = 218,["213"] = 217,["214"] = 221,["215"] = 222,["218"] = 226,["219"] = 227,["222"] = 231,["223"] = 232,["224"] = 221,["225"] = 235,["226"] = 236,["227"] = 237,["228"] = 238,["230"] = 241,["231"] = 242,["232"] = 244,["233"] = 245,["234"] = 246,["235"] = 247,["237"] = 248,["238"] = 248,["240"] = 249,["241"] = 249,["242"] = 250,["243"] = 251,["244"] = 252,["246"] = 249,["249"] = 248,["252"] = 256,["253"] = 235,["254"] = 259,["255"] = 260,["256"] = 259,["257"] = 33,["258"] = 34,["259"] = 35,["260"] = 35,["261"] = 35,["262"] = 35,["263"] = 35,["264"] = 35,["265"] = 35,["266"] = 34,["267"] = 266,["268"] = 267,["269"] = 268,["270"] = 269,["271"] = 269,["272"] = 269,["273"] = 269,["275"] = 272,["276"] = 274});
local ____exports = {}
local ____core = require("core")
local core = ____core.core
local ____event = require("event")
local GameEvents = ____event.GameEvents
local ____world = require("world")
local World = ____world.World
local ____base = require("systems.base")
local EntitySystem = ____base.EntitySystem
local idle_hs = HashString("idle")
local start_hs = HashString("start")
local running_hs = HashString("running")
local stop_hs = HashString("stop")
local ActiveDrill = __TS__Class()
ActiveDrill.name = "ActiveDrill"
function ActiveDrill.prototype.____constructor(self, speed)
    self.position = TileVector.new()
    self.isActive = false
    self.item = Item.new()
    self.depleted = false
    self.timer = Timer.new(speed)
end
ActiveDrill.SCHEMA = Schema.new({
    SchemaField.new("timer", DataTypes.TIMER),
    SchemaField.new("position", DataTypes.TILEVECTOR),
    SchemaField.new("isActive", DataTypes.BOOL),
    SchemaField.new("item", DataTypes.COMPLEX),
    SchemaField.new("depleted", DataTypes.BOOL)
})
local DrillSystem = __TS__Class()
DrillSystem.name = "DrillSystem"
__TS__ClassExtends(DrillSystem, EntitySystem)
function DrillSystem.prototype.____constructor(self, ...)
    EntitySystem.prototype.____constructor(self, ...)
    self._soilId = 0
    self._tiles = __TS__New(Set)
    self._active = __TS__New(Map)
end
function DrillSystem.prototype.initialize(self)
    self:_setTiles()
    GameEvents.playerPlaced:listen(core.cb(self, "handlePlacedItem"))
end
function DrillSystem.prototype.loaded(self)
    self:_setTiles()
    self._active:delete(INVALID_ENTITYID)
end
function DrillSystem.prototype._setTiles(self)
    self._soilId = Prefab.get("tile.soil").tile.id
    self._tiles:clear()
    self._tiles:add(Prefab.get("tile.stone_deposit").tile.id)
    self._tiles:add(Prefab.get("material.adamantite_ore").tile.id)
    self._tiles:add(Prefab.get("material.corium_ore").tile.id)
    self._tiles:add(Prefab.get("material.iron_ore").tile.id)
    self._tiles:add(Prefab.get("material.silver_ore").tile.id)
    self._tiles:add(Prefab.get("tile.sandstone").tile.id)
    self._tiles:add(Prefab.get("tile.mana_deposit").tile.id)
    self._tiles:add(Prefab.get("material.obsidian").tile.id)
    self._tiles:add(Prefab.get("tile.biomass_deposit").tile.id)
end
function DrillSystem.prototype.add(self, entity, component)
    EntitySystem.prototype.add(self, entity, component)
    if entity.id ~= INVALID_ENTITYID then
        self._active:set(
            entity.id,
            __TS__New(ActiveDrill, component.speed)
        )
        entity.consumer.onStateChange:listen(core.cb(self, "handleStateChange"))
        entity.inventory:get("output").onChange:listen(core.bind(self, "handleInventoryChange", entity.id))
    end
end
function DrillSystem.prototype.remove(self, entity, component)
    EntitySystem.prototype.remove(self, entity, component)
    self._active:delete(entity.id)
end
function DrillSystem.prototype.update(self, frameTime)
    tracy.ZoneBeginN("DrillSystem::update()")
    local updateTime = frameTime.milliseconds * (World.stats.miningSpeed / 100)
    for ____, entry in __TS__Iterator(self._active) do
        local drill = entry[2]
        if drill.isActive then
            local entity = EntityManager.get(entry[1])
            local consumer = entity.consumer
            if drill.timer:updateRestart(math.ceil(consumer.efficiency * updateTime)) and consumer.canRun then
                drill.isActive = self:updateDrill(drill, entity)
                if drill.isActive then
                    self:dispense(drill, entity)
                else
                    consumer:removeState(ConsumerState.Running)
                end
            end
        end
    end
    tracy.ZoneEnd()
end
function DrillSystem.prototype.updateDrill(self, drill, entity)
    local backwall = World:get(entity.location.realm).backwall.map
    if not drill.position:isDefault() and not self:canDrillTile(backwall, drill.position) then
        drill.position:reset()
        drill.item = Item.new()
    end
    if drill.position:isDefault() then
        local area = entity.placement.axis.area
        local range = entity.drill.range
        local activeArea = TileRect.new(area.x - range, area.y - range, area.width + range * 2, area.height + range * 2)
        drill.position = self:findPosition(backwall, activeArea)
        if drill.position:isDefault() then
            drill.depleted = true
            return false
        end
        drill.item = Item.new(
            backwall:get(drill.position):data().drop,
            1
        )
    end
    return true
end
function DrillSystem.prototype.dispense(self, drill, entity)
    assert(not drill.position:isDefault())
    local inventory = entity.inventory:get("output")
    inventory:add(drill.item)
    if inventory:quantity(drill.item.entityID) == inventory:getStackSize(drill.item) then
        self:pause(entity.id)
    end
    if World.stats.miningEfficiency > 0 and Random.chance(World.stats.miningEfficiency) then
        return true
    end
    local backwall = World:get(entity.location.realm).backwall.map
    local tile = backwall:get(drill.position)
    if tile.quantity > 1 then
        backwall:setQuantity(drill.position, tile.quantity - 1)
    else
        backwall:set(drill.position, self._soilId, 1)
        if self:calculateRemainingQuantity(entity) == 0 then
            drill.depleted = true
        end
    end
    return true
end
function DrillSystem.prototype.findPosition(self, backwall, area)
    do
        local y = 0
        while y < area.height do
            do
                local x = 0
                while x < area.width do
                    local position = TileVector.new(area.x + x, area.y + y)
                    if self:canDrillTile(backwall, position) then
                        return position
                    end
                    x = x + 1
                end
            end
            y = y + 1
        end
    end
    return TileVector.new()
end
function DrillSystem.prototype.handleInventoryChange(self, entityID, index, item)
    if item:isEmpty() or item.quantity < item:entity().item.stack then
        self:resume(entityID)
    end
end
function DrillSystem.prototype.handleStateChange(self, entityID, state, flag)
    if flag == ConsumerState.Running then
        local entity = EntityManager.get(entityID)
        if bit.band(state, ConsumerState.Running) == ConsumerState.Running then
            animator.play(entity, start_hs)
            animator.queue(entity, running_hs, true)
            entity.ambience.event:start()
        else
            animator.play(entity, stop_hs)
            animator.queue(entity, idle_hs)
            entity.ambience.event:stop(FMODStopMode.FMOD_STUDIO_STOP_ALLOWFADEOUT)
        end
        return
    end
    if bit.band(state, ConsumerState.On) == ConsumerState.On and bit.band(state, ConsumerState.Powered) == ConsumerState.Powered then
        self:resume(entityID)
    else
        self:pause(entityID)
    end
end
function DrillSystem.prototype.resume(self, entityID)
    self:changeActive(entityID, true)
end
function DrillSystem.prototype.pause(self, entityID)
    self:changeActive(entityID, false)
end
function DrillSystem.prototype.changeActive(self, entityID, isActive)
    local drill = self._active:get(entityID)
    if drill and not drill.depleted and drill.isActive ~= isActive then
        local consumer = EntityManager.get(entityID).consumer
        if isActive and consumer.canRun then
            consumer:addState(ConsumerState.Running)
            drill.isActive = true
        elseif not isActive then
            consumer:removeState(ConsumerState.Running)
            drill.isActive = false
        end
    end
end
function DrillSystem.prototype.getActiveDrill(self, entityID)
    return self._active:get(entityID)
end
function DrillSystem.prototype.handlePlacedItem(self, player, entity)
    if entity.drill == nil then
        return
    end
    local active = self:getActiveDrill(entity.id)
    if not self:updateDrill(active, entity) then
        return
    end
    local realm = World:get(entity.location.realm)
    realm.indicator:discoverResourceAtPosition(realm, active.position)
end
function DrillSystem.prototype.calculateRemainingQuantity(self, entity)
    local active = self:getActiveDrill(entity.id)
    if active == nil then
        return 0
    end
    local realm = World:get(entity.location.realm)
    local backwall = realm.backwall.map
    local quantity = 0
    local area = entity.placement.axis.area
    local range = entity.drill.range
    local activeArea = TileRect.new(area.x - range, area.y - range, area.width + range * 2, area.height + range * 2)
    do
        local y = activeArea.y
        while y < activeArea:bottom() do
            do
                local x = activeArea.x
                while x < activeArea:right() do
                    local tile = backwall:get(TileVector.new(x, y))
                    if self._tiles:has(tile.id) then
                        quantity = quantity + tile.quantity
                    end
                    x = x + 1
                end
            end
            y = y + 1
        end
    end
    return quantity
end
function DrillSystem.prototype.canDrillTile(self, backwall, position)
    return self._tiles:has(backwall:get(position).id)
end
DrillSystem.ID = HashString("DrillSystem")
DrillSystem.SCHEMA = Schema.new({SchemaField.new(
    "_active",
    DataTypes.HASHMAP,
    DataTypes.ENTITY,
    DataTypes.COMPLEX,
    function()
        return __TS__New(ActiveDrill, 0)
    end
)})
if _G.DrillSystem == nil then
    _G.DrillSystem = __TS__New(DrillSystem)
    SystemManager.registerSystem(DrillSystem.ID, _G.DrillSystem, 16)
    SystemManager.associate(
        DrillSystem.ID,
        hash.hash_str32("drill")
    )
end
local manager = _G.DrillSystem
____exports.DrillSystem = manager
return ____exports
