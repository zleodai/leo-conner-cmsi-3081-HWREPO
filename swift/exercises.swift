import Foundation

struct NegativeAmountError: Error {}
struct NoSuchFileError: Error {}

typealias ChangeResult = Result<[Int:Int], NegativeAmountError>

func change(_ amount: Int) -> ChangeResult {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    var (counts, remaining) = ([Int:Int](), amount)
    for denomination in [25, 10, 5, 1] {
        (counts[denomination], remaining) = 
            remaining.quotientAndRemainder(dividingBy: denomination)
    }
    return .success(counts)
}

// Write your first then lower case function here

// Write your powers generator here

// Write your say function here

// Write your Quaternion struct here

// Write your Binary Search Tree enum here
