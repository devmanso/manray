init(850, 450, "test")

vec2 = require("scripts/vector2")

pos1 = vec2.new(10, 40)
pos2 = vec2.new(20, 10)
pos3 = vec2.new(pos1.x + pos2.x, pos1.y + pos2.y)

-- set target framerate
setfps(60)


while not WinShouldClose() do
    begin()
        -- display framerate
        fps = tostring(getfps())
        DrawText(fps.. " FPS", 400, 250, 20,
                67, 0.50, 0.50)

        -- display text to the screen
        DrawText("Hello world!", 150, 150, 20, 
                67, 0.90, 0.86)
        
        DrawText("wasdwa", 170, 170, 30,
                67, 0.50, 0.50)
        
        -- display memory usage
        memory = tostring(math.floor(collectgarbage('count') ) )
        message = "script memory usage: ".. memory .. "kb"
        DrawText(message, 40, 40, 20, 
                234, 0.03, 0.88)

        -- display time elapsed since last frame update
        frame_time = math.floor(DeltaTime() * 1000)
        DrawText(tostring(frame_time).. " ms", 20, 20, 20, 
                234, 0.03, 0.88)

        cls(0, 0, 0) -- clear the screen, with a certain color

        -- shapes :O
        DrawRect(200, 200, 100, 120,
                104, 1.0, 1.0)
        
        -- this rectangle will 'fidget' when displayed onto the screen
        DrawRect(math.random(70, 130), math.random(70, 130), math.random(50, 60), 120, 
                math.random(1, 360), math.random(0, 1), math.random(0, 1))
    stop()
end

exit()



