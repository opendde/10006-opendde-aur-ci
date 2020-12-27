# Maintainer  : axzxc1236        <axzxc1236 (@) users.noreply.github.com>
# Contributor : LinRs            <LinRs at users.noreply.github.com>
# Contributor : hexchain         <i at hexchain.org>
# Contributor : Thaodan          <theodorstormgradex {at) gmail [dot} com>
# Contributor : Firef0x          <Firefgx {at) gmail [dot} com>
# Contributor : Bernhard Walle   <bwalle.de: bernhard            >
# Contributor : Jesse Jaara      <gmail.com, mail.ru: jesse.jaara>
# Contributor : Armin Wehrfritz
# Contributor : Patrick McCarty  <pnorcks at gmail dot com>

pkgname=osc-git
_pkgname=osc
pkgver=0.172.0.r3651.61045600
pkgrel=1
pkgdesc="Command line client for the openSUSE Build Service"
arch=(any)
url="https://github.com/openSUSE/osc"
license=('GPL2')
depends=('python' 'python-m2crypto' 'diffstat')
makedepends=('git' 'python-setuptools')
optdepends=('obs-build: required to run local builds'
            'obs-service-format_spec_file: for running the format_spec_file source service'
            'obs-service-download_files: for running the download_files source service'
            'python-keyring: keyring support'
            'python-progressbar: progressbar support for operations like uploading and services'
            'python-distro: Linux OS platform information API'
            )
conflicts=('osc' 'osc-bash-completion' 'zsh-completion-osc')
replaces=('osc-bash-completion' 'zsh-completion-osc')
source=("git+https://github.com/openSUSE/osc.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    echo $(head -1 NEWS).r$(git rev-list --count master).$(git rev-parse --short HEAD)
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_pkgname}/tests"
	python suite.py
}
package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}/" --optimize=1 --prefix=/usr

    cd "${pkgdir}/usr/bin"
    ln -s osc-wrapper.py osc
    cd -

    install -Dm644 dist/complete.sh "${pkgdir}/usr/share/bash-completion/completions/osc"
    install -Dm755 dist/osc.complete "${pkgdir}/usr/lib/osc/complete"
}
