#!/usr/bin/env bash
set -euxo pipefail

# Note: you must suffix the dest path with `/` in order
# for the pandoc macros to be set correctly (they are used
# by the footer links)
function pandoc-path() {
    src=$1 ; shift
    dest=$1 ; shift

    for f in "$src"/* ; do
        pandoc "$f" \
                --template _template.html \
                --from markdown+footnotes \
                --to html+auto_identifiers \
                -o "${dest}""$(basename "$f" .md)".html
    done
}

pandoc-path _posts posts/
pandoc-path _wiki wiki/
pandoc-path _root  ''
