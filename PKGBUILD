# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Co-Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=apostrophe-git
pkgver=2.5.r78.gd0b4463
pkgrel=2
pkgdesc="A distraction free Markdown editor for GNU/Linux made with GTK+"
arch=('any')
url="https://world.pages.gitlab.gnome.org/apostrophe"
license=('GPL3')
depends=('gspell' 'libhandy' 'otf-fira-mono' 'otf-fira-sans' 'python-cairo'
         'python-gobject' 'python-levenshtein' 'python-pyenchant' 'python-pypandoc'
         'python-regex' 'python-setuptools' 'webkit2gtk')
makedepends=('git' 'meson' 'gobject-introspection' 'sassc')
checkdepends=('appstream-glib')
optdepends=('texlive-latexextra: for the pdftex module'
            'mathjax: for formula preview')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.gnome.org/World/apostrophe.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Bug 1953395 - Apostrophe can't export to HTML
  sed -i 's|/app/share/fonts/FiraSans-Regular.ttf|/usr/share/fonts/mozilla-fira/FiraSans-Regular.otf|' \
    data/media/css/web/base.css
  sed -i 's|/app/share/fonts/FiraMono-Regular.ttf|/usr/share/fonts/mozilla-fira/FiraMono-Regular.otf|' \
    data/media/css/web/base.css

  # W: hidden-file-or-dir
  rm apostrophe/.pylintrc
}

build() {
  arch-meson -Dprofile=development "${pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
}
