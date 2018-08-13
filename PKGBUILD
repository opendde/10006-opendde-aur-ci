#Maintainer: Plague-doctor <plague at privacyrequired dot com >

pkgname=freetube
pkgver=0.3.2
pkgrel=2
pkgdesc="An open source desktop YouTube player built with privacy in mind."
arch=('x86_64')
url="https://github.com/FreeTubeApp/FreeTube"
license=('GPL')
options=("!strip" "staticlibs")
noextract=("glibc-2.27-3-x86_64.pkg.tar.xz")
source=(
    "freetube.install"
    "freetube.desktop"
    "$pkgname-$pkgver-$pkgrel.zip"::"https://github.com/FreeTubeApp/FreeTube/releases/download/v$pkgver-beta/FreeTube-linux-x64.zip"
    "https://archive.archlinux.org/packages/g/glibc/glibc-2.27-3-x86_64.pkg.tar.xz"
    )

validpgpkeys=('A8F7858263C1E39480B731DCEAD4F103068DF8E5')

install="${pkgname}.install"

package() {
    install -d "$pkgdir/"{usr/bin,/usr/share/pixmaps,usr/share/applications/,opt}
    cp -R $srcdir/FreeTube-linux-x64 $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/FreeTube $pkgdir/usr/bin/$pkgname
    install -Dm644 "$srcdir/FreeTube-linux-x64/resources/app/src/icons/iconColor.png" "${pkgdir}/usr/share/pixmaps/freetube.png"
    install -Dm644 "freetube.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Patch pcloud to use glibc 2.27
    _idir="/opt/${pkgname}"
    _pdir="${pkgdir}/${_idir}"
    _pbin="${_pdir}/FreeTube"
    mkdir -p "$_pdir/glibc"
    tar -xJf "glibc-2.27-3-x86_64.pkg.tar.xz" -C "$_pdir/glibc"
    rm "$_pdir/glibc/"{.BUILDINFO,.INSTALL,.MTREE,.PKGINFO}
    patchelf --set-interpreter "$_idir/glibc/usr/lib/ld-linux-x86-64.so.2" "$_pbin"
    patchelf --set-rpath "$_idir:$_idir/glibc/usr/lib" "$_pbin"
    patchelf --shrink-rpath "$_pbin"
}


md5sums=('f9127e651de14f462fc4afee3c7fb675'
         '28055125824ebe9e9a6ad564c776a7fe'
         '9e8d19b4380708ede1161e2032345d79'
         '57c1dc79d8552f40602e49b84be65752')
