# This file was generated by GoReleaser. DO NOT EDIT.
# Maintainer: João Fernandes <joaofnds@joaofnds.com>
# Contributor: João Fernandes <joaofnds@joaofnds.com>

pkgname='astro-bin'
pkgver=0.0.26
pkgrel=1
pkgdesc='A habit tracker for your terminal with a GitHub style activity graph'
url='https://astro.joaofnds.com/'
arch=('aarch64' 'i686' 'x86_64')
license=('MIT')
provides=('astro')
conflicts=('astro')

source_aarch64=("${pkgname}_${pkgver}_aarch64.tar.gz::https://github.com/joaofnds/astro/releases/download/0.0.26/astro_0.0.26_Linux_arm64.tar.gz")
sha256sums_aarch64=('91834675748e9abe7deebeb48b0dc923802b778d5620478bf273ebcc15eaa9bd')

source_i686=("${pkgname}_${pkgver}_i686.tar.gz::https://github.com/joaofnds/astro/releases/download/0.0.26/astro_0.0.26_Linux_i386.tar.gz")
sha256sums_i686=('aad78bcb2490d17705b44bda63d040bf4e98547e85f80ce70f4e7f003609e18e')

source_x86_64=("${pkgname}_${pkgver}_x86_64.tar.gz::https://github.com/joaofnds/astro/releases/download/0.0.26/astro_0.0.26_Linux_x86_64.tar.gz")
sha256sums_x86_64=('f8d418d8b54ae395e23dcd7b29daf8b37d2f280255c6ad5297d0044a6461a80d')

package() {
  install -Dm755 "./astro" "${pkgdir}/usr/bin/astro"

}
