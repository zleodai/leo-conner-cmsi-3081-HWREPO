import { describe, it } from "node:test"
import { deepEqual, throws } from "node:assert/strict"
import { change } from "../exercises.js"

describe("The change function", () => {
  it("works for 0", () => {
    deepEqual(change(0), [0, 0, 0, 0])
  })
  it("throws on negative", () => {
    throws(() => change(-50), /RangeError/)
  })
  it("works for the usual cases", () => {
    deepEqual(change(1), [0, 0, 0, 1])
    deepEqual(change(99), [3, 2, 0, 4])
    deepEqual(change(42), [1, 1, 1, 2])
  })
  it("works for fractions of cents", () => {
    deepEqual(change(33.375), [1, 0, 1, 3.375])
  })
  it("can handle really big values", () => {
    deepEqual(change(100000000037), [4000000001, 1, 0, 2])
    deepEqual(change(10000000000005), [400000000000, 0, 1, 0])
  })
})
