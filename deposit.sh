#!/bin/bash
BALANCE=$(yarn --cwd ~/ironfish/ironfish-cli/ start accounts:balance)
AMOUNT=$(echo $BALANCE | grep -Eo 'spend\: \$IRON ([0-9]+\.[0-9]+)' | cut -c 13-)
if (( $(echo "$AMOUNT >= 0.10000001" |bc -l) )); then
    $(yarn --cwd ~/ironfish/ironfish-cli/ start deposit --confirm)
fi
