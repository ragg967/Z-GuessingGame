const std = @import("std");
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();
const RndGen = std.Random.DefaultPrng;

pub fn main() !void {
    // Use the system's random number generator to seed your PRNG
    var seed_bytes: [8]u8 = undefined;
    std.crypto.random.bytes(&seed_bytes);
    const seed = std.mem.readInt(u64, &seed_bytes, .little);
    var rnd = RndGen.init(seed);

    // Generate number between 1-100
    const number_to_guess: u8 = rnd.random().intRangeAtMost(u8, 1, 100);

    // initial gratings
    try stdout.print("\nGoal: Guess the number I'm thinking of (1-100)\n", .{});

    // mem buffer
    var buffer: [256]u8 = undefined;

    // actual game logic
    while (true) {
        try stdout.print("> ", .{});

        if (try stdin.readUntilDelimiterOrEof(buffer[0..], '\n')) |input| {
            const trimmed_input = std.mem.trim(u8, input, " \t\n\r");

            // Handle empty input
            if (trimmed_input.len == 0) {
                continue;
            }

            // Check for exit command
            if (std.mem.eql(u8, trimmed_input, "exit")) {
                try stdout.print("👋 Bye bye! Thanks for playing! See you next time! 🎮✨\n", .{});
                break;
            }

            // Parse the input string to a number
            const guess = std.fmt.parseInt(u8, trimmed_input, 10) catch {
                try stdout.print("Please enter a valid number between 1-100\n", .{});
                continue;
            };

            // Check if guess is in valid range
            if (guess < 1 or guess > 100) {
                try stdout.print("Please enter a number between 1-100\n", .{});
                continue;
            }

            // Compare the input
            switch (std.math.order(guess, number_to_guess)) {
                .lt => try stdout.print("📈 Too low! Try higher! ⬆️\n", .{}),
                .gt => try stdout.print("📉 Too high! Try lower! ⬇️\n", .{}),
                .eq => {
                    try stdout.print("🎉🎊 WINNER! 🏆 The number was {d}! 🎯\n", .{number_to_guess});
                    break;
                },
            }
        }
    }
}
