

local storyboard = require("storyboard")
local scene = storyboard.newScene()
local splash

function scene:createScene(event)
    splash = display.newRect(0,0, display.contentWidth, display.contentHeight)
    splash:setFillColor(0,0,0)

    local myText = display.newText("Welcome to Snow Run!!", 100, 200, display.contentWidth* 0.5, display.contentHeight * 0.5, native.systemFont, 22 )
    myText:setFillColor(1, 1, 1)
    myText.x = display.contentCenterX
    myText.y = display.contentCenterY
    local myText = display.newText("Use the arrows to Avoid the Obstacles!! ",804,804,0,0)
    myText:setFillColor(2, 2, 2)
    myText.x = display.contentCenterX
    myText.y = display.contentCenterY



    local function nextScene() 
       print("go to 1Level scene")
 
    	
        storyboard.loadScene("1Level")

    end

    splash:addEventListener("tap", nextScene)

end


function scene:enterScene( event )
	-- body
end

function scene:exitScene(event)
  	splash:removeEventListener()
  	splash:removeSelf()
end



scene:addEventListener( "createScene", scene )

scene:addEventListener( "enterScene", scene )

scene:addEventListener( "exitScene", scene )
return scene	