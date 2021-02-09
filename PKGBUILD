# Maintainer: Jerry <isjerryxiao at outlook dot com>
_srcname=pacroller
pkgname=pacroller-git
pkgver=0.1.0.8.g5090fdb
pkgrel=1
pkgdesc="Unattended upgrade for archlinux"
arch=('any')
url="https://github.com/isjerryxiao/pacroller"
license=('GPL3')
depends=('python' 'pyalpm')
makedepends=('python-setuptools' 'git')
optdepends=('needrestart')
provides=("pacroller")
conflicts=("pacroller")
backup=('etc/pacroller/config.json' 'etc/pacroller/known_output_override.py')
source=("$_srcname::git+https://github.com/isjerryxiao/pacroller.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_srcname"
    git describe --tags | sed 's/^v//;s/-/./g'
}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -Dm644 "src/$_srcname/config.json.example" "$pkgdir/etc/pacroller/config.json"
    install -Dm644 "src/$_srcname/known_output_override.py" -t "$pkgdir/etc/pacroller"
    mkdir -p "$pkgdir/var/lib/pacroller"
    install -Dm644 "pacroller.service" "${pkgdir}/usr/lib/systemd/system/pacroller.service"
    install -Dm644 "pacroller.timer" "${pkgdir}/usr/lib/systemd/system/pacroller.timer"
}
