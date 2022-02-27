# Maintainer: SZanko, szanko at protonmail dot com

pkgbase="mailchecker"
pkgname=(
	#"go-mailchecker"
	#"nodejs-mailchecker"
	#"php-mailchecker"
	"python-mailchecker"
	#"ruby-mailchecker"
	#"rust-mailchecker"
)
_pkgname="mailchecker"
pkgver="4.1.13"
pkgrel="1"
pkgdesc='Cross-language email validation. Backed by a database of over 30 000 throwable email domains.'
arch=('any')
url='https://github.com/FGRibreau/mailchecker/'
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=(
  'e089d993c0d499bd27a0d444e6c57f75703ce15ea6d178471a161ed1f5770aed'
)
makedepends=(
'python-setuptools'
'nodejs'
'npm'
#'rubygems'
)


build() {
  msg "Generate List"
  cd "$srcdir/${_pkgname}-${pkgver}"
  npm install && npm audit fix && npm run build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  sed -E -i "s/version[[:space:]]*=(.*)/version = '${pkgver}',/g" setup.py
  python setup.py build

  #msg "Building Ruby Gem"
  #cd "$srcdir/${_pkgname}-${pkgver}"
  #sed -E -i "s/spec.version[[:space:]]*=(.*)/spec.version = '${pkgver}'/g" *.gemspec
  #gem build *.gemspec
}


package_python-mailchecker() {
  depends=(
	'python-distribute'
  )
  cd "$srcdir/${_pkgname}-${pkgver}/platform/python"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  cd "$srcdir/${_pkgname}-${pkgver}"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/python-mailchecker/LICENSE.txt"
}

package_ruby-mailchecker() {
  depends=(
	'ruby'
  )
  local _gemdir="$('gem env gemdir')"
  gem install --ignore-dependencies --no-user-install -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $pkgbase-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$pkgbase-$pkgver.gem"
}
