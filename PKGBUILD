#! /bin/bash

pkgname="darkmod"
provides=("${pkgname}")
conflicts=("${pkgname}")

arch=("x86_64")
pkgver=2.07.1
pkgrel=2

pkgdesc="First person forgery stealth game"
license=("GPL3" "BSD" "CCPL")
url="http://www.thedarkmod.com"

SourcePath="https://gitlab.com/es20490446e/darkmod-linux-packager"
source=("git+${SourcePath}.git")
md5sums=("SKIP")

depends=("curl" "glew" "libjpeg-turbo" "libpng" "libpng12" "libpulse" "libxxf86vm" "openal")
makedepends=("git")


build () {
	"${srcdir}/darkmod-linux-packager/build.sh"
}


package () {
	mv "${srcdir}/darkmod-linux-packager/build/usr" "${pkgdir}"
}


pkgver () {
	curl --silent "${SourcePath}/raw/master/package%20version.sh" |
	bash
}

