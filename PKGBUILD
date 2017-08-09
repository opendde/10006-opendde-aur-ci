# Maintainer: Alexander Sulfrian <asulfrian at zedat dot fu-berlin dot de>
# Contributor: swearchnick <swearchnick at gmail dot com>

_pkgbase=tbs-linux_media-git
pkgname=${_pkgbase}-dkms
pkgver=r20170623.031410.f563cede
pkgrel=1
pkgdesc="TBS linux open source drivers (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/tbsdtv/linux_media"
license=('GPL2')
makedepends=('git')
depends=('dkms' 'patchutils' 'perl-proc-processtable')
conflicts=("${_pkgbase}" 'tbs-dvb-drivers')
provides=("${_pkgbase}" 'linux_media')
source=('dkms.conf'
        'media_build::git+https://github.com/tbsdtv/media_build.git')
sha256sums=('91b3834952b370cca204562542a7dd603d98353a042554ff64014608285bddb7'
            'SKIP')
options=('!strip')

prepare() {
    if [ -d "${srcdir}/media" ]; then
        cd "${srcdir}/media" && \
        git fetch --depth=1 origin && \
        git reset --hard origin/latest
    else
        git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest "$srcdir/media"
    fi
}

pkgver() {
    cd "$srcdir/media"
    printf "r%s.%s" "$(git show -s --date=format:'%Y%m%d.%H%M%S' --format=%cd)" "$(git rev-parse --short HEAD)"
}

package() {
    # Copy dkms.conf
    install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    # Copy sources
    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media/"
    cp -r "${srcdir}/media"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media/"

    mkdir -p "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media_build/"
    cp -r "${srcdir}/media_build"/* "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/media_build/"
}
