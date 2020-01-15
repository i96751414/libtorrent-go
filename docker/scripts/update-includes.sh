#!/usr/bin/env bash

set -ex

scripts_path=$(dirname "$(readlink -f "$0")")
if [ -z "${LIBTORRENT_INCLUDE}" ]; then
  LIBTORRENT_INCLUDE="${scripts_path}/libtorrent"
fi

function fileReplace() {
  if [ "$1" = "-n" ]; then
    args=(-e ':a' -e 'N' -e '$!ba')
    shift
  fi
  sed -i -E "${args[@]}" -e "s/$1/$2/g" "${LIBTORRENT_INCLUDE}/$3"
}

function filesReplace() {
  if [ "$1" = "-n" ]; then
    args=("$1")
    shift
  fi
  re="$1"
  sub="$2"
  shift 2
  for file in "$@"; do
    fileReplace "${args[@]}" "${re}" "${sub}" "${file}"
  done
}

function replaceDefinitionDefaultArgument() {
  re="$1"
  sub="$2"
  shift 2
  filesReplace "=[ ]*${re}([^;]*\))" "= ${sub}\2" "$@"
}

function replaceVariableAssignment() {
  re="$1"
  sub="$2"
  shift 2
  filesReplace "=[ ]*${re}[ ]*;" "= ${sub};" "$@"
}

w="[[:alnum:]:_<>]"
d="[0-9]"
function removeReduntantParentheses() {
  filesReplace "\((${w}+)\)([ ]*\()" "\1\2" "$@"
}

function removeNoreturn() {
  filesReplace "\[\[noreturn\]\][ ]*" "" "$@"
}

function replaceStructDefaultArgument() {
  replaceDefinitionDefaultArgument "(${w}+)[ ]*\{[ ]*\}" "\1()" "$@"
}

function replaceBits() {
  replaceVariableAssignment "(${d}+)_bit" "bit_t{static_cast<int>(\1)}" "$@"
}

function replaceFinals() {
  filesReplace -n "\bfinal(\s*[:])" "\1" "$@"
}

echo "Updating includes on ${LIBTORRENT_INCLUDE}"

removeReduntantParentheses \
  "sha1_hash.hpp" \
  "announce_entry.hpp" \
  "bandwidth_limit.hpp"

removeNoreturn \
  "torrent_handle.hpp"

replaceStructDefaultArgument \
  "file.hpp"

replaceBits "file.hpp" \
  "disk_io_job.hpp" \
  "file_storage.hpp" \
  "peer_info.hpp" \
  "torrent_handle.hpp" \
  "alert.hpp" \
  "create_torrent.hpp" \
  "pex_flags.hpp" \
  "torrent_flags.hpp" \
  "session_handle.hpp" \
  "alert_types.hpp"

#replaceFinals \
#  "alert_types.hpp"
