# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server-headless'
pkgver='3.12.0'
pkgrel='8043'
_rel='f299312f27'
pkgdesc='Ivideon-server daemon'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('portaudio' 'ffmpeg' 'gst-plugins-good' 'gst-plugins-base')
makedepends=('libarchive')
conflicts=('ivideon-video-server-nogui')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/${pkgname}/${pkgname}_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	"https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-server-dahua-bin-module/ivideon-server-dahua-bin-module_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
	"https://packages.ivideon.com/ubuntu/pool/non-free/libd/libdahuasdk/libdahuasdk_1.0.2_amd64.deb"
	"videoserverd.service"
	"videoserverd.conf"
	"sysusers.conf"
	"videoservertmp.conf")
noextract=("${source[@]%%::*}")
sha256sums=('bda04742095f10b92af45f600f23f35e9781a84e9709aee45c68bc90efbcbf84'
            '7b4ffcb82a1d9e7902b3f379d2dd4da2ce9fa14856aa60ae4d2fe671d253f116'
            '7da74ca97c53669f95efea718bbf05ddd7b0d5b0b97dc93d2777ed8c64388254'
            '4b0fcdf8cc77eb8748041fbc78d2d7b3e75ced0d1b96b6ce38c17241441bc022'
            'f0010bc64cd7c1b5aefcc7241f0e0074528aec1a4b51dd08bd429e95acd26012'
            '91c4b133ad4d1fda72679ab393b647ac24a56e3c0d46cd2a908a47ed8524ec81'
            'ad8029bf201260608daf7ed4d109731bbf247e8597e36cc1dea915fceae51b56')
backup=("etc/videoserverd.conf")

prepare() {
  cd "${srcdir}"
  bsdtar xf "${srcdir}/${pkgname}_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
  bsdtar xf "data.tar.xz"
  sed -i 's|$(dirname "$(readlink /etc/init.d/videoserver)")|/opt/ivideon/ivideon-server|g' "opt/ivideon/ivideon-server/serverctl.sh"

  mkdir "${srcdir}/ivideon-server-dahua-bin-module"
  cd "${srcdir}/ivideon-server-dahua-bin-module"
  bsdtar xf "${srcdir}/ivideon-server-dahua-bin-module_${pkgver}-${pkgrel}~${_rel}_amd64.deb"
  bsdtar xf "data.tar.xz"

  mkdir "${srcdir}/libdahuasdk"
  cd "${srcdir}/libdahuasdk"
  bsdtar xf "${srcdir}/libdahuasdk_1.0.2_amd64.deb"
  bsdtar xf "data.tar.xz"
}

build() {
  rm "opt/ivideon/ivideon-server/ivideon-server.service"
  rm "opt/ivideon/ivideon-server/remote-svc.service"
  rm "opt/ivideon/ivideon-server/remote_service"
  rm "opt/ivideon/ivideon-server/serverctl.sh"
}

package() {
  cd "${srcdir}"
  cp -ax "opt" "${pkgdir}"
  cp -ax "${srcdir}/ivideon-server-dahua-bin-module/opt" "${pkgdir}"
  cp -ax "${srcdir}/libdahuasdk/opt" "${pkgdir}"
  install -Dm644 "videoserverd.service" "${pkgdir}/usr/lib/systemd/system/videoserverd.service"
  install -Dm644 "videoserverd.conf" "${pkgdir}/etc/videoserverd.conf"
  install -Dm644 "sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/videoserverd.conf"
  install -Dm644 "videoservertmp.conf" "${pkgdir}/usr/lib/tmpfiles.d/videoserverd.conf"
  install -dm755 -o 176 -g 176 "${pkgdir}/run/videoserverd"
  install -dm775 -o 176 -g 176 "${pkgdir}/var/log/videoserverd"
}
