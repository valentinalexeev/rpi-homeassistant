#!/bin/bash
REPOSITORY="valentinalexeev/rpi-homeassistant"

# prepare version string elements
VERSION=$1

echo "Building RPi Home-Assistant image for version $VERSION"

VERSION_IDS=(${VERSION//\./ })

declare -a TAGS=($REPOSITORY:latest)

VERSION_MAJOR=${VERSION_IDS[0]}.${VERSION_IDS[1]}
TAGS+=($REPOSITORY:$VERSION_MAJOR)

if [ -n "${VERSION_IDS[2]}" ]; then
    TAGS+=($REPOSITORY:$VERSION_MAJOR.${VERSION_IDS[2]})
fi

echo docker build --build-arg version=$VERSION ${TAGS[@]/$REPOSITORY/-t $REPOSITORY} .
docker build --build-arg version=$VERSION ${TAGS[@]/$REPOSITORY/-t $REPOSITORY} .

for i in ${TAGS[*]/-t //}
do
    echo docker push $i
    docker push $i
done
