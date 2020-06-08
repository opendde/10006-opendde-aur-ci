# Maintainer: Jason Ryan <jasonwryan@gmail.com>
# Contributor: Marco Curreli <marcocurreli@tiscali.it>

pkgname=stardict-oald
pkgver=2.4.2
pkgrel=9
pkgdesc="Oxford Advanced Learner's Dictionary for Stardict"
license=('freeware')
arch=('any')
depends=('stardict')
url="https://code.google.com/archive/p/stardict-3/"
md5sums=('7ce40a845b76c33f5c80cd9af638d344'
         '4fb5a2085540ebba08b2ebd3418d631e')
source=(http://download.huzheng.org/bigdict/stardict-Oxford_English_Dictionary_2nd_Ed._P1-2.4.2.tar.bz2
        http://download.huzheng.org/bigdict/stardict-Oxford_English_Dictionary_2nd_Ed._P2-2.4.2.tar.bz2)

package() {
	mkdir -p "$pkgdir/usr/share/stardict/dic/oald"
  cd stardict-Oxford_English_Dictionary_2nd_Ed._P1-"${pkgver}"/
  install -m 644 *.dict.dz *.idx *.ifo "$pkgdir/usr/share/stardict/dic/oald/"
  cd ../stardict-Oxford_English_Dictionary_2nd_Ed._P2-"${pkgver}"/
  install -m 644 *.dict.dz *.idx *.ifo "$pkgdir/usr/share/stardict/dic/oald/"
}

# vim:set ts=2 sw=2 et:
