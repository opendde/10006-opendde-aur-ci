# Maintainer: Ivan Konovalov <ivknv0@gmail.com>

pkgname=python2-pysftp
_name=${pkgname#python2-}
pkgver=0.2.9
pkgrel=1
pkgdesc="A simple interface to SFTP for Python"
arch=('any')
url="https://bitbucket.org/dundeemt/pysftp"
license=('BSD')
depends=('python2>=2.7.0' 'python2-paramiko>=1.17')
makedepends=('python2-pip' 'curl')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz")
sha256sums=("fbf55a802e74d663673400acd92d5373c1c7ee94d765b428d9f977567ac4854a")

package() {
    PIP_CONFIG_FILE=/dev/null pip2 install --isolated --root="$pkgdir" --ignore-installed --no-deps *.tar.gz || exit
    curl "https://bitbucket.org/dundeemt/pysftp/raw/918494eef04e56f91cbff99c422bb57e21f4e257/LICENSE.txt" -o LICENSE.txt || exit
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
