# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-browser-git
_pkgname=browser-laptop
pkgver=0.7.16dev.3
pkgrel=1
pkgdesc="A chromium-based web browser that stops ads and trackers by Brendan Eich and Co. Development master branch."
arch=('x86_64') # No 32-bit electron-prebuilt for you!
url="https://www.brave.com/"
license=('custom')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'libnotify' 'gconf' 'libxtst' 'desktop-file-utils')
optdepends=('cups: To use your printer.')
makedepends=('git' 'npm' 'xdg-utils')
provides=('brave')
conflicts=('brave')
options=(!strip)
install=$pkgname.install
source=("git://github.com/brave/browser-laptop.git" 'brave-browser-git.desktop')
md5sums=('SKIP'
         '8ad47100f052e3b65e088f4733c4f24a')

pkgver() {
  cd "$srcdir/$_pkgname"

# I'm leaving this here in case there is a need for a more complex version number. Versioning
# policy in a project the size and clout of Brave is not going to change without due warning.
#  printf %s.r%s $(git describe --tags | sed -e 's/^v//' | sed -e 's/-/./' | sed -e 's/-.\+//') \
#    $(git rev-list --count HEAD)

  printf %s $(git describe --tags | sed -e 's/^v//' | sed -e 's/-/./' | sed -e 's/-.\+//')
}

build() {
  cd "$srcdir/$_pkgname"

  npm install node-gyp@3.2.1
  npm install
  npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  _arch='x64'

  install -d -m0755 "$pkgdir"/opt

  cp -a --reflink=auto Brave-linux-"$_arch" "$pkgdir"/opt/$pkgname

  install -d -m0755 "${pkgdir}/usr/bin"

  ln -s "/opt/$pkgname/Brave" "${pkgdir}/usr/bin/brave-browser-git"

  install -D -m0644 "$startdir"/brave-browser-git.desktop "$pkgdir"/usr/share/applications/brave-browser-git.desktop

  install -D -m0644 "res/app.png" "$pkgdir"/usr/share/pixmaps/brave-browser-git.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/$pkgname

  mv "$pkgdir"/opt/$pkgname/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
