# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>
# Contributors: bepebe, cconrad

pkgname=softmaker-office-bin
pkgver=2012.702
pkgrel=1
pkgdesc="Softmaker Office 2012, proprietary office suite; word processing, spreadsheets, presentations"
url="http://softmaker.com"
arch=('x86_64' 'i686')
license=('custom')
install=smoffice2012.install

# Set dependencies for i686 or x86-64
if [ "$CARCH" == "x86_64" ]; then
   depends=('desktop-file-utils' 'shared-mime-info' 'lib32-libxrender' 'lib32-libxmu' 'lib32-gcc-libs' 'hicolor-icon-theme')
elif [ "$CARCH" == "i686" ]; then
   depends=('desktop-file-utils' 'shared-mime-info' 'libxrender' 'libxmu' 'gcc-libs' 'hicolor-icon-theme')
fi

source=("http://www.softmaker.net/down/2012/softmaker-office-2012-702.tgz"
        "planmaker-2012.desktop"
        "planmaker12"
        "presentations-2012.desktop"
        "presentations12"
        "textmaker-2012.desktop"
        "textmaker12"
        "icons.zip"
        "license.txt")
md5sums=('df333512e49aea146d21ef0fdf835061'
         '5427ac5cd945b7348b1494b3e7744d1c'
         'bd742e02bb99c207f0941bf7bf87142a'
         'b3a09fdac71841226bc6bd483764c373'
         'a26a4a3008db7ed26870e84a8a770be8'
         '78b9c32224703ac916e37660a0539ea1'
         '9e0ad29740ec780afefaec44550a7d20'
         '8d00663db0c87693a3464f2d12910443'
         '00e002e7ac0f54d5eeaa57c50884f3e9')
sha512sums=('1299676a51e91616f363877dc02886a17ffb28e4e4792962ffa64aca75fe71930dfc67d720a36f41cacb89ebb5fe8c739b5b8cbe0027ae31b295c2edcc687149'
            '053afd59aa64247bf048d2358104ada35e19d200c03ad923ae0a7c7b69a14c360f8c34dc0edd4e1cb9f375a50f35e2e22e8527b9b453d543ac1b00a4422d4f6f'
            'a0682318dae6894a9eb33797e50ef29f4304856174575f2b0c7cca145b0e8fc297e49c01101e70ea384b67cc0deb66f961a102d2b8dcf5aabc8adf3390516f7a'
            '9bd6e92718c6ae2e045b301bec8c216878b0aa1fd0e04df0c47c09360de9ab8230e93d83630ab11f4d3fda376a72d563ec885556b1d6b0df435222ccd711295c'
            'a0d17b147dfe9a5cf1f1eedc2288713c8de15923336a2be4dbe8bff7f75fe456b4e70078fb2aa3b0e286a73feff55b6c28a6ebf0457663019acae574dd08d43e'
            '7ef3fdd09920b6be2704c05494a785c4bf5463c99f4fce14ea42cb52cc32158050b171283e4eb74e02a77131375e9438faac3ee271f6b30d9e7b5b8aa5a1906b'
            '4508a4ae1a983b250608fafac4e3c5cb571768e3b818bd0fdbac9f2b84e9e87deeea9b037c967c5d3086b8ea6df9d4f43d8147558bf59c4b47b2b342d9133509'
            'd687ad64f707ddf42d4fff129fb968210d58973d124a8b90e380986e8109e6b4a342d1c7e591ed64f9554079f68d03bba191b6c650cb0544a4ef310f1038c8b6'
            '25464fd669e6d81ccdfd0511e911f7344912e66526cdab4c2dc9fb6e9b65a6f83a328cafe99827bb012800fb2e923f4b00c4a652432710a59597d71759121c33')

package() {
   mkdir -p "${pkgdir}/opt/smoffice2012"
   cd "${pkgdir}/opt/smoffice2012"
   tar -xzf "${srcdir}/office.tgz"
   install -Dm755 "${srcdir}/planmaker12" "${pkgdir}/usr/bin/planmaker12"
   install -Dm755 "${srcdir}/presentations12" "${pkgdir}/usr/bin/presentations12"
   install -Dm755 "${srcdir}/textmaker12" "${pkgdir}/usr/bin/textmaker12"
   install -Dm644 "${srcdir}/textmaker-2012.desktop" "${pkgdir}/usr/share/applications/textmaker-2012.desktop"
   install -Dm644 "${srcdir}/presentations-2012.desktop" "${pkgdir}/usr/share/applications/presentations-2012.desktop"
   install -Dm644 "${srcdir}/planmaker-2012.desktop" "${pkgdir}/usr/share/applications/planmaker-2012.desktop"
   mkdir -p "${pkgdir}"/usr/share/mime/packages
   install -Dm644 "${pkgdir}/opt/smoffice2012/mime/softmaker-office-2012.xml" "${pkgdir}/usr/share/mime/packages"
   mkdir -p "${pkgdir}"/usr/share/icons/hicolor
   cp -r "${srcdir}"/hicolor/* "${pkgdir}"/usr/share/icons/hicolor
   install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/softmaker-office-bin/license.txt"
}
