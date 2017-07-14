# tibetan_utils

This is a port of my
[tibetan-utils](https://hackage.haskell.org/package/tibetan-utils) library. 

As it stands, I'm waiting for Unicode support for this to work.

## Installation

First, get [lightyear](https://github.com/ziman/lightyear) and install that
along with [composition](https://github.com/vmchale/composition).
Then:

```
git clone https://github.com/vmchale/tibetan_utils.git
cd tibetan_utils
idris --install tibetan_utils.ipkg
```

## Tests

To run the test suits, additionally install [specdris](https://github.com/pheymann/specdris). Then:

```
idris --testpkg tibetan_tests.ipkg
```
