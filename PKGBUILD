# Maintainer: Jake <ja.ke@posteo.de>
# Based on searx-git, thanks to: 
# Jean Lucas <jean at 4ray dot co> and Reventlov <contact+aur at volcanis dot me>

pkgname=searx
pkgver=0.12.0
pkgrel=1
pkgdesc="A privacy-respecting, hackable metasearch engine"
arch=('any')
url="https://asciimoo.github.io/searx/"
license=('AGPL')
makedepends=('openssl')
depends=('python2-flask'
        'python2-flask-babel'
        'python2-requests'
        'python2-lxml'
        'python2-yaml'
        'python2-dateutil'
        'python2-pygments'
        'python2-certifi'
        'python2-idna'
        'python2-pysocks')
conflicts=('searx-git')
backup=('etc/searx/settings.yml')
install=searx.install
source=("https://github.com/asciimoo/searx/archive/v$pkgver.zip"
        'searx.install'
        'searx.service')
sha512sums=('2809b3dadcc7511477dd58150e65641877f4f09850cb038ec8e445982d21af4dc7121acf4f948520b457ed138902bb418fc5f678590f7a92716af7ba68851494'
            'daf98a69d87dc78ea645a02146d67b0a2903b3b219edadf2e3c987c20d0751ac147b72fe185c74bfe3e0b154ed8ee4b9b503e7ca922548fad52157aada05803c'
            '64ab805f7e0089d9b638c2972687ba60331304b3d63bfff138ce8b7903d999f40854067c384cafbc6c635afc335bd084b758cbb7c5cac397d97ed1f31e67ac6e')


package() {
  cd $srcdir/searx-$pkgver

  # Allow newer versions of the dependencies
  sed -i "s|==|>=|g" requirements.txt
  
  # Generate a random secret key
  sed -i -e "s/ultrasecretkey\" # change this!/`openssl rand -hex 32`\"/g" searx/settings.yml

  python2 setup.py install --root=$pkgdir --optimize=1
  
  mv $pkgdir/usr/lib/python2.7/site-packages/{README.rst,searx/}
  mv $pkgdir/usr/lib/python2.7/site-packages/{tests,searx/}
  
  mkdir -p $pkgdir/etc/searx
  mv $pkgdir/usr/lib/python2.7/site-packages/searx/settings.yml $pkgdir/etc/searx/
  ln -s /etc/searx/settings.yml $pkgdir/usr/lib/python2.7/site-packages/searx/settings.yml

  install -Dm0644 ../searx.service $pkgdir/usr/lib/systemd/system/searx.service
}
