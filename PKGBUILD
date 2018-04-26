# Maintainer: Nils Czernia <nils[at]czserver[dot[de>

pkgname=grav-admin
pkgver=1.4.3
pkgrel=3
pkgdesc="Grav is a modern open source flat-file CMS with admin plugin"
arch=("any")
url="https://getgrav.org"
license=("MIT")
depends=("php")
source=("https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip")
sha256sums=("bacb9fdef36bf52cdc9c9cfe7ce51acad82dc5807fcbabe0d5859579225768db")


package() {
    dirs=("assets" "backup" "cache" "images" "user")

    cd "$pkgdir"
    install -dm0755 usr/share/webapps/${pkgname}/
    install -dm0755 var/log/${pkgname}/
    install -dm0755 var/lib/${pkgname}/

    for dir in "${dirs[@]}"; do
        mv ${srcdir}/${pkgname}/${dir}/ var/lib/${pkgname}/${dir}/
        ln -s ../../../../var/lib/${pkgname}/${dir}/ usr/share/webapps/${pkgname}/${dir}
    done

    rm -Rf ${srcdir}/${pkgname}/logs/
    ln -s ../../../../var/log/${pkgname}/ usr/share/webapps/${pkgname}/logs
    chown http: -R var/lib/${pkgname}/ var/log/${pkgname}/
    chmod o-rwx -R var/lib/${pkgname}/ var/log/${pkgname}/

    cp -a $srcdir/${pkgname}/* usr/share/webapps/${pkgname}/

    cd ${pkgdir}/usr/share/webapps/${pkgname}
    rm -Rf *.md composer.json composer.lock 
    chown http: tmp/
}
