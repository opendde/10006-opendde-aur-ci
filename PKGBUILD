# Maintainer: Daniel T. Borelli < danieltborelli@gmail.com>

pkgbase=archisomydrive
pkgname=$pkgbase
pkgver=5.5
pkgrel=1
_remotepkgbase=$pkgbase-git
_remotepkgrel=1
_gitname=ArchIsoMyDrive
_gittag="v${pkgver}"

pkgdesc="GUI utility to copy an ISO file to a USB disk."
arch=('x86_64')
url="https://github.com/daltomi/$_gitname"
license=('GPL3')
depends=('qt5-base' 'qt5pas' 'qt5-x11extras' 'rhash' 'udev' 'glibc' 'glib2' 'libutil-linux') 

conflicts=('archisomydrive-git')

source=("$url/releases/download/v$pkgver/$_remotepkgbase-$pkgver-$_remotepkgrel-x86_64.pkg.tar.xz"{,.sig})

sha256sums=('063b22a4d267bf74c0cd9d21af072400b789871784097e9ca9bab4c26643915a'
            'SKIP'
           )

validpgpkeys=('51479755D90A2AACFA90A6551DD242462908D08B')

package() {
        install -Dm644 "$srcdir/usr/share/applications/archisomydrv.desktop" "$pkgdir/usr/share/applications/archisomydrv.desktop"
        install -Dm644 "$srcdir/usr/share/polkit-1/actions/org.archisomydrv.policy" "$pkgdir/usr/share/polkit-1/actions/org.archisomydrv.policy"
        install -Dm755 "$srcdir/usr/bin/archisomydrv" "$pkgdir/usr/bin/archisomydrv"
        install -Dm644 "$srcdir/usr/share/pixmaps/archisomydrv.png" "$pkgdir/usr/share/pixmaps/archisomydrv.png"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/" "$srcdir/usr/share/ArchIsoMyDrive/LICENSE"
        install -Dt "$pkgdir/usr/share/ArchIsoMyDrive/locale/" -m644 "$srcdir/usr/share/ArchIsoMyDrive/locale/"*
}

#  vim: set ts=8 sw=8 tw=500 et :
