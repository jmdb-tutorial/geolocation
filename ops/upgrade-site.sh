#!/usr/bin/env bash

set -eoux pipefail

read -p "Enter a version number: " VERSION

INSTALL_DIR="ixcode.org-v${VERSION}"

echo "Creating new dir ${INSTALL_DIR}..."
mkdir ${INSTALL_DIR}

cd ${INSTALL_DIR}

tar xfvz ../site.tgz

cd ..

# f to force the overwrite
# h to not follow symbolic links needed in order to force replace of an existing link

if [[ `uname` == "Linux" ]]; then
    ln -sfn ${INSTALL_DIR} ixcode.org
else
    ln -sfh ${INSTALL_DIR} ixcode.org
fi

echo "Completed upgrade to ${VERSION}. Site should be available."
ls -lart ixcode.org
