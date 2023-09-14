#!/bin/bash

# Check if the year argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <year>"
    exit 1
fi

YEAR="$1"
NUM_DAYS=25  # Number of days

# Create the year's directory as a Cargo package with the desired name
YEAR_DIR="y$YEAR"
cargo new --bin "$YEAR_DIR"

# Create the `src/bin` directory if it doesn't exist
mkdir -p "$YEAR_DIR/src/bin"

# Create the `inputs` directory if it doesn't exist
mkdir -p "$YEAR_DIR/inputs"

# Create binaries for all days inside `src/bin`
for ((i = 1; i <= NUM_DAYS; i++)); do
    DAY="d$i"
    
    # Create a binary for the day inside `src/bin`
    DAY_BIN="$YEAR_DIR/src/bin/$DAY.rs"
    touch "$DAY_BIN"

    # Create an empty data.txt file for the day inside `inputs`
    DATA_FILE="$YEAR_DIR/inputs/$DAY-data.txt"
    touch "$DATA_FILE"
    
    echo "Created binary and data for $YEAR Advent of Code - Day $i."
done

