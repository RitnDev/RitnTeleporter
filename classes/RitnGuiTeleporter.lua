-- RitnGuiTeleporter
----------------------------------------------------------------
local class = require(ritnlib.defines.class.core)
local libStyle = require(ritnlib.defines.class.gui.style)
local libGui = require(ritnlib.defines.class.luaClass.gui)
----------------------------------------------------------------
local RitnPlayer = require(ritnlib.defines.core.class.player)
local RitnTeleporter = require(ritnlib.defines.teleporter.class.teleporter)
----------------------------------------------------------------
local font = ritnlib.defines.names.font
local fGui = require(ritnlib.defines.teleporter.gui.teleporter)
local table = require(ritnlib.defines.table)
----------------------------------------------------------------
--- CLASSE DEFINES
----------------------------------------------------------------
local RitnGuiTeleporter = class.newclass(libGui, function(base, event)
    libGui.init(base, event, ritnlib.defines.teleporter.name, "frame-main")
    base.object_name = "RitnGuiTeleporter"
    --------------------------------------------------
    base.gui_name = "teleporter"
    base.gui_action = {
        [base.gui_name] = {
            [ritnlib.defines.teleporter.gui_actions.teleporter.open] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.close] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.teleport] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.edit] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.valid] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.up] = true,
            [ritnlib.defines.teleporter.gui_actions.teleporter.down] = true,
        }
    }    
    --------------------------------------------------
    base.gui = { base.player.gui.screen }
    --------------------------------------------------
    base.content = fGui.getContent()
    --------------------------------------------------
end)

----------------------------------------------------------------


function RitnGuiTeleporter:create(...)
    if self.gui[1][self.gui_name.."-"..self.main_gui] then return self end
    local rTeleporter, selecter = ...
    if selecter == nil then selecter = 1 end

    local element = fGui.getElement(self.gui_name)

    -- assembly gui elements
    local content = {
        flow = {},
        frame = {},
        label = {},
        button = {},
    }


    -- frame Teleporter
    content.frame.main =            self.gui[1].add(element.frame.main)
    content.frame.submain =         content.frame.main.add(element.frame.submain)
    -- label info
    content.label.info =            content.frame.submain.add(element.label.info)
    -- flow namer
    content.flow.namer =            content.frame.submain.add(element.flow.namer)
    -- label namer
    content.label.namer =           content.flow.namer.add(element.label.namer)
    -- button edit
    content.button.edit =           content.flow.namer.add(element.button.edit)
    -- flow namer
    content.flow.edit =             content.frame.submain.add(element.flow.edit)
    -- label namer
    content.text =                  content.flow.edit.add(element.text)
    -- button edit
    content.button.valid =          content.flow.edit.add(element.button.valid)
    -- line 
    content.line =                  content.frame.submain.add(element.line)

    -- label enter
    content.label.enter =           content.frame.submain.add(element.label.enter)

    -- empty list teleport
    content.flow.empty =            content.frame.submain.add(element.flow.empty)
    content.button.empty =          content.flow.empty.add(element.button.empty)

    -- flow teleport
    content.flow.teleport =         content.frame.submain.add(element.flow.teleport)
    -- list surfaces
    content.list =                  content.flow.teleport.add(element.list)
    -- flow dialog
    content.flow.dialog =           content.flow.teleport.add(element.flow.dialog)
    -- button edit
    content.button.down =           content.flow.dialog.add(element.button.down)
    -- button edit
    content.button.up =             content.flow.dialog.add(element.button.up)
    -- empty
    content.empty =                 content.flow.dialog.add(element.empty)
    -- button request
    content.button.teleport =       content.flow.dialog.add(element.button.teleport)
    


    local driving = false
    if self.driving and rTeleporter.drive ~= nil then
        if rTeleporter.drive.name == self.name then 
            content.label.enter.visible = false
            driving = true
        elseif rTeleporter.drive.type == "character" then 
            if rTeleporter.drive.player.name == self.name then 
                content.label.enter.visible = false
                driving = true
            end
        end
    elseif self.driving == false then 
        content.label.enter.caption = ritnlib.defines.teleporter.names.caption.frame_teleporter.label_enter
    end

    -- styles guiElement
    content.label.info.caption = {rTeleporter.data.id, rTeleporter.data.surface_name}
    content.label.namer.caption = rTeleporter.data.name
    content.text.text = rTeleporter.data.name
    content.frame.main.auto_center = true
    ----
    libStyle(content.frame.main):padding(4)
    libStyle(content.frame.submain):padding(4):stretchable()
    libStyle(content.flow.namer):padding(4)
    libStyle(content.label.namer):font(font.bold18):width(275)
    libStyle(content.button.edit):spriteButton(28)
    libStyle(content.flow.edit):padding(8)
    libStyle(content.text):font(font.default18):width(275)
    libStyle(content.button.valid):spriteButton(28)
    libStyle(content.label.enter):padding(4)
    libStyle(content.flow.teleport):padding(4):stretchable()
    libStyle(content.list):horizontalStretch():maxHeight(500)
    libStyle(content.flow.dialog):horizontalStretch():topPadding(4)
    libStyle(content.button.down):spriteButton(28)
    libStyle(content.button.up):spriteButton(28)
    libStyle(content.empty):stretchable()
    libStyle(content.button.teleport):height(30)
    libStyle(content.flow.empty):padding(4):height(80)
    libStyle(content.button.empty):stretchable():fontColor("white", true, true)

    
    if driving then

        local surfaces = remote.call('RitnCoreGame', 'get_surfaces')
        local teleporters = surfaces[rTeleporter.surface.name].teleporters
        local nbTeleporter = table.length(teleporters) - 1

        if nbTeleporter > 0 then 
            content.flow.teleport.visible = true

            local thisIndex = rTeleporter.data.index   
            -- temporary table teleporter sort by index
            local tabTemp = {}
            for i,value in pairs(teleporters) do 
                tabTemp[teleporters[i].index] = value
            end

            --> add teleporter on the list
            for _,teleporter in pairs(tabTemp) do 
                if teleporter.name ~= nil then
                    if thisIndex ~= teleporter.index then
                        content.list.add_item(teleporter.name)
                    end
                end
            end 
            content.list.selected_index = selecter
        else 
            content.flow.empty.visible = true
        end
    end

    return self
