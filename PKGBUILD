# Maintainer: Sam Whited <sam@samwhited.com>

_pkgname=jackal
pkgname=${_pkgname}-git
pkgver=v0.4.6_1_g8be4ba9049ea
pkgrel=2
pkgdesc='An XMPP/Jabber server'
arch=('x86_64' 'i686')
url='https://github.com/ortuman/jackal'
license=('GPL3')
depends=('glibc')
makedepends=('go>=1.11.0')
optdepends=('postgresql: PostgreSQL support'
            'mariadb: MariaDB support')
conflicts=('jackal')
provides=('jackal')
backup=('etc/jackal/jackal.yml')
source=(git+https://github.com/ortuman/jackal.git
        jackal.service
        jackal.sysusers
        jackal.tmpfiles
        jackal.yml)
sha256sums=('SKIP'
            '0a9a9065957e5b0576e5443b29bf0cae81281194664376569a91c51f85e7d7ff'
            '5fec4f4053ac15cd597bb32ba03c35d85f52438204fd801edf333403ec2c4bf3'
            '20b7e5a5fee727e72fdbac54182b594a838340c0625036ca9d117e2a9d710045'
            'e7e0b6d701c4e0c7b76fb3b446e01926368325e70aff04fa33eb5f9e88f392be')
install=jackal.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed s/-/_/g
}

build() {
  cd ${_pkgname}
  export GO111MODULE=on
  go build -gcflags  "all=-trimpath=${PWD}" \
           -asmflags "all=-trimpath=${PWD}" \
           -ldflags  "-extldflags ${LDFLAGS}"
}

package() {
  install -dm 750 "${pkgdir}/var/lib/jackal/"
  install -dm 775 "${pkgdir}/usr/share/doc/jackal/"
  install -dm 775 "${pkgdir}/usr/share/jackal/"

  install -D jackal.yml "${pkgdir}/etc/jackal/jackal.yml"
  install -Dm444 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/jackal/"
  cp -r "${srcdir}/${_pkgname}/sql/" "${pkgdir}/usr/share/jackal/"
  install -Dm755 "${srcdir}/${_pkgname}/jackal" "${pkgdir}/usr/bin/jackal"

  install -Dm644 ${_pkgname}.sysusers "${pkgdir}"/usr/lib/sysusers.d/${pkgname}.conf
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/${_pkgname}.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}

# vim: ts=2 sw=2 et:
