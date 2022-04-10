# Maintainer: Martins Mozeiko <martins.mozeiko@gmail.com>

pkgname=far2l-git
pkgver=r2750.fb7dbafa
pkgrel=1
pkgdesc='Linux port of FAR v2'
url='https://github.com/elfmz/far2l'
arch=('i686' 'x86_64')
license=('GPL2')
source=('git+https://github.com/elfmz/far2l'
        'far2l-desktop.patch')
sha256sums=('SKIP'
            'f279f4255d9015e087e036fb793de688b973b1d14afd30a55722cc6f591675ce'
           )
makedepends=('git' 'cmake')
depends=('wxgtk3' 'openssl' 'spdlog' 'xerces-c' 'fmt' 'uchardet')
optdepends=(
  'libssh: SFTP support in NetRocks'
  'smbclient: SMB support in NetRocks'
  'libnfs: NFS support in NetRocks'
  'neon: WebDAV support in NetRocks'
  'pcre: custom archives support in multiarc'
  'libarchive: more archive type support in multiarc'
)

pkgver() {
  cd "$srcdir"/far2l
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir"/far2l
  patch -p1 -i "$srcdir"/far2l-desktop.patch
}

package() {
  cd "$srcdir"/far2l

  cmake . -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr -DCMAKE_BUILD_TYPE=Release -DwxWidgets_CONFIG_EXECUTABLE=/usr/bin/wx-config-gtk3 -DCMAKE_CXX_FLAGS=-w
  cmake --build . --target install

  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_askpass
  ln -sf ../../bin/far2l "$pkgdir"/usr/lib/far2l/far2l_sudoapp
}
