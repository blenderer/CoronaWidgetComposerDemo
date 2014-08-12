-----------------------------------------------------------------------------------------
--
-- common.lua
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local widget = require( "widget" )

function createBackButton(scene)

  local topBox = display.newRect( 0, 0, 40, 33 )
  topBox.anchorX = 0
  topBox.anchorY = 0
  topBox.scene = scene

  function topBox:touch( event )
      if event.phase == "ended" then
          composer.gotoScene("scenes." .. event.target.scene)
          return true
      end
  end

  topBox:addEventListener( "touch", topBox )

  return topBox
end