# Maintainer: Dafne Kiyui <didyouknowthat@dafne.rocks>
# CoMaintainer: Kenneth Cremeans <kcrem@hfhosting.us>
# Release Code Name: Newton

pkgname=lbry-app-bin
pkgver=0.45.1
pkgrel=1
pkgdesc='The LBRY app built using electron'
arch=('x86_64')
url='https://lbry.com/'
license=('MIT')
# dpkg -I $pkg.deb | grep Depends
# gconf deprecated: https://github.com/electron/electron/issues/2727
# gnome-keyring still required: https://github.com/lbryio/lbry-desktop/issues/386
depends=('libnotify' 'libappindicator-gtk2' 'libxtst' 'nss' 'libsecret')
source=('https://github.com/lbryio/lbry-desktop/releases/download/v0.45.1/LBRY_0.45.1.deb')
sha256sums=('f92635e94aab596883605e1890164720bb6bda0e56ce12c925de2ca6b14a0a07')

package() {
    tar -xf "$srcdir/data.tar.xz" -C "$pkgdir"
    install -dm755 "$pkgdir"/{opt,usr/bin,usr/share}
    ln -s "/opt/LBRY/lbry" "$pkgdir/usr/bin/lbry"
}
