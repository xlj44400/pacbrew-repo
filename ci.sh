#!/usr/bin/env bash

PKGS=(sdk libcxx bzip2 zlib mbedtls xz libarchive lua tinyxml2 libsamplerate
      SDL2 libpng libjpeg-turbo libwebp freetype libconfig libsodium
      SDL2_mixer SDL2_ttf SDL2_image SDL2_net curl ffmpeg)

sudo pacman --noconfirm --remove ps5-payload-dev

for PKG in ${PKGS[*]} ; do
    pushd $PKG || exit 1
    rm -f *.pkg.tar.gz
    rm -rf src pkg
    makepkg -c -f || exit 1
    sudo pacman --noconfirm -U ./ps5-payload-*.pkg.tar.gz || exit 1
    popd
done