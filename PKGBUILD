# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver
pkgver=5.5.3
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('any')
url="https://github.com/ONLYOFFICE/DocumentServer"
makedepends=('python' 'python2' 'git' 'p7zip' 'svn' 'qt5-base' 'clang' 'qt5-multimedia' 'pkg' 'ncurses5-compat-libs')
# python, ncurses5-compat-libs, clang, required for v8
optdepends=('rabbitmq' 'postgresql' 'nginx')
license=('AGPL')
source=("build-tools-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/build_tools/archive/v5.5.3.42.tar.gz"
	"core-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core/archive/c1e4a2ce33bdcfab29d670f5fdb10fc63cf5fd6a.tar.gz"
	"core-fonts-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/core-fonts/archive/959c01c91a49a8f72324332be4dd033081c213a1.tar.gz"
	"dictionaries-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/dictionaries/archive/2bff8e819ef459a041894d9600d053991c00e214.tar.gz"
	"sdkjs-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs/archive/6622ecdaa43b72e84512eb93d4f1e7737cbde733.tar.gz"
	"sdkjs-plugins-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/sdkjs-plugins/archive/cee7e3fb6485fe2d339d19bb0413f8fa1655cb31.tar.gz"
	"server-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/server/archive/e6731c54dc932c0e1d42e5595e10be20574c14d5.tar.gz"
	"web-apps-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/web-apps/archive/9f06b2182de20f5d77006dc63f243de5e3eccdf0.tar.gz"
	"desktop-sdk-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/desktop-sdk/archive/7bd748ec302efc9a548a1e36cbdc1ae9d8a15f17.tar.gz"
	"document-server-integration-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/document-server-integration/archive/83bab147d0d597cde4eedfb2c50558fbcd2ffeb6.tar.gz"
	"document-builder-${pkgver}.tar.gz::https://github.com/ONLYOFFICE/DocumentBuilder/archive/e6645204b0b1a82e031ec30255dfcfeb9384d06b.tar.gz"
	"onlyoffice-fileconverter.service"
	"onlyoffice-spellchecker.service"
	"onlyoffice-docservice.service"
	"onlyoffice-documentserver.hook"
	"onlyoffice-documentserver.sysusers"
	"onlyoffice-documentserver.tmpfiles"
	"videoplayer_build_bug_fix.patch::https://github.com/ONLYOFFICE/build_tools/commit/4fccc2116510ef297cd2a1fd88964602e53418be.patch")
sha512sums=('c16f5b4c44c0b880c192c4c10667fb3a7a29f8fe9861ebfcc5bcdab6fa13bfd2f0474c64e2e09cad37fb58b80b02268d35d201323a14803bf2353ede1357febd'
            'f0edcc3a73de707d138e344c6ab153690f93740a14da17dbac6312e50794d335a58de732eb51fbadb10963d871818f0d5be52a8261c53344fa5e4d489dc4583d'
            '722f5d1e273f7a1c7f95fa6b76bcb8965a729866be356ea60f296d0ba082b9a94149eb80ca41ad4be79664949481d9d89b50bd17fcfcb6090660ad9da708b1fa'
            '51a147f8cf5de7f10f226318f3995b3104b63d3dc846e04f8fbe9a1bbfa7ceebe52519fcb6ce3d565ca95fbd7f2faecbb7eebb0c19778bd551fcab8102902165'
            '2971cd15be05969fa3919933ba1198648dbbb7d4c5ada524d0393741a44bf3a7e6cf5f7c9a3f405ff549ae230d1e40decb776a9741d399b106562097d3482ab1'
            '0ff82883a8c117b968b4e45ca72947286322e2ba874f081929b6fb19af080bc1a58ad6f26ad4498cca7baa84230cbe7ff77feca2dd7ff705bc0dbb2002e5f5cb'
            'd29f4f4c3e7a9660e1346f7d935293f25cdaa0164b2dbdf6bfda0d28bbf2595d0c1bce10a73e131f3647de0c54da501ea6f9ea44c3f287296a0b1b7068a1a958'
            'b259d224870bad323dda0ff9cb342e115491f66909121301548cf53daa0e5df6c8fcb82c68fd263651bd4a3a6557b255a34cd26e4689c50be59fb7d36237e4fd'
            'a7696cbfae7ff68aacefeb43052e03fb8291fe069ec7c3eeade1865582ff743429d0df8d741d4d975231103f6106e485413404dcf1f3d645b6f1a557a8b78332'
            'a1a6995b6f3b988f6c9998523c234cacd4d44ba2ef42064e7c0a535e5a5fd18448198f696f463323ec3f9bdfd9c270889a483b7a0e056c0722198dd9b42fab14'
            'c98b226bf7bc07f6c83d7945c1f7571ec1a555f17199e4260ec31b93a5712a4481fabcf71552f1fe96928fd26b9e4385d552d376780f65c87681be94c9a3e027'
            '848074ce03328915d251db45a5475f6a2dff3b15f53b3b1dfbd702a9dc184d53aea78da1310db9c60d85a35062ce9986f37843c000f269dcaf8d624ed29e0a60'
            '71cf274868452cef92eb4729d3bfe04ce7b3dd863aee8e7395cf166296206b07abb60756e09911395badbea1965eea4a9fa7595dba7f9bc1c7ad4b8158ac1263'
            '3df1f5339b394eef1b27317f5d0e7786d2cb8dbbd13cddb22047567c3703f384d95f092fc34ce3031aeb895f013d7c0686ce968e1fae7f1f24473c1a6615f7ad'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed'
            'a4e0157c938def5196a280facf6dbbb907f4f3bb7f78af7418da33964f9f0c81f6796fb1b67454957dadc3757bc171ac6762fa02c37bfa5619cd2e5ff6b75b58')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
	'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"

prepare() {
  cd "${srcdir}"

  # Unfortunately, v8 depot_tools still requires python2
  # Bug: https://bugs.chromium.org/p/chromium/issues/detail?id=942720
  mkdir -p path
  ln -sf /usr/bin/python2 path/python

  # Rename source directories
  for dir in "core-fonts" "core" "dictionaries" "sdkjs-plugins" "sdkjs" "server" "web-apps" "desktop-sdk" "document-server-integration" "DocumentBuilder"
  do
    rm -rf "${dir}"
    find . -maxdepth 1 -type d -name "${dir}*" -exec mv '{}' ${dir} \;
  done

  # Configuration for build-tools
  cd "build_tools-5.5.3.42"
  ./configure.py --branch master --module server --update 0 --qt-dir /usr/include/qt

  # Use clang instead of gcc because of compile errors
  sed -i 's/is_clang=false/is_clang=true/g' scripts/core_common/modules/v8.py

  # Unsure how to fix path to QT-dir
  sed -i '28i\ \ \ \ qt_dir = ""' scripts/build.py

  # Patch build file in build_tools to fix bug
  # https://github.com/ONLYOFFICE/build_tools/issues/82
  patch -i ../videoplayer_build_bug_fix.patch

  # Somehow there is a missing header file
  sed -i '7i#include <math.h>' "${srcdir}/desktop-sdk/ChromiumBasedEditors/videoplayerlib/src/qpushbutton_icons.h"
}

build() {
  cd "${srcdir}/build_tools-5.5.3.42"

  export PATH="${srcdir}/path:$PATH"
  ./make.py
}

package() {
  install -D "${pkgdir}/usr/share/webapps"
  cp -r "${srcdir}/build_tools-5.5.3.42/out/linux_64/onlyoffice" "${pkgdir}/usr/share/webapps/"

  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -Dm 644 "${srcdir}/onlyoffice-spellchecker.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-spellchecker.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
