# Maintainer: willemw <willemw12@gmail.com>

pkgname=iwscanner
pkgver=0.2.4
pkgrel=4
pkgdesc="Wireless scanner with an easy to use graphic interface and using the iwlist tool"
arch=('any')
url="http://kuthulu.com/iwscanner"
license=('LGPL')
depends=('pygtk' 'python2' 'wireless_tools')
optdepends=('gksu: privilege escalation to use wireless tools'
            'kdesu: privilege escalation to use wireless tools')
options=(!emptydirs)
# Additional source files are based on the opensuse 'iwscanner' rpm
#source=(http://kuthulu.com/iwscanner/iwscanner-$pkgver.tgz
source=(https://answers.launchpad.net/~unit193/+archive/ubuntu/test/+files/iwscanner_0.2.4.orig.tar.gz
        iwscanner
        iwscanner.desktop
        setup.py)
md5sums=('f26ce8196f992ad3e60b1af758be1546'
         '7dcbc65395faba817a3653db7d07224a'
         'd0613547024a89444c34ef2b34d8427c'
         '470cb6fb4539e7d580086178304c95a9')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's|#!/usr/bin/env python[ ]*$|#!/usr/bin/env python2|' iwscanner.py
}

package() {
  install -Dm644 iwscanner.desktop "$pkgdir/usr/share/applications/iwscanner.desktop"

  cd $pkgname-$pkgver
  python2 ../setup.py install --root="$pkgdir/" --optimize=1
}

