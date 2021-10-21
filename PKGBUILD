# Maintainer: Ben Cooper <contactme@bengcooper.co.uk>
# Contributor: Johan Förberg <johan@forberg.se>
pkgname=magicq
pkgver=1.9.1.6
pkgrel=1
pkgdesc='Lighting control software from ChamSys'
arch=(x86_64)
url='https://chamsyslighting.com/products/magicq'
groups=()
options=('!strip') # Binaries are already stripped.

source=('http://files.magicq.co.uk/v1_9_1_6/magicq_ubuntu_v1_9_1_6.deb')
sha1sums=('4061bbab7aee24f4e5e54eae86d6de55d33ee120')

# I've been unable to find any formal license for Magicq. The website only
# states that it's available free of charge. There don't seem to be any
# restrictions on use, except that some features are disabled unless Chamsys
# hardware is detected.
license=(unknown)

package() {
    depends=(alsa-lib ffmpeg glu gst-plugins-base gst-plugins-good
    libarchive libcups libusb libx11 libxcb qt5-multimedia qt5-webkit zlib)

    cd "$pkgdir"

    bsdtar xf "$srcdir/data.tar.xz"

    # We use the system libraries instead of the bundled binaries.
    rm -rf opt/magicq/lib*.so*

    # Magicq expects to be able to write these directories.
    # The directory list comes from the debian package postinst.
    chmod 777 opt/magicq

    for dir in log show web thumbs backuparchive convert audio; do
        mkdir -p "opt/magicq/$dir"
        chmod -R 777 "opt/magicq/$dir"
    done

    # Fix permissions from .deb file.
    find usr etc -type f -exec chmod 644 {} + , -type d -exec chmod 755 {} +

    mkdir -p usr/bin
    ln -s /opt/magicq/runmagicq.sh usr/bin/magicq
    ln -s /opt/magicq/runmagichd.sh usr/bin/magichd
    ln -s /opt/magicq/runmagicvis.sh usr/bin/magicvis
}
