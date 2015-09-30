# Maintainer: Andya <ap_9@outlook.com>
# Contributor: oozyslug <oozyslug@gmail.com>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>
# Submitter: John Reese <john@noswap.com>
# Upstream URL: https://github.com/atom/atom

# Please do mind that pkgbuild will automagically update
# to latest tagged release (you could have problems if you use an aur helper),
# there's no need to manually change pkgver.
# Please don't flag out-of-date!
pkgname=atom-editor-git
pkgver=1.1.0.beta.0.r178.g575d79a
pkgrel=2
pkgdesc="Chrome-based text editor from Github"
arch=('i686' 'x86_64')
url="https://github.com/atom/atom"
license=('MIT')
provides=('atom-editor')
conflicts=('atom-editor' 'atom-editor-bin')
depends=('gconf' 'nodejs' 'libgnome-keyring' 'python2')
makedepends=('git' 'npm')
source=("atom::git+git://github.com/atom/atom")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/atom"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/atom"

  sed -e "s/<%= description %>/$pkgdesc/" \
    -e "s|<%= executable %>|/usr/bin/atom|"\
    -e "s|<%= iconName %>|atom|"\
    resources/linux/atom.desktop.in > resources/linux/Atom.desktop
}

build() {
  cd "$srcdir/atom"

  export PYTHON=python2
  script/build --build-dir "$srcdir/atom-build"
}

package() {
  cd "$srcdir/atom"

  script/grunt install --build-dir "$srcdir/atom-build" --install-dir "$pkgdir/usr"
  install -Dm644 resources/linux/Atom.desktop "$pkgdir/usr/share/applications/atom.desktop"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
