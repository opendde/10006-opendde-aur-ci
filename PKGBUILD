# Maintainer: Matthew McGinn <mamcgi@gmail.com>
# Contributor: Gergely Imreh <imrehg@gmail.com>

pkgname=balena-cli
pkgdesc='balena.io command line interface'
pkgver=12.40.4
pkgrel=1
arch=('x86_64')
url='https://balena.io/'
_github_url="https://github.com/balena-io/balena-cli"
license=('APACHE')
depends=('nodejs>=10.20.0' 'nodejs<14.0.0' 'gawk' 'sed' 'make')
makedepends=('npm' 'python2' 'jq' 'coffeescript' 'git' 'node-gyp')
optdepends=('python2: balena preload'
    'openssh: balena ssh'
    'linux-aufs: balena preload/build/deploy --build'
    'avahi: balena scan')
optdepends_x86_64=('lib32-glibc: emulated builds')
source=(https://registry.npmjs.org/${pkgname}/-/${pkgname}-${pkgver}.tgz)
noextract=(${pkgname}-${pkgver}.tgz)
options=(!strip)
replaces=('resin-cli')
sha256sums=('7fae71573776c88624a25e4f5e246a811f51c5a64a9323a4f2635bd13164b757')

package() {
  npm install --global --production --cache "${srcdir}/npm-cache" --prefix "${pkgdir}/usr" "${srcdir}/${pkgname}-${pkgver}.tgz"

  find "${pkgdir}" -name package.json -print0 | xargs -r -0 sed -i '/_where/d'

  find "${pkgdir}/usr" -type d -exec chmod 755 {} +
  local tmppackage="$(mktemp)"
  local pkgjson="${pkgdir}/usr/lib/node_modules/${pkgname}/package.json"
  jq '.|=with_entries(select(.key|test("_.+")|not))' "${pkgjson}" > "${tmppackage}"
  mv "${tmppackage}" "${pkgjson}"
  chmod 644 "${pkgjson}"
  chown -R root:root "${pkgdir}"
}
