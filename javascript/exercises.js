// Write your solutions to the exercises in this file.

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
