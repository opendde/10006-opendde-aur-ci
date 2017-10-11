# Maintainer: Tobias Bachmann <tobachmann@gmx.de>
pkgname=fsleyes
pkgver=0.15.1
pkgrel=1
pkgdesc="FSLeyes is the FSL image viewer"
arch=('any')
url="https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSLeyes"
license=('Apache')
groups=()
depends=('python' 'desktop-file-utils')
makedepends=('python-six' 'python-numpy' 'python-matplotlib' 'python-nibabel' 'python-jinja' 'python-pillow' 'python-opengl' 'python-pyparsing' 'python-scipy' 'python-opengl-accelerate' 'wxpython-phoenix' 'fsl' 'fsleyes-widgets' 'fsleyes-props')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("$pkgname-$pkgver.tar.gz::https://git.fmrib.ox.ac.uk/fsl/fsleyes/fsleyes/repository/archive.tar.gz?ref=$pkgver"
        "$pkgname.png::https://git.fmrib.ox.ac.uk/uploads/-/system/group/avatar/85/icon_512x512.png"
        "$pkgname.desktop")
sha256sums=('e29506874f910b7a07abeea63525371b29e9dfad7ef03d44d89c5f60858da78a'
            'c7211ee624483a272f280b3aa772046ec9226d838f9c3023450888abddf9d71a'
            '6e91e88eb74602f8da7cda6575245dbaaf4577022bffe15c0efedb33106139fb')

package() {
  cd "$srcdir/$pkgname-$pkgver-"*
  python setup.py install --root="$pkgdir/" --optimize=1
  
  cd "$startdir"
  install -Dm644 $pkgname.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
}
