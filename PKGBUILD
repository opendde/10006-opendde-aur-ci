#Maintainer: Xyne <gro xunilhcra enyx, backwards>
pkgname=fipolate
pkgver=2017
pkgrel=4
pkgdesc='Interpolate text files with variables through a fifo via user prompts.'
arch=(any)
license=(GPL)
url="https://xyne.dev/projects/fipolate"
depends=(python-pyinotify python3)
source=(
  https://xyne.dev/projects/fipolate/src/fipolate-2017.tar.xz
  https://xyne.dev/projects/fipolate/src/fipolate-2017.tar.xz.sig
)
sha512sums=(
  3df325656a2cd23c085ef39845190b117f9f290f074d26dfd7404b7c393f5cfe9c9d7517a975ce461febed40417b3e14545fb9a6038c8aea247778011879af22
  24ca530b6a8947f1efc446f303390bd61d47ce5ed6e0b893db1414aea29730799c3ddbe5ae3c4a96b0403d11897e6226c6e76b179fac985205d00f891124b399
)
md5sums=(
  0857996a546241a426143f50956401ec
  1d82437fc77cb78dbf5c4703732500b2
)
validpgpkeys=('D89FAAEB4CECAFD199A2F5E612C6F735F7A9A519')

package ()
{
  install -Dm755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}


# vim: set ts=2 sw=2 et:
