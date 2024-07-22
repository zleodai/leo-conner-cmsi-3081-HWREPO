#include <cassert>
#include <sstream>
#include "exercises.h"

using namespace std;

int main() {
  std::cout << "Testing change()\n";
  assert(change(1ul) == (vector {0ul, 0ul, 0ul, 1ul}));
  assert(change(99ul) == (vector {3ul, 2ul, 0ul, 4ul}));
  assert(change(42ul) == (vector {1ul, 1ul, 1ul, 2ul}));
  assert(change(100000000037ul) == (vector {4000000001ul, 1ul, 0ul, 2ul}));
  assert(change(10000000000005ul) == (vector {400000000000ul, 0ul, 1ul, 0ul}));

  cout << "All tests passed\n";
}
