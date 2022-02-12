
# Maintainer: Matthias Eberlein
pkgname=youtube-to-mp3
pkgver=3.9.9.68
pkgrel=2
epoch=
pkgdesc="YouTube to Mp3 converter\nDownloads audio from YouTube or Vimeo and saves it to mp3 or m4a format to listen to locally"
arch=('any')
url="https://www.mediahuman.com/youtube-to-mp3-converter/"
license=('custom')
groups=()
depends=(
	'hicolor-icon-theme>=0.17-1'
	'qt5-multimedia>=5.14.1-1'
	'qt5-webkit>=5.212.0alpha4-1'
	'taglib>=1.11.1-3'
	)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_i386=("${pkgname}-${pkgver}.deb::https://www.mediahuman.com/de/download/YouTubeToMP3.i386.deb")
source_x86_64=("${pkgname}-${pkgver}.deb::https://www.mediahuman.com/de/download/YouTubeToMP3.amd64.deb")
noextract=()
md5sums_i386=("a2f2af2e9bb655f88e8b25558887eba2")
md5sums_x86_64=("e07c8ee92069d0d3e4356e5c26e149ae")
validpgpkeys=()

prepare() {
	##Starting Point: src dir with already extracted .deb package
	echo "Preparing the installation.."
	if [ ! -d "$pkgname-$pkgver" ]; then
		mkdir "$pkgname-$pkgver"
	else
		echo "Skipping creating subdirectory '$pkgname-$pkgver': Directory already exists."
	fi
	tar -xf "data.tar.xz" -C "${pkgname}-${pkgver}"
	tar -xf "control.tar.gz" -C "${pkgname}-${pkgver}"
}

pkgver() {
	cd "$pkgname-$pkgver"
	actualpackagename="$(cat "control" | grep "Package:")"
	if [[ ! "$actualpackagename" =~ .*"$pkgname" ]]; then
		echo "Package name changed. Please inform the Maintainer."
		exit -1
	fi
	actpkgverlong="$(cat "control" | grep "Version:")"
	actpkgver=${actpkgverlong##*: }
	if [[ ! "$actpkgverlong" == *"$pkgver" ]]; then
		cd ..
		mv "$pkgname-$pkgver.deb" "$pkgname-$actpkgver.deb"
		if [ -d "$pkgname-$actpkgver" ]; then
			rm -R "$pkgname-$actpkgver"
		fi
		mv -T "$pkgname-$pkgver" "$pkgname-$actpkgver"

		cd ..
		mv "$pkgname-$pkgver.deb" "$pkgname-$actpkgver.deb"
	fi
	echo "$actpkgver"
}

package() {
	## We still start in the src dir
	cd "$pkgname-$pkgver"

	# Copy the binaries and application to their destination in /pkg as root folder
	cp -r -i "usr" "$pkgdir/"
	cp -r -i "opt" "$pkgdir/"
	cp "usr/share/doc/youtube-to-mp3/copyright" "$pkgdir/LICENSE"

	# Remove .deb packages
	cd ../..
	echo "Cleaning up old unneeded .deb file.."
	rm "$pkgname-$pkgver.deb"

	# install the license
	echo "PKGDIR: $pkgdir"
	sudo install -Dm644 "$pkgdir/LICENSE" "/usr/share/licenses/$pkgname/LICENSE"
}
