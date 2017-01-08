# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: Jaroslav Lichtblau <dragonlord at aur dot archlinux dot org>
# Contributor: Daniel J Griffiths <ghost1227 at archlinux dot us>
# Contributor: Ronald van Haren <ronald at archlinux dot org>
# Contributor: Alessio 'mOLOk' Bolognino <themolok at gmail dot com>
# Contributor: Pawel Rusinek <p.rusinek at gmail dot com>

pkgname="griffith"
pkgver=0.13
pkgrel=12
pkgdesc="Movie collection manager application"
arch=('any')
url="http://www.griffith.cc/"
license=('GPL2')
depends=('pygtk' 'sqlite' 'python2-pysqlite' \
         'python2-reportlab' 'python2-pillow' 'python2-sqlalchemy'
)
optdepends=('python2-psycopg2: postgreSQL support'
            'mysql-python: MySQL support'
            'python2-chardet: encoding detection of imported CSV files'
            'python2-gtkspell: spell checking support'
            'griffith-extra-artwork: additional icons'
)
source=("http://launchpad.net/${pkgname}/trunk/0.13/+download/${pkgname}-${pkgver}.tar.gz"
		"https://raw.githubusercontent.com/ValHue/AUR-PKGBUILDs/master/griffith/validators.py"
		"http://www.strits.dk/files/PluginMovieIMDB.py"
)
sha256sums=('60576d33aa855ab45d654288d7bf2ead8accecb72fd2acbc373656294ab8f242'
            'f5e0b43c6ee56148b55cc650599c96b7774491867d38b47278bc121bf33fb9af'
            'c1f1c5dbe0b975f15a6d0265e53b993390eb33aca2011f2e0d390b326a017a21'
)

build() {
    cd "${pkgname}-${pkgver}"

    # python2 fix
    sed -i 's_#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' griffith

    # new bash_completion directory
    #sed -e 's,BASHCOMPDIR = $\(ETCDIR\)/bash_completion.d,BASHCOMPDIR = $\(PREFIX\)/share/bash-completion/completions,' -i Makefile
    sed -e 's,BASHCOMPDIR = $(ETCDIR)/bash_completion.d,BASHCOMPDIR = $(PREFIX)/share/bash-completion/completions,' -i Makefile

    # The version 0.13.0 of griffith isn't compatible with SqlAlchemy 0.8.
    # http://forum.griffith.cc/index.php/topic,1601.msg5317.html#msg5317
    cp -f ../validators.py ./lib/db/validators.py

	# Update PluginMovieIMDB.py to version 1.15. Thanks to Strit
	# http://www.strits.dk/files/PluginMovieIMDB.py
	cp -f ../PluginMovieIMDB.py ./lib/plugins/movie/PluginMovieIMDB.py

	# Fix dependencies version
	sed -i '65,83d' griffith

	# Fix to AttributeError: 'module' object has no attribute 'glade'
	sed -i "35i\import gtk.glade" ./lib/initialize.py
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR=${pkgdir} install

    # The program creates a wrong symlink so make a new one
	rm ${pkgdir}/usr/bin/griffith
	ln -s /usr/share/griffith/lib/griffith ${pkgdir}/usr/bin/griffith 
}
# vim:set ts=4 sw=2 ft=sh et:
