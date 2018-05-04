# Maintainer: Renaud Littolff <rlittolff@gmail.com>
# Contributor: Gregory Schier <greg@schier.co>

pkgname=insomnia
pkgver=5.16.2
pkgrel=1
pkgdesc="A simple and beautiful REST API and HTTP client"
arch=('x86_64')
url="http://insomnia.rest/"
options=('!strip' '!upx')
depends=()

source=(
    "https://github.com/getinsomnia/insomnia/releases/download/v${pkgver}/insomnia_${pkgver}_amd64.deb"
    "insomnia.sh"
)

package() {
    # Define some helpers
    SCRIPT_PATH=${pkgdir}/opt/Insomnia/insomnia

    # Extract the core package
    tar -xf data.tar.xz -C "${pkgdir}"

    # Setup usr folder
    chmod -R go-w ${pkgdir}/usr
    mkdir -p ${pkgdir}/usr/bin

    # Setup the start script and permissions
    mv ${pkgdir}/opt/Insomnia/insomnia ${pkgdir}/opt/Insomnia/insomnia.bin
    cp ${srcdir}/insomnia.sh ${SCRIPT_PATH}
    chmod 755 ${SCRIPT_PATH}
    ln -s /opt/Insomnia/insomnia ${pkgdir}/usr/bin/insomnia

    # Install the necessary parts
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/icons
    install -d ${pkgdir}/opt/Insomnia
}

# Generated by `$ makepkg -g >> PKGBUILD`
md5sums=('6ec0ded1b092e1a982c4fbfd574bf2f1'
         'a1f02a6e1658e95218fca636ea56f5a3')
