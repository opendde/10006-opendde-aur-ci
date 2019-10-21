# Maintainer: Aleksandr <contact at via dot aur>
pkgname=bginetaccounting
_basename=bgbilling
_pkgname=BGInetAccounting
_major=7.1
_minor=48
pkgver=$_major.$_minor
pkgrel=1
pkgdesc="Accounting server for BGBilling"
arch=('i686' 'x86_64') 
url="http://bgbilling.ru"
license=('custom')
depends=('jdk8')
makedepends=('unzip' 'dos2unix')
source=("ftp://bgbilling.ru/pub/${_basename}/${_major}/data/${_pkgname}_${_major}_${_minor}.zip")

prepare() {
  sed -i 's|#JAVA_HOME=|JAVA_HOME=/usr/lib/jvm/java-8-jdk|' \
  "./${_pkgname}/setenv.sh"
}

package() {
  install -d -m0755 ${pkgdir}/opt/${_basename}
  mv ./${_pkgname} ${pkgdir}/opt/${_basename}/

  install -D -m 644 ${pkgdir}/opt/${_basename}/${_pkgname}/script/inet-accounting.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  
# putting the appropriate access rights to the startup scripts
  cd ${pkgdir}/opt/${_basename}/${_pkgname}
  chmod +x *.sh
  chmod +x script/*.sh

# patch
#  patch -p0 <"${srcdir}/setenv.sh.patch"

# converting files to Unix format
  dos2unix *.sh

# remove win files
  rm -rf *.ini
  rm -rf *.bat
  rm -rf *.exe

# remove junk files
  #rm -rf ./script
}

# vim:set ts=2 sw=2 ft=sh et:
md5sums=('593f6b959f374169326c0a15b49b9c6e')
