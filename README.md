# Number Garden

A single-file math game for a five-year-old who already does Kumon arithmetic and needs the other half: number sense, strategy, patterns, and puzzles with no procedure.

Open `index.html` in any browser. On a phone or tablet, use "Add to Home Screen" and it behaves like an installed app. The layout adapts: one column on a phone, three-column doors and side-by-side picture-book pages from about 700px (iPad, laptop).

**Saving.** Progress is written to the browser's local storage immediately, and, on the published claude.ai page, to the page's cloud database (`db` capability) a moment later. On load the newer of the two wins, so a cleared browser or a second device picks up where she left off. Outside claude.ai (a plain local file) only the browser copy exists.

## Rooms

| Room | Games | What it builds |
|---|---|---|
| Warm-ups | How many? · Make 10 · Which has more? | Subitizing, complements to 10/20/100, comparing groups and numbers and finding the difference |
| Add & take | Take away · Make a ten to add · Find the missing number | Place value (sticks of 10 that break), bridging through ten, missing-addend thinking |
| Patterns | What comes next? · Rule machine | Repeating and growing patterns, function machines |
| Puzzles | Balance it · Which one is different? · Make the money · Sudoku (shapes 4×4 → digits 4×4 → 6×6) · Number riddle · Who has what? (logic grid) · Sort by two things · If this, then that | Reasoning with no algorithm: the seed of competition math |
| Stories | Story mystery · How many ways? | Reading-level word problems in one to two steps, and open questions with several right answers |
| Shapes & space | Mirror it · Count the shapes · Fit the hole · Finish the mirror · Count the cubes | Spatial reasoning: reflections, shapes hidden inside shapes, matching a piece to a gap, completing a symmetric picture, counting cubes you cannot see |
| Playground | Counters and sticks · Number line walk · Balance scale | Free play with no questions: feel ten snapping into a stick, hop a sum along the line, load a scale and watch it tip |
| Time | What time is it? · How long until…? · Days and months | Reading the clock to five minutes, elapsed time by counting on, the week and the year going round |
| Measure | Parts of a whole · How long? · About how many? | Halves and quarters of shapes and of groups, measuring with units laid end to end, estimating against a box of 10 |
| Zoe makes it | You hide the number · You make the rule · You write the story · You make the pattern | She sets the puzzle and the app solves it, checking her answers and teaching when one is off |
| Big Ideas | **Numbers:** Counting on · Skip counting · Tens and ones · Bigger and smaller · Number neighbors **Adding and taking:** Making ten · How far apart · What = really means **Groups:** Even and odd · Double and half · Equal groups · Fair sharing **Time:** Reading the clock · Day and night · Why 24, 60 and 60? · A day on Mars · Before there were clocks · Why time is precious · What is time for? | Six-page picture books narrated by the ladybug (see it, the rule, where you meet it, the trap, your turn by drag-and-drop, it's the same as…), then three try-its and a link to the game |

## How a session works

The home screen is the garden with nine doors. A ladybug mascot bobs on the home screen and in the corner of the play card, jumps on a right answer and tilts her head on a miss. Tapping a door starts a **trail** of five stepping stones (two warm-ups, games from that door, one puzzle). Each solved stone lights up; the fifth plants a flower in the garden. Levels adapt silently and are never shown to the child.

**Zoe's Book** writes one sentence she can read for every problem she solves ("Zoe took 9 away from 23 and got 14"), a bigger entry for each level-up and finished trail, and holds the badge shelf (First Flower, Ten-Breaker, Riddle Solver, Many Ways, Balance Master, Pattern Spotter, Story Reader, Gardener).

The grown-up settings are behind the faint "for grown-ups" link at the bottom of the home screen, with a short Papa page: ideas she has read, strongest games, what needs a second look, her last five book lines.

In Stories and the dots warm-up she can touch each object to count it herself; the touch adds a green number.

**Tell Papa.** Every fourth clean win, a card asks her to explain out loud how she knew before the next stone; tapping "I told Papa" writes it in her book.

**Remember this?** Each trail swaps its puzzle stone for whichever game she hasn't played in three or more days, so older skills come back before they fade.

**Read it to me.** Stories, riddles, how-many-ways and Big Ideas have a speaker button that reads the text aloud (browser speech, where available).

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

Nothing waiting. Add the next idea here.

## Puzzle families

Sudoku and Who-has-what are generators with parameters (grid size, box shape, symbol set, number of clues), so a new variant is a level entry, not a new game. The same pattern is the way to add more: write the generator once, verify the puzzle has one solution (the logic generator brute-forces this), expose difficulty as levels.

## Adding a Big Idea

Each idea is an entry in `IDEAS`: `title`, one-line `line`, `thing` (which object icon to draw), `pages` (each `{say, draw(scene)}`: the ladybug's line and an async function that animates the scene with `dot`, `row`, `appear`, `flyTo`, `tenFrame`, `walkSvg`), one page built with the drag engine (`trayOf`, `zones`, `makeDraggable`, `fullCount`), `tries()` returning `{q, kind:'choice'|'num', opts?, ans, draw, explain, show?}`, the `door` to play afterwards, and the `book` sentence.

## Adding a game

Each game is a `skill({...})` call in `index.html` with an `id`, a `room`, a `title`, a number of `levels`, and a `mount(level)` function that draws into `stage` and `controls` and calls `win(message)` or `miss(hint)`. Each game calls `help({book, clues, answer, why, show})`: `book` is the sentence written in her book, `clues` feed the Clue button, `show` draws the answer. Shared helpers: `pad`, `numpad`, `choices`, `tenFrame`, `numberLine`. Mastery, stars, turns and the garden are handled for you.

## Wrapping as a desktop app

The page has no build step, so it drops straight into an Electron shell or a C# WebView2 window if a native install is ever wanted.
