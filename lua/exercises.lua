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
function return_lower_case(inputString)
  if string.len(inputString) ~= 0 then return string.lower(inputString) end
  return nil
end 

function first_then_lower_case(stringTable, filterFunction)
  for index, value in ipairs(stringTable) do
    if filterFunction(value) then return return_lower_case(value) end      
  end
  return nil
end

-- Write your powers generator here
function powers_generator(power, max)
  limit = math.floor(math.log(max)/math.log(power))
  powerGenerator = coroutine.create(function ()
    for i=0,limit do 
      coroutine.yield(power^i)
    end
  end
  )
  return powerGenerator
end

-- Write your say function here

-- Write your line count function here

-- Write your Quaternion table here
