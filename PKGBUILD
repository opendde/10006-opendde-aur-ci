# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

pkgname=picard-tools
pkgver=1.134
pkgrel=1
pkgdesc='set of tools for working with next generation sequencing data in the BAM format'
arch=('i686' 'x86_64')
url="https://github.com/broadinstitute/picard"
license=('GPL2')
depends=('bash' 'java-runtime>=6')
source=("https://github.com/broadinstitute/picard/releases/download/$pkgver/$pkgname-$pkgver.zip"
        'picard-profile.sh'
        'picard.sh')
md5sums=('aa868087b05fe870226c559609d1c40d'
         'ebcda2d2c55df6d05994252cf22a68c2'
         '0987aa56f62f5e843bfa788cc93626c8')

package() {
  cd $srcdir/$pkgname-$pkgver

  for f in *.jar ; do
    install -Dm755 $f $pkgdir/usr/share/java/picard-tools/$f
  done

  install -Dm755 libIntelDeflater.so $pkgdir/usr/lib/libIntelDeflater.so

  pushd $pkgdir/usr/share/java/picard-tools > /dev/null
  ln -s ../../../lib/libIntelDeflater.so
  popd > /dev/null

  install -Dm755 $srcdir/picard.sh         $pkgdir/usr/bin/picard
  install -Dm755 $srcdir/picard-profile.sh $pkgdir/etc/profile.d/picard.sh
}
