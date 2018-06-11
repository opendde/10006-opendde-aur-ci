# Maintainer: Thomas Perraut <https://github.com/tperraut/>
pkgname=godot-rc-bin
pkgver=3.0.3
pkgrel=3
pkgdesc="Godot is an advanced, feature packed, multi-platform 2D and 3D game engine. It provides a huge set of common tools, so you can just focus on making your game without reinventing the wheel."
arch=("i686" "x86_64")
url="http://www.godotengine.org"
license=("MIT")
provides=("godot-rc-bin")
conflicts=("godot" "godot-git" "godot-bin")
replaces=("godot" "godot-git" "godot-bin")
source=("godot.desktop" "icons.tar.gz")
source_i686+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/"$pkgver"/rc"$pkgrel"/Godot_v"$pkgver"-rc"$pkgrel"_x11.32.zip")
source_x86_64+=("$pkgname-$pkgver::https://downloads.tuxfamily.org/godotengine/"$pkgver"/rc"$pkgrel"/Godot_v"$pkgver"-rc"$pkgrel"_x11.64.zip")
md5sums=("fa7422332b97ab8430ea7628ec8b0880" "9dbfaa636daf7737899de6a28c33c3be")
md5sums_i686=("c421ba8cb37f164ba9608f65c6addaba")
md5sums_x86_64=("8128063b3c42c319a60838a81f685ff7")

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/icons/hicolor"
  mkdir -p "$pkgdir/usr/share/applications"

  case $CARCH in
    "i686")
      cp "$srcdir/Godot_v"$pkgver"-rc"$pkgrel"_x11.32" "$pkgdir/opt/$pkgname/godot"
    ;;
    "x86_64")
      cp "$srcdir/Godot_v"$pkgver"-rc"$pkgrel"_x11.64" "$pkgdir/opt/$pkgname/godot"
    ;;
  esac

  cp "$srcdir/godot.desktop" "$pkgdir/usr/share/applications/godot.desktop"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/hicolor"
  cp -a "$srcdir/icons/." "$pkgdir/usr/share/icons/gnome"

  chmod +x "$pkgdir/opt/$pkgname/godot"

  ln -s "/opt/$pkgname/godot" "$pkgdir/usr/bin/godot"
}