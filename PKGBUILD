# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>
# Contributor: George Rawlinson <george@rawlinson.net.nz>

_pkgname=ImHex
pkgname=${_pkgname,,}
pkgver=1.10.0
pkgrel=2
pkgdesc='A Hex Editor for Reverse Engineers, Programmers and people that value their eye sight when working at 3 AM'
url='https://github.com/WerWolv/ImHex'
license=('GPL2')
arch=('x86_64')
depends=('glfw' 'capstone' 'mbedtls' 'libssh2'
         'python' 'freetype2' 'file' 'gtk3' 'hicolor-icon-theme'
         'yara' 'fmt')
makedepends=('git' 'cmake' 'glm' 'llvm' 'nlohmann-json' 'librsvg')
source=("${pkgname}::git+https://github.com/WerWolv/ImHex.git#tag=v${pkgver}"
  "nativefiledialog::git+https://github.com/btzy/nativefiledialog-extended.git"
  "git+https://git.sr.ht/~danyspin97/xdgpp"
  0001-build-Fix-system-libraries-usage.patch
  imhex.desktop)
cksums=('SKIP'
        'SKIP'
        'SKIP'
        '2019546358'
        '4178124713')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '25f2b3fe49d0c75207ad561995a3ad24b45581cad878c04922402d3d60e98ef1'
            '72525512a241589cecd6141f32ad36cbe1b5b6f2629dd8ead0e37812321bdde6')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        '00982d536e4623a47acdc648d53a97fe4eb64e1a19f807b7a1a5aa66cda5056100cc9bc968a2c914f64e924c0beb47d5443dcb013c858d30af8a24c16e0a82bf'
        '7b2d029de385fdc2536f57a4364add9752b9a5dc31df501e07bff1fd69fdd1de2afa19a5ac5a4c87fbf21c5d87cc96d3fe30d58825c050f5a7d25f6d85d08efc')

prepare() {
  git -C "$pkgname" submodule init
  for name in nativefiledialog xdgpp; do
    git -C "$pkgname" config submodule.external/$name.url "$srcdir/$name"
  done
  for name in yara/yara fmt curl; do
    git -C "$pkgname" config --remove-section submodule.external/$name
  done
  git -C "$pkgname" submodule update

  git -C "$pkgname" apply -v \
    "$srcdir/0001-build-Fix-system-libraries-usage.patch"
}

build() {
  cmake -B build -S "$pkgname" \
    -Wno-dev \
    -D CMAKE_BUILD_TYPE=RelWithDebInfo \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_SKIP_RPATH=ON \
    -D CMAKE_C_COMPILER="gcc" \
    -D CMAKE_CXX_COMPILER="g++" \
    -D USE_SYSTEM_LLVM=ON \
    -D USE_SYSTEM_YARA=ON \
    -D USE_SYSTEM_FMT=ON \
    -D USE_SYSTEM_CURL=ON \
    -D USE_SYSTEM_NLOHMANN_JSON=ON \
    -D PROJECT_VERSION="$pkgver"
  cmake --build build
}

package() {
  # Executable
  install -Dm0755 build/imhex "${pkgdir}/usr/bin/imhex"

  # Shared lib and plugins
  install -Dm0755 -t "${pkgdir}/usr/lib" build/plugins/libimhex/libimhex.so

  for plugin in builtin; do
    install -Dm0755 -t "${pkgdir}/usr/share/imhex/plugins" "build/plugins/$plugin/$plugin.hexplug"
  done

  # Desktop file(s)
  install -Dm0644 -t "${pkgdir}/usr/share/applications" imhex.desktop
  install -Dm0644 "${pkgname}/res/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/imhex.svg"
  for size in 32 48 64 128 256; do
    install -dm0755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
    rsvg-convert -a -f png -w $size -o "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/imhex.png" \
      "${pkgname}/res/icon.svg"
  done

  install -Dm0644 "${pkgname}/res/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/imhex.svg"

  # Misc files
  install -Dm0644 -t "${pkgdir}/usr/share/imhex/resources" "${pkgname}/res/resources"/*

  # License
  install -Dm0644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Documentation
  install -Dm0644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    "${pkgname}/README.md"
}
