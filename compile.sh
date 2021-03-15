#!/usr/bin/env bash
set -euxo pipefail

# Note: you must suffix the dest path with `/` in order
# for the pandoc macros to be set correctly (they are used
# by the footer links)
function pandoc-path() {
    src=$1 ; shift
    dest=$1 ; shift

    for f in $(ls $src) ; do
        pandoc $src/$f \
                --template _template.html \
                --from markdown+footnotes \
                --to html+auto_identifiers \
                -o ${dest}$(basename $f .md).html
    done
}

THIS_SCRIPT=$(realpath $0)
ROOT=$(dirname $THIS_SCRIPT)

MOVED=""

if [ $ROOT != $PWD ] ; then
    cd $ROOT
    MOVED=true
fi

pandoc-path _posts posts/
pandoc-path _root  ''

if [ $MOVED ] ; then
    cd -
fi