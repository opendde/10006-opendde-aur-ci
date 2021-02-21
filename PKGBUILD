# Maintainer: sardo <sardonimous@hotmail.com>
# Parts copied from x3270 package by tuftedocelot <tuftedocelot@fastmail.fm>
pkgname=x3270-git
pkgver=4.1alpha7.r2733
pkgrel=1
pkgdesc="IBM 3270 terminal emulator for the X Window System"
arch=('x86_64')
url="http://x3270.bgp.nu/"
license=('BSD')
depends=('libxaw' 'openssl' 'bash')
makedepends=('imake' 'openssl' 'libx11' 'libxaw' 'libxt' 'xbitmaps' 'xorg-bdftopcf')
provides=("x3270")
conflicts=("x3270")
backup=(etc/x3270/ibm_hosts)
install=x3270.install
source=("$pkgname::git+https://git.code.sf.net/p/x3270/code"
        x3270.install
	x3270.fontpath
	x3270.desktop)
sha256sums=('SKIP'
            '1007f7a7a5ad41749dbc70cc7ca6e259ec7c272dd82d210d2dd0f2fca6c18444'
            '3cbd44463bf70a5a5983f4fa2ef51adaf4d3e0217638fc1f7fc12c1566c31d2b'
            'c45ded78fe9a2fe2acff1a5df53366647310165931b39bab942ab06296e13b1c')
pkgver() {
    cd "${srcdir}/${pkgbase}"
    printf "%s.r%s" "$(sed -n 's/^version=\"\([^\"]*\)\"/\1/p' Common/version.txt)" "$(git rev-list --count HEAD)"
}
build() {
   cd "${pkgname}" 
   ./configure --enable-x3270 --prefix=/usr --sysconfdir=/etc --with-fontdir=/usr/share/fonts/3270
   sed -n -e '/ * Copyright (c)/,/^$/{s/^...\(.*\)$/\1/p}' Common/copyright.c >LICENSE
   make || return 1
 }
package() {
   cd ${pkgname}
   make DESTDIR="${pkgdir}" install || return 1

   chmod 644 "${pkgdir}"/etc/x3270/ibm_hosts

   mkdir -pm755 "${pkgdir}/etc/X11/xorg.conf.d"
   mkdir -pm755 "${pkgdir}/usr/share/fonts/3270"
   mkdir -pm755 "${pkgdir}/usr/share/applications"
   mkdir -pm755 "${pkgdir}/usr/share/pixmaps"
   mkdir -pm755 "${pkgdir}/usr/share/licenses/${pkgname}"

   install -m644 "${srcdir}/x3270.fontpath"                   "${pkgdir}/etc/X11/xorg.conf.d/60-${pkgname}.conf"
   install -m644 "${srcdir}/x3270.desktop"                    "${pkgdir}/usr/share/applications/"
   install -m644 "${srcdir}/${pkgname}/x3270/x3270-icon2.xpm" "${pkgdir}/usr/share/pixmaps/"
   install -m644 "${srcdir}/${pkgname}/LICENSE"               "${pkgdir}/usr/share/licenses/${pkgname}/"
}

