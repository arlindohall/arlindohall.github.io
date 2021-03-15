#!/usr/bin/env bash
set -euxo pipefail

THIS_SCRIPT=$(realpath $0)
ROOT=$(dirname $THIS_SCRIPT)

MOVED=""

if [ $ROOT != $PWD ] ; then
    cd $ROOT
    MOVED=true
fi

for f in $(ls _posts) ; do
    pandoc _posts/$f \
            --template _template.html \
            --from markdown+footnotes \
            --to html+auto_identifiers \
            -o posts/$(basename $f .md).html
done

if [ $MOVED ] ; then
    cd -
fi