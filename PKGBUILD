# Maintainer: Ricardo Band <email@ricardo.band>
pkgname=yawsso
pkgver=0.7.2
pkgrel=3
pkgdesc="Yet Another AWS SSO - sync up AWS CLI v2 SSO login session to legacy CLI v1 credentials"
arch=("any")
url=https://github.com/victorskl/yawsso
license=("custom:MIT")
makedepends=("python-setuptools")
depends=("python-pyperclip")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('51d27c89957bfd9d13154797bfd445646e54ffe5fc1edc69b92ce750423385ce')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
