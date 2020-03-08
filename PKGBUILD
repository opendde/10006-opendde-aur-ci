# Maintainer: dreieck
# Contributor: Jens Adam <jra@byte.cx>

_perlmod=Travel-Status-DE-IRIS
_pkgname=perl-travel-status-de-iris
pkgname="${_pkgname}-git"
_pkgver="latest"
epoch=1
pkgver=1.43+r466.20200121.g9151036
pkgrel=1
pkgdesc='Interface to IRIS-based web departure monitors (as used by DeutscheBahn)'
url='http://finalrewind.org/projects/Travel-Status-DE-IRIS/'
license=('PerlArtistic')
arch=('any')
depends=(
  'perl-class-accessor'
  'perl-datetime'
  'perl-datetime-format-strptime'
  'perl-geo-distance'
  'perl-list-compare'
  'perl-list-moreutils'
  'perl-list-utilsby'
  'perl-libwww'
  'perl-package-deprecationmanager'
  'perl-text-levenshtein'
  'perl-xml-libxml'
)
makedepends=(
  'perl-file-slurp'
  'perl-module-build'
  'perl-test-compile'
  'perl-test-fatal'
  'perl-test-pod'
  'perl-text-csv'
)
checkdepends=(
  'perl-test-number-delta'
)
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}<=${pkgver}")
conflicts=("${_pkgname}")
options=('!emptydirs')
# source=("http://finalrewind.org/projects/${_perlmod}/${_perlmod}-${pkgver}.tar.gz"{,.asc})
source=("${_perlmod}::git+http://git.finalrewind.org/${_perlmod}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_perlmod}"
#   {
#     grep -e '\$VERSION[[:space:]]*=[[:space:]]*' './bin/db-iris' | head -n 1; echo 'print $VERSION'
#   } | perl

  _descr="$(git describe --tags --long)"
  _ver="$(printf '%s' "${_descr}" | awk -F '-' '{print $1}')"
  _rev="r$(git rev-list --count HEAD)"
  _hash="$(printf '%s' "${_descr}" | awk -F '-' '{print $3}')"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  printf '%s\n' "${_ver}+${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}/${_perlmod}"
  sed -i 's/Text::LevenshteinXS/Text::Levenshtein/' Build.PL lib/Travel/Status/DE/IRIS/Stations.pm.PL
  perl Build.PL installdirs=vendor destdir="${pkgdir}"
  ./Build
}

check() {
  cd "${srcdir}/${_perlmod}"
  ./Build test
}

package() {
  cd "${srcdir}/${_perlmod}"
  ./Build install
  for _docfile in README.md Changelog; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done
}
