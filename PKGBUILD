# Contributor: Thomas Laroche <tho.laroche@gmail.com>
# Contributor: Kristian Klausen <klausenbusk@hotmail.com>
# Maintainer: Thomas Fanninger <thomas@fanninger.at>

pkgname=gogs
_pkgname=${pkgname}
pkgver=0.6.5
pkgrel=4
epoch=1
pkgdesc="Gogs(Go Git Service) is a Self Hosted Git Service in the Go Programming Language."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
changelog=$pkgname.changelog
url="http://gogs.io/"
license=('MIT')
depends=('git>=1.7.1')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
makedepends=('go>=1.2' 'patch')
conflicts=('gogs-bin' 'gogs-git' 'gogs-git-dev')
options=('!strip' '!emptydirs')
backup=('srv/gogs/conf/app.ini')

install=gogs.install

_gourl=github.com/gogits
source=('gogs.service'
        'app.ini.patch'
        "${_pkgname}::git+https://${_gourl}/${_pkgname}.git#tag=v${pkgver}")

sha512sums=('2b4303f850e3b13b2fc3c9f0bc5820dae431d228002b35f01be0d4bfbcf05de8dcec2a559a85e318b609e4a4d492d44306eadf5f6508fd72333b198661bb0bb7'
            '939be9ad851ae6e20b786e2e189b0b67c0198edfc8c83442934ec48c7be073e03c75172e79f23a6ee1e0eb467c6fa18096a66d69d1142ebba28fdc8bb2a3964c'
            'SKIP')


prepare() {
  mkdir -p "${srcdir}/src/${_gourl}"
  mv "${_pkgname}" "${srcdir}/src/${_gourl}/${_pkgname}"
  msg2 "go get"
  GOPATH="${srcdir}" go get -tags "sqlite redis memcache" "${_gourl}/${_pkgname}"
  
  msg2 "Patch: GOGS app.ini"
  patch -Np1 -i "${srcdir}/app.ini.patch" "${srcdir}/src/${_gourl}/${_pkgname}/conf/app.ini"
}

build() {
  msg2 "Build program"
  cd ${srcdir}/src/${_gourl}/${_pkgname}
  GOPATH="${srcdir}" go fix
  GOPATH="${srcdir}" go build -tags "sqlite redis memcache cert"
}

package() {
  install -D -m 0755 "${srcdir}/src/${_gourl}/${_pkgname}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}/${_pkgname}"

  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/conf" "${pkgdir}/usr/share/${_pkgname}"
  install -d "${pkgdir}/usr/share/themes/gogs/default/"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/public" "${pkgdir}/usr/share/themes/gogs/default"
  cp -r "${srcdir}/src/${_gourl}/${_pkgname}/templates" "${pkgdir}/usr/share/themes/gogs/default"

  install -D -m 0600 "${pkgdir}/usr/share/${_pkgname}/conf/app.ini" "$pkgdir/srv/${_pkgname}/conf/app.ini"
  install -D -m 0644 "${srcdir}/gogs.service" "$pkgdir/usr/lib/systemd/system/gogs.service"
  install -d "${pkgdir}/var/log/gogs"
  install -D -m 0644 "${srcdir}/src/${_gourl}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/$_pkgname"
}
