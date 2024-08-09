import { open } from "node:fs/promises"

export function change(amount) {
  if (!Number.isInteger(amount)) {
    throw new TypeError("Amount must be an integer")
  }
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let [coins, remaining] = [[], amount]
  for (const denomination of [25, 10, 5, 1]) {
    coins.push(Math.floor(remaining / denomination))
    remaining %= denomination
  }
  return coins
}

// Write your first then lower case function here

// Write your powers generator here

// Write your say function here

// Write your misc file stats function here

// Write your Quaternion class here
