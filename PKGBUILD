
# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Shaun Bartlett <tixetsal@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: Tom Moore <t.moore01@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

# Based on the plex-media-server package by Maxime Gauduin.

pkgname=plex-media-server-plexpass
pkgver=1.30.0.6442
_pkgsum=5070ad484
pkgrel=1
pkgdesc='The back-end media server component of Plex.'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url='https://plex.tv/'
license=('custom')
options=('!emptydirs' '!strip' 'staticlibs')
provides=('plex-media-server')
conflicts=('plex-media-server')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'plexmediaserver.hook'
        'plex.sysusers'
        'plex.tmpfiles'
        'terms.txt')

source_aarch64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_arm64.deb")
source_armv7h=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_armhf.deb")
source_x86_64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/redhat/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")
source_i686=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/redhat/plexmediaserver-${pkgver}-${_pkgsum}.i686.rpm")

sha256sums=('b7f2fb1cbedde54a79a1794ec9f35f8bdeb033a4c5453ec77944ca7fe77cd9b7'
            'ef09d53d410f92ea5ec3e9549ad9d1ac6136a83a5b60a4ea7c67b67435d752d9'
            'a94c798e3a1b5614020e3dd6ec80d378c0401fa08f411769527ad87a6898e80c'
            'c597bee0bcbb59ed791651555a904e5f7e9d2e82f6c6986b6352e5fc38e5b557'
            'b7ff6525a3c7a8be885edc85bb523095f8e25ddb38873127e2a4e97b28f2c7ad'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_x86_64=('132ad3ed4cd550e9a6fd4c35695ba1c0281635bb8912161bcda79cd47de75c68')
sha256sums_i686=('f2f829784ac38f50f5d34e68afaeadfc321ff8dbe26683248cc121e3b4ef0ab6')
sha256sums_armv7h=('36c2f2b256e126c8390d9e41bc8649b479d6da24d834cec1acb39f53c04a353f')
sha256sums_aarch64=('5ab82eb67eccf37eced32f43f272f630a04f52ad1577f234839a566c23a2135e')

prepare() {
  if [[ $CARCH = armv7h ]] || [[ $CARCH = aarch64 ]]; then
    bsdtar -xf data.tar.xz
  fi
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/plexmediaserver"
  cp -dr --no-preserve='ownership' "${srcdir}/usr/lib/plexmediaserver" "${pkgdir}/usr/lib/"

  install -D -m 644 "${srcdir}/plexmediaserver.conf.d" "${pkgdir}/etc/conf.d/plexmediaserver"
  install -D -m 644 "${srcdir}/plexmediaserver.service" "${pkgdir}/usr/lib/systemd/system/plexmediaserver.service"
  install -D -m 644 "${srcdir}/plex.sysusers" "${pkgdir}/usr/lib/sysusers.d/plex.conf"
  install -D -m 644 "${srcdir}/plex.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plex.conf"

  install -D -m 644 "${srcdir}/terms.txt" "${pkgdir}/usr/share/licenses/${pkgname}/terms.txt"
  install -D -m 644 "${srcdir}/plexmediaserver.hook" "${pkgdir}/usr/share/doc/${pkgname}/plexmediaserver.hook"
}

# vim: ts=2 sw=2 et:
