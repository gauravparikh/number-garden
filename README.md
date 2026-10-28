# Number Garden

A single-file math game for a five-year-old who already does Kumon arithmetic and needs the other half: number sense, strategy, patterns, and puzzles with no procedure.

Open `index.html` in any browser. On a phone or tablet, use "Add to Home Screen" and it behaves like an installed app.

**Saving.** Progress is written to the browser's local storage immediately, and, on the published claude.ai page, to the page's cloud database (`db` capability) a moment later. On load the newer of the two wins, so a cleared browser or a second device picks up where she left off. Outside claude.ai (a plain local file) only the browser copy exists.

## Rooms

| Room | Games | What it builds |
|---|---|---|
| Warm-ups | How many? · Make 10 | Subitizing, complements to 10/20/100 |
| Add & take | Take away · Make a ten to add · Find the missing number | Place value (sticks of 10 that break), bridging through ten, missing-addend thinking |
| Patterns | What comes next? · Rule machine | Repeating and growing patterns, function machines |
| Puzzles | Balance it · Which one is different? · Make the money · Mini sudoku · Number riddle | Reasoning with no algorithm: the seed of competition math |
| Stories | Story mystery · How many ways? | Reading-level word problems in one to two steps, and open questions with several right answers |
| Zoe makes it | You hide the number · You make the rule | She sets the puzzle and the app solves it, checking her answers and teaching when one is off |
| Big Ideas | Even and odd · How far apart · Tens and ones · Bigger and smaller · Making ten · Double and half | Concept pages she reads herself: a short explanation, a hands-on demo, three try-it questions, then a link to the game that uses the idea |

## How a session works

The home screen is the garden with five doors. Tapping a door starts a **trail** of five stepping stones (two warm-ups, games from that door, one puzzle). Each solved stone lights up; the fifth plants a flower in the garden. Levels adapt silently and are never shown to the child.

**Zoe's Book** writes one sentence she can read for every problem she solves ("Zoe took 9 away from 23 and got 14"), a bigger entry for each level-up and finished trail, and holds the badge shelf (First Flower, Ten-Breaker, Riddle Solver, Many Ways, Balance Master, Pattern Spotter, Story Reader, Gardener).

The grown-up settings are behind the faint "for grown-ups" link at the bottom of the home screen, with a short Papa page: ideas she has read, strongest games, what needs a second look, her last five book lines.

In Stories and the dots warm-up she can touch each object to count it herself; the touch adds a green number.

## Design rules

- One thing on screen at a time. No tabs, no counters, no level tags visible to her.
- No timers anywhere. Speed is never rewarded.
- A star is earned for finishing a problem, not for a first-try answer.
- Wrong answers get a hint that points at the structure, never an X.
- Levels adapt on their own: three clean problems in a row moves up, two hint-heavy problems moves down. The gear menu lets a grown-up nudge any level.
- "Me & Dad" mode alternates turns on the same games so the child watches an adult think out loud.
- Every finished trail plants a flower. Confetti is reserved for flowers, level-ups, and 5- and 10-in-a-row streaks.
- Streaks count first-try answers in a row within a session; they are celebrated, never punished, and there is no daily streak to break.
- The home screen greets her by name with what she did last time and a rotating one-line motto; Papa can leave a note from the grown-up screen.

## Ideas queued

- "You write the story": she picks a thing and two numbers, Papa solves it
- "You make the pattern": she builds a pattern, the app continues it
- Shapes & space room (tangram fits, counting squares, symmetry)
- Place value room (10 more / 10 less, build a number from sticks)

## Adding a Big Idea

Each idea is an entry in `IDEAS`: `title`, one-line `line`, `words` (the explanation, reading level, with `<em>` on the key terms), `demo(box, btns)` that draws something she can poke, `tries()` returning `{q, kind:'choice'|'num', opts?, ans, draw, explain, show?}`, the `door` to play afterwards, and the `book` sentence.

## Adding a game

Each game is a `skill({...})` call in `index.html` with an `id`, a `room`, a `title`, a number of `levels`, and a `mount(level)` function that draws into `stage` and `controls` and calls `win(message)` or `miss(hint)`. Each game calls `help({book, clues, answer, why, show})`: `book` is the sentence written in her book, `clues` feed the Clue button, `show` draws the answer. Shared helpers: `pad`, `numpad`, `choices`, `tenFrame`, `numberLine`. Mastery, stars, turns and the garden are handled for you.

## Wrapping as a desktop app

The page has no build step, so it drops straight into an Electron shell or a C# WebView2 window if a native install is ever wanted.
