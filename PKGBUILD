# Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=cartaodecidadao
_pkgname=autenticacao.gov
pkgver=3.1.0
pkgrel=1
pkgdesc="Portuguese Citizen Card Application"
arch=('i686' 'x86_64')
url="http://www.cartaodecidadao.pt/"
license=('GPL2' 'LGPL3' 'custom:EUPL')
depends=('qt5-base'
         'qt5-tools'
         'qt5-quickcontrols'
				 'qt5-quickcontrols2'
         'qt5-graphicaleffects'
         'pcsclite>=1.5.0'
         'openssl-1.0'
         'ccid'
         'libzip'
         'poppler-qt5'
				 'libxerces-c-3.1'
				 'libcurl-compat'
         'xml-security-c')
makedepends=('swig' 'qconf' 'git' 'xml-security-c' 'jdk11-openjdk')
optdepends=('autenticacao-gov-pt: Necessário para autenticações online'
            'cartaodecidadao-pki: PKI que confirma a validade dos certificados dos CC'
            'ecce-gov-pt-certificates: Certificados da ECCE quem assina dos certificados contidos em cartaodecidadao-pki')
conflicts=('classpath' 'cartaodecidadao-bin')

source=('git+https://github.com/amagovpt/autenticacao.gov/#branch=openssl-migration')

sha512sums=('SKIP')

prepare(){
	# Temporary Fix in order to compile with archlinux java handling neededs sudo and conflicts with GNU classpath
	sudo archlinux-java set java-11-openjdk
	sudo ln -sf /usr/lib/jvm/default/include/jni.h /usr/include/jni.h
	sudo ln -sf /usr/lib/jvm/default/include/linux/jni_md.h /usr/include/jni_md.h
}

build() {
	cd ${srcdir}/${_pkgname}/pteid-mw-pt/_src/eidmw
		qmake pteid-mw.pro
		make
}

package() {
	cd ${srcdir}/${_pkgname}/pteid-mw-pt/_src/eidmw

	# Install programs and libraries
	mkdir -p ${pkgdir}/usr/local/lib/
	make INSTALL_ROOT="$pkgdir" DESTDIR=$pkgdir PREFIX=/usr install
	mv ${pkgdir}/usr/local/lib/ ${pkgdir}/usr/lib/ 
}
