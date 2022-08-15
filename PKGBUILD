# Maintainer: Misaka 19465 <misaka19465@olddoctor.net>
pkgname="efistub-helper"
pkgdesc="An easy way to update EFISTUB configuration"
url="https://github.com/misaka19465/EFISTUBHelper"
pkgver=1.0
pkgrel=1
arch=("any")
license=("GPL3")
depends=("efibootmgr")
source=("update-efistub" "efistub-helper.install")
md5sums=("ce9c583a784bc4a738c491acab885ded" "1d9a9ac2df83f66c84cefb7ef9fab80d")

package() {
  mkdir $pkgdir/bin
  mkdir $pkgdir/etc
  mkdir $pkgdir/etc/efistub.d
  touch $pkgdir/etc/efistub.conf
  install -m755 $srcdir/update-efistub $pkgdir/bin/update-efistub

  esp=$(df --output=source /boot | sed -n '2p')
  if [ -z "${esp}" ];then
    esp=$(df --output=source /esp | sed -n '2p')
    if [ -z "${esp}" ];then
      echo -e "\033[31m Error: No boot partition or unsupported mount point. \033[0m" >&2
      exit -1
    fi
  fi

  disk="/dev/$(lsblk -no pkname ${esp})"
  partnum=$(echo ${esp: ${#disk}} | tr -cd "[0-9]")



}
