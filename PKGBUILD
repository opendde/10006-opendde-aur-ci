# Maintainer: THEGUSPROJECT <gus@thegusproject.xyz>

pkgname=zukitwo-manjaro
pkgver=1.0
pkgrel=1
pkgdesc="A green varient of the Zukitwo GTK theme specifically tailored for Manjaro Linux. It works with all GTK 2 and 3 compatible desktop environments and window managers."
arch=('any')
url="https://github.com/THEGUSPROJECT/zukitwo-manjaro"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines')
optdepends=('gnome-themes-standard: Required for the GTK3 theme'
            'ttf-droid: Font family for the Gnome Shell theme')
source=("${_pkgname}::git+https://github.com/thegusproject/${_pkgname}.git")
sha1sums=SKIP

package() {
    cd "${srcdir}/"

    install -d -m 755 "${pkgdir}/usr/share/themes/"
    cp -r "${_pkgname}" "${pkgdir}/usr/share/themes/"
    rm -r "${pkgdir}/usr/share/themes/${_pkgname}/.git"
}

