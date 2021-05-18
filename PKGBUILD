# Maintainer: sQVe <oskargrunning@gmail.com>

pkgname=vimix-gtk-themes-git
pkgver=r358.8b76023
pkgrel=1
pkgdesc='A flat Material Design theme for GTK 3, GTK 2 and Gnome-Shell'
url='https://github.com/vinceliuice/vimix-gtk-themes'
arch=('any')
license=('GPL3')
depends=('gtk3')
optdepends=('gtk-engine-murrine: for gtk2 themes'
            'gtk-engines: for gtk2 themes')
makedepends=('git')
source=('git+https://github.com/vinceliuice/vimix-gtk-themes.git')
sha256sums=('SKIP')
provides=("vimix-gtk-themes=${pkgver}")
conflicts=('vimix-gtk-themes')
_gitname=vimix-gtk-themes

pkgver() {
    cd "${_gitname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_gitname}"
    install -dm755 "${pkgdir}/usr/share/themes"
    ./install.sh -a -d "$pkgdir/usr/share/themes"
}
