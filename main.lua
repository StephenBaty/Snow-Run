local x_mp3= audio.loadStream("x.mp3")
local button6=display.newImage("button6.png", 60, 70)
local stop=display.newImage("stop.png",170,70)
function button6:tap(event)
    audio.play(x_mp3)
end
function stop:tap( event )
    audio.stop()
end
display.setStatusBar( display.HiddenStatusBar )

local storyboard = require("storyboard")

storyboard.purgeOnSceneChange = true
storyboard.loadScene( "splash")


-- Hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- The name of the ad provider.
local provider = "admob"

-- Your application ID
local appID = "5983191708564752/7010019821"

-- Load Corona 'ads' library
local ads = require "ads"



local statusText = display.newText( "", 0, 0, native.systemFontBold, 22 )
statusText:setTextColor( 255 )

statusText.x, statusText.y = display.contentWidth * 0.5, 160

local showAd


local function adListener( event )
	
	local msg = event.response

	
	print("Message received from the ads library: ", msg)

	if event.isError then
		statusText:setTextColor( 255, 0, 0 )
		statusText.text = "Error Loading Ad"
		statusText.x = display.contentWidth * 0.5

		showAd( "banner" )
	else
		statusText:setTextColor( 0, 255, 0 )
		statusText.text = "Successfully Loaded Ad"
		statusText.x = display.contentWidth * 0.5
	end
end

if appID then
	ads.init( provider, appID, adListener )
end



local sysModel = system.getInfo("model")
local sysEnv = system.getInfo("environment")


showAd = function( adType )
	local adX, adY = display.screenOriginX, display.screenOriginY
	statusText.text = ""
	ads.show( adType, { x=adX, y=adY } )
end



if sysEnv == "simulator" then
	local font, size = native.systemFontBold, 22
	local warningText = display.newRetinaText( "Please build for device or Xcode simulator to test this sample.", 0, 0, 290, 300, font, size )
	
else
	with = start with = banner ad
	= showAd( "interstitial" )
end

 button6:addEventListener("tap", playButton6)
stop:addEventListener("tap", stop)
