# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
# Thanks to mobo's package, https://aur.archlinux.org/packages/zandronum2/
pkgname=zandronum
pkgver=3.0
pkgrel=3
_fmod_ver_true="4.24.16"
_fmod_ver="$(echo ${_fmod_ver_true} | sed -e 's/\.//g')"
pkgdesc="OpenGL ZDoom port with Client/Server multiplayer"
arch=('i686' 'x86_64')
url="https://zandronum.com/"
license=('custom')
depends=('sdl' 'libjpeg6-turbo' 'glu' 'openssl' 'fluidsynth')
optdepends=('timidity++: midi support' 'freedoom: free IWAD' 'gtk2: for a GUI selection screen')
makedepends=( 'zlib' 'sdl' 'libjpeg-turbo' 'nasm' 'gtk2' 'cmake' 'mercurial' 'fluidsynth' 'mesa' 'glu' )
_pkgname=zandronum
conflicts=('zandronum2')
install=zandronum.install
source=("LICENSE.txt"
	"${pkgname}.launcher"
	"${pkgname}-server.launcher"
	"LICENSE.txt.sig"
	"${pkgname}.launcher.sig"
	"${pkgname}-server.launcher.sig")
sha512sums=('b928f3211ff31f17fc2d754728e299b5783e1b946b4019713718b7613e13ff0a7c4f02087c0ab4f137f7a0de57a2bfeaa6ed63285d0e6063d2b4734b097ce9e1'
	    '488a274e40727ea58e1a6a67d9d37e77476f4fbcee9071e5f278fcfd88ddce42d25d3337d5d15455aa5cba32a176ec731e398cddfc6b86e151ba92c8bc1e1f22'
	    '5c4ab297579c3b623ea549548b9e0674195f3d86f17589a2a756c8362e46dec0f1eb488ec0347be14968969f9ba802998bd67d910d3d6500a90f50074fcabfb5'
	    'SKIP'
	    'SKIP'
	    'SKIP')
source_i686=("https://zandronum.com/downloads/${_pkgname}${pkgver}-linux-x86.tar.bz2"
             "${_pkgname}${pkgver}-linux-x86.tar.bz2.sig")
sha512sums_i686=('e04d421b817f366d5b0d0251088065b36daadb550b77f2d655db735c8163e92110ad7ec602b7d0fe93fcacd89bdb93c5de79eaa1546e4f8ba4d297200033e1a0'
            	 'SKIP')
source_x86_64=("https://zandronum.com/downloads/${_pkgname}${pkgver}-linux-x86_64.tar.bz2"
               "${_pkgname}${pkgver}-linux-x86_64.tar.bz2.sig")
sha512sums_x86_64=('830985bbea92c5519c50fbda839da7cebf35af7969d550c3e3d3f829fdb2d693c599d7d7f06ba977cb0cbb6973fa05c30cd06ff20293d5679688c9ea0b1392cc'
            	   'SKIP')

if [ "${CARCH}" == "x86_64" ];
then
	_fmod_suffix="64"
else
	_fmod_suffix=""
fi

package() {
  cd ${srcdir}
  
  install -Dm644 "zandronum.pk3" "${pkgdir}/usr/share/${pkgname}/zandronum.pk3"
  #install -Dm644 "brightmaps.pk3" "${pkgdir}/usr/share/${pkgname}/brightmaps.pk3"
  install -Dm644 "skulltag_actors.pk3" "${pkgdir}/usr/share/${pkgname}/skulltag_actors.pk3"
  install -Dm755 "liboutput_sdl.so" "${pkgdir}/usr/share/${pkgname}/lib/liboutput_sdl.so"
  install -Dm755 "zandronum" "${pkgdir}/usr/share/${pkgname}/zandronum"
  install -Dm755 "zandronum-server" "${pkgdir}/usr/share/${pkgname}/zandronum-server"
  install -Dm755 "zandronum.launcher" "${pkgdir}/usr/bin/zandronum"
  install -Dm755 "zandronum-server.launcher" "${pkgdir}/usr/bin/zandronum-server"
  install -Dm755 "libfmodex${_fmod_suffix}-${_fmod_ver_true}.so" "${pkgdir}/usr/share/${pkgname}/lib/libfmodex${_fmod_suffix}-${_fmod_ver_true}.so"

#  ln -s "/usr/lib/libcrypto.so" "$pkgdir/usr/share/zandronum/lib/libcrypto.so.0.9.8"
#  ln -s "/usr/lib/libssl.so" "$pkgdir/usr/share/zandronum/lib/libssl.so.0.9.8"

  install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
