import Foundation

switch change(250) {
    case .success(let coins): assert(coins == (10, 0, 0, 0))
    case _: assert(false)
}
switch change(-50) {
    case .success(_): assert(false)
    case .failure(_): assert(true)
}
assert(try! change(0).get() == (0, 0, 0, 0))
assert(try! change(97).get() == (3, 2, 0, 2))
assert(try! change(8).get() == (0, 0, 1, 3))
assert(try! change(144).get() == (5, 1, 1, 4))
assert(try! change(97).get() == (3, 2, 0, 2))
assert(try! change(100000000000).get() == (4000000000, 0, 0, 0))
assert((try? change(-50).get()) == nil)

print("All tests passed")
