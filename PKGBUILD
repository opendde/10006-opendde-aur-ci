    # Maintainer: fettouhi <A.Fettouhi@gmail.com>
    # Contributor: Neverth <t-r-a-y@mbnet.fi>
    # Contributor: Marvn
     
    pkgname=moodbar
    pkgver=1.1
    pkgrel=1
    pkgdesc="moodbar binaries and script for Amarok"
    arch=(i686 x86_64)
    url="https://github.com/exaile/moodbar/releases"
    license=('GPL')
    depends=('fftw'  'gst-plugins-base' 'gst-plugins-base-libs' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-ugly')
    makedepends=('meson')
    source=("https://github.com/exaile/moodbar/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
    sha256sums=('b329731259b6db20b969dccb616fd260fa56673571b02144d29cacb42546ea8c')
    
    build() {
      cd ${srcdir}/${pkgname}-${pkgver}
      meson --prefix /usr --buildtype plain _build
      ninja -C _build
    }

    package() {
      cd ${srcdir}/${pkgname}-${pkgver}
      DESTDIR="$pkgdir" ninja -C _build install
      mkdir -p "${pkgdir}/usr/share/licenses/$pkgname"
      install -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname"
    }
