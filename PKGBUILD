# Maintainer: CountStarlight <countstarlight@gmail.com>
# Maintainer: wszqkzqk <wszqkzqk@gmail.com>
# Maintainer: ssfdust <ssfdust@gmail.com>

pkgname=deepin-wine-tim
pkgver=2.0.0
deepintimver=1.2.0deepin0
pkgrel=0
pkgdesc="Latest Tencent TIM (com.qq.office) on Deepin Wine For Archlinux"
arch=("x86_64")
url="http://tim.qq.com/"
license=('custom')
depends=('p7zip' 'wine' 'wine-mono' 'wine_gecko' 'xorg-xwininfo' 'xdotool' 'wqy-microhei' 'adobe-source-han-sans-cn-fonts')
conflicts=('wine-tim' 'deepin.com.qq.office' 'deepin-tim-for-arch')
install="deepin-wine-tim.install"
_mirror="https://mirrors.ustc.edu.cn/deepin"
source=("$_mirror/pool/non-free/d/deepin.com.qq.office/deepin.com.qq.office_${deepintimver}_i386.deb"
  "http://dldir1.qq.com/qqfile/qq/TIM${pkgver}/22317/TIM${pkgver}.exe"
  "run.sh"
  "system.reg"
  "user.reg"
  "userdef.reg"
  "update.policy")
md5sums=('5cf622671fc50b8a76434d7f86134a9a'
  '53d2bd63163e849ab8bbc89b5440bfc6'
  '1f533f05f918a3e8bac7a71fb0a13cc6'
  '8a38b29888a4ed68ac0b1a36f349e594'
  '1d64d2e10f716f12ab6fa8200edea233'
  'b0c17bbb093d794d6a3d8c3db01c482b'
  'a66646b473a3fbad243ac1afd64da07a')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  sed "s/\(Categories.*$\)/\1Network;/" -i "${srcdir}/dpkgdir/usr/local/share/applications/deepin.com.qq.office.desktop"
  msg "Extracting Deepin Wine TIM archive ..."
  7z x -aoa "${srcdir}/dpkgdir/opt/deepinwine/apps/Deepin-TIM/files.7z" -o"${srcdir}/deepintimdir"
  msg "Removing original outdated TIM directory ..."
  rm -r "${srcdir}/deepintimdir/drive_c/Program Files/Tencent/TIM"
  msg "Adding config files and fonts"
  cp userdef.reg "${srcdir}/deepintimdir/userdef.reg"
  cp system.reg "${srcdir}/deepintimdir/system.reg"
  cp update.policy "${srcdir}/deepintimdir/update.policy"
  cp user.reg "${srcdir}/deepintimdir/user.reg"
  ln -sf "/usr/share/fonts/wenquanyi/wqy-microhei/wqy-microhei.ttc" "${srcdir}/deepintimdir/drive_c/windows/Fonts/wqy-microhei.ttc"
  ln -sf "/usr/share/fonts/adobe-source-han-sans/SourceHanSansCN-Medium.otf" "${srcdir}/deepintimdir/drive_c/windows/Fonts/SourceHanSansCN-Medium.otf"
  msg "Repackaging app archive ..."
  7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepintimdir/*"
}

package() {
  msg "Preparing icons ..."
  sed -i -- 's/chat;/Network;InstantMessaging;/g' "${srcdir}/dpkgdir/usr/local/share/applications/deepin.com.qq.office.desktop"
  sed -i '9s#.*#Exec="/opt/deepinwine/apps/Deepin-TIM/run.sh"#'  "${srcdir}/dpkgdir/usr/local/share/applications/deepin.com.qq.office.desktop"
  install -d "${pkgdir}/usr/share"
  cp -a ${srcdir}/dpkgdir/usr/local/share/* "${pkgdir}/usr/share/"
  msg "Copying TIM to /opt/deepinwine/apps/Deepin-TIM ..."
  install -d "${pkgdir}/opt/deepinwine/apps/Deepin-TIM"
  install -m644 "${srcdir}/files.7z" "${pkgdir}/opt/deepinwine/apps/Deepin-TIM/"
  install -m755 "${srcdir}/run.sh" "${pkgdir}/opt/deepinwine/apps/Deepin-TIM/"
  install -m644 "${srcdir}/TIM$pkgver.exe" "${pkgdir}/opt/deepinwine/apps/Deepin-TIM/"
}
