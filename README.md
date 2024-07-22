# Homework Template for CMSI 3801

Welcome!

## Instructions

Fork this repo for your homework submissions. After forking, **please replace the contents of this readme** file with information about your submission, including the name(s) of the students and any notes you need to leave for the graders.

Your homework submissions will consist of programs in the following languages. To keep things simple, there is a separate folder for each language.

- **Homework 1**: Lua, Python, JavaScript
- **Homework 2**: OCaml, Haskell, TypeScript
- **Homework 3**: Java, Kotlin, Swift
- **Homework 4**: C, C++, Rust
- **Homework 5**: Go, Gleam, Mojo

At each homework deadline, the graders will clone your repo and run the tests. I will be inspecting the source code, grading your work on style, clarity, and appropriate use of language idioms. Do not throw away points in these areas: **use code formatters and linters**. Please consider it a moral obligation to use these tools. Not doing so is a violation of professional ethics. _You must respect the naming, capitalization, formatting, spacing, and indentation conventions of each language_.

## The Test Suites

The test files are included in the repo already. They are available for YOU! They will help you not only learn the languages and concepts covered in this course, but to help you with professional practice. You should get accustomed to writing code to make tests pass. As you grow in your profession, you will get used to writing your tests early.

The test suites are run like so (assuming you have a Unix-like shell, modify as necessary if you have Windows):

### Lua

```
lua test.lua
```

### Python

```
python3 -m unittest exercises_test.py
```

### JavaScript

```
npm test
```

### OCaml

```
ocamlc exercises.ml test.ml && ./a.out
```

### Haskell

```
ghc ExercisesTest.hs && ./ExercisesTest
```

### TypeScript

```

```

### Java

```
javac -cp junit.jar:. ExercisesTest.java && java -jar junit.jar -cp . -c ExercisesTest
```

### Kotlin

```
kotlin -J-ea test.kts
```

### Swift

```
swiftc -o main exercises.swift main.swift && ./main
```

### C

```
g++ -o exercises test.c exercises.c && ./exercises
```

### C++

```
g++ -std=c++20 -o exercises test.cpp exercises.cpp && ./exercises
```

### Rust

```
cargo test
```

### Go

```
go test exercises_test.go exercises.go
```

### Gleam

```

```

### Mojo

```

```

## Grading Notes

Your grade is a reflection not only of your ability to sling code to pass existing tests, but also of your ability to construct software in a professional setting. Therefore, you will be docked points on your submission if you:

- Fail to follow any submission instructions, such as not replacing the contents of this readme file and not including the names of all participants of any group work.
- Push to your GitHub repository any file that does not belong (including but not limited to that silly `DS_Store`). Make sure all generated executables, intermediate files, third-party libraries, etc. are not committed. Your repo contents should be limited to your solution files, tests, configuration files, and `.gitignore` files.
- Fail to follow naming or formatting guidelines for the language you are writing in. Inconsistent indentation, for example, has no place in professional or student software. Neither does end-of-line whitespace, huge chunks of contiguous blank lines, and other types of messy coding practices that show the world that you don’t care about your work.
