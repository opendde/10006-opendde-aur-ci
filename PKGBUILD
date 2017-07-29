# Maintainer: Ainola

pkgname=gtk-theme-united-gnome
pkgver=2.2
pkgrel=1
epoch=1
pkgdesc="GTK2/3 + GNOME Shell theme based on a Ubuntu 18.04 design concept."
arch=(any)
url="https://github.com/godlyranchdressing/United-GNOME"
license=('GPL3')
source=("United-Antergos-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Antergos.tar.gz"
        "United-Antergos-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Antergos-Compact.tar.gz"
        "United-Arch-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch.tar.gz"
        "United-Arch-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Arch-Compact.tar.gz"
        "United-Debian-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Debian.tar.gz"
        "United-Debian-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Debian-Compact.tar.gz"
        "United-Fedora-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora.tar.gz"
        "United-Fedora-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Fedora-Compact.tar.gz"
        "United-Latest-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest.tar.gz"
        "United-Latest-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Latest-Compact.tar.gz"
        "United-Manjaro-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro.tar.gz"
        "United-Manjaro-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Manjaro-Compact.tar.gz"
        "United-OpenSUSE-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE.tar.gz"
        "United-OpenSUSE-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-OpenSUSE-Compact.tar.gz"
        "United-Solus-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus.tar.gz"
        "United-Solus-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Solus-Compact.tar.gz"
        "United-Ubuntu-alt-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt.tar.gz"
        "United-Ubuntu-alt-Compact-$pkgver.tar.gz"::"https://github.com/godlyranchdressing/United-GNOME/releases/download/V$pkgver/United-Ubuntu-alt-Compact.tar.gz")
sha256sums=('2dbcfafbf4aee5c7422a6dc9379ec79a7f90a06dbc00901fee82fe8f6ceace3e'
            'b586fbde45c410e601c8a01a25b4b0104be5c141a0c7ce1b41904729eaff4a9a'
            '1b414a44739e7242bfdf7b326eebba75862cadf6af00d79e7a50a8ab9851d061'
            '3cedd38ac81b1d5a25058f26d29dd894374b92f34ac475a9f2952b2f1d4ad357'
            '3fee303499b2ec0cd1ad3b2ecf28c94e5620f336dacf83f5db493d901216af53'
            '02184e3b7ebabfe9a365aea65867c659ea497b55b9c119c544f9594d342a9c7b'
            'f039a583aae3aef1eea4fe9d3a4e661fc9785778674bf5c6a7f6b226c3b7000d'
            '6f18b80a80adacf64a05ff0e685c86069dbe3cc2b0cb273009dee93d07a71934'
            'bf8dfdba814df466f636f9de256bf287963eeb4f5cad602b831d772dc67d2040'
            'feac562eb7f0c498c184608940083e0979ad04ec11ed3cd3443d62f15ab10a1f'
            '06e7ceb9c0520fd27b4dfd69fe675afb9a47f1b666cbe3dd48e09d1ee3095113'
            '2050291bce95ae3e0ce072a380f9a7e826272ebdb21b03873d48525b140e7f79'
            'cd544df681866a82b72f878edf5c882ed9214829f968691fad819f4c4db98b42'
            'fcae921acf17730c02900e3f1b4e64b1d3c4e62961ce160c587bf2f199f814ef'
            '845dab0b2ea56b4fbd7b1a653622de624d4c86dbfd6f589c58e8fb0508caefb2'
            '9d00c6c02e4b34c027ca63e78fab8c2e9f96369269e0cad6c2ba14db29b899bf'
            '8193f598f7b068921216636d3f1a3d8e1281e22841766f46639af7af8a807fa3'
            '729ce5977b24e0b80b6295e1dc1d55fbb0ef60435e6ade2e5f904b0e8369ac81')

package() {
  install -dm755 "$pkgdir/usr/share/themes"
  # Upstream names tend to differ between releases: So that users don't have to
  # constantly re-apply their themes, let's just agree on the following format
  # in case it changes again: United-<distro><-variant> (e.g. United-Arch or
  # United-Arch-Darker).

  # Note that 'United-Latest' means 'Ubuntu'

  # Dirs in $srcdir are installable themes; however, we want to ignore symlinks
  find "$srcdir" -mindepth 1 -maxdepth 1 -type d -exec \
    cp -rt "$pkgdir/usr/share/themes/" {} +
  find "$pkgdir/usr/share/themes/" -type d -exec chmod 755 {} \;
  find "$pkgdir/usr/share/themes/" -type f -exec chmod 644 {} \;
}

# vim: ts=2 sw=2 et
