# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Contributor: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=unifi
pkgver=5.7.23
pkgrel=1
pkgdesc='Centralized management system for Ubiquiti UniFi AP'
arch=('any')
url='https://community.ubnt.com/unifi'
# We are allowed to ship the software in our repository
# https://mailman.archlinux.org/mailman/private/arch-dev/2014-August/015690.html
license=('custom')
depends=('mongodb' 'jre8-openjdk-headless' 'fontconfig')
conflicts=('tomcat-native')
source=("UniFi-$pkgver.zip::https://dl.ubnt.com/unifi/$pkgver/UniFi.unix.zip"
        'mongod'
        'unifi.service'
        'unifi.sysusers'
        'LICENSE')
sha512sums=('63150282d9b7c907e0851bfcfa6779c8a5568b6aa5a8c7333dd5d1403ea8561f8175e9682f79c508da98812efc619257971943a1c3803dd1e72295b9de3340af'
            'ea729c0053bf82e5561ce5f4fb7dba90cbe1b84631f5c257371883090ae5ccc58bd212cb93c9df51e687cdb2b5cdfa8c9e5bfc22bc7d58dc23c9c4dce3a686b8'
            '4b77e480dac9acef58e2d8f088491aa056a55edc9ca613c1b707d53ca802579513082e7c16f5a59689813609b97c2391253c99d77709be4a536abb683e5106ed'
            '0fdd04112236bb3f4d96e4e1c43e0a9d97412831b44837466d70e15521336275a0496dbd47dd28873dc85ba4982ef2234e31c78146eb45c20b158dadf2cec7b8'
            '22e0a4d5be7645e7f1dd760a1b93fa5a49a7e92ce6f23f2a7d0f72043cd0be057bd3faecabd1d3048ecf93480b47d278926b99b5abc17ecbe91a5b15763f0a9c')

package() {
    # lib
    install -dm755 "${pkgdir}/usr/lib/unifi"
    cp -r UniFi/{bin,dl,lib,webapps} "${pkgdir}/usr/lib/unifi"
    rm -r "${pkgdir}/usr/lib/unifi/lib/native"

    # fix incompatibility with mongodb >= 3.6
    rm "${pkgdir}/usr/lib/unifi/bin/mongod"
    install -Dm755 ${srcdir}/mongod "${pkgdir}/usr/lib/unifi/bin/mongod"

    # data
    install -dm750 "${pkgdir}/var/lib/unifi"
    for _d in data run work; do
        install -dm750 "${pkgdir}/var/lib/unifi/$_d"
        ln -s "../../../var/lib/unifi/$_d" "${pkgdir}/usr/lib/unifi/$_d"
    done
    chown -R 113:113 "${pkgdir}/var/lib/unifi"

    # log
    install -dm750 "${pkgdir}/var/log/unifi"
    ln -s ../../../var/log/unifi "${pkgdir}/usr/lib/unifi/logs"
    chown -R 113:113 "${pkgdir}/var/log/unifi"

    # readme
    install -Dm644 UniFi/readme.txt "${pkgdir}/usr/share/doc/${pkgname}/README"

    # license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # systemd
    install -Dm644 ${pkgname}.service "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
    install -Dm644 ${pkgname}.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
}
