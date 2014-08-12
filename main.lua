-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
require "includes.common"
local composer = require "composer"

display.setStatusBar( display.HiddenStatusBar )

-- load scenetemplate.lua
composer.gotoScene( "scenes.startmenu" )

-- Add any objects that should appear on all scenes below (e.g. tab bar, hud, etc.):