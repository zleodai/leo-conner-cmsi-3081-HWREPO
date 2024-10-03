function change(amount)
  if math.type(amount) ~= "integer" then
    error("Amount must be an integer")
  end
  if amount < 0 then
    error("Amount cannot be negative")
  end
  local counts, remaining = {}, amount
  for _, denomination in ipairs({25, 10, 5, 1}) do
    counts[denomination] = remaining // denomination
    remaining = remaining % denomination
  end
  return counts
end

-- Write your first then lower case function here
function first_then_lower_case(stringTable, filterFunction)
  for index, value in ipairs(stringTable) do
    if filterFunction(value) then 
      if string.len(value) ~= 0 then return string.lower(value) end
      return nil
    end      
  end
  return nil
end

-- Write your powers generator here
function powers_generator(power, max)
  local limit = math.floor(math.log(max)/math.log(power))
  local powerGenerator = coroutine.create(function ()
    for i=0,limit do 
      coroutine.yield(power^i)
    end
  end)
  return powerGenerator
end

-- Write your say function here
function say(inputString)
  if inputString == nil then return "" end
  return (function(otherInputString)
    if otherInputString == nil then return inputString end
    return say(string.format("%s %s", inputString, otherInputString))
  end)
end

-- Write your line count function here
function meaningful_line_count(filePath)
  local file = io.open(filePath, "r")
  if file == nil then error("No such file") end
  local lineCount = 0
  for line in file:lines() do
    if string.len(line) ~= 0 then
      local firstChar = ""
      local firstCharFound = false
      for charIndex = 1,#line do
        -- Im gonna assume "	" is a whitespace even doe it is a hidden character
        if string.sub(line, charIndex, charIndex) ~= " " and string.sub(line, charIndex, charIndex) ~= "	" and string.sub(line, charIndex, charIndex) ~= " " and not firstCharFound then 
          firstChar = string.sub(line, charIndex, charIndex) 
          firstCharFound = true
        end
      end
      if firstChar ~= "#" and firstCharFound then lineCount = lineCount + 1 end
    end
  end
  return lineCount
end

-- Write your Quaternion table here
Quaternion = {a = 0.0, b = 0.0, c = 0.0, d = 0.0}
Quaternion.__index = Quaternion

function Quaternion.new(_a, _b, _c, _d)
  local quaternion = setmetatable({}, Quaternion)
  quaternion.a = _a
  quaternion.b = _b
  quaternion.c = _c

  quaternion.d = _d

  return quaternion
end

function Quaternion:__add(a)
  local newQuaternion = setmetatable({}, Quaternion)
  newQuaternion.a = a.a + self.a
  newQuaternion.b = a.b + self.b
  newQuaternion.c = a.c + self.c
  newQuaternion.d = a.d + self.d
  return newQuaternion
end

function Quaternion:__mul(a)
  local newQuaternion = setmetatable({}, Quaternion)
  newQuaternion.a = (self.a * a.a) - (self.b * a.b) - (self.c * a.c) - (self.d * a.d)
  newQuaternion.b = (self.a * a.b) + (self.b * a.a) + (self.c * a.d) - (self.d * a.c)
  newQuaternion.c = (self.a * a.c) - (self.b * a.d) + (self.c * a.a) + (self.d * a.b)
  newQuaternion.d = (self.a * a.d) + (self.b * a.c) - (self.c * a.b) + (self.d * a.a)
  return newQuaternion
end

function Quaternion:__eq(a)
  return self.a == a.a and self.b == a.b and self.c == a.c and self.d == a.d
end

function Quaternion:__tostring()
  local quatString = ""

  if self.a ~= 0 then quatString = string.format("%s", self.a) end

  if self.b == 1 and string.len(quatString) == 0 then quatString = string.format("%si", quatString)
  elseif self.b == 1 then quatString = string.format("%s+i", quatString)
  elseif self.b == -1 then quatString = string.format("%s-i", quatString)
  elseif self.b > 0 then quatString = string.format("%s+%si", quatString, self.b)
  elseif self.b < 0 then quatString = string.format("%s%si", quatString, self.b) end
  
  if self.c == 1 and string.len(quatString) == 0 then quatString = string.format("%sj", quatString)
  elseif self.c == 1 then quatString = string.format("%s+j", quatString)
  elseif self.c == -1 then quatString = string.format("%s-j", quatString)
  elseif self.c > 0 then quatString = string.format("%s+%sj", quatString, self.c)
  elseif self.c < 0 then quatString = string.format("%s%sj", quatString, self.c) end

  if self.d == 1 and string.len(quatString) == 0 then quatString = string.format("%sk", quatString)
  elseif self.d == 1 then quatString = string.format("%s+k", quatString)
  elseif self.d == -1 then quatString = string.format("%s-k", quatString)
  elseif self.d > 0 then quatString = string.format("%s+%sk", quatString, self.d)
  elseif self.d < 0 then quatString = string.format("%s%sk", quatString, self.d) end
  
  if string.len(quatString) == 0 then quatString = "0" end

  return quatString
end

function Quaternion:coefficients()
  local coefficentsTable = {self.a, self.b, self.c, self.d}
  return coefficentsTable
end

function Quaternion:conjugate()
  local newQuaternion = Quaternion.new(self.a, -self.b, -self.c, -self.d)
  return newQuaternion
end