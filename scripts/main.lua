init(850, 450, "test")

vec2 = require("scripts/vector2")
kb = require("scripts/keyboard")


pos1 = vec2.new(10, 40)
pos2 = vec2.new(20, 10)
pos3 = vec2.new(pos1.x + pos2.x, pos1.y + pos2.y)

-- set target framerate
setfps(60)

sprite = LoadImage("scripts/art/images.png")

function glitchyRectangle()
    -- stress testing the engine
    -- this rectangle will 'fidget' and appear 'glitchy' when displayed onto the screen
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))

    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))

    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
    math.random(1, 360), math.random(0, 1), math.random(0, 1))
    
end

function displayInfo()
    DrawImage(sprite, 200, 100)
    -- display memory usage
    memory = tostring(math.floor(collectgarbage('count') ) )
    message = "script memory usage: ".. memory .. "kb"
    DrawText(message, 40, 40, 20, 
    234, 0.03, 0.88)
    -- display framerate
    fps = tostring(getfps())
    DrawText(fps.. " FPS", 750, 20, 20,
    67, 0.50, 0.50)

    -- display text to the screen
    DrawText("Hello world!", 210, 200, 20, 
    67, 0.90, 0.86)

    -- display time elapsed since last frame update
    frame_time = math.floor(DeltaTime() * 1000)
    DrawText(tostring(frame_time).. " ms", 20, 20, 20, 
    234, 0.03, 0.88)
end


function playerInput()
    -- arrow key movement
    if IsKeyDown(keyboard.uparrow) then
        pos1.y = pos1.y - DeltaTime() * 200
    end
    if IsKeyDown(keyboard.downarrow) then
        pos1.y = pos1.y + DeltaTime() * 200
    end
    if IsKeyDown(keyboard.rightarrow) then
        pos1.x = pos1.x + DeltaTime() * 200
    end
    if IsKeyDown(keyboard.leftarrow) then
        pos1.x = pos1.x - DeltaTime() * 200
    end

    -- WASD movement
    if IsKeyDown(keyboard.w) then
        pos1.y = pos1.y - DeltaTime() * 200
    end
    if IsKeyDown(keyboard.s) then
        pos1.y = pos1.y + DeltaTime() * 200
    end
    if IsKeyDown(keyboard.d) then
        pos1.x = pos1.x + DeltaTime() * 200
    end
    if IsKeyDown(keyboard.a) then
        pos1.x = pos1.x - DeltaTime() * 200
    end
end

while not WinShouldClose() do
    begin()
        -- draw the player (rectangle/square)
        DrawRect(pos1.x, pos1.y, 30, 30,
        67, 0.50, 0.50)
        playerInput()

        cls(0, 0, 0) -- clear the screen, with a certain color
        displayInfo()
        glitchyRectangle()
    stop()
end

exit()



