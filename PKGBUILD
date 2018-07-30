# Maintainer: Mark Weiman <mark dot weiman at markzz dot com>

_gemname=fpm
pkgname=$_gemname
pkgver=1.10.2
pkgrel=1
pkgdesc='Effing package management! Build packages for multiple platforms (deb, rpm, etc) with great ease and sanity.'
arch=(any)
url="https://github.com/jordansissel/${_gemname}"
license=('MIT')
depends=(ruby
         ruby-json-1
         ruby-cabin
         ruby-backports
         ruby-arr-pm
         ruby-clamp
         ruby-childprocess
         ruby-ffi
         ruby-xz
         ruby-pleaserun
         ruby-stud)
# makedepends=(ruby-rspec
#              ruby-insist)
options=(!emptydirs)
source=("https://github.com/jordansissel/fpm/archive/v${pkgver}.tar.gz")
sha256sums=('186f5c9d1cc20360bddd34e6d20bca34b48f3b2bc68eee88fa05e62d128deac8')

build() {
  cd $srcdir/$_gemname-$pkgver
  sed -i 's/"clamp", "~> 1.0.0"/"clamp", ">= 1.0.0"/' fpm.gemspec
  make gem
}

# check() {
#   cd $srcdir/$_gemname-$pkgver
#   make test
# }

package() {
  local _gemdir="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install --no-document -i "$pkgdir/$_gemdir" -n "$pkgdir/usr/bin" $srcdir/$_gemname-$pkgver/$_gemname-$pkgver.gem
  rm "$pkgdir/$_gemdir/cache/$_gemname-$pkgver.gem"
  install -D -m644 "$pkgdir/$_gemdir/gems/$_gemname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
