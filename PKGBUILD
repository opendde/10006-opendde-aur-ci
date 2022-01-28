# Maintainer: garionion <garionion ät entr0py.de>
# thanks to nyanpasu64 for pointing out the wrong install path

pkgname=fluffychat-git
_name=fluffychat
pkgver=v1.2.0.r7.g12e9637d
pkgrel=1
pkgdesc="Chat with your friends"
arch=('x86_64' 'aarch64')
url="https://fluffychat.im/"
license=('AGPL3')
depends=('gtk3' 'jsoncpp' 'libsecret')
makedepends=('clang'
             'ninja'
             'flutter'
             'cmake'
             'git'
             'gtk3')
provides=("$_name")
conflicts=("$_name")
source=("git+https://gitlab.com/famedly/fluffychat.git")
sha256sums=('SKIP')

pkgver(){
    cd ${_name}
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  ####
  # thanks to @dreieck 
  _flutter_dir="${srcdir}/flutter"
  PATH="${_flutter_dir}/bin:${PATH}"
  export PATH

  msg2 "Copying '/opt/flutter' to '${_flutter_dir}' ..."
  cp -a /opt/flutter "${_flutter_dir}"
  ####

  flutter config --enable-linux-desktop
  flutter config --no-analytics
  cd ${_name}
  git submodule update --init --recursive
  
  flutter clean
  flutter pub get
}

build() {
  _flutter_dir="${srcdir}/flutter"
  PATH="${_flutter_dir}/bin:${PATH}"
  export PATH


  cd ${_name}
  flutter build linux --release --verbose
}

package() {
  # install
  install -dm755 ${pkgdir}/opt
  mv ${_name}/build/linux/x64/release/bundle ${pkgdir}/opt/${_name}
  
  # link
  install -dm755 ${pkgdir}/usr/bin
  ln -s /opt/${_name}/${_name} ${pkgdir}/usr/bin/${_name}

  # icon
  install -Dm 644 ${pkgdir}/opt/${_name}/data/flutter_assets/assets/favicon.png ${pkgdir}/usr/share/pixmaps/${_name}.png

  # desktop entry

  install -dm 755 "${pkgdir}/usr/share/applications"
  cat > ${pkgdir}/usr/share/applications/${_name}.desktop << EOF
[Desktop Entry]
Type=Application
Version=${pkgver}
Name=FluffyChat
Comment=Matrix Client. Chat with your friends
Exec=${_name}
Icon=${_name}
Terminal=false
EOF

}

# vim: set sw=2 ts=2 et:
