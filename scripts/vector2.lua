-- vector2.lua

-- Define the module table
local vector2 = {}

-- Define the metatable for the Vector2 object
local vector2_mt = {
  __index = {
    -- Define the x and y properties of the Vector2 object
    x = 0,
    y = 0,

    -- Define the __add metamethod to add two Vector2 objects
    __add = function(self, other)
      return vector2.new(self.x + other.x, self.y + other.y)
    end,

    -- Define the __sub metamethod to subtract two Vector2 objects
    __sub = function(self, other)
      return vector2.new(self.x - other.x, self.y - other.y)
    end,

    -- Define the __mul metamethod to multiply a Vector2 object by a scalar value
    __mul = function(self, scalar)
      return vector2.new(self.x * scalar, self.y * scalar)
    end,

    -- Define the __eq metamethod to check if two Vector2 objects are equal
    __eq = function(self, other)
      return self.x == other.x and self.y == other.y
    end,

    -- Define the __tostring metamethod to convert a Vector2 object to a string
    __tostring = function(self)
      return "(" .. self.x .. ", " .. self.y .. ")"
    end
  },

  -- Define the __call metamethod to create a new Vector2 object
  __call = function(self, x, y)
    local obj = setmetatable({}, vector2_mt)
    obj.x = x or obj.x
    obj.y = y or obj.y
    return obj
  end
}

-- Define the new function to create a new Vector2 object
function vector2.new(x, y)
  return vector2_mt.__call(vector2_mt, x, y)
end

-- Define the zero constant for the Vector2 object
vector2.zero = vector2.new(0, 0)

-- Export the module table
return vector2
