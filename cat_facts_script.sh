#!/bin/bash

API_URL="https://catfact.ninja/fact"
OUTPUT_FILE="Random_Cat_Facts.txt"

DEFAULT_FACTS_COUNT=1

clear_file() {
    > "$OUTPUT_FILE"
    echo "File cleared."
}

while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -n|--number)
            FACTS_COUNT="$2"
            shift
            shift
        ;;
        -h|--help)
            echo "Usage: $0 [-n|--number NUMBER] [-c|--clear] [--help]"
            echo " -n, --number Specify the number of cat facts to fetch and append."
            echo " -c, --clear Clear all contents in the output file."
            exit 0
        ;;
        -c|--clear)
            clear_file
            exit 0
        ;;
        *)
            echo "Unknown option: $1"
            echo "Usage: $0 [-n|--number NUMBER] [-c|--clear] [--help]"
            exit 1
        ;;
    esac
done

if [ -z "$FACTS_COUNT" ]; then
    FACTS_COUNT=$DEFAULT_FACTS_COUNT
fi

date=$(date "+%Y-%m-%d %H:%M:%S")

for ((i = 0; i < FACTS_COUNT; i++)); do
    fact=$(curl -s "$API_URL" | jq -r '.fact')
    echo -e "\n--- Fact $((i + 1)) ---\nDate Added: $date\n$fact\n" >> "$OUTPUT_FILE"
done

echo "$FACTS_COUNT cat facts appended to $OUTPUT_FILE"

# Running "./cat_facts_script.sh" will call the catfact API and store the response in the Random_Cat_Facts.txt file.
