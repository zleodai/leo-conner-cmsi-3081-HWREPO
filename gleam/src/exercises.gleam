pub type ChangeError {
  NegativeAmount
}

fn divmod(a: Int, b: Int) -> #(Int, Int) {
  #(a / b, a % b)
}

pub fn change(amount: Int) -> Result(#(Int, Int, Int, Int), ChangeError) {
  case amount < 0 {
    True -> Error(NegativeAmount)
    False -> {
        let #(quarters, remaining) = divmod(amount, 25)
        let #(dimes, remaining) = divmod(remaining, 10)
        let #(nickels, remaining) = divmod(remaining, 5)
        let pennies = remaining
        Ok(#(quarters, dimes, nickels, pennies))
    }
  }
}
