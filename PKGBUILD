# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=dwarftherapist
pkgver=39.1.2
pkgrel=1
pkgdesc="Heavily modified version of the original Dwarf Therapist."
url="https://github.com/Dwarf-Therapist/Dwarf-Therapist"
arch=('x86_64' 'i686')
license=('MIT')
depends=('qt5-declarative' 'hicolor-icon-theme' 'libcap')
makedepends=('cmake')
install="dwarftherapist.install"
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
md5sums=('9f612141b588eab5f3579eb131135968')
sha256sums=('365bee761b6aa0cbf0e7c917b472717d25b5ab9efbb2d4921f07583f89a64407')

build() {
  cd Dwarf-Therapist-${pkgver}
  cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE="Release" .
  make
}

package() {
  cd Dwarf-Therapist-${pkgver}
  make DESTDIR="${pkgdir}" install
  
  # Rename binary
  mv "${pkgdir}/usr/bin/DwarfTherapist" "${pkgdir}/usr/bin/dwarftherapist"
  # Fix .desktop
  sed -i 's:DwarfTherapist:dwarftherapist:g' "${pkgdir}/usr/share/applications/dwarftherapist.desktop"

  # Link license to expected location
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  ln -s /usr/share/doc/dwarftherapist/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
