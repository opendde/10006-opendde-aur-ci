# Maintainer: Vlad Panazan <brgdvz@gmail.com>

pkgname=hikari
pkgver=2.3.3
pkgrel=2
epoch=1
pkgdesc='Stacking Wayland compositor with additional tiling capabilities, heavily inspired by the Calm Window manager (cwm)'
url='https://hikari.acmelabs.space'
license=('custom')
arch=('x86_64')
depends=('wlroots>=0.15' 'wlroots<0.16' 'cairo' 'pango' 'xorg-server-xwayland' 'libucl-git')
makedepends=('bmake' 'wayland-protocols')
source=("https://hikari.acmelabs.space/releases/hikari-${pkgver//_/-}.tar.gz"
        "0001_xwayland.patch")
sha256sums=('40736ff326e11a51128c1739051a692ad2c79173fc4b695c8be5ec7a614b4de2'
            '6f0804d210bfb3d11c0c231c11ed31d56c5365f65eb6bcd4c281a5bebc5e976c')


prepare() {
  cd "$pkgname-${pkgver//_/-}"
  # Fix for mouse clicks going to the wrong window
  # See: https://hub.darcs.net/raichoo/hikari/issue/40
  patch -Np1 -i ${srcdir}/0001_xwayland.patch
}

build(){
  cd "$pkgname-${pkgver//_/-}"
  bmake PREFIX=/usr ETC_PREFIX=/ WITH_POSIX_C_SOURCE=YES WITH_XWAYLAND=YES WITH_SCREENCOPY=YES WITH_GAMMACONTROL=YES WITH_LAYERSHELL=YES WITH_VIRTUAL_INPUT=YES
}

package() {
  cd "$pkgname-${pkgver//_/-}"
  bmake DESTDIR="${pkgdir}" PREFIX=/usr ETC_PREFIX=/ WITHOUT_SUID=YES install
}

