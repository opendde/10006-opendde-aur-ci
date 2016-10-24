# Maintainer: Please see AUR page for current maintainer and contact information.

pkgname=brave-git
_pkgname=browser-laptop
pkgver=0.12.6.15
pkgrel=1
pkgdesc="A web browser that stops ads and trackers by default. Master branch."
arch=('x86_64') # Upstream supports x86_64 only
url="https://www.brave.com/"
license=('custom:MPL2' 'BSD' 'Apache' 'custom:others')
groups=('networking')
depends=('gtk2' 'nss' 'alsa-lib' 'gconf' 'libxtst' 'libgnome-keyring' 'libxss' 'ttf-font')
makedepends=('git' 'npm')
optdepends=('cups: To print stuff')
provides=('brave' 'brave-browser')
conflicts=('brave')
source=("git://github.com/brave/browser-laptop.git" 
        'brave.desktop')
sha384sums=('SKIP'
            'f950675fb4a3f9e48374f8a2667e7a45889206a3062c8182e474143607fc26bd17e852a1ef494607dbd3ff4de325e05f')

pkgver() {
  cd "$startdir/$_pkgname"
  
  # Please note that this version hack works here because this package 
  # intends to track dev-channel, you can track master instead, just edit
  # above to your heart's content. 
  # Upstream has a defined tagging and versioning policy, often.
  # Version extraction is fragile and needs work.
  echo $(git describe --tags | sed -e 's/^v//' -e 's/dev//' -e 's/-/./' -e 's/-.\+//')
}

build() {
  cd "$srcdir/$_pkgname"

  npm install 
  CHANNEL=dev npm run build-package
}

package() {
  cd "$srcdir/$_pkgname"

  install -d -m0755 "$pkgdir"/usr/lib

  # Yes, btrfs, Thanks for asking. :-)
  cp -a --reflink=auto Brave-linux-x64 "$pkgdir"/usr/lib/brave

  install -d -m0755 "$pkgdir"/usr/bin

  ln -s /usr/lib/brave/brave "$pkgdir"/usr/bin/brave

  install -dm0755 "$pkgdir"/usr/share/applications

  cp --reflink=auto "$srcdir"/brave.desktop "$pkgdir"/usr/share/applications/brave.desktop

  install -Dm0644 res/app.png "$pkgdir"/usr/share/pixmaps/brave.png

  install -d -m0755 "$pkgdir"/usr/share/licenses/brave-git

  cp --reflink=auto LICENSE.txt "$pkgdir"/usr/share/licenses/brave-git/MPL2

  mv "$pkgdir"/usr/lib/brave/{LICENSE,LICENSES.chromium.html} "$pkgdir"/usr/share/licenses/brave-git/
}

# vim:set ts=2 sw=2 et:
