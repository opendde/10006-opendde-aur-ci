# Maintainer: Jack O'Connor <oconnor663@gmail.com>

# NOTE: This PKGBUILD is generated and pushed by Keybase's release automation.
# Any changes made in aur.archlinux.org git repos will get overwritten. See
# https://github.com/keybase/client/tree/master/packaging/linux/arch.

pkgname=keybase-bin
pkgdesc='the Keybase Go client, filesystem, and GUI'
license=('BSD')
url='https://keybase.io'
pkgver=1.0.39_20180103170425+352aaf98a
deb_pkgver="${pkgver/_/-}"
deb_pkgver="${deb_pkgver/+/.}"
pkgrel=1
arch=('i686' 'x86_64')
depends=(fuse gconf libxss gtk2) # don't change this without changing the SRCINFO template too
# keybase-release is a deprecated AUR package
conflicts=(keybase keybase-release keybase-git)
source_i686=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_${deb_pkgver}_i386.deb"
)
source_x86_64=(
  "https://s3.amazonaws.com/prerelease.keybase.io/linux_binaries/deb/keybase_${deb_pkgver}_amd64.deb"
)
install=keybase.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  deb_package="keybase_${deb_pkgver}_${deb_arch}.deb"
  ar xf "$deb_package"
  tar xf data.tar.xz -C "$pkgdir"

  # Omit the cronjobs that the Debian package includes.
  rm -rf "$pkgdir/etc/cron.daily"
}

# You can cross reference these hashes with Keybase Debian repo metadata:
# https://prerelease.keybase.io/deb/dists/stable/main/binary-amd64/Packages
# https://prerelease.keybase.io/deb/dists/stable/main/binary-i386/Packages
sha256sums_i686=(f23f1199f1cb25ba671a6ccd68f24e98de07f9703658b44cd2e09a65e84867d4)
sha256sums_x86_64=(7d1244f6ccc5967cad652abe3a6ec9ad9f8da2d52d585426b6842a9087f90b85)
