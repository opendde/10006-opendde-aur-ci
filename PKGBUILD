# Maintainer: Xyne <ac xunilhcra enyx, backwards>

_basename=achemso
pkgname=texlive-"$_basename"
pkgver=3.10h
pkgrel=1
pkgdesc="LaTeX support for American Chemical Society journal submissions."
arch=('any')
depends=('texlive-bin')
# url="http://ctan.org/pkg/$_basename"
url="http://ctan.org/tex-archive/macros/latex/contrib/$_basename"
license=('custom')
# source=("http://mirrors.ctan.org/macros/latex/contrib/$_basename/$_basename.dtx")
source=("http://mirrors.ctan.org/macros/latex/contrib/$_basename.zip")
install=$pkgname.install

package() {
  mkdir -p -- "$pkgdir"/usr/share/texmf/
  cd -- "$pkgdir"/usr/share/texmf/
  bsdtar -xf "$srcdir/$_basename".zip
  find "$pkgdir" -type f -exec chmod 644 {} \+
  find "$pkgdir" -type d -exec chmod 755 {} \+
}

sha1sums=('40b03e1d604b7861d3a51c8145d12056856e75e6')
