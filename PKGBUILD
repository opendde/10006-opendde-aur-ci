# Maintainer: max-k <max-kATpostDOTcom>
pkgname=sonar-scanner
pkgver="4.6.0.2311"
pkgrel=1
pkgdesc="Default launcher to analyze a project with SonarQube"
arch=('any')
url="http://www.sonarqube.org/"
license=('LGPL3')
depends=('java-runtime')
provides=('sonar-runner')
backup=("opt/$pkgname/conf/$pkgname.properties")
install="$pkgname.install"
source=("https://binaries.sonarsource.com/Distribution/$pkgname-cli/$pkgname-cli-$pkgver.zip"
        "$pkgname.sh"
        "$pkgname.install")
sha256sums=('e45599982e455fc36ac896579a9b88957060882b8eaa3a2d69e9e373f9174381'
            '2438839809633e1d4a46a8fa5ab02063bb3b530a90059c5dc9325e2d4b0cc4e0'
            '58dcb9b51bb5d1148a62ee6ce60a937d64647993b67ab2c0a4eb2752171e9160')

package() {
    mkdir -p "$pkgdir/etc/profile.d"
    install -Dm755 "$pkgname.sh" "$pkgdir/etc/profile.d/"

    cd "$pkgname-$pkgver"
    mkdir -p $pkgdir/opt/$pkgname/{bin,conf,lib}
    install -Dm755 "bin/$pkgname" "$pkgdir/opt/$pkgname/bin/"
    install -Dm644 "lib/$pkgname-cli-$pkgver.jar" "$pkgdir/opt/$pkgname/lib/"
    install -Dm644 "conf/sonar-scanner.properties" "$pkgdir/opt/$pkgname/conf/"
    ln -sf "/opt/$pkgname/conf" "$pkgdir/etc/$pkgname"
}
