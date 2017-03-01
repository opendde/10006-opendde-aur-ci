pkgname=topinambour-git
pkgver=1.0.11.r38.gd3ac9b6
pkgrel=2
pkgdesc="vte terminal based on the ruby-gtk3 bindings"
arch=('i686' 'x86_64')
url="https://github.com/cedlemo/topinambour"
license=('GPL')
depends=('fish' 'ruby' 'ruby-gtk3' 'ruby-vte3')
makedepends=('git')
source=('git://github.com/cedlemo/topinambour' 'topinambour-git.desktop')
sha256sums=('SKIP'
            'd8b68ec2f05f4eaaf3b3e93893758be40ce15b7f3ece5994818597db0914906c')

pkgver() {
  cd "topinambour"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${srcdir}/topinambour"
  gem build topinambour.gemspec

}
package() {
  cd "${srcdir}/topinambour"
  gem install --no-user-install --ignore-dependencies \
    -i "${pkgdir}$(ruby -e 'puts Gem.default_dir')" \
    -n "${pkgdir}/usr/bin" \
    topinambour-*.gem
install -Dm644 "data/topinambour.gschema.xml" "$pkgdir/usr/share/glib-2.0/schemas/topinambour.gschema.xml"
install -Dm644 "../$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
