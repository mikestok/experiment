# Experiment

Check to see if I can:

1. Connect to an sqlite3 database with a name supplied at runtime.

## Running Elixir

```
mix deps.get
./build-dbs.sh

SQLITE_FILE=bands1.db mix bands

SQLITE_FILE=bands2.db mix bands
```
