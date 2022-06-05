# Maintainer: quietvoid <tcChlisop0@gmail.com>

_plug=rekt
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.0.0.r0.g2fbd63b
pkgrel=1
pkgdesc='Plugin for VapourSynth: rekt (GIT version)'
arch=('x86_64')
url='https://github.com/OpusGang/rekt'
license=('MIT')
depends=('vapoursynth' 'vapoursynth-plugin-vsutil')
makedepends=('git'
             'python-pip'
             'python-wheel')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/OpusGang/rekt.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_plug}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_plug}"
    pip wheel --no-deps . -w dist
}

package() {
    cd "${_plug}"
    
    pip install -I --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl
    install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/tools/${_plug}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
