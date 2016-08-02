# Maintainer: Moritz Lipp <mlq@pwmt.org>

pkgname=radicale
_pkgname=Radicale
pkgver=1.1.1
pkgrel=3
pkgdesc='Simple calendar (CalDAV) and contact (CardDAV) server'
arch=('any')
url='http://www.radicale.org/'
license=('GPL3')
depends=('python>=3.2')
makedepends=('python-setuptools')
backup=('etc/radicale/config')
install='radicale.install'
source=(
	"http://pypi.python.org/packages/source/R/Radicale/Radicale-${pkgver}.tar.gz"
	"radicale-${pkgver}.patch"
	'radicale.service'
	'radicale.install'
)
optdepends=(
	'python-passlib: bcrypt support for htpasswd access'
	'python-requests: HTTP authentication support'
	'python-dulwich: Git support'
#	'python-pam: PAM authentication support'
#	'python-ldap: LDAP authentication support'
)

prepare() {
  cd "${_pkgname}-${pkgver}"

  patch -p1 < "${srcdir}/${pkgname}-${pkgver}.patch"
}

package() {
  pushd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m644 -D 'config' "${pkgdir}/etc/radicale/config"

  install -m644 -D 'radicale.fcgi' "${pkgdir}/usr/share/${pkgname}/radicale.fcgi"
  install -m644 -D 'radicale.wsgi' "${pkgdir}/usr/share/${pkgname}/radicale.wsgi"
  popd

  install -m644 -D 'radicale.service' "${pkgdir}/usr/lib/systemd/system/radicale.service"
}

sha256sums=('e2c9812913c464ab88ae1f66b29e81f87a4cc6ee1c94d167b33508c530dab4b0'
            'e9089df51c5b77741cb153cd66eb4d78ca25ff4c2bd20d638675846aa0574df3'
            'b5bcf0451f74c1b78e5fa52be4250c153b79d029f6f260d8d9506687b8669f02'
            '24eba59e49176a731db6b227838ee0507dbc13d710f0db8685ccf55b1a14acde')
sha384sums=('4ef6aa890c1a0d4d5044fbab7192b24676b4c4827f23ee137e7992312f7245aee673379b825495293a31e82dfdae73f0'
            'a3aab21f82e9990b15a33d036a18318bab46c08281019c00a500c22bceb542d04d1d4f0aad0a2cb489f9c9f42525052a'
            '159d799189de5924eefc1959f52edbb6347bdc2fd150274929ade410e0c46704ed844751d378f4f59b771c550a7cdacd'
            '344ee3ce9cccf504b5491846fbc1c079d32ff5c0df4b2431151a05db3b6a584267a30820174ad4d69e5e74960178c451')
sha512sums=('dc251d8fa4d347c2bbcf472b7a2da94d674f858a007fec1d74774cd1f3ae43eb2d5902ed45762638ec49546b8ee1f66446d07b50fc0ff6595deb67ea07f87af2'
            '96d542c5f583de807602fe797d0540c4096479e5b6015da8f4b25065f6186b3287e889c6610cb32ef1b61a6daec43bb82822bc253bc0f9829e13b122cd534c0d'
            '5fde1bd6192da676a552632400d58a75a9db16c2b550a6dfa24c36fa042dba42ab46226073ec7c1120eaf1a41c0d2c74314e5b2dc0f6b727507356cda829540b'
            '6c1340c78c48d5574492a26e1dcd33323486fe9087dcca6db64fa2753a06db141b84d0254eaf530d52b0879380ac877a17946eee69af8844b09d22b3cab986fb')
