# Maintainer: dreieck

# PKGBUILD last time manually edited: At least on 2016-12-11.

_pkgname=idos-package-updater-script
pkgname="${_pkgname}"
epoch=0
pkgver=20180718.2
pkgrel=1
pkgdesc="Bash script which automates the process of updating installed IDOS timetable browser related packages by reinstalling and thus fetching the newest version."
arch=('any')
license=('custom')

groups=(
        "idos-timetable"
       )

depends=(
  "util-linux" # for 'column'-executable.
  "pacman"
  "yaourt"
)

makedepends=()

optdepends=()

provides=()

conflicts=()

replaces=()


source=(
  "idos-packages-update.sh"
  "copying.txt"
)

sha256sums=(
  "5b3574e974b06312dad217148c30f0e31ac7c7255a3ff9f3d4f3c1fa7322cf85"
  "c3cbff25307e905545788f5c74cc137d79706c60549092f2a37919b93cf55ee3"
)


pkgver() {
  "${srcdir}/idos-packages-update.sh" --version
}


package() {
  _instdirbase='/opt/idos-timetable'
  _instdir="${pkgdir}/${_instdirbase}"
  _licdirbase="/usr/share/licenses/${pkgname}"
  _licdir="${pkgdir}/${_licdirbase}"
  _execdirbase='/usr/bin'
  _execdir="${pkgdir}/${_execdirbase}"
  
  install -v -D -m755 "${srcdir}/idos-packages-update.sh" "${_instdir}/idos-packages-update.sh"
  install -v -D -m644 "${srcdir}/copying.txt" "${_licdir}/copying.txt"
  install -v -d -m755 "${_execdir}"

  ln -sv "${_instdirbase}/idos-packages-update.sh" "${_execdir}/"
}
