# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi
_pkgname=meet
_version=1.0.6504
_url=https://download.jitsi.org/unstable/jitsi-meet-web_1.0.6504-1_all.deb
_url_config=https://download.jitsi.org/unstable/jitsi-meet-web-config_1.0.6504-1_all.deb

_pkgbase=${_basename}-${_pkgname}-nightly
_debname=${_basename}-${_pkgname}-web
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=1
pkgdesc="Jitsi Meet Web nightly binary"
arch=('any')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
depends=()
optdepends=("nginx")
makedepends=('tar')
options=('!strip')
backup=(
  "etc/webapps/${_pkgbase}/logging_config.js"
  "etc/webapps/${_pkgbase}/config.js"
  "etc/webapps/${_pkgbase}/interface_config.js"
)
source=(
        "$_url"
        "config_${_version}.deb::$_url_config"
)
noextract=(
    "config_${_version}.deb"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
        ar p "config_${_version}.deb" data.tar.xz | tar xJC ${_pkgbase}
}

package() {
        cd "$srcdir/${_pkgbase}"

        DESTDIR="${pkgdir}/usr/share/webapps/${_pkgbase}"
        CONFDIR="${pkgdir}/etc/webapps/${_pkgbase}"
        DOCDIR="${pkgdir}/usr/share/doc/${_pkgbase}"

        install -d "$DESTDIR"
        install -d "$CONFDIR"
        install -d "$DOCDIR"

        cp -R usr/share/jitsi-meet/* "${DESTDIR}"
        cp usr/share/jitsi-meet-web-config/config.js "${DESTDIR}"
        cp -R usr/share/jitsi-meet-web-config/* "${DOCDIR}"

        for i in interface_config.js logging_config.js config.js
        do
                install -Dm644 "$DESTDIR/${i}" "$CONFDIR/${i}"
                ln -sf "/etc/webapps/${_pkgbase}/${i}" "$DESTDIR/${i}"
        done

        sed -i 's@/usr/share/jitsi-meet@/usr/share/webapps/'${_pkgbase}'@' "${pkgdir}/usr/share/doc/${_pkgbase}/"*
        sed -i 's@/etc/jitsi/meet@/etc/webapps/'${_pkgbase}'@' "${pkgdir}/usr/share/doc/${_pkgbase}/"*

        chown -R root:root "${pkgdir}"
}
sha256sums=('b617f6c9e2299568397a00111246956025cf695e5c8ebbb9809f8e1ac49b4b38'
            'dd3c080bf99e2499ff1513a0956e9a5b09a7e00b03edcf46e228f25ba2dd69b5')
