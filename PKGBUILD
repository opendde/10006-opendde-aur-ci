# Maintainer: Orphaned
# Patch for linux 4.5.x by chearius and CheariX, patched by PlusMinus
# The original patch was created by sinfomicien (https://github.com/sinfomicien) and uploaded on GitHub: https://github.com/sinfomicien/displaylink-evdi-opensuse/blob/master/evdi-1.0.68-linux-4.5.0.patch



pkgname=displaylink
pkgver=1.0.335
pkgrel=8
pkgdesc="DisplayLink DL-5xxx, DL-41xx and DL-3x00 Driver for Linux"
arch=('i686' 'x86_64')
url="http://www.displaylink.com/downloads/ubuntu.php"
license=('custom' 'GPL2' 'LGPL2.1')
depends=('dkms')
install=${pkgname}.install
changelog="DisplayLink_Ubuntu_1.0.335_release-note.txt"
source=(http://downloads.displaylink.com/publicsoftware/DisplayLink_Ubuntu_$pkgver.zip 99-displaylink.rules displaylink.service displaylink-sleep.sh https://raw.githubusercontent.com/sinfomicien/displaylink-evdi-opensuse/f08647a2659b4e18e86aa8a32b0b17646fe0f0d8/evdi-1.0.68-linux-4.5.0.patch)
md5sums=('006cfb269af80e6fc73bcfe04b693131'
         '37e076a16be49985f1d6800f960d16b4'
         'c141a15e973481c7d961f8e135627ca4'
         '4185b016cd64c6069302239515afadff'
         '55e5cf81f2d87a5d2cf3f0bbe2c84d75')

package() {
  echo "Adding udev rule for DisplayLink DL-3xxx/5xxx devices"
  install -D -m644 99-displaylink.rules "$pkgdir/etc/udev/rules.d/99-displaylink.rules"

  echo "Installing DLM systemd service"
  install -D -m644 displaylink.service "$pkgdir/usr/lib/systemd/system/displaylink.service"
  install -D -m755 displaylink-sleep.sh "$pkgdir/usr/lib/systemd/system-sleep/displaylink.sh"

  echo "Installing DisplayLink Module Patch"
  install -D -m644 evdi-1.0.68-linux-4.5.0.patch "$pkgdir/usr/lib/displaylink/patch/evdi-1.0.68-linux-4.5.0.patch"
  
  echo "Extracting DisplayLink Driver Package"
  chmod +x displaylink-driver-$pkgver.run
  ./displaylink-driver-$pkgver.run --target $pkgname-$pkgver --noexec
  cd "$pkgname-$pkgver"
  
  COREDIR="$pkgdir/usr/lib/displaylink"
  install -d -m755 $COREDIR
  install -d -m750 "$pkgdir/var/log/displaylink"
  
  echo "Configuring EVDI DKMS module"
  SRCDIR="$pkgdir/usr/src/evdi-$pkgver"
  mkdir -p $SRCDIR
  tar xf evdi-$pkgver-src.tar.gz -C $SRCDIR

  CURRENT_DIR=`pwd`
  cd $SRCDIR
  patch -p1 < "$pkgdir/usr/lib/displaylink/patch/evdi-1.0.68-linux-4.5.0.patch"
  cd $CURRENT_DIR

  if [ "$CARCH" == "i686" ]; then
    ARCH="x86"
  elif [ "$CARCH" == "x86_64" ]; then
    ARCH="x64"
  fi
  echo "Installing DisplayLink Manager $ARCH"
  install -D -m755 $ARCH/DisplayLinkManager $COREDIR/DisplayLinkManager

  echo "Installing libraries"
  install -D -m755 $ARCH/libevdi.so $COREDIR/libevdi.so
  install -D -m755 $ARCH/libusb-1.0.so.0.1.0 $COREDIR/libusb-1.0.so.0.1.0

  ln -s /usr/lib/displaylink/libusb-1.0.so.0.1.0 $COREDIR/libusb-1.0.so.0
  ln -s /usr/lib/displaylink/libusb-1.0.so.0.1.0 $COREDIR/libusb-1.0.so

  echo "Installing firmware packages"
  install -D -m644 *.spkg $COREDIR

  echo "Installing license file"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

