# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>

_basename=jitsi
_pkgname=meet
_tag=4655
_version=1.0.4655

_pkgbase=${_basename}-${_pkgname}-nightly
_debname=${_basename}-${_pkgname}-web
pkgname=${_pkgbase}-bin
pkgver=${_version}
pkgrel=3
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
        "https://download.jitsi.org/unstable/${_debname}_1.0.${_tag}-1_all.deb"
        "https://download.jitsi.org/unstable/${_debname}-config_1.0.${_tag}-1_all.deb"
# temporary fix
	"lib-jitsi-meet.min.js.gz"
	"lib-jitsi-meet.e2ee-worker.js.gz"
)
noextract=(
	"${_debname}-config_1.0.${_tag}-1_all.deb"
)
provides=(${_pkgbase})
conflicts=(${_pkgbase})

build() {
        rm -rf ${_pkgbase}
        mkdir ${_pkgbase}
        tar xJf data.tar.xz -C ${_pkgbase}
	ar p "${_debname}-config_1.0.${_tag}-1_all.deb" data.tar.xz | tar xJC ${_pkgbase}

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

	# temp fix
	gzip -dc "${srcdir}/lib-jitsi-meet.min.js.gz" > "${DESTDIR}/libs/lib-jitsi-meet.min.js"
	gzip -dc "${srcdir}/lib-jitsi-meet.e2ee-worker.js.gz" > "${DESTDIR}/libs/lib-jitsi-meet.e2ee-worker.js"
        
        chown -R root:root "${pkgdir}"
}
sha256sums=('52aa1eeb1fd687189ee66c4efab42fee2951577794483efecab4a6586958bd71'
            'ae9d5e02f3455a3d28d88304b9951473a9e572a32f73c2f3237ed67406942ef4'
            '2f08ea2976b3c5282286327267dfa6e956bc6fbf47a85b939021a09249ae8a20'
            '25273fd18e84dd03e8a436eb9794ab2cadaefd291cb737808dbb622e81e6877e')
