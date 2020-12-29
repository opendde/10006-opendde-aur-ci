# Maintainer: Lorien Dunn <loriendunn@gmail.com>
# based on Eugene Cherny's PKGBUILD
# builds the develop branch of cabbage against the last JUCE version 5 commit
pkgname=cabbage
pkgrel=1
pkgver=2.5.11.git
juceCommit=1e71c07a492f01022f9064560c95c2bcd938847c
pkgdesc='A framework for audio software development'
arch=('x86_64')
url="http://cabbageaudio.com/"
license=('GPLv3')
makedepends=()
depends=('csound' 'csound-doc' 'steinberg-vst36' 'curl'
        'libx11' 'libxinerama' 'mesa' 'gtk3' 'vim' 'webkit2gtk'
        'freeglut' 'jack' 'libxcomposite' 'libxrandr' 'libxcursor')
conflicts=('cabbage')
provides=('cabbage')
source=('git+https://github.com/rorywalsh/cabbage.git#branch=develop'
        'git+https://github.com/WeAreROLI/JUCE.git#commit'=$juceCommit
        'http://cabbageaudio.com/beta/CabbageManual.zip'
        'cabbage.png'
        'Cabbage.desktop'
        'CabbageLite.desktop')
md5sums=('SKIP'
         'SKIP'
         'a68ec24d1fc0dbd0c549b467764da360'
         'c3c8e35dd46c86f22a3565aa4dd828a8'         
         '4ee5f1f806834f0613dfbc80375a5d7b'
         'af60ffcadf2c2bdc2d0beafc5d9df6b6' )

prepare() {
  cd "${srcdir}/cabbage"
  #hack to use system vst sdk
  for f in *jucer; do
     sed -i 's@~/SDKs/VST_SDK/VST3_SDK@/usr/include/vst36@g' "$f"
  done
}

build() {
  # Projucer

  sed -i -e "s/JUCER_ENABLE_GPL_MODE 0/JUCER_ENABLE_GPL_MODE 1/" \
            "${srcdir}/JUCE/extras/Projucer/JuceLibraryCode/AppConfig.h"
  cd "${srcdir}/JUCE/extras/Projucer/Builds/LinuxMakefile/"
  make -j4

  # Cabage
  sed -i 's@/usr/share/doc/csound-doc@/usr/share/doc/csound-doc/html@g' "${srcdir}/cabbage/Source/Settings/CabbageSettings.cpp"
  cd "${srcdir}/cabbage/Builds/LinuxMakefile"

 ./buildCabbage

}

package() {
  install -Dm644 "${srcdir}/cabbage.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/cabbage.png"
  install -Dm644 "${srcdir}/Cabbage.desktop" "${pkgdir}/usr/share/applications/Cabbage.desktop"
  install -Dm644 "${srcdir}/CabbageLite.desktop" "${pkgdir}/usr/share/applications/CabbageLite.desktop"

  cd "${srcdir}/cabbage/Builds/LinuxMakefile/install/bin"

  for f in Cabbage CabbageLite CabbagePluginEffect.so CabbagePluginSynth.so opcodes.txt; do
    install -Dm755 "$f" "${pkgdir}/usr/bin/$f"
  done

  cd "${srcdir}/cabbage/Builds/LinuxMakefile/install"

  install -d "${pkgdir}/usr/share/doc/cabbage/Examples"
  cp -r Examples/* "${pkgdir}/usr/share/doc/cabbage/Examples/"

  install -d "${pkgdir}/usr/share/cabbage/Themes"
  cp -r "${srcdir}/cabbage/Themes/" "${pkgdir}/usr/share/cabbage/"
  chmod -R 755 "${pkgdir}/usr/share/cabbage/Themes"

  cp -r "${srcdir}/CabbageManual" "${pkgdir}/usr/share/doc/cabbage"
  chmod -R 755 "${pkgdir}/usr/share/doc/cabbage"

}
