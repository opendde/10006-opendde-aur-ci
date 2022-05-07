# Maintainer: Stanisław Jasiewicz <stjasiewicz@protonmail.com>
pkgname=nwscript-code
pkgver=1.4.0
pkgrel=1
pkgdesc="Setup for a NWScript IDE assembled from VSC and various development tools"
arch=('any')
url="https://gitlab.com/Taro94/nwscript-code/"
license=('GPL')
depends=('code' 'astyle' 'nwnsc-bin' 'neverwinter.nim' 'nasher' 'nssnippets-bin' 'nssdefinitions-bin')
optdepends=('wine')
source=('https://gitlab.com/Taro94/nwscript-code/-/archive/1.4.0/nwscript-code-1.4.0.tar.gz')
md5sums=('71696d46694e1e9577b66af0acded5d2')
options=(!strip)

package() {
	cd nwscript-code-1.4.0
    install -Dm 755 "nwscript-code" -t "$pkgdir/usr/bin"
    install -Dm 755 "nsshotreload" -t "$pkgdir/usr/bin"
    install -Dm 755 "default_config.ini" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "tasks.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "settings.json" -t "$pkgdir/usr/share/nwscript-code"
    install -Dm 755 "keybindings.json" -t "$pkgdir/usr/share/nwscript-code"
    #install -Dm 755 "extensions" -t "$pkgdir/usr/share/nwscript-code"
    cp -r "extensions" "$pkgdir/usr/share/nwscript-code"    
}
