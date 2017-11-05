# Maintainer: Andrew Crerar <andrew (at) crerar (dot) io>
# Contributor: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
# Contributor: FadeMind <fademind@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Sebastian Stammler <stammler.s@gmail.com>
# Contributor: Sarkasper <echo a2FzcGVyLm1lbnRlbkBnbXguY29tCg== | base64 -d>
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michalis Georgiou <mechmg93@gmail.comr>
# Contributor: Alexander De Sousa <archaur.xandy21@spamgourmet.com>

pkgname=ttf-google-fonts-git
pkgver=r1206.2e2caa23
pkgrel=2
epoch=1
pkgdesc="TrueType fonts from the Google Fonts project (git version)"
arch=(any)
url="https://github.com/google/fonts"
license=('custom:SIL Open Font License' 'custom:Ubuntu Font License v1.0')

# About why "cantarell-fonts" and "noto-fonts" is a dependency see comment in package() function.
depends=(cantarell-fonts fontconfig noto-fonts xorg-fonts-encodings xorg-mkfontdir
         xorg-mkfontscale)
makedepends=(git)
conflicts=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
           lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
           ttf-croscore ttf-fira-mono ttf-fira-sans ttf-inconsolata ttf-lato
           ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
           ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
           ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto ttf-roboto-mono
           ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx
           ttf-ubuntu-font-family-ib ttf-vollkorn-ibx ttf-arabeyes-fonts
           ttf-ubuntu-font-family)
provides=(adobe-source-code-pro-fonts adobe-source-sans-pro-fonts jsmath-fonts
          lohit-fonts ttf-andika ttf-anonymous-pro ttf-cardo ttf-comfortaa
          ttf-croscore ttf-fira-mono ttf-fira-sans ttf-inconsolata ttf-lato
          ttf-lora-cyrillic ttf-lekton ttf-medievalsharp ttf-merriweather
          ttf-merriweather-sans ttf-nova ttf-opensans ttf-oswald ttf-oxygen
          ttf-oxygen-git ttf-pt-fonts ttf-quintessential ttf-roboto ttf-roboto-mono
          ttf-signika ttf-sil-fonts ttf-source-code-pro-ibx ttf-source-sans-pro-ibx
          ttf-ubuntu-font-family-ib ttf-vollkorn-ibx ttf-ubuntu-font-family)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
    cd fonts

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -dm755 "$pkgdir/usr/share/fonts/TTF"
    find . -type f -name \*.[Tt][Tt][Ff] -exec install -Dm644 '{}' ${pkgdir}/usr/share/fonts/TTF \;

    # remove Cantarell fonts because Google ships the original Cantarell
    # instead of the improved version of Cantarell shipped by the GNOME Project
    #
    # it is safe to remove "Cantarell-*.ttf" from this dir because the
    # cantarell-fonts package installs its fonts into /usr/share/fonts/cantarell/
    # and because cantarell-fonts installs .otf files instead of .ttf files
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Cantarell-*.ttf" -delete

    # remove Noto fonts because noto-fonts package have more fonts than this package
    # and also noto-fonts install it's fonts in /usr/share/fonts/noto.
    find ${pkgdir}/usr/share/fonts/TTF -type f -name "Noto*.ttf" -delete
}
