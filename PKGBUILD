# Maintainer: Paul Taylor <bao7uo at gmail dot com>
# Contributer: GI_Jack <GI_Jack@hackermail.com>
# Contributer: ArchStrike <team@archstrike.org>

pkgname=crackmapexec
_pkgname=CrackMapExec
pkgver=5.4.0
_pkgver=5.4.0
pkgrel=1
pkgdesc='A swiss army knife for pentesting Windows/Active Directory environments'
arch=('any')
url='https://github.com/byt3bl33d3r/CrackMapExec'
license=('GPL3')
depends=('impacket' 'python' 'python-aiowinreg' 'python-asn1crypto'
	 'python-asysocks' 'python-bcrypt' 'python-beautifulsoup4' 'python-bs4'
	 'python-certifi' 'python-cffi' 'python-chardet' 'python-click'
	 'python-cryptography' 'python-dnspython' 'python-flask' 'python-future'
	 'python-greenlet' 'python-idna' 'python-itsdangerous' 'python-jinja'
	 'python-ldap3' 'python-ldapdomaindump' 'python-lsassy'
	 'python-markupsafe' 'python-minidump' 'python-minikerberos'
	 'python-msgpack' 'python-msldap' 'python-netaddr' 'python-ntlm-auth'
	 'python-paramiko' 'python-prompt_toolkit' 'python-pyasn1'
	 'python-pycparser' 'python-pycryptodomex' 'python-pylnk303'
	 'python-pynacl' 'python-pyopenssl' 'python-pypsrp' 'python-pypykatz'
	 'python-pyspnego' 'python-pytz' 'python-requests-ntlm' 'python-six'
	 'python-soupsieve' 'python-termcolor' 'python-terminaltables'
	 'python-tqdm' 'python-urllib3' 'python-wcwidth' 'python-werkzeug'
	 'python-winacl' 'python-winsspi' 'python-xmltodict' 'python-zope-event'
	 'python-zope-interface' 'python-pywerview' 'python-gevent' 'python-neo4j'
	 'python-aioconsole')

makedepends=('python-build' 'python-installer' 'python-poetry')
source=("${url}/archive/v${_pkgver}.tar.gz")
sha512sums=('36be587970c988080fc44c6c86d446eda7594ce02b4bfb4a7c2864d885bfd999b202afdf4051d53af132f27abe1f2558a077af3322ad34427ae61bd279604358')

build() {
  cd $_pkgname-$_pkgver
  poetry build
  #python -m build --wheel --no-isolation
  #cd dist
  #tar zxvf "${pkgname}-${_pkgver}.tar.gz"
}

package() {
  cd "${_pkgname}-${_pkgver}/"
  python -m installer --destdir="$pkgdir" dist/*.whl
 
  # Install the license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
 
}

