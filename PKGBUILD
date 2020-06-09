# Maintainer: fkxxyz <fkxxyz@163.com>

pkgname=rime-cloverpinyin
pkgver=1.0.0
pkgrel=1
pkgdesc="Clover Simplified pinyin input for rime."
arch=('x86_64')
url="https://github.com/fkxxyz/rime-cloverpinyin"
license=('LGPL')
# dependency for reverse lookup
depends=('rime-emoji' 'rime-symbols')
makedepends=('librime' 'rime-prelude' 'rime-essay')
source=("https://github.com/fkxxyz/rime-cloverpinyin/archive/${pkgver}.tar.gz")
sha512sums=('784c78a5be5d1138c5e90804069dc8c552310d203682c5c8f0fc6e0a89a493ac7a37bbe886b36c12f8ab6b89ae3e909e3b988d48d31330fe8f0c3ced84993af1')

prepare() {
  cd $pkgname-$pkgver/data
  # Link essentials
  for _f in $(pacman -Qql rime-prelude rime-essay | grep -v "/$"); do ln -sf $_f; done
}

build(){
  cd $pkgname-$pkgver/data
  for _s in $(ls *.schema.yaml); do rime_deployer --compile $_s; done
}

package() {
  cd $pkgname-$pkgver/data
  find . -type l -delete
  rm build/*.txt
  rm -rf opencc
  install -Dm644 *.yaml -t "$pkgdir"/usr/share/rime-data/
  install -Dm644 build/* -t "$pkgdir"/usr/share/rime-data/build/
}
