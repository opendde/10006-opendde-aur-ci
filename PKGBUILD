# Maintainer: Tobias Witek <tobi@tobi-wan-kenobi.at>
# Contributor: Daniel M. Capella <polycitizen@gmail.com>
# Contributor: spookykidmm <https://github.com/spookykidmm>

pkgname=bumblebee-status
pkgver=2.1.2
pkgrel=1
pkgdesc='Modular, theme-able status line generator for the i3 window manager'
arch=('any')
url=https://github.com/tobi-wan-kenobi/bumblebee-status
license=('MIT')
depends=('python' 'python-netifaces' 'python-psutil' 'python-requests')
optdepends=('xorg-xbacklight: to display a displays brightness'
            'xorg-xset: enable/disable automatic screen locking'
            'libnotify: enable/disable automatic screen locking'
            'dnf: display DNF package update information'
            'xorg-setxkbmap: display/change the current keyboard layout'
            'redshift: display the redshifts current color'
            'pulseaudio: control pulseaudio sink/sources'
            'xorg-xrandr: enable/disable screen outputs'
            'pacman: display current status of pacman'
            'iputils: display a ping'
            'i3ipc-python: display titlebar'
            'fakeroot: dependency of the pacman module'
            'python-pytz: timezone conversion for datetimetz module'
            'python-tzlocal: retrieve system timezone for datetimetz module'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('7602a6574049917a5d7e194bac0e98640097c033cc2bf0370857f723fe21ec990aa8831b9f2796db1a9244af08bf07546792ec48234f77cc30aa9e530605de44')

package() {
  install -d "$pkgdir"/usr/bin \
    "$pkgdir"/usr/share/$pkgname/bumblebee_status/{core,util} \
    "$pkgdir"/usr/share/$pkgname/bumblebee_status/modules/{core,contrib} \
    "$pkgdir"/usr/share/$pkgname/themes/icons
  ln -s /usr/share/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
  ln -s /usr/share/$pkgname/bumblebee-ctl "$pkgdir"/usr/bin/bumblebee-ctl

  cd $pkgname-$pkgver
  cp -a --parents $pkgname bumblebee_status/{,core/,util/,modules/core/,modules/contrib/}*.py \
    themes/{,icons/}*.json $pkgdir/usr/share/$pkgname
  cp -r bin $pkgdir/usr/share/$pkgname/

  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
