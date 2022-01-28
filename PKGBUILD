# Maintainer: Mohammad Amin Mollazadeh <madamin@pm.me>
# Contributer: Robin Lange <robin dot langenc at gmail dot com>

pkgname=optimus-manager-openrc-git
pkgver=1.3.1.r64.g28bdc14
pkgrel=1
pkgdesc="Management utility to handle GPU switching for Optimus laptops (Git version)"
arch=('any')
url="https://github.com/minusium/optimus-manager"
license=('MIT')
conflicts=("optimus-manager" "optimus-manager-git")
provides=("optimus-manager=$pkgver")
depends=('python3' 'python-setuptools' 'python-dbus' 'glxinfo' 'xorg-xrandr'
         'python-py3nvml' 'python-psutil' 'openrc' 'elogind')
optdepends=('bbswitch: alternative power switching method'
            'acpi_call: alternative power switching method'
            'xf86-video-intel: provides the Xorg intel driver')
makedepends=('python-setuptools' 'git')
backup=('etc/optimus-manager/xorg-integrated-gpu.conf'
        'etc/optimus-manager/xorg-nvidia-gpu.conf'

        'etc/optimus-manager/xsetup-integrated.sh'
        'etc/optimus-manager/xsetup-nvidia.sh'
        'etc/optimus-manager/xsetup-hybrid.sh'

        'etc/optimus-manager/nvidia-enable.sh'
        'etc/optimus-manager/nvidia-disable.sh'

        'var/lib/optimus-manager/persistent/startup_mode')
source=("git+https://github.com/minusium/optimus-manager.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/optimus-manager/"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
 
build() {
 
  cd "${srcdir}/optimus-manager/"
  /usr/bin/python3 setup.py build
 
}
 
 
package() {

  install="optimus-manager.install"
 
  cd "${srcdir}/optimus-manager/"
 
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 modules/optimus-manager.conf "$pkgdir/usr/lib/modprobe.d/optimus-manager.conf"
  install -Dm755 openrc/optimus-manager "$pkgdir/etc/init.d/optimus-manager"
  install -Dm644 optimus-manager.conf "$pkgdir/usr/share/optimus-manager.conf"
  
  install -Dm644 systemd/logind/10-optimus-manager.conf "$pkgdir/usr/lib/elogind/logind.conf.d/10-optimus-manager.conf"
  
  install -Dm644 login_managers/sddm/20-optimus-manager.conf "$pkgdir/etc/sddm.conf.d/20-optimus-manager.conf"
  install -Dm644 login_managers/lightdm/20-optimus-manager.conf  "$pkgdir/etc/lightdm/lightdm.conf.d/20-optimus-manager.conf"
  
  install -Dm644 config/xorg-integrated-gpu.conf "$pkgdir/etc/optimus-manager/xorg-integrated-gpu.conf"
  install -Dm644 config/xorg-nvidia-gpu.conf "$pkgdir/etc/optimus-manager/xorg-nvidia-gpu.conf"
  
  install -Dm755 config/xsetup-nvidia.sh "$pkgdir/etc/optimus-manager/xsetup-nvidia.sh"
  install -Dm755 config/xsetup-hybrid.sh "$pkgdir/etc/optimus-manager/xsetup-hybrid.sh"
  install -Dm755 config/xsetup-integrated.sh "$pkgdir/etc/optimus-manager/xsetup-integrated.sh"

  install -Dm755 config/nvidia-enable.sh "$pkgdir/etc/optimus-manager/nvidia-enable.sh"
  install -Dm755 config/nvidia-disable.sh "$pkgdir/etc/optimus-manager/nvidia-disable.sh"
 
  /usr/bin/python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
 
} 

