# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Christian Krause ("wookietreiber") <christian dot krause at mailbox dot org>

pkgname=wiggletools
pkgver=1.2.10
pkgrel=1
pkgdesc="Compute genome-wide statistics with composable iterators"
arch=('i686' 'x86_64')
url="https://github.com/Ensembl/WiggleTools"
license=('Apache')
depends=('gsl' 'htslib' 'libbigwig' 'python2')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/Ensembl/WiggleTools/archive/v${pkgver}.tar.gz"
        "wiggletools-flags.patch")
sha256sums=('082ee703ad3a5379a70d885002a18d0bf285bb2eff16a9388f640093b630303b'
            'c0d08f1b99d2b0d9849272ca18f064288dbaeb32ad986b015396d7b01c85e77c')

prepare() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  patch -Np1 -i "${srcdir}/wiggletools-flags.patch"

  # Use python2
  sed -e 's|#!/usr/bin/env python|#!/usr/bin/env python2|' \
    -i python/wiggletools/*.py
}

build() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  make
}

check() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  make test || true
}

package() {
  cd "${srcdir}/WiggleTools-${pkgver}"
  install -Dm755 bin/wiggletools ${pkgdir}/usr/bin/wiggletools

  for pythonscript in bin/*.py ; do
    install -Dm755 ${pythonscript} ${pkgdir}/usr/bin/$(basename ${pythonscript} .py)
  done

  for shellscript in bin/*.sh ; do
    install -Dm755 ${shellscript} ${pkgdir}/usr/bin/$(basename ${shellscript} .sh)
  done
}
