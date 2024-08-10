import { describe, it } from "node:test"
import { deepEqual, throws, rejects } from "node:assert/strict"
import {
  change,
  // firstThenLowerCase,
  // say,
  // powersGenerator,
  // fileStats,
  // Quaternion,
} from "./exercises.js"

describe("The change function", () => {
  it("throws for fractions of cents", () => {
    throws(() => change(33.375), /TypeError/)
  })
  it("throws on negative", () => {
    throws(() => change(-50), /RangeError/)
  })
  it("works for 0", () => {
    deepEqual(change(0), { 25: 0, 10: 0, 5: 0, 1: 0 })
  })
  it("works for the usual cases", () => {
    deepEqual(change(1), { 25: 0, 10: 0, 5: 0, 1: 1 })
    deepEqual(change(99), { 25: 3, 10: 2, 5: 0, 1: 4 })
    deepEqual(change(42), { 25: 1, 10: 1, 5: 1, 1: 2 })
  })
  it("can handle really big values", () => {
    deepEqual(change(100000000037), { 25: 4000000001, 10: 1, 5: 0, 1: 2 })
    deepEqual(change(10000000000005), { 25: 400000000000, 10: 0, 5: 1, 1: 0 })
  })
})

// Uncomment the following tests as you complete the exercises
// and remove this comment that tells you to uncomment!

// describe("The firstThenLowerCase function", () => {
//   const nonEmpty = (s) => s !== ""
//   const lengthGreaterThan3 = (s) => s.length > 3
//   it("works", () => {
//     deepEqual(firstThenLowerCase([], nonEmpty), undefined)
//     deepEqual(firstThenLowerCase(["", "A", "B"], nonEmpty), "a")
//     deepEqual(
//       firstThenLowerCase(["", "A", "ABC"], lengthGreaterThan3),
//       undefined
//     )
//     deepEqual(
//       firstThenLowerCase(["ABC", "ABCD", "ABCDE"], lengthGreaterThan3),
//       "abcd"
//     )
//   })
// })

// describe("The say function", () => {
//   it("works when there are no words", () => {
//     deepEqual(say(), "")
//   })
//   it("works when there are words", () => {
//     deepEqual(say("hi")(), "hi")
//     deepEqual(say("hi")("there")(), "hi there")
//     deepEqual(
//       say("hello")("my")("name")("is")("Colette")(),
//       "hello my name is Colette"
//     )
//   })
//   it("handles spaces and empty words", () => {
//     deepEqual(say("h i")(), "h i")
//     deepEqual(say("hi ")("   there")(), "hi     there")
//     deepEqual(say("")("")("dog")("")("go")(), "  dog  go")
//   })
//   it("handles emojis", () => {
//     deepEqual(say("😄🤗")("💀👊🏾")(), "😄🤗 💀👊🏾")
//   })
// })

// describe("The powers generator", () => {
//   it("works as expected", () => {
//     const g1 = powersGenerator(2, 1)
//     deepEqual(g1.next(), { value: 1, done: false })
//     deepEqual(g1.next(), { value: undefined, done: true })
//     const g2 = powersGenerator(3, 100)
//     deepEqual(g2.next(), { value: 1, done: false })
//     deepEqual(g2.next(), { value: 3, done: false })
//     deepEqual(g2.next(), { value: 9, done: false })
//     deepEqual(g2.next(), { value: 27, done: false })
//     deepEqual(g2.next(), { value: 81, done: false })
//     deepEqual(g2.next(), { value: undefined, done: true })
//     deepEqual([...powersGenerator(3, 27)], [1, 3, 9, 27])
//   })
// })

// describe("The fileStats function", async () => {
//   it("throws if no such file", async () => {
//     rejects(async () => await fileStats("NoSuchFile.txt"), /Error/)
//   })
//   it("computes stats for the test file", async () => {
//     const stats = await fileStats("../test-for-line-count.txt")
//     deepEqual(stats, { lineCount: 13, blankLineCount: 7, hashedLineCount: 2 })
//   })
// })

// describe("The Quaternion class", () => {
//   it("can echo coefficients", () => {
//     const q1 = new Quaternion(8, 5, -3, 1)
//     deepEqual(q1.coefficients(), [8, 5, -3, 1])
//     deepEqual(q1.conjugate(), new Quaternion(8, -5, 3, -1))
//     const q2 = new Quaternion(0, 0, 0, 0)
//     deepEqual(q2.coefficients(), [0, 0, 0, 0])
//     deepEqual(q2.conjugate(), new Quaternion(0, 0, 0, 0))
//   })
//   it("adds correctly", () => {
//     const q1 = new Quaternion(13, 21, -5, -21)
//     const q2 = new Quaternion(2, -1, -55, 2.5)
//     deepEqual(q1.plus(q2).coefficients(), [15, 20, -60, -18.5])
//     deepEqual(q1.plus(q2).conjugate(), new Quaternion(15, -20, 60, 18.5))
//   })
//   it("multiples correctly", () => {
//     const q1 = new Quaternion(3, -5, 1, -8)
//     const q2 = new Quaternion(2, -13, -2, 3)
//     deepEqual(q1.times(q2).coefficients(), [-33, -62, 115, 16])
//     deepEqual(q1.times(q2).conjugate(), new Quaternion(-33, 62, -115, -16))
//   })
// })
