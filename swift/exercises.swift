import Foundation

struct NegativeAmountError: Error {}
struct NoSuchFileError: Error {}

func change(_ amount: Int) -> Result<[Int:Int], NegativeAmountError> {
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

func firstThenLowerCase(of: Array<String>, satisfying: (String) -> Bool) -> String?{
    var first: String?
    var firstFound: Bool = false

    for string in of {
        if (satisfying(string) && !firstFound) {
            first = string
            firstFound = true
        }
    }

    if (firstFound) {
        return first?.lowercased()
    }
    return nil
}

class ChainableString {
    var phrase: String

    init(_ phrase: String) {
        self.phrase = phrase
    }

    func and(_ stringSuffix: String) -> ChainableString {
        return ChainableString(phrase + " " + stringSuffix)
    }
}

fun say(_ string: String? = nil): ChainableString {
    var defau
}

// Write your meaningfulLineCount function here

// Write your Quaternion struct here
// make copy of list when constructing quaternion
// internal list can be mutable
// return immutable list for quaternion

// Write your Binary Search Tree enum here
