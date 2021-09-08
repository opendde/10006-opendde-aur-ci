# Maintainer ZhangHua<zhanghua.00@qq.com>

pkgname=aria2cd
pkgver=1.0
pkgrel=4
pkgdesc="A systemd Service to start aria2 automatically."
arch=(any)
url="https://aur.archlinux.org/aria2cd.git"
license=(custom:WTFPL)
depends=(aria2 systemd)
source=(
	${pkgname}.hook
	aria2.conf
	aria2@.service
	LICENSE::http://www.wtfpl.net/txt/copying
)
sha256sums=('3bc0673f21df1d8a7c01b2bba41505fbb73ce69ca199cef282a92f7d67a0fd1e'
            '9a2b835b018c8ebc99d0fa01182c15aca1fb04c5c859192e0a16402b81624da9'
            'c863595990e32eb41aa76fd55d151acb04cee401fcf219d4e418b96fdc1468b2'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5')
package(){
	install -Dm644 ${srcdir}/aria2.conf ${pkgdir}/usr/share/aria2/aria2.conf
	touch ${pkgdir}/usr/share/aria2/dht.dat
	touch ${pkgdir}/usr/share/aria2/dht6.dat
	touch ${pkgdir}/usr/share/aria2/aria2.session
	install -Dm644 ${srcdir}/aria2@.service ${pkgdir}/usr/lib/systemd/system/aria2@.service
	install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licences/${pkgname}/LICENSE
	install -Dm644 ${srcdir}/${pkgname}.hook ${pkgdir}/usr/share/libalpm/hooks/${pkgname}.hook
}
