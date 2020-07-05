# Maintainer: Your Name <youremail@domain.com>
pkgname=reposilite
pkgver=2.6.1
pkgrel=1
pkgdesc="Reposilite (formerly NanoMaven) - lightweight repository manager for Maven artifacts. It is a simple solution to replace managers like Nexus, Archiva or Artifactory."
arch=(any)
url="https://github.com/dzikoysk/$pkgname"
license=('Apache')
depends=('java-runtime')
makedepends=('java-environment' 'maven')
source=("$url/archive/$pkgver.tar.gz" 'fix-tests-listening-port.patch' 'change-default-port-to-8080.patch' "$pkgname.service" "$pkgname.sysusers" "$pkgname.tmpfiles")
sha256sums=('3a6af7fbeab363323eac5bf6ce054d50297e2aef1c5eb418994c4acad4a9ac4f'
            '7f23358accbb833ab85d7ca0dabd07dcf9571de8c24557ea37b9893dafa92bbc'
            'c2701c3abeb18249dd23a15077a298bf46d96add5c8ce786fef0debf640d3637'
            'a90d98915a867ae8b2569d124d0f625908e490284d26005cd47c041c75ef3db4'
            '92ccfeff429aa4757ef353677dd99ad7aebe7483d4824706a27250e81efd6323'
            '9587fa49dd66d5f31dee33aa1a9da269a34666b63f62e2550a66c3bc1d397aa7')

prepare() {
  cd "$pkgname-$pkgver"
  patch -p0 -i "$srcdir/fix-tests-listening-port.patch"
  patch -p0 -i "$srcdir/change-default-port-to-8080.patch"
}

build() {
  cd "$pkgname-$pkgver"
  mvn package
}

package() {
  install -Dm 644 $pkgname.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm 644 $pkgname.sysusers "${pkgdir}/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm 644 $pkgname.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm 644 "$pkgname-$pkgver/reposilite-backend/target/$pkgname-$pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
}
