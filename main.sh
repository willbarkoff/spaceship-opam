#
# OPAM
#
# Opam is the OCaml package manager. It includes a feature that allows switching
# between OCaml versions.
# Link: https://opam.ocaml.org

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_OPAM_SHOW="${SPACESHIP_OPAM_SHOW=true}"
SPACESHIP_OPAM_PREFIX="${SPACESHIP_OPAM_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_OPAM_SUFFIX="${SPACESHIP_OPAM_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_OPAM_SYMBOL="${SPACESHIP_OPAM_SYMBOL="🐫 "}"
SPACESHIP_OPAM_COLOR="${SPACESHIP_OPAM_COLOR="yellow"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_opam() {
  [[ $SPACESHIP_OPAM_SHOW == false ]] && return

  # If there are OCaml-specific files in current directory.
  [[ -f _opam || -n *.ml(#qN^/) || -n *.mli(#qN^/) ]] || return

  spaceship::exists opam || return

  # opam switch show shows the currently selected switch
  local current_switch=$(opam switch show)

  spaceship::section \
    "$SPACESHIP_OPAM_COLOR" \
    "$SPACESHIP_OPAM_PREFIX" \
    "${SPACESHIP_OPAM_SYMBOL}${current_switch}" \
    "$SPACESHIP_OPAM_SUFFIX"
}
