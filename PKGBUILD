# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck[at]w4it[dot]eu>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Slava Volkov <sv99sv[at]gmail[dot]com>

pkgbase=phpstorm
pkgname=(phpstorm phpstorm-jre)
pkgver=2019.3.3b193.6494.47
pkgrel=1
pkgdesc='Lightweight and Smart PHP IDE'
arch=('x86_64' 'i686')
license=('commercial')
url='https://www.jetbrains.com/phpstorm/'
depends=('glib2' 'python')
options=('!strip')
source=("https://download.jetbrains.com/webide/PhpStorm-${pkgver%b*}.tar.gz"
        jetbrains-phpstorm.desktop
        LICENSE)
sha512sums=('3066d8871e329470ace22923d844a5e941cadb8155667cd6b800ff6882239fedee31bb7c6b0482f58805da0403f3a7c1080b3a508a2f7d1749c31ae02c2a1edb'
            'b10edd04a7d48641bec7a9e23037510b426acb5a3059267b2081ec0fce41272d8de413f0b4c1dddd3387bb0ce330c48b3f7894f4817973cd6d32a74a14af3528'
            'e2aaaa75571f368f85bcc4baef27cc502781ce382bf04737763b07244716918fc2f0eb0b78b02631e242c9a5c246b27d720bb28556fc64bbde213403b7bf57f6')

pkgver() {
  echo "${pkgver%b*}b$(find ${srcdir} -maxdepth 1 -type d -printf "%P" | cut -d "-" -f2)"
}

package_phpstorm() {
  optdepends=('phpstorm-jre: JetBrains custom Java Runtime (Recommended)'
              'java-runtime: JRE - Required if phpstorm-jre is not installed'
              'gnome-keyring: save login/deployment credentials safely'
              'java-openjfx: rendering Markdown files')

  install -dm755 "${pkgdir}"/opt/
  install -dm755 "${pkgdir}"/usr/bin/
  install -dm755 "${pkgdir}"/usr/share/applications/
  install -dm755 "${pkgdir}"/usr/share/pixmaps/

  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/ "${pkgdir}"/opt/${pkgbase}
  rm -rf "${pkgdir}"/opt/${pkgbase}/jbr

  ln -s /opt/${pkgbase}/bin/${pkgbase}.sh "${pkgdir}"/usr/bin/${pkgbase}
  install -D -m 644 "${srcdir}"/jetbrains-${pkgbase}.desktop "${pkgdir}"/usr/share/applications/
  install -D -m 644 "${pkgdir}"/opt/${pkgbase}/bin/${pkgbase}.svg "${pkgdir}"/usr/share/pixmaps/${pkgbase}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_phpstorm-jre() {
  pkgdesc='JBR (JetBrains Runtime) for PhpStorm - a patched JRE'
  url='https://confluence.jetbrains.com/display/JBR/JetBrains+Runtime'

  install -d -m 755 "${pkgdir}"/opt/${pkgbase}
  cp -a "${srcdir}"/PhpStorm-${pkgver#*b}/jbr "${pkgdir}"/opt/${pkgbase}
}
