-- Graphics 2.0 parallax scrolling
local storyboard = require("storyboard")
local scene = storyboard.newScene()
local physics = require("physics")
physics.start()

    print("in 1level")
	local centerX = display.contentCenterX
	local centerY = display.contentCenterY
	local _W = display.contentWidth
	local _H = display.contentHeight

	
	local TOP_REF = 0
	local BOTTOM_REF = 1
	local LEFT_REF = 0
	local RIGHT_REF = 1
	local CENTER_REF = 0.5
    local score = 0
   


    
    local  bkgd = display.newImageRect("background.png", 800, 367)
    bkgd.x = centerX
    bkgd.y = centerY
print("bkgd.width"..bkgd.width)

print("device"..display.contentWidth)
print("deviceH"..display.contentHeight)
    local baseline = 380

  
    local obj = {}
    obj[1] = display.newImageRect( "dude.png", 50, 50 )
    obj[1].xScale = 0.7 
    obj[1].yScale = 0.7
    obj[1].anchorY = BOTTOM_REF
    obj[1].x = 400 
    obj[1].y = baseline -20
    
    obj[1].dx = 0.8
physics.addBody(obj[1], "dynamic", {density = 1, friction=0, bounce=0})
    
    local hills =display.newImageRect("hills.png",100,100)
    hills.anchorX = LEFT_REF
    hills.x = 0
    hills.y = baseline + 10
    physics.addBody(hills, "static", {density = 1, friction=0, bounce=0})

    local road = display.newImageRect("road.png", 300, 55)
    road.anchorX = LEFT_REF
    road.x = 0
    road.y = baseline + 70
    physics.addBody(road, "static", {density = 1, friction=0, bounce=0})
    local road2 = display.newImageRect("road.png", 300, 55)
    road2.anchorX = LEFT_REF
    road2.x = 300
    road2.y = baseline + 70
    physics.addBody(road2, "static", {density = 1, friction=0, bounce=0})
    local road3 = display.newImageRect("road.png", 300, 55)
    road3.anchorX = LEFT_REF
    road3.x = 600
    road3.y = baseline + 70
    physics.addBody(road3, "static", {density = 1, friction=0, bounce=0})
sco = display.newText("Score: "..score, 10, 65, system.nativeFont, 20)
    local button1=display.newImage("button2.png", 680, 450)

    local button2=display.newImage("button1.png", -80, 450)
    local x_mp3= audio.loadStream("x.mp3")
local button6=display.newImage("button6.png", -60, 70)
local stop=display.newImage("stop.png",120,70)
function button6:tap(event)
    audio.play(x_mp3)
end
function stop:tap( event )
    audio.stop()
end
    

    local tPrevious = system.getTimer()
    local function move(event)
    	local tDelta = event.time - tPrevious
    	tPrevious = event.time
    
    	local xOffset = ( 0.2 * tDelta )
        hills.x=hills.x-xOffset-1
    	road.x = road.x - xOffset
    	road2.x = road2.x - xOffset
        road3.x = road3.x - xOffset
if (hills.x + hills.width) < 0 then 
    print(hills.x..", "..hills.width)
            hills:translate( math.random(200,900), 0)
        end
    	if (road.x + road.width) < 0 then
            print(road.x..", "..road.width)
    		road:translate( 900, 0)
    	end
    	if (road2.x + road2.width) < 0 then
    		road2:translate( 900, 0)
    	end
        if (road3.x + road3.width) < 0 then
            road3:translate( 900, 0)
        end
	
    	local i
    	for i = 1, #obj, 1 do
    		obj[i].x = obj[i].x - obj[i].dx * tDelta * 0.2
    		if (obj[i].x + obj[i].contentWidth) < 0 then 
            

             

                display.newRect( 0, 0, 5000, 5000 )
    			Gover = display.newText("Game Over! Score: "..score, 300, 250, system.nativeFont, 40)
                Gover:setTextColor(255,0,0)
    		
            

            end
           
    	end
      
    end
  


function right()
 obj[1].x=obj[1].x+35
 score = score + 1
 sco.text = "Score: "..score
end
function up()
 obj[1].y=obj[1].y-37
end

    Runtime:addEventListener( "enterFrame", move );
    button1:addEventListener( "tap", right )
    button2:addEventListener( "tap", up )
  --  button1.addEventListener("right", tap)




function scene:enterScene( event )


end

function scene:exitScene(event)

end
button6:addEventListener("tap", playButton6)
stop:addEventListener("tap", stop)
-- "createScene" is called whenever the scene is FIRST called
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )
return scene