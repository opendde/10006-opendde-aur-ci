# Previous Maintainer: Peter Reschenhofer < peterreschenhofer at gmail dot com >
# Current Maintainer : Mark Lee <mark@markelee.com>
# Contributor: Familia < carlosfamilia at gmail dot com >
pkgname=rstudio-server-bin
pkgver=2022.07.1_554
pkgrel=2
pkgdesc="A integrated development environment (IDE) for R (binary version from RStudio official website)"
arch=('x86_64')
license=('GPL')
url="http://www.rstudio.org/"
depends=('r>=3.0.1' 'glibc>=2.7' 'libedit' 'psmisc' 'openssl-1.1' 'postgresql-libs')
conflicts=('rstudio-server' 'rstudio-server-git')
sha256sums=('b6778c0a78d69d836d5c812342a3697a19b83c80c2d6eb7162b38dedc6ad6b56'
            '24b0545aa2a576c7d7480c0ef77d7641e2ebaadae856fd2a18f57871bd25fd88'
            '993a3096c2b113e6800f2abbd5d4233ebf1a97eef423990d3187d665d3490b92')
provides=("rstudio-server=${pkgver}")
#options=(!strip)
source=(#"https://download2.rstudio.org/server/debian9/x86_64/rstudio-server-${pkgver}-amd64.deb"
        "https://download2.rstudio.org/server/bionic/amd64/rstudio-server-${pkgver/_/-}-amd64.deb"
        "rstudio-server.service"
        "rstudio")
install="${pkgname}".install

package() {
    msg "Converting debian package..."

    cd "${srcdir}"
    #tar zxpf data.tar.xz -C "${pkgdir}"
    tar xf data.tar.xz -C "${pkgdir}"
    chmod 755 $(find ${pkgdir}/usr -type d)

    install -m755 -d "${pkgdir}/usr/bin"
    install -m755 -d "${pkgdir}/etc/rstudio"
    install -m644 -D "rstudio-server.service" "${pkgdir}/etc/systemd/system/rstudio-server.service"
    mkdir -p "${pkgdir}/etc/pam.d"
    install -m644 -D "rstudio" "${pkgdir}/etc/pam.d/"
}
