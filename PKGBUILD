# Maintainer: kholo <kholo@bit-ronin.net>

_pluginname=waveform
pkgname=obs-plugin-waveform-git
pkgver=1.4.1
pkgrel=1
pkgdesc="Waveform is an audio spectral analysis plugin for OBS Studio. It is based on FFTW and optimized for AVX2/FMA3"
arch=("x86_64")
url="https://github.com/phandasm/waveform/"
license=("GPL3")
groups=("obs-plugins")
depends=("obs-studio" "fftw")
makedepends=("cmake")
source=("$_pluginname-$pkgver::git+https://github.com/phandasm/$_pluginname.git"
        "git+https://github.com/google/cpu_features.git")
md5sums=("SKIP" "SKIP")

prepare() {
  cd "$_pluginname-$pkgver"
  git submodule init
  git config submodule.deps/cpu_features.url "$srcdir/cpu_features"
  git submodule update
}

build() {
  cd "$_pluginname-$pkgver"
  cmake -B build
  make -C build
}

package() {
  install -Dm755 "$srcdir/$_pluginname-$pkgver/build/libwaveform.so" "$pkgdir/usr/lib/obs-plugins/libwaveform.so"
  install -Dm644 "$srcdir/$_pluginname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$_pluginname/LICENSE"
  mkdir -p "$pkgdir/usr/share/obs/obs-plugins/waveform"
  cp -r "$_pluginname-$pkgver/data/locale" "$pkgdir/usr/share/obs/obs-plugins/waveform/locale"
  cp "$_pluginname-$pkgver/data/gradient.effect" "$pkgdir/usr/share/obs/obs-plugins/waveform/gradient.effect"
}
