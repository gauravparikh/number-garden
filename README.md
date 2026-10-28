# Number Garden

A single-file math game for a five-year-old who already does Kumon arithmetic and needs the other half: number sense, strategy, patterns, and puzzles with no procedure.

Open `index.html` in any browser. On a phone or tablet, use "Add to Home Screen" and it behaves like an installed app. Nothing is sent anywhere; progress lives in the browser's local storage.

## Rooms

| Room | Games | What it builds |
|---|---|---|
| Warm-ups | How many? · Make 10 | Subitizing, complements to 10/20/100 |
| Add & take | Take away · Make a ten to add · Find the missing number | Place value (sticks of 10 that break), bridging through ten, missing-addend thinking |
| Patterns | What comes next? · Rule machine | Repeating and growing patterns, function machines |
| Puzzles | Balance it · Which one is different? · Make the money · Mini sudoku · Number riddle | Reasoning with no algorithm: the seed of competition math |

## Design rules

- No timers anywhere. Speed is never rewarded.
- A star is earned for finishing a problem, not for a first-try answer.
- Wrong answers get a hint that points at the structure, never an X.
- Levels adapt on their own: three clean problems in a row moves up, two hint-heavy problems moves down. The gear menu lets a grown-up nudge any level.
- "Me & Dad" mode alternates turns on the same games so the child watches an adult think out loud.
- Every two stars plants a flower in the garden strip at the top.

## Adding a game

Each game is a `skill({...})` call in `index.html` with an `id`, a `room`, a `title`, a number of `levels`, and a `mount(level)` function that draws into `stage` and `controls` and calls `win(message)` or `miss(hint)`. Shared helpers: `pad`, `numpad`, `choices`, `tenFrame`, `numberLine`. Mastery, stars, turns and the garden are handled for you.

## Wrapping as a desktop app

The page has no build step, so it drops straight into an Electron shell or a C# WebView2 window if a native install is ever wanted.
