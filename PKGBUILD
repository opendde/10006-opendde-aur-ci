# Maintainer: Shapiro <shapiro@quantentunnel.de>

pkgname='veracrypt-inyourlanguage'
_pkgname='veracrypt'
pkgver=1.25.9
pkgrel=4
pkgdesc='Disk encryption with strong security based on TrueCrypt 7.1a. Choose one of 40+ languages for installation.'
url='https://www.veracrypt.fr'
arch=('x86_64')
license=('Apache 2.0' 'TrueCrypt 3.0')
provides=('veracrypt')
conflicts=('veracrypt' 'veracrypt-console-bin' 'veracrypt-git' 'veracrypt-git-no-gost' 'veracrypt-trans')
depends=('fuse2>=2.8.0' 'wxwidgets-gtk3' 'libsm' 'device-mapper')
makedepends=('git' 'yasm' 'libxml2' 'coreutils')
optdepends=('sudo: mounting encrypted volumes as nonroot users')
source=(https://launchpad.net/${_pkgname}/trunk/${pkgver}/+download/VeraCrypt_${pkgver}_Source.tar.bz2
        select_lang.sh
        veracrypt_starter.sh
        veracrypt.desktop)
sha512sums=('9b11c8d8e85770ae05960fef8fc9639731e4f9caf0cc4e50bc8c9c92b45d44c80eaeff483d3ab048fd6a82cc873a6027820e21abde7ddb92b3c368f85b837cf2'
            '1c6b79ef584958f803a2f2a6268c301ee095db4b2f9f90503cd20dcc9a4558bc27e9bc95f6f73d3c6d116c35eeeb6661b82f6c33c6368f71c35d234efbf98737'
            '631b0a50154e8c99ba8143a27a0146e24aaec34a64fa08be168ea0bce5e0b0b8b3812b880305cd94528638484500c114921c92e164b2acd07440fe689b752d25'
            '31008f51fa85a7bc2542eeefc4e0ba813a5327ce5c0f6e5926de9ca79ec5b9b312ec998984be60e7d623e1f8722a228f78c659d2e4dacee89f0d5abcb1ade7ff')

prepare() {
  bash $srcdir/../select_lang.sh
}

build() {
  cd src
  make PKG_CONFIG_PATH=/usr/lib/pkgconfig WX_CONFIG=/usr/bin/wx-config
}

package() {
  cd src
  make DESTDIR="$pkgdir/" install
  rm -r "$pkgdir/usr/sbin"
  rm -r "$pkgdir/usr/share/veracrypt"
  install -Dm 755 "${srcdir}/veracrypt_starter.sh" "${pkgdir}/usr/bin"
  install -Dm 644 "${srcdir}/veracrypt.desktop" "${pkgdir}/usr/share/applications"
}

