pkgname=pandoc-citeproc-bin
pkgver=2.3
pkgrel=1
pkgdesc="Pandoc Cite Processor - executable only, without 750MB Haskell depends/makedepends"
url="https://hackage.haskell.org/package/pandoc-citeproc"
license=("custom:BSD3")
arch=('x86_64')
conflicts=("pandoc-citeproc")
provides=("pandoc-citeproc")
replaces=('pandoc-citeproc-static' 'pandoc-citeproc-lite')
depends=('pandoc')

source=(
    "https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-linux.tar.gz"
)
sha256sums=('0a2b57adb54e4d5c859ccbd268fcf89c76557cc3869b6394c8d4d81994a3b4a0')

package() {
    # the original pandoc executable is provided by a different package.
    rm "${srcdir}/pandoc-${pkgver}/bin/pandoc"
    rm "${srcdir}/pandoc-${pkgver}/share/man/man1/pandoc.1.gz"

    mkdir "${pkgdir}/usr"
    cp -r "${srcdir}/pandoc-${pkgver}/bin" "${pkgdir}/usr"
    cp -r "${srcdir}/pandoc-${pkgver}/share" "${pkgdir}/usr"
}
