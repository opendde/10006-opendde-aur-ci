# Maintainer: Axel Gembe <derago@gmail.com>

pkgname=electron-cash-bin
pkgdesc='Lightweight Bitcoin Cash wallet'
pkgver=4.2.2
pkgrel=1
pkgbin=electron-cash
url='http://www.electroncash.org/'
arch=('x86_64')
license=('MIT')
depends=('ttf-bitstream-vera')

github='https://github.com/Electron-Cash/Electron-Cash'
appimage="Electron-Cash-${pkgver}-${arch}.AppImage"

validpgpkeys=(D56C110F4555F371AEEFCB254FD06489EFF1DDE1 # Jonald Fyookball <jonf@electroncash.org>
              D465135F97D0047E18E99DC321810A542031C02C # Calin Culianu <calin.culianu@gmail.com>
              )

source_x86_64=(
	"${github}/releases/download/${pkgver}/${appimage}"
	"${appimage}.asc::${github}/releases/download/${pkgver}/${appimage}.asc"
	)

sha256sums_x86_64=('d75bacbc7f36595826ff05b23e37522aa4dd56112683d8840204380dba62bc80'
                   'SKIP')

package() {
	# Extract files
	chmod +x "$srcdir/$appimage"
	$srcdir/$appimage --appimage-extract
	# Clean old build dir files
	rm -rf $srcdir/$pkgbin
	mv -f "$srcdir/squashfs-root" "$srcdir/$pkgbin"

	# Install Icon
	install -Dm644 "$srcdir/$pkgbin/electron-cash.png" "$pkgdir/usr/share/pixmaps/$pkgbin.png"

	install -d "$pkgdir/opt/$pkgbin"
	cp -a "$srcdir/$pkgbin/." "$pkgdir/opt/$pkgbin/"
	chmod -R +rx "$pkgdir/opt/$pkgbin"

	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgbin/AppRun" "$pkgdir/usr/bin/$pkgbin"
	install -Dm644 "$srcdir/$pkgbin/$pkgbin.desktop" "$pkgdir/usr/share/applications/$pkgbin.desktop"
}