end

----------------------------------------------------------------


function RitnGuiTeleporter:closeGuiEntity()
    if self.player.opened ~= nil then
        if self.player.opened.name == ritnlib.defines.teleporter.names.entity.teleporter then
            self.player.opened = nil
        end
    end
end


----------------------------------------------------------------
-- ACTIONS --
----------------------------------------------------------------

function RitnGuiTeleporter:action_close()   
    local frame = self.gui[1][self.gui_name.."-"..self.main_gui]
    if frame then frame.destroy() end
    log('> '..self.object_name..':action_close()')
    return self
end

function RitnGuiTeleporter:action_open(...)
    self:closeGuiEntity()
    self:action_close()
    self:create(...)
    log('> '..self.object_name..':action_open()')
    return self
end



function RitnGuiTeleporter:action_teleport()
    local info = self:getElement("label", "info")
    local list = self:getElement("list")
    ----
    local surface_name = info.caption[2]
    local selected_index = list.selected_index
    local item_select = list.get_item(selected_index)
    ----
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    local teleporters = surfaces[surface_name].teleporters
    local id = table.index(teleporters, 'name', item_select)
    local teleporter = teleporters[id]
    
    local tabEntities = game.surfaces[surface_name].find_entities_filtered({
        name=ritnlib.defines.teleporter.names.entity.teleporter, 
        type='car',
        position=teleporter.position,
    })
    if table.length(tabEntities) > 0 then 
        tabEntities[1].set_passenger(self.player)
    end
    log('> '..self.object_name..':action_teleport('.. self.player.name ..')')
    return self
end


function RitnGuiTeleporter:action_edit()
    local flow_edit = self:getElement("flow", "edit")
    local flow_namer = self:getElement("flow", "namer")
    local textfield = self:getElement("text")
    ----
    flow_namer.visible = false
    flow_edit.visible = true
    ----
    textfield.select_all()
    textfield.focus()
    ----
    log('> '..self.object_name..':action_edit('.. self.player.name ..')')
    return self
end


function RitnGuiTeleporter:action_valid()
    local textfield = self:getElement("text")
    local info = self:getElement("label", "info")
    ----
    local id = tonumber(info.caption[1])
    local surface_name = info.caption[2]
    ----
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    local render_id = surfaces[surface_name].teleporters[id].render_id
    local position = surfaces[surface_name].teleporters[id].position
    local force_name = surfaces[surface_name].teleporters[id].force_name
    ----
    surfaces[surface_name].teleporters[id].name = textfield.text
    
    -- set rendering
    rendering.set_text(render_id, textfield.text)

    -- set tag map
    local area = {
        {position.x - 0.5, position.y - 0.5},
        {position.x + 0.5, position.y + 0.5},
    }
    local tabTag = game.forces[force_name].find_chart_tags(surface_name, area)

    if table.length(tabTag) > 0 then 
        tabTag[1].text = textfield.text
        tabTag[1].last_user = self.player
    end
    ----
    remote.call("RitnCoreGame", "set_surfaces", surfaces)
    ----
    self:action_close()
    log('> '..self.object_name..':action_valid('.. self.player.name ..')')
    return self
end


