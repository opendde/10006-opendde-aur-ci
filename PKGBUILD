# Maintainer: crian <crian84 at gmail dot com>

pkgname=auto-cpufreq-git
pkgver=1.9.6.r3.gff72e1e
pkgrel=2
pkgdesc='Automatic CPU speed & power optimizer'
arch=('any')
url="https://github.com/AdnanHodzic/auto-cpufreq"
license=('LGPL-3.0')
depends=('python-distro' 'python-psutil' 'python-click' 'dmidecode')
optdepends=('cpufreqctl: CPU Power Manager'
            'gnome-shell-extension-cpufreq: CPU Power Manager for GNOME Shell'
            'thermald: Thermal Daemon - recommended by upstream')
makedepends=('git' 'python-setuptools' 'python-pip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname%-git}.install"
source=("git+${url}.git" "${pkgname%-git}.service")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    sed -i 's|usr/local|usr|g' "scripts/${pkgname%-git}.service" auto_cpufreq/core.py
}

build() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README"
    install -Dm755 scripts/cpufreqctl.sh -t "$pkgdir/usr/share/${pkgname%-git}/scripts"
    install -Dm644 "$srcdir/${pkgname%-git}.service" -t "$pkgdir/usr/lib/systemd/system"
}
