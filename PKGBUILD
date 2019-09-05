# Maintainer: Jonas Witschel <diabonas at gmx dot de>
pkgname=junit-system-rules
pkgver=1.19.0
pkgrel=1
pkgdesc='Collection of JUnit rules for testing code that uses java.lang.System'
arch=('any')
url='https://stefanbirkner.github.io/system-rules/'
license=('CPL')
depends=('junit')
source=("https://search.maven.org/remotecontent?filepath=com/github/stefanbirkner/${pkgname#junit-}/$pkgver/${pkgname#junit-}-$pkgver.jar")
sha512sums=('57fb278d3df230e36a246a2485f60713b7b8e7d5f25bb6be892bfba93360dec6ac0018f0f38c7554261fd36d899df10858318a05b2b30445b233f262848ff38b')

package() {
	install -Dm644 "${pkgname#junit-}-$pkgver.jar" -t "$pkgdir/usr/share/java"
	ln -s "${pkgname#junit-}-$pkgver.jar" "$pkgdir/usr/share/java/${pkgname#junit-}.jar"
}
