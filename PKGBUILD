# Maintainer: Tomas S. <me+aur at wereii.cz>
# Controbutor: Martin Petrus <martin.petrus@example.com>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Kochetkov Andrey <gornet@gmail.com>
# Contributor: Fabian Schoelzel <myfirstname.mylastname@googlemail.com>

pkgname=pyfa
pkgver=2.39.2
pkgrel=2
_distname="Pyfa-${pkgver}"
pkgdesc="EVE Online Fitting Assistant"
arch=('any')
url="https://github.com/pyfa-org/Pyfa"
license=('GPL3')
makedepends=('python-pip')
depends=('python' 'python-wxpython' 'python-logbook' 'python-matplotlib' 'python-dateutil' 'python-setuptools' 'python-requests' 'python-sqlalchemy' 'python-cryptography' 'python-markdown2' 'python-packaging' 'python-beautifulsoup4' 'python-yaml' 'python-roman' 'python-numpy' 'python-jose' 'python-requests-cache' 'webkit2gtk')
optdepends=()
options=(!strip)
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/pyfa-org/Pyfa/archive/v$pkgver.tar.gz
        pyfa.desktop
        pyfa-start.sh
        0001-python-3.10-compatibility.patch
       )

sha256sums=('2a16ca0f1c2c34aebe9698aa84cae3695eea509eaa7496011d1bab0f8ac78a1f'
            SKIP SKIP SKIP)

build() {
  cd "${srcdir}"/"${_distname}"
  # "Temporary" fix for python310 and wxPython>4.0.6
  echo "Applying 0001-python-3.10-compatibility.patch"
  patch --binary -l -p1 < ../0001-python-3.10-compatibility.patch
  python db_update.py
}

package() {
  install -dm755 "${pkgdir}"/usr/share/pyfa
  install -dm755 "${pkgdir}"/usr/share/licenses/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/config.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/db_update.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/eve.db "${pkgdir}"/usr/share/pyfa
  install -Dm755 "${srcdir}"/"${_distname}"/pyfa.py "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/README.md "${pkgdir}"/usr/share/pyfa
  install -Dm644 "${srcdir}"/"${_distname}"/version.yml "${pkgdir}"/usr/share/pyfa

  install -Dm644 "${srcdir}"/"${_distname}"/LICENSE "${pkgdir}"/usr/share/licenses/pyfa

  cp -a "${srcdir}"/"${_distname}"/eos "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/graphs "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/gui "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/imgs "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/service "${pkgdir}"/usr/share/pyfa
  cp -a "${srcdir}"/"${_distname}"/utils "${pkgdir}"/usr/share/pyfa
  
  install -dm755 "${pkgdir}"/usr/share/pixmaps
  install -Dm644 "${srcdir}"/"${_distname}"/imgs/gui/pyfa64.png "${pkgdir}"/usr/share/pixmaps/pyfa.png

  install -Dm644 "${srcdir}"/pyfa.desktop "${pkgdir}"/usr/share/applications/pyfa.desktop
  install -Dm755 "${srcdir}"/pyfa-start.sh "${pkgdir}"/usr/bin/pyfa
}

