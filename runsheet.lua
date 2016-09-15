

local sheet = false
local setInfo = false
local msFactor = 1000

local function newSpriteSet(_sheet, _name, _startFrame, _frameCount, _frameRate, _loopParam, _xReference, _yReference, _spriteSourceWidth, _spriteSourceHeight, _unscaledSpriteX, _unscaledSpriteY, _unscaledSpriteWidth, _unscaledSpriteHeight, _frames, _shapeOnly)
    if (_shapeOnly) then
        return
    end

    local set = sprite.newSpriteSet(_sheet, _startFrame, _frameCount)
    sprite.add(set, _name, 1, _frameCount, (_frameCount / _frameRate) * msFactor, _loopParam)
    setInfo[_name] = {set = set, xReference = _xReference, yReference = _yReference, spriteSourceSize = {width = _spriteSourceWidth, height = _spriteSourceHeight}, unscaledSpriteRect = {x = _unscaledSpriteX, y = _unscaledSpriteY, width = _unscaledSpriteWidth, height = _unscaledSpriteHeight}, frames = _frames, frameRate = _frameRate, frameCount = _frameCount, fpss = _frameRate / 1000, startFrame = _startFrame}
end

local function load()
    local frameSets = {}
    local allFrames = {}

    frameSets["runer"] = {
        {
            name="runer-1",
            spriteColorRect={x=1, y=0},
            textureRect={x=345, y=0, width=86, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-2",
            spriteColorRect={x=7, y=0},
            textureRect={x=105, y=0, width=77, height=105},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-3",
            spriteColorRect={x=29, y=0},
            textureRect={x=55, y=0, width=50, height=106},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-4",
            spriteColorRect={x=13, y=0},
            textureRect={x=431, y=0, width=62, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-5",
            spriteColorRect={x=10, y=0},
            textureRect={x=66, y=106, width=86, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-6",
            spriteColorRect={x=0, y=0},
            textureRect={x=152, y=106, width=96, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-7",
            spriteColorRect={x=0, y=0},
            textureRect={x=152, y=106, width=96, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-8",
            spriteColorRect={x=10, y=0},
            textureRect={x=259, y=0, width=86, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-9",
            spriteColorRect={x=13, y=0},
            textureRect={x=0, y=106, width=66, height=102},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-10",
            spriteColorRect={x=29, y=0},
            textureRect={x=0, y=0, width=55, height=106},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        },
        {
            name="runer-11",
            spriteColorRect={x=7, y=0},
            textureRect={x=182, y=0, width=77, height=105},
            spriteSourceSize={width=96, height=106},
            spriteTrimmed=true,
        }
    }
    allFrames = table.copy(allFrames, frameSets["runer"])


    sheet = sprite.newSpriteSheetFromData("runsheet.png", {frames = allFrames })

    -- setInfo table contains info about sprites: { (spriteName = {set: set, xReference: xReference, yReference: yReference, spriteSourceSize = {width: width, height: height}})+ }
    setInfo = {}
    newSpriteSet(sheet, "runer", 1, 11, 15, 1, 0 - (96/2 + 3), 0 - (106/2 + -2), 96, 106, 1, 0, 86, 102, frameSets["runer"], false)

    local shapes = {}
    shapes["runer"] = {

    }

    return { sheet = sheet, setInfo = setInfo, shapes = shapes }
end

local function destroy()
    sheet:dispose()
    sheet = nil
    setInfo = nil
end

return { load = load, destroy = destroy }
