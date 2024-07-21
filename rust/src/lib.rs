// Write your solutions to the exercises in this file.

pub fn change(amount: i64) -> Result<(i64, i64, i64, i64), &'static str> {
    if amount < 0 {
        return Err("Amount must be positive");
    }

    let mut coins = vec![];
    let mut remaining = amount;
    for coin in vec![25, 10, 5] {
        let count = remaining / coin;
        coins.push(count);
        remaining -= count * coin;
    }
    coins.push(remaining);
    Ok((coins[0], coins[1], coins[2], coins[3]))
}
