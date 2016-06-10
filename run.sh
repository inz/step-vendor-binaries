#!/bin/bash

main() {
  set +e
  vendor_binaries
  set -e
}

vendor_binaries() {
  # Adapted from https://github.com/peterkeen/heroku-buildpack-vendorbinaries/blob/master/bin/compile
  if [ -f .vendor_urls ]; then
    while read url; do
      if [ -n "$url" ]; then # incase ensure_newline_at_eof_on_save is enabled
        echo Vendoring $url

        extension="${url##*.}" # http://stackoverflow.com/q/965053
        case "$extension" in
          gz)
            flag="-z"
            ;;
          xz)
            flag="--xz"
            ;;
          bz2)
            flag="--bzip2"
            ;;
          *)
            flag=""
            ;;
        esac

        curl -L --silent $url | tar x $flag
      fi
    done < .vendor_urls
  fi
}

main;