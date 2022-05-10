# Maintainer: dreieck
# Contributor: jghodd

_pkgname=uvesafb-dkms
pkgname="${_pkgname}-git"
pkgver=1.0.4+r10.20210102.cada654
pkgrel=2
pkgdesc="uvesafb DKMS driver."
arch=('i686' 'x86_64')
url="https://github.com/jghodd/uvesafb-dkms"
license=('GPL2')
depends=(
  'dkms>=2.2.0'
  'v86d'
)
makedepends=(
  'git'
)
provides=(
  "${_pkgname}=${pkgver}"
  'UVESAFB-MODULE'
)
conflicts=(
  "${_pkgname}"
)
optdepends=(
  "mkinitcpio-uvesafb: For mkinitcpio hook to load the 'uvesafb' module."
)
options=('!makeflags')

source=(
  "${_pkgname}::git+https://github.com/jghodd/uvesafb-dkms.git"
  'dkms.conf'
  'modprobe_uvesafb.conf'
)

sha256sums=(
  'SKIP'
  '3afc65ee7ec66978910aae2d5247d81b64c07a5f0770e89c4ce359e1aac9c6b7'
  '5d5949ec23a546d1468327e5496e8cc2b0b2015b84ff8bedb6d0b462df59bd19'
)

prepare() {
  cd "${srcdir}"

  printf '%s\n' "${url}" > 'upstream.url'
}

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed -E 's|^[vV]||' | tr '-' '.')"
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

package() {
  cd "${srcdir}"

  # Copy dkms.conf
  install -D -v -m644 "dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -rv "${_pkgname}/src" "${_pkgname}/Makefile" \
        "${pkgdir}/usr/src/${_pkgname}-${pkgver}"/

  # Install example modprobe configuration
  install -D -v -m644 "${srcdir}/modprobe_uvesafb.conf" "${pkgdir}/usr/share/doc/${_pkgname}/examples/etc/modprobe.d/uvesafb.conf"

  # Install documentation
  install -D -v -m644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -D -v -m644 "${srcdir}/upstream.url" "${pkgdir}/usr/share/doc/${_pkgname}/upstream.url"
}
