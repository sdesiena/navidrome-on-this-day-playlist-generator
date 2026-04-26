#!/bin/bash

# Change to directory where you keep your Navidrome smart playlists.
OUTPUT_FILE="OnThisDay.nsp"

CURRENT_YEAR=$(date +%Y)
CURRENT_MONTH=$(date +%m)
CURRENT_DAY=$(date +%d)

# JSON
{
    echo "{"
    echo '  "name": "On This Day",'
    echo '  "comment": "Albums released on this day over the past 50 years.",'
    echo '  "any": ['

    # Generate entries for the past 50 years
    for i in $(seq 0 50); do
        # Calculate the year for this iteration
        YEAR=$((CURRENT_YEAR - i))

        # Format the date string YYYY-MM-DD
        DATE_STRING="${YEAR}-${CURRENT_MONTH}-${CURRENT_DAY}"

        # Add comma if it's not the last item
        if [ $i -lt 50 ]; then
            COMMA=","
        else
            COMMA=""
        fi

        cat <<EOF
    {
      "is": {
        "originaldate": "${DATE_STRING}"
      }
    }${COMMA}
EOF
    done

    echo "  ],"
    echo '  "sort": "-originaldate,+album"'
    echo "}"
} > "$OUTPUT_FILE"

echo "Successfully generated $OUTPUT_FILE with 50 years of dates."