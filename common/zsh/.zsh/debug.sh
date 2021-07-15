#!/usr/bin/env zsh

_debug_log() {
  ([ "$DEBUG_RC" -eq "1" ] && echo "[debug_rc] $*") || true
}
_debug_log "loaded _debug_log function"
