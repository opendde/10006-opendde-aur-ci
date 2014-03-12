# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ldapauthmanager
pkgver=1.4.0
pkgrel=1
url=https://projects.jethrocarr.com/p/oss-ldapauthmanager/
pkgdesc="An LDAP user manager and password self-service webaapp."
arch=('any')
license=('AGPL')
depends=('php-ldap')
source=("https://projects.jethrocarr.com/p/oss-ldapauthmanager/downloads/get/ldapauthmanager-1.4.0.tar.bz2" 'apache.conf')
md5sums=('4b41c3c9deaf2750e3ffcaaf9a0c6c22'
         'a5a247acdc7004988a7fb4470f19f4f6')

backup=('etc/webapps/ldapauthmanager/config.php' 'etc/webapps/ldapauthmanager/apache.conf')

post_install () {
    echo "## You will need to create a database ##"
    echo "$ mysql ­-u root ­-p < /usr/share/webapps/ldapauthmanager/sql/version_LATESTDATE_install.sql"
}

post_upgrade () {
    echo "## You will need to update your database ##"
    echo "$ mysql ­-u root ­-p < /usr/share/webapps/ldapauthmanager/sql/version_LATESTDATE_install.sql"
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    mkdir -p ${pkgdir}/etc/webapps/ldapauthmanager
    mkdir -p ${pkgdir}/usr/share/webapps/ldapauthmanager

    find ./ -type f -execdir chmod 0644 {} \;
    cp -ra htdocs scripts sql resources ldap radius ${pkgdir}/usr/share/webapps/ldapauthmanager/
    install -Dm0664 htdocs/admin/config.php ${pkgdir}/etc/webapps/ldapauthmanager/config.php
    rm ${pkgdir}/usr/share/webapps/ldapauthmanager/htdocs/admin/config.php
    ln -s ${pkgdir}/etc/webapps/ldapauthmanager/config.php ${pkgdir}/usr/share/webapps/ldapauthmanager/htdocs/admin/

    install -Dm0664 $srcdir/apache.conf $pkgdir/etc/webapps/ldapauthmanager/apache.conf
}
