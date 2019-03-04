# Maintainer: Adrián Pérez de Castro
pkgname=ttf-ia-writer
pkgdesc='Subset of the fonts provided by iA Writer'
pkgver=20181225
pkgrel=1
url=https://github.com/iaolo/iA-Fonts
conflicts=(ttf-ia-writer-duospace)
provides=(${conflicts[@]})
license=(custom:OFL)
arch=(any)

_baseurl="${url}/raw/b337fe1a4c93026268f70e4b2678371f3e89e2ce/"
source=("${_baseurl}/iA%20Writer%20Mono/Static/iAWriterMonoS-Bold.ttf"
        "${_baseurl}/iA%20Writer%20Mono/Static/iAWriterMonoS-BoldItalic.ttf"
        "${_baseurl}/iA%20Writer%20Mono/Static/iAWriterMonoS-Italic.ttf"
        "${_baseurl}/iA%20Writer%20Mono/Static/iAWriterMonoS-Regular.ttf"
        "${_baseurl}/iA%20Writer%20Quattro/Static/iAWriterQuattroS-Bold.ttf"
        "${_baseurl}/iA%20Writer%20Quattro/Static/iAWriterQuattroS-BoldItalic.ttf"
        "${_baseurl}/iA%20Writer%20Quattro/Static/iAWriterQuattroS-Italic.ttf"
        "${_baseurl}/iA%20Writer%20Quattro/Static/iAWriterQuattroS-Regular.ttf"
        "${_baseurl}/iA%20Writer%20Duo/Static/iAWriterDuoS-Bold.ttf"
        "${_baseurl}/iA%20Writer%20Duo/Static/iAWriterDuoS-BoldItalic.ttf"
        "${_baseurl}/iA%20Writer%20Duo/Static/iAWriterDuoS-Italic.ttf"
        "${_baseurl}/iA%20Writer%20Duo/Static/iAWriterDuoS-Regular.ttf"
        "${_baseurl}/iA%20Writer%20Duospace/TTF%20(PC)/iAWriterDuospace-Bold.ttf"
        "${_baseurl}/iA%20Writer%20Duospace/TTF%20(PC)/iAWriterDuospace-BoldItalic.ttf"
        "${_baseurl}/iA%20Writer%20Duospace/TTF%20(PC)/iAWriterDuospace-Italic.ttf"
        "${_baseurl}/iA%20Writer%20Duospace/TTF%20(PC)/iAWriterDuospace-Regular.ttf")

package () {
	install -m644 -D -t "${pkgdir}/usr/share/fonts/${pkgname}" *.ttf
}
sha512sums=('3334653927758b8bf1336a7954191df71bb5d660196c6a61a31aeb0a50480bf48c0fb39ec2e17d211c754f16433a8051c300c21dc2fd1b46f117c837d4d89f02'
            '994cb5a8e9bc2d7cd79ae08816ed5f631aafcc293559195b26105eaa44f1c8843265e80064e324b2cbf141f125d0dafdf3dcd99de7da5dc954f4e08243c68df4'
            'e0d189ea1ca7feb04d9ade3232266e944a4ec7747754c01e3fb8d4d10afdafa739037d76d67e7636a7b1e45da3b9a935d8fa644813d97b07e75c1eb049e9eb1e'
            '837defdaef7fb5252b33c5a770e78ef655666c86a5891aa6b92e6b540167a834d1b79b444fb58bdd33c83b93bcce0e68ea60c99875c73cd2964b79b12b5e104e'
            '386eb2ad45c8b1126cbe15d8ace870f409f6ebb8393fa9e788e75ac5cee9de2bfd67d6cf55647abb52361daa7c0a4b2d2a63cfe651bfda99f6c1b9731ac586c7'
            '9e2322ad3df70572b826f79d43877bd66ef80870125de930756e17b53fc98799cb4336428e1fd3e0333a43d7f814e9eae30a944a5ac6d6440770994f2ba438e1'
            'ff08a80847770e14a0d6593f43a31812d2bf609a7dbe8f343a69aa35f687b5ee8ebd3102d8bf9d4b474788e67ad6c7298c1c99ec1d15923845436d1184c16273'
            '1b0b9c6ad93a98443be677ea447358f23949276ef220795749d4b47f2f7c49b893fef354a1ce3fe533e045860ac351948227da6064d20b0748b7569e0ca254c4'
            '5f73b50535b2c187cfa70c9d0cfb9d39a5fc1cdca8c85300ada66fc5cb9ce393ad8db3563ef7ba14010328d533e1c1f7d924116d3ac6d619e1b07ba850a9f66c'
            '120906c5cdf21f32160f595b757b0534fedf605ed7bc441b570b372801e004b5c6adcf07a6b45e086ce2ab3241c31b05baff220b94db192d9933a2668710e653'
            '7b7ea880b6cc7e73c9401ffd2989cc8c51eb868a696de721771899b89f2a808a609d7cba6750bbc301de92a6fb15f9b0454757d5e80726723154a24571c3b04e'
            'd6a5f340ec45bbe9f19247370b4be1d885f5ace6fab1ed9f2ed0966de655c5ae1de08dd774854898ac50129f50e5a2c0f352231930c33d6cbce40ed08521a76c'
            '45e34601f4eeb57bec8babbc5d82c8a7189db6259d39bd28935cd95bc979b6fb70981047eee7ff34eb203b1f19a9bbf20ba9a5934c832a04dc5a978eeca863f1'
            '67405a5e5114ef5f1d0981d55a8cd9ebb0b612fa7f180c98d6bf0022c68bc14c3d742c690282900a9f6b745159f675ac03b49cd748147085c1e3e2dba532196b'
            'f6e278e790128f9a6061f4e18e37a823a3a562a1fdb3f6d39dcd99eaa046bf0dda5a48fadf3bc6b72a613a4ff67cf0900aecc0eea8f7d673e03471ccbe2d2452'
            'f3d5f41f7b293f15f33d5e84dc01e9ca0252bececb7c29d6e862b6421bb2fbb677c520bcf9e20be488a50705d87f26c6abda190ee32c576fac1820df3a6f66b1')
