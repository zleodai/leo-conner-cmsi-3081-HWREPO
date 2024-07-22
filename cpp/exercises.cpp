// Write your solutions to the exercises in this file.

#include <iostream>
#include <vector>
#include <stdexcept>

std::vector<unsigned long> change(unsigned long amount) {
    if (amount < 0) {
        throw std::invalid_argument("amount cannot be negative");
    }

    std::vector<unsigned long> denominations = {25, 10, 5, 1};
    std::vector<unsigned long> coins;
    long remaining = amount;

    for (int value : denominations) {
        coins.push_back(remaining / value);
        remaining %= value;
    }

    return coins;
}
