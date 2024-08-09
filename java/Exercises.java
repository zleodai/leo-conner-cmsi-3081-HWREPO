// Write your solutions to the exercises in this file.

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Predicate;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Exercises {
    static List<Long> change(long amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount cannot be negative");
        }
        var denominations = List.of(25L, 10L, 5L, 1L);
        var coins = new ArrayList<Long>();
        for (var denomination : denominations) {
            coins.add(amount / denomination);
            amount %= denomination;
        }
        return List.copyOf(coins);
    }

    // Write your first then lower case function here

    // Write your say function here

    // Write your misc file stats function here

    // Your Quaterion and Binary Search Tree solutions will be in different files
}
