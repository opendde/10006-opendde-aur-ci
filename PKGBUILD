# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>

pkgname='singularity-container'
pkgver='3.1.0'
pkgrel='1'
pkgdesc='Container platform focused on supporting "Mobility of Compute".'
arch=('i686' 'x86_64')
url='https://www.sylabs.io/singularity/'
license=('BSD')
makedepends=('go' 'dep')
depends=('squashfs-tools' 'libseccomp')
source=("https://github.com/sylabs/singularity/releases/download/v${pkgver}/singularity-${pkgver}.tar.gz")
noextract=("singularity-${pkgver}.tar.gz")
md5sums=('762bafa98e7c6de3c55012ebeb8acf03')

prepare() {
  export GOPATH="${srcdir}/singularity"
  mkdir -p "${GOPATH}/src/github.com/sylabs"
  tar -zxf singularity-${pkgver}.tar.gz -C "${GOPATH}/src/github.com/sylabs"
}

build() {
  export GOPATH="${srcdir}/singularity"
  cd "${GOPATH}/src/github.com/sylabs/singularity"
  ./mconfig --prefix=/usr --sysconfdir=/etc --localstatedir=/var --sbindir=/usr/bin
  cd builddir
  make
}

package() {
  export GOPATH="${srcdir}/singularity"
  cd "${GOPATH}/src/github.com/sylabs/singularity/builddir"
  make DESTDIR="${pkgdir}" install
}

