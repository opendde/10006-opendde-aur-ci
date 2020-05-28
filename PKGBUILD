# Maintainer: airwoodix <airwoodix at posteo dot me>
pkgname=kicad-interactive-html-bom-plugin
_name=InteractiveHtmlBom
pkgver=2.3
pkgrel=1
pkgdesc="Interactive HTML BOM generation plugin for KiCAD"
arch=('i686' 'x86_64')
url="https://github.com/openscopeproject/InteractiveHtmlBom"
license=('MIT')
depends=('kicad')
source=("https://github.com/openscopeproject/${_name}/archive/v${pkgver}.tar.gz")
md5sums=('38e9e1cab71deb772a5dfa81331db1e0')
sha256sums=('735f03b8072a7600f0b9abb71f6818f6252a15bd687b9830e0e0f400e5c7eb6a')

package() {
  cd "$srcdir/${_name}-${pkgver}"

  install -m755 -d "${pkgdir}/usr/share/kicad/scripting/plugins"
  cp -R "${_name}/" "${pkgdir}/usr/share/kicad/scripting/plugins"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
