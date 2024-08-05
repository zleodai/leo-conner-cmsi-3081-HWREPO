import { describe, it } from "node:test"
import { deepEqual, throws } from "node:assert/strict"
import {
  change,
  // stretched,
  // say,
  // powersGenerator,
  // miscFileStats,
  // Quaternion,
} from "../exercises.js"

describe("The change function", () => {
  it("throws for fractions of cents", () => {
    throws(() => change(33.375), /TypeError/)
  })
  it("throws on negative", () => {
    throws(() => change(-50), /RangeError/)
  })
  it("works for 0", () => {
    deepEqual(change(0), [0, 0, 0, 0])
  })
  it("works for the usual cases", () => {
    deepEqual(change(1), [0, 0, 0, 1])
    deepEqual(change(99), [3, 2, 0, 4])
    deepEqual(change(42), [1, 1, 1, 2])
  })
  it("can handle really big values", () => {
    deepEqual(change(100000000037), [4000000001, 1, 0, 2])
    deepEqual(change(10000000000005), [400000000000, 0, 1, 0])
  })
})

// Uncomment the following tests as you complete the exercises
// and remove this comment that tells you to uncomment!

// describe("The stretched function", () => {
//   it("works", () => {
//     deepEqual(stretched(""), "")
//     deepEqual(stretched("  "), "")
//     deepEqual(stretched("  \t\n  \t"), "")
//     deepEqual(stretched("  Hi  hi  "), "Hiihhhiiii")
//     deepEqual(stretched("a        π§"), "aππ§§§")
//     deepEqual(stretched("😁😂😱"), "😁😂😂😱😱😱")
//     deepEqual(stretched(" 😄   🤗 💀  "), "😄🤗🤗💀💀💀")
//     deepEqual(
//       stretched("hello world"),
//       "heelllllllooooowwwwwwooooooorrrrrrrrllllllllldddddddddd"
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

// describe("The miscFileStats function", async () => {
//   it("returns an object with an error if no such file", async () => {
//     const stats = await miscFileStats("NoSuchFile.txt")
//     deepEqual(stats, { error: "No such file" })
//   })
//   it("computes stats for the test file", async () => {
//     const stats = await miscFileStats("../test-for-line-count.txt")
//     deepEqual(stats, { lineCount: 13, blankLineCount: 7, hashedLineCount: 2 })
//   })
// })

// describe("The Quaternion class", () => {
//   it("can echo coefficients", () => {
//     deepEqual(new Quaternion(8, 5, -3, 1).coefficients(), [8, 5, -3, 1])
//     deepEqual(new Quaternion(0, 0, 0, 0).coefficients(), [0, 0, 0, 0])
//   })
//   it("adds correctly", () => {
//     const q1 = new Quaternion(13, 21, -5, -21)
//     const q2 = new Quaternion(2, -1, -55, 2.5)
//     deepEqual(q1.plus(q2).coefficients(), [15, 20, -60, -18.5])
//   })
//   it("multiples correctly", () => {
//     const q1 = new Quaternion(3, -5, 1, -8)
//     const q2 = new Quaternion(2, -13, -2, 3)
//     deepEqual(q1.times(q2).coefficients(), [-33, -62, 115, 16])
//   })
// })
