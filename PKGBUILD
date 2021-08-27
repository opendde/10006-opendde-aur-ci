# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=whitesur-gtk-theme-git
pkgver=2021.07.27.r42.g8651607
pkgrel=1
pkgdesc="MacOS Big Sur like theme for GNOME desktops"
arch=('any')
url="https://github.com/vinceliuice/WhiteSur-gtk-theme"
license=('GPL')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'whitesur-icon-theme-git: matching icon theme'
            'whitesur-cursor-theme-git: matching cursor theme'
            'whitesur-kvantum-theme: matching Kvantum theme'
            'gnome-shell-extension-dash-to-dock: recommended GNOME extension'
            'gnome-shell-extension-blur-my-shell: recommended GNOME extension')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
options=('!strip')
source=(git+$url.git)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/themes"

  # See for more customization options:
  # https://github.com/vinceliuice/WhiteSur-gtk-theme#theres-so-many-customizations-you-can-do
  ./install.sh \
    --icon arch \
    --alt all \
    --theme all \
    --dest "$pkgdir/usr/share/themes"

  # Plank theme
  install -Dm644 src/other/plank/theme-dark/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-dark"
  install -Dm644 src/other/plank/theme-light/* -t \
    "$pkgdir/usr/share/plank/themes/WhiteSur-light"

  # Firefox theme
  install -d "$pkgdir/usr/share/docs/$pkgname"
  cp -r src/other/firefox "$pkgdir/usr/share/docs/$pkgname"
}
