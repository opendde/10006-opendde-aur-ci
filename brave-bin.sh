#!/usr/bin/env bash
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

# Allow users to override command-line options
USER_FLAGS_FILE="$XDG_CONFIG_HOME/brave-flags.conf"
if [[ -f "$USER_FLAGS_FILE" ]]; then
   mapfile -t USER_FLAGS < <(sed 's/#.*//g' "$USER_FLAGS_FILE")
fi

export CHROME_VERSION_EXTRA="stable"

exec /usr/lib/brave-bin/brave "$@" "${USER_FLAGS[@]}"
