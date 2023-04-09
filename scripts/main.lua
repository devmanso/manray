--[[
  this is a stress test of the engine, everything here is disorganized, poorly commented,
  and it is bad code. It has a few samples using the vector2 and input library such as player
  input and movement.
]]

init(GetMonitorWidth(0), GetMonitorHeight(0), "my title")

vec2 = require("scripts/vector2")
input = require("scripts/input")

drawOps = 0
pos1 = vec2.new(10, 40)
pos2 = vec2.new(20, 10)
pos3 = vec2.new(pos1.x + pos2.x, pos1.y + pos2.y)

-- set target framerate
setfps(150)

sprite = LoadImage("scripts/art/images.png")

function displayInfo()
    -- display memory usage
    memory = tostring(math.floor(collectgarbage('count') ) )
    message = "script memory usage: ".. memory .. "kb"
    DrawText(message, 50, 40, 20, 
    265, 0.01, 0.99)

    mathOperations = "rectangle math operations done: " ..tostring(drawOps)
    DrawText(mathOperations, 50, 60, 20, 
    265, 0.01, 0.99)

    -- display framerate
    fps = tostring(getfps())
    DrawText(fps.. " FPS", 750, 20, 20,
    265, 0.01, 0.99)

    -- display text to the screen
    DrawText("Hello world!", 210, 200, 20, 
    67, 0.90, 0.86)

    -- display time elapsed since last frame update
    frame_time = math.floor(DeltaTime() * 1000)
    DrawText(tostring(frame_time).. " ms", 20, 20, 20, 
    265, 0.01, 0.99)
end


function playerInput()
    local speed = 200
    local moving_up = false
    local moving_down = false
    local moving_left = false
    local moving_right = false

    if IsKeyDown(input.keyboard.i) then
      collectgarbage('collect')
    end

    if IsKeyDown(input.keyboard.o) then
      OpenURL("http://142.250.65.238")
    end
    
    if IsKeyDown(input.keyboard.uparrow) then
      if not moving_up then
        pos1.y = pos1.y - DeltaTime() * speed
        moving_up = true
      end
    else
      moving_up = false
    end
  
    if IsKeyDown(input.keyboard.downarrow) then
      if not moving_down then
        pos1.y = pos1.y + DeltaTime() * speed
        moving_down = true
      end
    else
      moving_down = false
    end
  
    if IsKeyDown(input.keyboard.rightarrow) then
      if not moving_right then
        pos1.x = pos1.x + DeltaTime() * speed
        moving_right = true
      end
    else
      moving_right = false
    end
  
    if IsKeyDown(input.keyboard.leftarrow) then
      if not moving_left then
        pos1.x = pos1.x - DeltaTime() * speed
        moving_left = true
      end
    else
      moving_left = false
    end

    -- WASD
    if IsKeyDown(input.keyboard.w) then
        if not moving_up then
          pos1.y = pos1.y - DeltaTime() * speed
          moving_up = true
        end
      else
        moving_up = false
      end
    
      if IsKeyDown(input.keyboard.s) then
        if not moving_down then
          pos1.y = pos1.y + DeltaTime() * speed
          moving_down = true
        end
      else
        moving_down = false
      end
    
      if IsKeyDown(input.keyboard.d) then
        if not moving_right then
          pos1.x = pos1.x + DeltaTime() * speed
          moving_right = true
        end
      else
        moving_right = false
      end
    
      if IsKeyDown(input.keyboard.a) then
        if not moving_left then
          pos1.x = pos1.x - DeltaTime() * speed
          moving_left = true
        end
      else
        moving_left = false
      end

end

xpos = math.random(1, 1340)
ypos = math.random(1, 800)

function calculatePositions()
  xpos = math.random(1, 1340)
  ypos = math.random(1, 800)
end

--collectgarbage('collect')
while not WinShouldClose() do
    begin()
        cls(0, 0, 0) -- clear the screen, with a certain color

        leftClick = IsMouseButtonPressed(input.mouse.left)
        mousepos = GetMousePosition()

        if leftClick == true then
          if mousepos.x <= xpos + 30 then
            calculatePositions()
          end
        end

        -- draw the player (rectangle/square)
        --DrawImage(sprite, pos1.x, pos1.y)

        DrawRect(xpos, ypos, 100, 100,
                295, 0, 1)
        
        --playerInput()

        --displayInfo()
    stop()
end

exit()



