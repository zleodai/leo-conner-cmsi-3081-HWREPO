import gleeunit
import gleeunit/should
import exercises.{change, NegativeAmount}

pub fn change_test() {
  change(250) |> should.equal(Ok(#(10, 0, 0, 0)))
  change(-50) |> should.equal(Error(NegativeAmount))
  change(0) |> should.equal(Ok(#(0, 0, 0, 0)))
  change(97) |> should.equal(Ok(#(3, 2, 0, 2)))
  change(8) |> should.equal(Ok(#(0, 0, 1, 3)))
  change(144) |> should.equal(Ok(#(5, 1, 1, 4)))
  change(97) |> should.equal(Ok(#(3, 2, 0, 2)))
  change(100000000037) |> should.equal(Ok(#(4000000001, 1, 0, 2)))
  change(10000000000005) |> should.equal(Ok(#(400000000000, 0, 1, 0)))
}

pub fn main() {
  gleeunit.main()
}
