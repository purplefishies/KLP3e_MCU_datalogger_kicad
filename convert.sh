#!/bin/bash


TAG_COMMIT=$(git rev-list --abbrev-commit --tags --max-count=1)
# `2>/dev/null` suppress errors and `|| true` suppress the error codes.
TAG=$(git describe --abbrev=0 --tags ${TAG_COMMIT} 2>/dev/null || true)
# here we strip the version prefix
VERSION=${TAG}
if [[ $VERSION -eq "" ]] ; then
    COMMIT=$(git rev-parse --short=5 HEAD)
    DATE=$( git log -1 --format=%cd --date=format:"%Y%m%d")
    VERSION=${COMMIT}-${DATE}
fi

echo $VERSION

