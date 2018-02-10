# Maintainer: Runnytu < runnytu at gmail dot com >
# Old Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Old Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: tobias <tobias@archlinux.org>
# Committer: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=courier-imap
pkgver=4.18.2
pkgrel=2
pkgdesc="IMAP(s)/POP3(s) Server"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL2')
url="http://www.courier-mta.org/imap/"
depends=('courier-maildrop' 'gcc-libs' 'gamin' 'gdbm' 'openssl' 'courier-unicode>=2.0' 'courier-authlib')
backup=('etc/courier-imap/imapd.cnf' 'etc/courier-imap/pop3d.cnf' \
        'etc/courier-imap/imapd' 'etc/courier-imap/imapd-ssl' \
        'etc/courier-imap/pop3d' 'etc/courier-imap/pop3d-ssl')
conflicts=('courier-mta')
provides=('imap-server' 'pop3-server')
options=('!libtool' '!staticlibs')
source=(http://downloads.sourceforge.net/project/courier/imap/${pkgver}/${pkgname}-${pkgver}.tar.bz2
	courier-imapd-ssl.service
	courier-imapd.service
	courier-pop3d.service
	courier-pop3d-ssl.service)
sha512sums=('821f0151012f1a357faf705d938d8498a939cc994957398c0d5e2b7a619eabe202549f174e625161545ba6a94b753072458e9f0edc30cbb2443b15405740347e'
	    'dfb4caa92e5033fbd5396df2e1718ae1f18d63d41f61e14014edee31f823d0fe49a151af570546767a7bafa31e0517717c1aef82896ff6741696a35bba397925'
	    '7cd18dc9449255ab7fc945ceb836e470afcfa2e722bd20c19d46a88082eee61d9136a4cbccc082625ba1f0c97d70c287d2b98718694613c32a180decce5f3051'
	    '419014a8956bb82de36f29afe859b6b2b57818fc7456a734c3447b389ff606c2bfe400506a2c33d4cec005583081e4cb78c38230d126aadc1f62b9ce0ec1e4d0'
	    '896af7b284e48f1b85f7d485b3ca169b2b5b90f8678018a1473fe18b4852f149623c2883614d5aa8205f1a3debe910b5cbf18904adb4985bb72059704f9ebec1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # fix a tiny bug
  sed -i -e \
    's|--with-authchangepwdir=/var/tmp/dev/null|--with-authchangepwdir="$libexecdir"/authlib|' \
    configure && chmod 755 configure

  ./configure --prefix=/usr \
    --sysconfdir=/etc/courier-imap \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/courier-imap \
    --localstatedir=/var/spool/courier-imap \
    --disable-root-check \
    --enable-unicode \
    --enable-workarounds-for-imap-client-bugs \
    --with-piddir=/run/courier \
    --with-trashquota \
    --with-db=gdbm \
    --with-mailuser=courier --with-mailgroup=courier
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # cleanup - provided by courier-maildrop
  rm "${pkgdir}/usr/bin/"{deliverquota,maildirmake,makedat}
  rm "${pkgdir}/usr/share/man/man1/"maildirmake*
  rm "${pkgdir}/usr/share/man/man8/"deliverquota*
  ###############################################################################
  # this is what usually "make install-configure" does
  # *.dist files get rid of "dist"
  for _distfile in "${pkgdir}/etc/courier-imap/"*.dist; do
     # change ownership where it is assumed the user & group already exist
     chown -R 72:72 "${pkgdir}/etc/courier-imap/"
     mv "${_distfile}" "${pkgdir}/etc/courier-imap/"$(basename "${_distfile}" .dist)
  done
  sed -i 's|TLS_CERTFILE=/usr/share/|TLS_CERTFILE=/etc/courier-imap/|' \
    "${pkgdir}/etc/courier-imap/"*-ssl
  #for _pamfile in imap/*.pam; do
  #  sed -i "s|/lib/security/||;s|pam_pwdb|pam_unix|" "${_pamfile}"
  #  install -Dm 644 "${_pamfile}" \
  #    "${pkgdir}/etc/pam.d/"$(basename "${_pamfile}" .pam | sed "s/d$//")
  #done

  chown 72:72 "${pkgdir}/usr/lib/courier-imap"

  # Install systemd service files
  install -Dm 644 "${srcdir}/courier-imapd.service" 	"${pkgdir}/usr/lib/systemd/system/courier-imapd.service"
  install -Dm 644 "${srcdir}/courier-imapd-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-imapd-ssl.service"
  install -Dm 644 "${srcdir}/courier-pop3d.service" 	"${pkgdir}/usr/lib/systemd/system/courier-pop3d.service"
  install -Dm 644 "${srcdir}/courier-pop3d-ssl.service" "${pkgdir}/usr/lib/systemd/system/courier-pop3d-ssl.service"

  # Install systemd configuration files
  mkdir "$pkgdir/usr/lib/tmpfiles.d" -p
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd.conf"
  echo "D /run/courier 0755 courier courier" > "$pkgdir/usr/lib/tmpfiles.d/courier-imapd-ssl.conf"

  mkdir -p "${pkgdir}/run/courier"
}
