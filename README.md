# Number Garden

A single-file math game for a five-year-old who already does Kumon arithmetic and needs the other half: number sense, strategy, patterns, and puzzles with no procedure.

Open `index.html` in any browser, or play it at https://playmaths.github.io/number-garden/. On a phone or tablet, use "Add to Home Screen": the manifest and service worker (`manifest.webmanifest`, `sw.js`, `icons/`) make it a real installed app with its own icon that works offline. Progress lives in the browser's local storage; the claude.ai copy also saves to the cloud.

**Saving.** Progress is written to the browser's local storage immediately, and, on the published claude.ai page, to the page's cloud database (`db` capability) a moment later. On load the newer of the two wins, so a cleared browser or a second device picks up where she left off. Outside claude.ai (a plain local file) only the browser copy exists.

## Rooms

| Room | Games | What it builds |
|---|---|---|
| Warm-ups | How many? · Make 10 · Which has more? | Subitizing, complements to 10/20/100, comparing groups and numbers and finding the difference |
| Add & take | Take away · Make a ten to add · Find the missing number | Place value (sticks of 10 that break), bridging through ten, missing-addend thinking |
| Patterns | What comes next? · Rule machine | Repeating and growing patterns, function machines |
| Puzzles | Balance it · Which one is different? · Make the money · Sudoku (shapes 4×4 → digits 4×4 → 6×6) · Number riddle · Who has what? (logic grid) · Sort by two things · If this, then that | Reasoning with no algorithm: the seed of competition math |
| Stories | Story mystery · How many ways? | Reading-level word problems in one to two steps, and open questions with several right answers, up to finding every split and counting the ways |
| Shapes & space | Mirror it · Count the shapes · Fit the hole · Finish the mirror · Count the cubes | Spatial reasoning: reflections, shapes hidden inside shapes, matching a piece to a gap, completing a symmetric picture, counting cubes you cannot see |
| Playground | Counters and sticks · Number line walk · Balance scale | Free play with no questions: feel ten snapping into a stick, hop a sum along the line, load a scale and watch it tip |
| Time | What time is it? · How long until…? · Days and months | Reading the clock to five minutes, elapsed time by counting on, the week and the year going round |
| Measure | Parts of a whole · How long? · About how many? | Halves and quarters of shapes and of groups, measuring with units laid end to end, estimating against a box of 10 |
| (Name) makes it | You hide the number · You make the rule · You write the story · You make the pattern | She sets the puzzle and the app solves it, checking her answers and teaching when one is off |
| Big Ideas | **Numbers:** Counting on · Skip counting · Tens and ones · Bigger and smaller · Number neighbors **Adding and taking:** Making ten · How far apart · What = really means **Groups:** Even and odd · Double and half · Equal groups · Fair sharing **Patterns:** Rules and machines **Shapes:** Shapes and mirrors **Measure:** Money · Measuring **Time:** Reading the clock · Day and night · Why 24, 60 and 60? · A day on Mars · Before there were clocks · Why time is precious · What is time for? | Six-page picture books narrated by the ladybug (see it, the rule, where you meet it, the trap, your turn by drag-and-drop, it's the same as…), then three try-its and a link to the game |

## How a session works

The home screen is the garden with nine doors. A ladybug mascot bobs on the home screen and in the corner of the play card, jumps on a right answer and tilts her head on a miss. Tapping a door starts a **trail** of five stepping stones, all from that door (a door with fewer than five games cycles through them, never the same problem twice). Each solved stone lights up; the fifth plants a flower in the garden. Levels adapt silently and are never shown to the child.

**My Book** (or "(Name)'s Book" once a name is set in the grown-ups screen) writes one sentence she can read for every problem she solves ("Sprout took 9 away from 23 and got 14"), a bigger entry for each level-up and finished trail, and holds the badge shelf (First Flower, Ten-Breaker, Riddle Solver, Many Ways, Balance Master, Pattern Spotter, Story Reader, Gardener).

The grown-up settings are behind the faint "for grown-ups" link at the bottom of the home screen, with a short Papa page: ideas she has read, strongest games, what needs a second look, her last five book lines.

In Stories and the dots warm-up she can touch each object to count it herself; the touch adds a green number.

**Tell Papa.** Every fourth clean win, a card asks her to explain out loud how she knew before the next stone; tapping "I told Papa" writes it in her book.

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

A Big Idea is a concept taught, not a game dressed up. Even and odd is the model; a full book has, in order: the idea in one plain sentence; the same idea in a picture; a second and a third way to see it (two teams, counting by twos); the pattern or rule stated outright; the reason the rule works; the traps a child actually falls into (odd is not strange, big is not even, zero is even); where she meets it in life; two kinds of practice (with pictures, then without); and what it is the same as elsewhere in the garden. The try-its then sample every one of those, not just the first picture.

Each idea is an entry in `IDEAS`: `title`, one-line `line`, `thing` (which object icon to draw), `pages` (each `{say, draw(scene)}`: the ladybug's line and an async function that animates the scene with `dot`, `row`, `appear`, `flyTo`, `tenFrame`, `walkSvg`), one page built with the drag engine (`trayOf`, `zones`, `makeDraggable`, `fullCount`), `tries()` returning `{q, kind:'choice'|'num', opts?, ans, draw, explain, show?}`, the `door` to play afterwards, and the `book` sentence.

## Learn, when she wants it

A game can name the Big Idea that teaches its concept (`idea:'ten'`). A **Learn** button then sits beside Clue and Show me; it opens that picture book and its last button brings her back to the same stone. On her second miss Pip offers it: "Want Pip to show you the idea? Tap Learn."

## Teach first

A game can carry a `teach(lv, lesson)` function. The first time she meets that level, Pip runs it before any question: `lesson.say(html)` fills her bubble, `lesson.scene` is the stage to draw in, and `await lesson.wait(ms)` paces the animation (it stops cleanly if she taps **My turn** early). A **Watch** button beside Clue and Show me replays it any time. The three Time games have lessons; add one to any game where asking first would be unfair.

## Adding a game

Each game is a `skill({...})` call in `index.html` with an `id`, a `room`, a `title`, a number of `levels`, an optional `teach(level, lesson)`, and a `mount(level)` function that draws into `stage` and `controls` and calls `win(message)` or `miss(hint)`. Each game calls `help({book, clues, answer, why, show})`: `book` is the sentence written in her book, `clues` feed the Clue button, `show` draws the answer. Shared helpers: `pad`, `numpad`, `choices`, `tenFrame`, `numberLine`. Mastery, stars, turns and the garden are handled for you.

## Wrapping as a desktop app

The page has no build step, so it drops straight into an Electron shell or a C# WebView2 window if a native install is ever wanted.
