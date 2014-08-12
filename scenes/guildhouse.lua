----------------------------------------------------------------------------------
--
-- guildhouse.lua
--
----------------------------------------------------------------------------------

local composer = require( "composer" )
local widget = require( "widget" )
local scene = composer.newScene()

---------------------------------------------------------------------------------

local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    local rowData = row.params.data

    local nameText = display.newText({
    	parent = row, text = rowData.name, fontSize = 14, x = 20,
    	y = rowHeight * 0.5
    })

    nameText:setFillColor( 0 )
    nameText.anchorX = 0

    nameText.y = rowHeight * 0.5

    local displayLevel = display.newText({
    	parent = row, text = "lv. " .. rowData.lv, fontSize = 12, 
    	align = "right", width = 100
    })
    displayLevel:setFillColor( 0 )
    displayLevel.anchorX = 100
    displayLevel.x = 300
    displayLevel.y = rowHeight * 0.35

    local className = display.newText({
    	parent = row, text = rowData.job, fontSize = 12, 
    	align = "right", width = 100
    })
    className:setFillColor( 0 )
    className.anchorX = 100
    className.x = 300
    className.y = rowHeight * 0.65
    
end

function scene:create( event )
	local sceneGroup = self.view

	-- Called when the scene's view does not exist.
	-- 
	-- INSERT code here to initialize the scene
	-- e.g. add display objects to 'sceneGroup', add touch listeners, etc.
	sceneGroup:insert(createBackButton("startmenu"));

	local tableView = widget.newTableView
	{
	    left = 0,
	    top = 75,
	    height = 406,
	    width = 320,
	    onRowRender = onRowRender,
	    onRowTouch = onRowTouch,
	    listener = scrollListener
	}
	sceneGroup:insert(tableView)

	local rows = {
		{name = "Erik the Red", lv = 2, job = "Viking"}
		,{name = "Sir William the Ortell", lv = 2, job = "Knight"}
		,{name = "Markbeard", lv = 2, job = "Pirate"}
		,{name = "Razor Bucket", lv = 2, job = "Warrior"}
		,{name = "Mayowin, High Elf of Miracle Whip", lv = 14, job = "Sorcerer"}
		,{name = "Legolas", lv = 22, job = "Marksman"}
	}

	for i = 1, #rows do
	    -- Insert a row into the tableView
	    tableView:insertRow{params = {data = rows[i]}, rowHeight = 75}
	end
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
	end	
end


function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

---------------------------------------------------------------------------------

return scene