# Maintainer: Andrea Giammarchi <andrea.giammarchi@gmail.com>
pkgdesc='WPE launcher and webapp container'
pkgname=cog-wpe-gl-aarch64
pkgver=0.8.0
arch=(aarch64)
pkgrel=1
url=https://github.com/Igalia/cog
license=(custom:MIT)
groups=(wpe)
provides=(cog cog-git)
conflicts=(cog cog-git)
depends=(wpewebkit-gl-aarch64 wpebackend-fdo libinput)
source=('https://webreflection.github.io/aur/cog-wpe-gl-aarch64-0.8.0.tar.gz')
md5sums=('2d7ab31af30ce10532a4bc8c36fca9d9')
sha1sums=('b415204e6fe2eb16dcbed0165f37a00f706bf189')
sha256sums=('4e00adf172ffffe5b1bba986f951be9778cd34d2f87eab399b0c265f39b4dc48')
sha512sums=('92898f5a33857b4045d02521821550c6a051c9a13cec5366895acfc2c91322558a2f432cc2b78dbc29a962ee74f599c510f41adb8e49b10b7dc232610ef7a677')

package () {
    cp -R "${srcdir}/usr" "${pkgdir}"
}
