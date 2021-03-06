----------------------------------------------------------------------------------
--
-- scenetemplate.lua
--
----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()

-- Clear previous scene
storyboard.removeAll()

----------------------------------------------------------------------------------
-- 
--	NOTE:
--	
--	Code outside of listener functions (below) will only be executed once,
--	unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

-- monsters table
local monsters = {
	"Oscar the Vampire",
	"Angst the evil Bat",
	"Juliet the Virgin",
	"Fungus the old butler",
	"Camelia the Smiling Zombie"
}

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
	local group = self.view

	-----------------------------------------------------------------------------
		
	--	CREATE display objects and add them to 'group' here.
	--	Example use-case: Restore 'group' from previously saved state.
	
	-----------------------------------------------------------------------------

local group = self.view
 
  local gameTitle = display.newText( "The Haunted Castle", 0, 0, native.systemFontBold, 36 )
  gameTitle.x = display.contentCenterX
  gameTitle.y = display.contentCenterY - 20
  group:insert( gameTitle )

 local startButton = display.newText( "Start", 0, 0, native.systemFont, 20 )
  startButton.x = display.contentCenterX
  startButton.y = display.contentCenterY + 80
 
  local function onTap( event )
    storyboard.gotoScene("about" )
  end
  startButton:addEventListener( "tap", onTap )
 
  group:insert( startButton )

  -- monster præsentation
  cast = display.newText(
	"Feat ".. monsters[1] .. " & " .. table.getn(monsters) .. " monsters", 
	0, 
	0, 
	native.systemFontBold, 
	25
  )
  cast.x = display.contentCenterX
  cast.y = display.contentCenterY +  10
  cast:setFillColor( 1,0,0 )  
group:insert( cast )
	
end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
		
	--	INSERT code here (e.g. start timers, load audio, start listeners, etc.)
	
	-----------------------------------------------------------------------------
	
end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)
	
	-----------------------------------------------------------------------------
local group = self.view
 
  local gameTitle = display.newText( "My Game", 0, 0, native.systemFontBold, 36 )
  gameTitle.x = display.contentCenterX
  gameTitle.y = display.contentCenterY - 20
 
  group:insert( gameTitle )	
end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
	local group = self.view
	
	-----------------------------------------------------------------------------
	
	--	INSERT code here (e.g. remove listeners, widgets, save state, etc.)
	
	-----------------------------------------------------------------------------
	
end


---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene
