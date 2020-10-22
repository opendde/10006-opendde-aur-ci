# Maintainer: Janek Thomaschewski <janek@thomaschewski.dev>

pkgname=rambox-bin
_pkgname=Rambox
pkgver=0.7.7
pkgrel=2
pkgdesc='Free and Open Source messaging and emailing app that combines common web applications into one.'
arch=('i686' 'x86_64')
depends=('desktop-file-utils' 'gtk3' 'libappindicator-gtk3' 'libnotify' 'libxtst' 'libxss' 'libxkbcommon' 'libsecret' 'nss' 'libutil-linux')
provides=('rambox')
conflicts=('rambox')
url='http://rambox.pro/'
license=('GPL3')

source_i686=("https://github.com/ramboxapp/community-edition/releases/download/$pkgver/${_pkgname}-$pkgver-linux-i386.deb")
source_x86_64=("https://github.com/ramboxapp/community-edition/releases/download/$pkgver/${_pkgname}-$pkgver-linux-amd64.deb")

sha256sums_i686=('dae550daa5383df57c1a0690f031927e9db7e2a41b3e6d93f35b82a0a0c40fda')
sha256sums_x86_64=('a99bf982ba01925a60b5d5b6ea05e39bfd52bdf3261f7c117b24bdb98223322e')

package() {
    # extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    # install symbolic link in /usr/bin
    install -d -m755 "${pkgdir}/usr/bin"
    ln -s /opt/${_pkgname}/rambox "${pkgdir}/usr/bin"

    # fix crash on some systems due to https://github.com/ramboxapp/community-edition/issues/2481
    chmod 4755 "${pkgdir}/opt/${_pkgname}/chrome-sandbox"
}
