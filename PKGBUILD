pkgname=kylin-video
pkgver=2.1.0
pkgrel=1
pkgdesc='Front-end for MPlayer and MPV Qt5 Mplayer and MPV front-end, with basic features like playing videos and audios to more advanced features. It supports both x86 and ARM platform, and supports most of the audio and video formats.'
url='https://github.com/ukui/kylin-video'
arch=(x86_64)
source=(http://mirrors.kernel.org/ubuntu/pool/universe/k/kylin-video/kylin-video_2.1.0-1_amd64.deb)
sha512sums=('41406b72b2fabe47be3188a338a0ed84560414640ed4931e683843220a597a584cb2a5b5906281eafa03caa31f79052fd441df253316db091e98d4a6971b4406')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
}
