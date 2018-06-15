# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=gitea
pkgver=1.4.2
pkgrel=2
pkgdesc='Git with a cup of tea, forked from Gogs. Is a Self Hosted Git Service in the Go Programming Language.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='http://gitea.io'
license=('MIT')
depends=('git')
makedepends=('go')
optdepends=('sqlite: SQLite support'
            'mariadb: MariaDB support'
            'postgresql: PostgreSQL support'
            'pam: Authentication via PAM support'
            'redis: Redis support'
            'memcached: MemCached support'
            'openssh: GIT over SSH support')
conflicts=('gitea-git' 'gitea-git-dev')
backup=('etc/gitea/app.ini')
source=(https://github.com/go-gitea/gitea/archive/v${pkgver}.tar.gz
        gitea.tmpfiles
        gitea.service
        app.ini)
sha512sums=('ab4cd43753afffec53a46c093bf92a9c31a633f9c8b5d730e8782eceee1e581cce673945005aaa6a94428d8acfcf2e6618f3abcc49f2ac5439aa8a4fb910b550'
            '11b9c62e6b46967e3763e8d795ffa0ea5d334694445b152493ec8ccecf62c58fe8cffccdb136930286d1311e4467a680435aa92b383eef2de9578917669e1e7f'
            'e27fc8d70a3ea1f7d0a040ea5f46be4e3c3de5591d29382cbc94eb20332a41e32c608dc8ccae776e56869c9a73efd55695881a33c770ee227bc8f4da09f06c76'
            '3d8439ad48621a4a87634588377d133ae13a9ce30830d140beee1d69e3d4d40f6c47df663e97620d88c42e892c7fc0845f4091574c6314bed53fd20c7416b949')

prepare() {
  mkdir -p "${srcdir}/src/code.gitea.io"
  ln -s "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/src/code.gitea.io/${pkgname}"
  sed -i -e "s/\"main.Version.*$/\"main.Version=${pkgver}\"/" "${srcdir}/${pkgname}-${pkgver}/Makefile"
}

build() {
  cd ${srcdir}/src/code.gitea.io/${pkgname}
  GOPATH="${srcdir}" PATH="${PATH}:${GOPATH}/bin/" make DESTDIR="${pkgdir}" TAGS="sqlite tidb pam" clean generate build
}

package() {
  install -Dm644 "${srcdir}/gitea.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/gitea.conf"

  install -dm 750 "${pkgdir}/var/lib/gitea/"
  install -dm 750 "${pkgdir}/var/lib/gitea/"{repos,tmp,attachments,data,indexer,conf}
  install -dm 750 "${pkgdir}/var/log/gitea/"
  install -dm 775 "${pkgdir}/etc/gitea/"

  install -Dm755 "${srcdir}/src/code.gitea.io/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/gitea.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm644 "${srcdir}/src/code.gitea.io/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm664 "${srcdir}/app.ini" "${pkgdir}/etc/gitea/app.ini"

  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/"{templates,options,public} "${pkgdir}/var/lib/${pkgname}"
  cp -r "${srcdir}/src/code.gitea.io/${pkgname}/options/locale" "${pkgdir}/var/lib/${pkgname}/conf"
}
