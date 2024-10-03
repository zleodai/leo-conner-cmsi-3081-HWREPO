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

func say(_ string: String = "") -> ChainableString {
    return ChainableString(string)
}

enum FileError: Error {
    case fileNotFound(String)
}

func meaningfulLineCount(_ path: String) async -> Result<Int, Error> {
    guard let contents = try? String(contentsOfFile: path) else {
        return .failure(NoSuchFileError())
    }

    let lines = contents.replacingOccurrences(of: "\r\n", with: "\n").split(separator: "\n")

    var lineCount: Int = 0
    for singleLine in lines {
        var firstChar = "#"
        var firstCharFound = false
        
        let chars = Array(singleLine)
        for char in chars {
            // print("\nChecking char: \(String(describing: char.asciiValue))")
            if (char.asciiValue != 13 && char.asciiValue != 0 && char.asciiValue != 32 && char.asciiValue != 9 && !firstCharFound) {
                firstChar = String(char)
                firstCharFound = true
            }
        }
        
        if (firstChar != "#" && firstCharFound) {
            lineCount += 1
        }
    }

    return .success(lineCount)
}

// Write your Quaternion struct here
// make copy of list when constructing quaternion
// internal list can be mutable
// return immutable list for quaternion
struct Quaternion: CustomStringConvertible {
    let a: Double
    let b: Double
    let c: Double
    let d: Double

    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d    
    }
    
    var coefficients: [Double] { return [self.a, self.b, self.c, self.d] }
    var conjugate: Quaternion { return Quaternion(a: self.a, b: -self.b, c: -self.c, d: -self.d) }
    
    var description: String {
        var quatString: String = ""
        
        if (self.a != 0.0) { quatString = "\(self.a)" }
        
        if (self.b == 1.0 && quatString.length == 0) { quatString = "\(quatString)i" }
        else if (self.b == 1.0) { quatString = "\(quatString)+i" }
        else if (self.b == -1.0) { quatString = "\(quatString)-i" }
        else if (self.b > 0.0) { quatString = "\(quatString)+\(self.b)i" }
        else if (self.b < 0.0) { quatString = "\(quatString)\(self.b)i" }
        
        if (self.c == 1.0 && quatString.length == 0) { quatString = "\(quatString)j" }
        else if (self.c == 1.0) { quatString = "\(quatString)+j" }
        else if (self.c == -1.0) { quatString = "\(quatString)-j" }
        else if (self.c > 0.0) { quatString = "\(quatString)+\(self.c)j" }
        else if (self.c < 0.0) { quatString = "\(quatString)\(self.c)j" }
        
        if (self.d == 1.0 && quatString.length == 0) { quatString = "\(quatString)k" }
        else if (self.d == 1.0) { quatString = "\(quatString)+k" }
        else if (self.d == -1.0) { quatString = "\(quatString)-k" }
        else if (self.d > 0.0) { quatString = "\(quatString)+\(self.d)k" }
        else if (self.d < 0.0) { quatString = "\(quatString)\(self.d)k" }
        
        if (quatString.length == 0) { quatString = "0" }
        
        return quatString
    }

    static func == (left: Quaternion, right: Quaternion) -> Bool {
        return left.a == right.a && left.b == right.b && left.c == right.c && left.d == right.d
    }

    static func + (left: Quaternion, right: Quaternion) -> Quaternion {
        return Quaternion(a: left.a + right.a, b: left.b + right.b, c: left.c + right.c, d: left.d + right.d)
    }

    static func * (left: Quaternion, right: Quaternion) -> Quaternion {
        return Quaternion(a: (left.a * right.a) - (left.b * right.b) - (left.c * right.c) - (left.d * right.d),
                          b: (left.a * right.b) + (left.b * right.a) + (left.c * right.d) - (left.d * right.c),
                          c: (left.a * right.c) - (left.b * right.d) + (left.c * right.a) + (left.d * right.b),
                          d: (left.a * right.d) + (left.b * right.c) - (left.c * right.b) + (left.d * right.a))
    }

    static let ZERO = Quaternion(a: 0, b: 0, c: 0, d: 0)
    static let I = Quaternion(a: 0, b: 1, c: 0, d: 0)
    static let K = Quaternion(a: 0, b: 0, c: 0, d: 1)
    static let J = Quaternion(a: 0, b: 0, c: 1, d: 0)
}

indirect enum BinarySearchTree: CustomStringConvertible {
    case empty
    case nodeTree(tree: Array<String>, count: Int)

    var description: String {
        switch self {
            case .empty:
                return "()"
            case .nodeTree(let tree, _):
                var outputString: String = tree[1]
                if (tree.count > 2 && tree[2] != "None") {
                    outputString = descriptionHelper(tree: tree, outputString, 2)
                }
                if (tree.count > 3 && tree[3] != "None") {
                    outputString = descriptionHelper(tree: tree, outputString, 3)
                }
                return "(" + outputString + ")"
        }
    }

    func descriptionHelper(tree: Array<String>, _ c: String, _ i: Int) -> String {
        var parentStringIndex = c.range(of: tree[parent(i)])!.lowerBound
        var outputString: String = ""

        let insertingString = "(" + tree[i] + ")"
        if (i == leftChild(parent(i))) {
            outputString = c.prefix(upTo: parentStringIndex) + insertingString + c.suffix(from: parentStringIndex)
        } else {
            parentStringIndex = c.index(parentStringIndex, offsetBy: 1)
            outputString = c.prefix(upTo: parentStringIndex) + insertingString + c.suffix(from: parentStringIndex)
        }

        if (leftChild(i) < tree.count && tree[leftChild(i)] != "None") {
            outputString = descriptionHelper(tree: tree, outputString, leftChild(i))
        }
        if (rightChild(i) < tree.count && tree[rightChild(i)] != "None") {
            outputString = descriptionHelper(tree: tree, outputString, rightChild(i))
        }

        return outputString
    }

    var size: Int {
        switch self {
            case .empty:
                return 0
            case .nodeTree(_, let count):
                return count
        }
    }

    func parent(_ i: Int) -> Int { return i/2 }
    func leftChild(_ i: Int) -> Int { return i*2 }
    func rightChild(_ i: Int) -> Int { return i*2 + 1 }

    func insert(_ c: String) -> BinarySearchTree {
        switch self {
            case .empty:
                return BinarySearchTree.nodeTree(tree: ["None", c], count: 1)
            case .nodeTree(let tree, let count):
                var newTree: Array<String> = tree.map { $0 }
                var insertIndexFound: Bool = false
                var currentIndex: Int = 1

                while (!insertIndexFound) {
                    if (Character(newTree[currentIndex]).asciiValue ?? UInt8(0) > Character(c).asciiValue ?? UInt8(0)) {
                        currentIndex = leftChild(currentIndex)
                    } else {
                        currentIndex = rightChild(currentIndex)
                    }

                    if (currentIndex >= newTree.count) {
                        let sizeIncreaseNeeded: Int = currentIndex - newTree.count + 1
                        newTree.append(contentsOf: Array(repeating: "None", count: sizeIncreaseNeeded))
                    }

                    if (newTree[currentIndex] == "None") {
                        insertIndexFound = true
                    }
                }
                newTree[currentIndex] = c

                return BinarySearchTree.nodeTree(tree: newTree, count: count + 1)
        }
    }

    func contains(_ c: String) -> Bool {
        switch self {
            case .empty:
                return false
            case .nodeTree(let tree, _):
                return tree.contains(c)
        }
    }
}