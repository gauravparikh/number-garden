#!/bin/sh
# runs every check; needs Node and Playwright (npm i -D playwright && npx playwright install chromium)
cd "$(dirname "$0")" || exit 1
fail=0
for t in syntax.js smoke.js trails.js books.js sync.js solve-*.js; do node "$t" || fail=1; done
[ $fail = 0 ] && echo "all checks passed" || { echo "some checks FAILED"; exit 1; }
