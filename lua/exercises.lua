function change(amount)
  if math.type(amount) ~= "integer" then
    error("Amount must be an integer")
  end
  if amount < 0 then
    error("Amount cannot be negative")
  end
  local coins, remaining = {}, amount
  for _, coin in ipairs({25, 10, 5}) do
    local count = remaining // coin
    table.insert(coins, count)
    remaining = remaining - count * coin
  end
  table.insert(coins, remaining)
  return table.unpack(coins)
end

-- Write your firstThenLowercase function here

-- Write your powers generator here

-- Write your say function here

-- Write your misc file stats function here

-- Write your Quaternion table here
