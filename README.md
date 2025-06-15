# Z-GuessingGame

A simple number guessing game written in Zig where you try to guess a randomly generated number between 1 and 100.

## Description

This is a command-line guessing game that generates a random number between 1 and 100, and challenges you to guess it. The game provides feedback after each guess, telling you whether your guess is too high, too low, or correct. You can exit the game prematurely with the 'exit' command.

## Features

- Random number generation between 1-100
- Input validation (ensures valid numbers within range)
- Helpful feedback for each guess
- Simple command-line interface
- Debug mode showing the target number

## Prerequisites

- Zig compiler (minimum version 0.14.0)

## Building

To build the project:

```bash
zig build
```

## Running

To run the game:

```bash
zig build run
```

Or build and run the executable directly:

```bash
zig build
./zig-out/bin/Z-GurssingGame
```

## How to Play

1. Run the game
2. The game will generate a random number between 1 and 100
3. Enter your guess when prompted with `> `
4. The game will tell you if your guess is:
   - Too high
   - Too low  
   - Correct (you win!)
5. Keep guessing until you find the correct number

## Example Game play

```
Goal: Guess the number I'm thinking of (1-100)
Debug: the number is 42
> 50
Too high! Try again.
> 25
Too low! Try again.
> 42
🎉 You win! The number was 42
```

## Testing

To run tests:

```bash
zig build test
```

## Project Structure

```
├── build.zig          # Build configuration
├── build.zig.zon      # Package configuration
├── src/
│   └── main.zig       # Main game logic
└── .gitignore         # Git ignore rules
```

## License

This project is open source and available under the MIT license.
