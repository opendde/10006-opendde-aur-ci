# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Giovanni Harting <539@idlegandalf.com>

pkgname=cryptpad
pkgver=4.2.1
pkgrel=1
pkgdesc="Realtime collaborative visual editor with zero knowlege server"
arch=('any')
url="https://github.com/xwiki-labs/cryptpad"
license=('AGPL3')
depends=('nodejs')
makedepends=('npm' 'bower' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/xwiki-labs/cryptpad/archive/$pkgver.tar.gz"
        "cryptpad.service"
        "cryptpad.sysusers"
        "cryptpad.tmpfiles")
sha256sums=('a54a254f696f7aaa6e2492d6561bccd62919217c7ece3cff97179b9746802128'
            '522851fbe4e0e41fd6ece8b2b0ed17bbae0233a58328b7994a5207aa341a635b'
            '999a271d64b75c7c447fdb21486b27463c04679677e57ea9551a3b0429c618f6'
            'dc2207b11876160ad42b2e65aea384437c11fba82c98d74e7eb6aa84b191c49b')

package() {
    cd "$pkgname-$pkgver"

    npm install -g --user root --prefix "${pkgdir}"/usr --cache "${srcdir}/npm-cache"
    bower install --allow-root

    rm -r "$pkgdir"/usr

    # make sure directory permissions are acceptable
    find . -type d -exec chmod 755 {} +

    # Documentation
    install -t "$pkgdir/usr/share/doc/$pkgname" -Dm 644 docs/{ARCHITECTURE.md,example.nginx.conf} CHANGELOG.md

    # Cryptpad
    install -Dt "$pkgdir/usr/share/$pkgname" package.json server.js
    cp -rt "$pkgdir/usr/share/$pkgname" customize.dist lib scripts www
    rmdir "$pkgdir/usr/share/$pkgname/www/bower_components/codemirror/mode/rpm/changes"

    # Config
    sed -e "s|\(Path: '\)\./|\1/var/lib/cryptpad/|" \
        -e "s|'/var/lib/cryptpad/data/logs'|false|" \
        -e "s|logToStdout: false|logToStdout: true|" \
        -i config/config.example.js

    install -Dm 644 config/config.example.js "${pkgdir}/etc/webapps/$pkgname/config.example.js"
    ln -s "../../../etc/webapps/$pkgname" "$pkgdir/usr/share/$pkgname/config"

    # systemd
    install -Dm 644 "${srcdir}"/cryptpad.sysusers "${pkgdir}"/usr/lib/sysusers.d/cryptpad.conf
    install -Dm 644 "${srcdir}"/cryptpad.service "${pkgdir}"/usr/lib/systemd/system/cryptpad.service
    install -Dm 644 "${srcdir}"/cryptpad.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/cryptpad.conf
}
