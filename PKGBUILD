# Maintainer: SanskritFritz (gmail)
# Contributor: dreieck (AUR)

_pkgname=toppler
pkgname="${_pkgname}-git"
pkgver=1.2+10+r531.20220201.8596a68
pkgrel=2
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="https://gitlab.com/roever/toppler/"
license=('GPL3')
depends=('gcc-libs' 'sdl2_mixer' 'zlib')
makedepends=('gettext' 'gimp' 'git' 'imagemagick' 'povray')
optdepends=(
  "${_pkgname}-levels: The upstream levels as individual missions that can be played individually, and files that can be loaded into the level editor."
)
provides=( "${_pkgname}=${pkgver}" )
conflicts=( "${_pkgname}" )
replaces=( "${_pkgname}-darcs" )
source=(
  "${_pkgname}::git+https://gitlab.com/roever/toppler.git"
  "toppler.desktop"
)
sha256sums=(
  'SKIP'
  '828b4f8f6901e757de8cce76473caa1064b2db1375330eee370b0eff79909e9a'
)

pkgver () {
  cd "${srcdir}/${_pkgname}"
  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
  install -D -v -m644 "${srcdir}/toppler.desktop" "${pkgdir}/usr/share/applications/toppler.desktop"
  for _docfile in README.md doc/*; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
  install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
}
