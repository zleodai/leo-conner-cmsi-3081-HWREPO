// Write your solutions to the exercises in this file.

import Foundation

// Because change returns a result, we need to make a real error type.
struct NegativeAmountError: Error {}

// We didn’t talk about typealias in class, but it’s cool
typealias ChangeResult = Result<(Int, Int, Int, Int), NegativeAmountError>

// The _ is required of course, since you have to pass the tests.
func change(_ amount: Int) -> ChangeResult {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    let (quarters, afterQuarters) = amount.quotientAndRemainder(dividingBy: 25)
    let (dimes, afterDimes) = afterQuarters.quotientAndRemainder(dividingBy: 10)
    let (nickels, pennies) = afterDimes.quotientAndRemainder(dividingBy: 5)
    return .success((quarters, dimes, nickels, pennies))
}
