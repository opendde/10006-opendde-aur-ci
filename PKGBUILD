# Maintainer: Ashar Khan <ashar786khan at gmail.com>

pkgname=cpeditor
pkgver=6.7.2
_pkgdir=cpeditor-$pkgver-full-source
pkgrel=1
pkgdesc='The editor for competitive programming'
arch=('x86_64')
url='https://github.com/cpeditor/cpeditor'
license=('GPL3')
depends=('qt5-base>=5.15.0')
makedepends=(
	"cmake"
	"git"
	"ninja"
	"python3"
	"qt5-tools"
)
optdepends=(
	'cf-tool: submit to Codeforces support'
	'clang: C++ format and language server support'
	'jdk-openjdk: compile Java support'
	'jre-openjdk: execute Java support'
	'python: execute Python support'
)
conflicts=("cpeditor-git")
source=("https://github.com/cpeditor/$pkgname/releases/download/$pkgver/cpeditor-$pkgver-full-source.tar.gz")
sha256sums=('ed81514a25d53fde1e8b0ea03f727b7da5e8a6c30e72cb98d772346925d9dc86')

build() {
	cd "$_pkgdir"
	cmake -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DPORTABLE_VERSION=Off -DCMAKE_BUILD_TYPE=Release -GNinja
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgdir/build"
	DESTDIR="$pkgdir/" ninja install
}
