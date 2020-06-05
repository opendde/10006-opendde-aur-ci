# Maintainer: kageru <kageru[at]encode[dot]moe>

_plug=vsutil
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r60.afc1870
pkgrel=1
pkgdesc='A collection of general purpose Vapoursynth functions to be reused in modules/scripts'
arch=('x86_64')
url='https://github.com/Irrational-Encoding-Wizardry/vsutil'
license=('MIT')
depends=('vapoursynth')
makedepends=('git'
             'python-setuptools')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Irrational-Encoding-Wizardry/vsutil.git")
sha256sums=('SKIP')

_site_packages="$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")"

pkgver() {
    cd "${_plug}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_plug}"
    python setup.py build
}

package() {
    cd "${_plug}"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
