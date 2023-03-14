init(850, 450, "test")

-- set target framerate
setfps(60)

while not WinShouldClose() do
    begin()
        -- display text to the screen
        DrawText("Hello world!", 150, 150, 20, 67)
        
        -- display memory usage
        memory = tostring(math.floor(collectgarbage('count') ) )
        message = "script memory usage: ".. memory .. "kb"
        DrawText(message, 40, 40, 20, 67)

        -- display time elapsed since last frame update
        frame_time = math.floor(DeltaTime() * 1000)
        DrawText(tostring(frame_time).. " ms", 20, 20, 20, 47)

        cls(100) -- clear the screen, with a certain color

        -- shapes :O
        DrawRect(200, 200, 100, 120, 37)
        DrawRect(math.random(50, 60), math.random(50, 60), math.random(50, 60), 120, 37)
    stop()
end

exit()



