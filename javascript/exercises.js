export function change(amount) {
  if (amount < 0) {
    throw new RangeError("amount cannot be negative")
  }
  let [coins, remaining] = [[], amount]
  for (let denomination of [25, 10, 5]) {
    coins.push(Math.floor(remaining / denomination))
    remaining %= denomination
  }
  coins.push(remaining)
  return coins
}

// Write your stretched function here

// Write your powers generator here

// Write your say function here

// Write your file capitalizer function here

// Write your Quaternion class here
