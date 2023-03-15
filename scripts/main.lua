init(850, 450, "test")

-- set target framerate
setfps(60)

while not WinShouldClose() do
    begin()
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
                0, 1.0, 1.0)
        
        -- this rectangle will 'fidget' when displayed onto the screen
        DrawRect(math.random(50, 60), math.random(50, 60), math.random(50, 60), 120, 
                234, 0.83, 0.90)
    stop()
end

exit()



