# Maintainer: Sonic-Y3k <sonic.y3k@googlemail.com>
# Contributor: Donald Webster <fryfrog@gmail.com>
# Contributor: whiskerz007 <whiskerz007@gmail.com>
# Based on package by: Denis Saintilma <1068des@gmail.com>

pkgname=plexpy
pkgver=1.4.12
pkgrel=2
pkgdesc="A Python based monitoring and tracking tool for Plex Media Server."
arch=('any')
url="https://github.com/JonnyWong16/plexpy"
license=('GPL')
makedepends=('curl')
depends=('python2')
conflicts=('plexpy-git')
provides=("plexpy")
install='plexpy.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/JonnyWong16/plexpy/archive/v$pkgver.tar.gz" 
        'plexpy.service'
        'plexpy.install')
sha256sums=('66486edd0fe01671a899fc20180042ae707e8ef68ce7fa0b4938defa51ed5dbd'
            '58300f84762f1362ae4d81aab9bbdf48425735b886807fea847ec256082524a0'
            '93d8bc219acc2781f14d832443bc226a4fa6cc751f5ecf5cac5a407187c69160')

prepare() {
	echo "v${pkgver}" > "${srcdir}/${pkgname}-${pkgver}/version.txt"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	install -Dm755 PlexPy.py "${pkgdir}/opt/plexpy/PlexPy.py"
	install -Dm644 pylintrc  "${pkgdir}/opt/plexpy/"
	install -Dm644 CHANGELOG.md "${pkgdir}/opt/plexpy/"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/plexpy/LICENSE"

	cp -a data/ lib/ plexpy/ "${pkgdir}/opt/plexpy/"

	install -Dm644 "${srcdir}/plexpy.service" "${pkgdir}/usr/lib/systemd/system/plexpy.service"
	install -Dm644 "version.txt" "${pkgdir}/opt/plexpy/"
}

