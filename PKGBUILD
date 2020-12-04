pkgbase=pipewire-git
pkgname=('pipewire-git'
         'pipewire-docs-git'
         'pipewire-jack-git'
         'pipewire-alsa-git'
         'pipewire-pulse-git'
         'pipewire-ffmpeg-git'
         )
pkgver=0.3.17.51.gc6663b6a
pkgrel=1
pkgdesc='Server and user space API to deal with multimedia pipelines. (GIT version)'
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
makedepends=('git'
             'meson'
             'doxygen'
             'graphviz'
             'xmltoman'
             'valgrind'
             'jack2'
             'libpulse'
             'alsa-lib'
             'sbc'
             'rtkit'
             'vulkan-icd-loader'
             'dbus'
             'libsndfile'
             'bluez-libs'
             'vulkan-headers'
             'libldac'
             'ffmpeg'
             )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd pipewire

  # Reduce docs size
  printf '%s\n' >> doc/Doxyfile.in \
    HAVE_DOT=yes DOT_IMAGE_FORMAT=svg INTERACTIVE_SVG=yes
}

build() {
  cd "${srcdir}/build"

  CFLAGS+=" -Wformat"

  arch-meson ../pipewire \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=true \
    -D gstreamer=false \
    -D ffmpeg=true \

  ninja
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="${1}" f d; shift
  for f; do
    d="${srcdir}/${p}/${f#$pkgdir/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_pipewire-git() {
  depends=(
           'rtkit'
           'vulkan-icd-loader'
           'alsa-card-profiles'
           'libsndfile.so'
           'libudev.so'
           'libasound.so'
           'libsystemd.so'
           'libdbus-1.so'
           'sbc'
           'libldac'
           )
  optdepends=('pipewire-docs-git: Documentation'
              'pipewire-jack-git: JACK support'
              'pipewire-alsa-git: ALSA support'
              'pipewire-pulse-git: PulseAudio support'
              'pipewire-ffmpeg-git: ffmpeg support'
              )
  provides=('pipewire'
            "libpipewire-${pkgver:0:3}.so"
            )
  conflicts=('pipewire')
  backup=('etc/pipewire/pipewire.conf')
  install=pipewire-git.install

  DESTDIR="${pkgdir}" meson install -C build

  cd "${pkgdir}"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick jack etc/pipewire/media-session.d/with-jack
  _pick jack usr/bin/pw-jack usr/lib/pipewire-${pkgver:0:3}/jack
  _pick jack usr/lib/spa-0.2/jack
  _pick jack usr/share/man/man1/pw-jack.1

  # Use alsa-card-profiles built with Pulseaudio
  rm -rv "$pkgdir"/usr/share/alsa-card-profile

  _pick pulse etc/pipewire/media-session.d/with-pulseaudio

  _pick ffmpeg usr/lib/spa-0.2/ffmpeg/libspa-ffmpeg.so

}

package_pipewire-docs-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (documentation)(GIT Version)'
  provides=('pipewire-docs')
  conflicts=('pipewire-docs')
  arch=('any')

  mv docs/* "${pkgdir}"
}

package_pipewire-jack-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (JACK support)(GIT Version)'
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           'libjack.so'
           )
  provides=('pipewire-jack')
  conflicts=('pipewire-jack')

  mv jack/* "${pkgdir}"
}

package_pipewire-alsa-git() {
  pkgdesc="ALSA Configuration for PipeWire (ALSA support)(GIT version)"
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           )
  provides=('pipewire-alsa')
  conflicts=('pipewire-alsa')
  arch=('any')

  mkdir -p "${pkgdir}/etc/alsa/conf.d"
  ln -st "${pkgdir}/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}

package_pipewire-pulse-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (Pulse support)(GIT version)'
  depends=('pipewire'
           'libpulse'
           )
  provides=('pipewire-pulse'
            'pulseaudio'
            'pulseaudio-bluetooth'
            )
  conflicts=('pipewire-pulse'
             'pulseaudio'
             'pulseaudio-bluetooth'
             )
  arch=('any')
  install=pipewire-pulse.install

  mv pulse/* "${pkgdir}"
}

package_pipewire-ffmpeg-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (FFmpeg SPA plugin)(GIT version)'
  depends=('pipewire'
           "libpipewire-${pkgver:0:3}.so"
           'ffmpeg'
           )
  provides=('pipewire-ffmpeg')
  conflicts=('pipewire-ffmpeg')

  mv ffmpeg/* "${pkgdir}"
}