function RitnGuiTeleporter:action_up()
    local info = self:getElement("label", "info")
    local list = self:getElement("list")
    ----
    local id = tonumber(info.caption[1])
    local surface_name = info.caption[2]
    local selected_index = list.selected_index
    ----
    if selected_index == 0 then return self end
    ----
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    local teleporters = surfaces[surface_name].teleporters
    local teleporter = teleporters[id]
    ----
    local item_select = list.get_item(selected_index)
    local id_select = table.index(teleporters, 'name', item_select)
    local teleporter_select = teleporters[id_select]
    ----
    local tabTemp = {}
    for i,value in pairs(teleporters) do 
        tabTemp[teleporters[i].index] = value
    end
    ----
    local pass = false
    local new_index = teleporter_select.index
    if teleporter_select.index - 1 == teleporter.index then 
        pass = true
        new_index = new_index - 2
    else 
        new_index = new_index - 1
    end
    -- check si pas déjà en haut de la liste
    if new_index == 0 then return self end
    ----
    table.remove(tabTemp, teleporter_select.index)
    table.insert(tabTemp, new_index, teleporter_select)
    tabTemp[new_index].index = new_index
    if pass then 
        tabTemp[new_index + 1].index = new_index + 1
        tabTemp[new_index + 2].index = new_index + 2
    else 
        tabTemp[new_index + 1].index = new_index+1
    end
    ----
    local tmp_teleporters = teleporters
    teleporters = {}
    for id,value in pairs(tmp_teleporters) do 
        teleporters[id] = value
        for y,_ in pairs(tabTemp) do 
            if tabTemp[y].id == id then 
                teleporters[id].index = tabTemp[y].index
            end
        end
    end
    ----
    surfaces[surface_name].teleporters = teleporters
    remote.call("RitnCoreGame", "set_surfaces" , surfaces)
    local rTeleporter = RitnTeleporter(self.vehicle)
    if rTeleporter.data.index < teleporter_select.index then 
        new_index = new_index - 1
    end
    self:action_open(rTeleporter, new_index)
    ----
    log('> '..self.object_name..':action_up('.. self.player.name ..')')
    return self
end

-- permet de descendre un element de la liste des teleporters
function RitnGuiTeleporter:action_down()
    -- recupere le label "info" (il est invisible sur l'interface et permet d'avoir des info sur le teleporter id + surface)
    local info = self:getElement("label", "info")
    local list = self:getElement("list")
    ----
    local id = tonumber(info.caption[1]) -- recuperation de l'id : unit_number de l'entité Teleporter
    local surface_name = info.caption[2] -- surface où se trouve l'entité Teleporter
    local selected_index = list.selected_index -- index selectionné dans la liste actuellement
    ----
    if selected_index == 0 then return self end
    ---- 
    local surfaces = remote.call("RitnCoreGame", "get_surfaces")
    local teleporters = surfaces[surface_name].teleporters
    local teleporter = teleporters[id]
    local nbTeleporter = table.length(teleporters)
    ----
    local item_select = list.get_item(selected_index)
    local id_select = table.index(teleporters, 'name', item_select)
    local teleporter_select = teleporters[id_select]
    ----
    local tabTemp = {}
    for i,value in pairs(teleporters) do 
        tabTemp[teleporters[i].index] = value
    end
    ----
    local pass = false
    local new_index = teleporter_select.index
    if teleporter_select.index + 1 == teleporter.index then 
        pass = true
        new_index = new_index + 2
    else 
        new_index = new_index + 1
    end
    -- check si pas déjà en bas de la liste
    if new_index == nbTeleporter + 1 then return self end
    ----
    table.remove(tabTemp, teleporter_select.index)
    teleporter_select.index = new_index
    if pass then 
        tabTemp[new_index] = teleporter_select
        tabTemp[new_index-1].index = new_index-1
        tabTemp[new_index-2].index = new_index-2
    else 
        tabTemp[new_index] = teleporter_select
        tabTemp[new_index-1].index = new_index-1
    end
    ----
    local tmp_teleporters = teleporters
    teleporters = {}
    for id,value in pairs(tmp_teleporters) do 
        teleporters[id] = value
        for y,_ in pairs(tabTemp) do 
            if tabTemp[y].id == id then 
                teleporters[id].index = tabTemp[y].index
            end
        end
    end
    ----
    surfaces[surface_name].teleporters = teleporters
    remote.call("RitnCoreGame", "set_surfaces" , surfaces)
    local rTeleporter = RitnTeleporter(self.vehicle)
    if rTeleporter.data.index < teleporter_select.index then 
        new_index = new_index - 1
    end
    self:action_open(rTeleporter, new_index)
    ----
    log('> '..self.object_name..':action_down('.. self.player.name ..')')
    return self
end


----------------------------------------------------------------
return RitnGuiTeleporter