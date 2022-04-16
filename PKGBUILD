# Maintainer: Cory Sanin <corysanin@outlook.com>

_pkgname=boiler-writter
pkgname=${_pkgname}-bin
pkgver=1.3.0
pkgrel=1
pkgdesc='Console application to pull recent CS:GO matches'
arch=('x86_64')
url='https://github.com/akiver/boiler-writter'
license=('GPL3')
conflicts=('boiler-writter')
provides=('boiler-writter')
source=(
    "$_pkgname.zip"::"https://github.com/akiver/$_pkgname/releases/download/v$pkgver/boiler-writter-linux-$pkgver.zip"
)
sha1sums=(
    '4cef41d6785712234afc29a5e6a2ea96acbf5891'
)

package() {
	install -d "$pkgdir/opt/"
    cp -r "$srcdir/bin" "$pkgdir/opt/$_pkgname"
    printf "#\041/bin/sh\nexec \"/opt/$_pkgname/$_pkgname\" \"\$@\"" > "$pkgdir/opt/$_pkgname/$_pkgname.sh"
    chmod 755 "$pkgdir/opt/$_pkgname/"{"$_pkgname.sh","$_pkgname","libsteam_api.so"}

    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname.sh" "$pkgdir/usr/bin/$_pkgname"
}