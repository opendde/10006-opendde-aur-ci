# Contributor in comments: Misc <https://aur.archlinux.org/account/misc/>
# Maintainer: Lucki <Lucki at holarse-linuxgaming dot de>

pkgname=opsu-git
pkgver=0.10.0.r0.g47f6823
pkgrel=1
pkgdesc="An open source osu!-client written in Java."
arch=('any')
url="https://itdelatrisu.github.io/opsu/"
license=('GPL3')
changelog=.CHANGELOG
depends=('java-runtime' 'bash')
makedepends=('java-environment' 'java-web-start' 'maven' 'gendesk' 'git')
provides=('opsu-git')
conflicts=('opsu-git')
source=( ${pkgname}::git://github.com/itdelatrisu/opsu.git
         pom.patch
         opsu-git.sh )
sha512sums=('SKIP'
            '72c56c8f0c647fcdbf85a32e7c4bf1a37b7176015f08402dc20b707f11c5cbb78be1da81d4a697c9d842ac28a9a0bcf1f4c8252c2a18e2ee35435cd327da683b'
            '4c8b89b4f273a076620c98058623a0e8c0ab875f191cb65f126e9a0134e0b072ed27ac8a03928225db1b5b9e832935b4efca0db1d7a02b0c8b96ec87748398f3')

pkgver()
{
	cd ${srcdir}/${pkgname}
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
	# generate .desktop-file
	gendesk -n -f --pkgname ${pkgname} --pkgdesc "$pkgdesc" --name "opsu!-git" --exec "${pkgname}" --categories "Game"

	# update .CHANGELOG
	git -C ${srcdir}/${pkgname} log --graph -10 > ${startdir}/.CHANGELOG

	# check for openjdk
	if [[ ! $(archlinux-java get | sed -r 's/.*(.{7})/\1/') == "openjdk" ]]; then
		msg "OpenJDK not found, trying OracleJDK"

		# cut part for OpenJDK
		sed -e '4q' ${srcdir}/pom.patch > ${srcdir}/pom2.patch

		# patch pom.xml
		patch ${srcdir}/${pkgname}/pom.xml ${srcdir}/pom2.patch
	else
		msg "OpenJDK found, using systempath"

		# patch pom.xml
		patch ${srcdir}/${pkgname}/pom.xml ${srcdir}/pom.patch
	fi
}

build()
{
	cd ${srcdir}/${pkgname}
	mvn install -Djar
}

package()
{
	# cut pkgver
	_pkgver=$(git -C ${srcdir}/${pkgname} describe --tags | sed 's/-.*//')
	_pkgname=opsu

	install -Dm644 ${srcdir}/${pkgname}/target/${_pkgname}-${_pkgver}-runnable.jar ${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar
	install -Dm644 ${srcdir}/${pkgname}/res/logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png
	install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
	install -Dm755 ${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
