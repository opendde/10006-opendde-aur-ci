# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=dooble-qt4
pkgver=1.56c
pkgrel=1
pkgdesc='A safe WebKit Web browser'
url='http://dooble.sourceforge.net/'
arch=('i686' 'x86_64')
license=('custom:3-clause BSD')
depends=('qtwebkit' 'libspoton=2015.06.17' "dooble-common=${pkgver}")
makedepends=('qtwebkit' 'sed' 'coreutils')
source=("dooble-${pkgver}.tar.gz::https://downloads.sourceforge.net/project/dooble/Version%20${pkgver}/Dooble.d.tar.gz?r=")
sha256sums=('03b5bb0460aa8f4f731a47b70c571942a186fb0e7c4b74f546cef356be0afe6a')

# Dependency (from ldd output) tree:
# qtwebkit
#   qt4
#     openssl (via ca-certificates)
#     libsm (via libxt via libxmu via xorg-xset via xdg-utils)
#       libice
#       libutil-linux (via util-linux)
#     libjpeg (via libtiff)
#     libxrender (via libxrandr)
#     sqlite
#     fontconfig
#       expat
#         glibc
#       freetype2
#         bzip2
#         zlib
#         sh
#         libpng
#         harfbuzz
#           glib2
#             pcre
#             libffi
#           graphite
#             gcc-libs
#   gstreamer0.10-base
#     gstreamer0.10
#       libxml2
#         xz
#     orc
#   mesa-libgl (as libgl)
#     mesa
#       libdrm
#       libxxf86vm
#         libxext
#       libxdamage
#         libxfixes
#           libx11
#             libxcb
#               libxdmcp
#               libxau
#       libxshmfence
#       libsystemd (via systemd)
#         libgcrypt
#           libgpg-error


build()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    sed -i 's_-Werror__g' dooble.pro
    qmake-qt4 -o Makefile dooble.pro
    make distclean
    qmake-qt4 -o Makefile dooble.pro
    make
}

package()
{
    cd "$srcdir/dooble.d/Version 1.x/"
    install -Dm755  Dooble         -- "${pkgdir}/usr/lib/${pkgname}/Dooble"
    install -Dm755  dooble.sh      -- "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644  dooble.desktop -- "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    
    msg "Editing files for the file system adaption"
    
    sed -i s_"/usr/local/dooble/"_"/usr/lib/${pkgname}/"_g -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i s_"/usr/local/dooble"_"/usr/share/dooble"_g     -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i s_"\./Dooble"_"../../lib/${pkgname}/Dooble"_g   -- "${pkgdir}/usr/bin/${pkgname}"
    sed -i /LD_LIBRARY_PATH/d                              -- "${pkgdir}/usr/bin/${pkgname}"
    
    sed -i s_'/usr/local/dooble/Lib\x00'_'/usr/lib\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'_g  \
	-- "${pkgdir}/usr/lib/${pkgname}/Dooble" # The replacements's length must match the pattern's length
    
    sed -i s_'/usr/local/dooble/dooble.sh'_"/usr/bin/${pkgname}"_g  \
	-- "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

