#!/bin/bash

API_URL="https://catfact.ninja/fact"

OUTPUT_FILE="Random_Cat_Facts.txt"

echo -e "\n--- $(date) ---\n" >> "$OUTPUT_FILE"

curl -s "$API_URL" >> "$OUTPUT_FILE"

echo ""API response saved to $OUTPUT_FILE""

#Running "./cat_facts_script.sh" will call the catfact API and store the response in the Random_Cat_Facts.txt file.
