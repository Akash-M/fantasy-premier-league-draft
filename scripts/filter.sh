#!/bin/bash

# Usage:
# ./filter.sh <json_file> <key1>=<value1> [<key2>=<value2> ...]
# Example:
# ./filter.sh players.json teamName=Leeds age=26

filter_players() {
  local json_file="$1"
  shift

  local jq_filter=""
  for kv in "$@"; do
    key="${kv%%=*}"
    value="${kv#*=}"
    # Detect if value is numeric or boolean
    if [[ "$value" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
      jq_filter+=" and .${key} == ${value}"
    elif [[ "$value" == "true" || "$value" == "false" ]]; then
      jq_filter+=" and .${key} == ${value}"
    else
      jq_filter+=" and .${key} == \"${value}\""
    fi
  done

  # Remove leading ' and '
  jq_filter="${jq_filter# and }"

  jq ".playerTableStats[] | select(${jq_filter})" "$json_file"
}

# If run directly, call the function with arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
  filter_players "$@"
fi

