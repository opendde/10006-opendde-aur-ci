#Maintainer: jnanar <info@agayon.be>

pkgbase='sat-libervia-hg'
pkgname=('sat-libervia-hg' 'sat-pyjamas')
_realname=libervia
_pyjamasname=pyjamas
venv_pyjama='venv'
pkgver=0.6.1.r1105.e6ff5530900e
VERSION=0.6.1
pkgrel=1
url="http://salut-a-toi.org/"
arch=('any')
depends=('python2'  'python2-txjsonrpc-git' 'python2-jinja' 'python2-shortuuid-git' 'sat-media-hg' 'sat-xmpp-hg' 'sat-templates-hg' 'python2-zope-interface' 'python2-pyopenssl' 'python2-autobahn')
makedepends=('python2-setuptools' 'python-virtualenv' 'mercurial')
license=('AGPL3')
install=$pkgbase.install
source=('ftp://ftp.goffi.org/pyjamas/pyjamas.tar.bz2'
        "hg+http://repos.goffi.org/libervia"
        )

md5sums=('a0d6344951153f79302eb2b6fd08376e'
         'SKIP'
         )

options=('!strip')

pkgver() {
  cd "$_realname"
  printf "$VERSION.r%s.%s" "$(hg identify -n)" "$(hg identify -i)" 
}

    
pyjamas_build(){
 
    pwd
	virtualenv $venv_pyjama -ppython2.7 --system-site-packages
	cd $_pyjamasname
	source $srcdir/$venv_pyjama/bin/activate	
	python2.7 bootstrap.py
	deactivate
}
                 
build() {
        pyjamas_build

        cd "$srcdir/$_realname"
        install -dm755 "$srcdir/fakeinstall/"
        PYJSBUILD_PATH="$srcdir/pyjamas/bin/"
PATH=$PATH:$PYJSBUILD_PATH LIBERVIA_INSTALL=arch NO_PREINSTALL_OPT=nopreinstall SAT_INSTALL=nopreinstall python2 setup.py install --root="$srcdir/fakeinstall/" --prefix=/usr --optimize=1
	cp -r $srcdir/$_realname/src/{browser,pages,common,server,twisted} $srcdir/fakeinstall/usr/lib/python2.7/site-packages/libervia
}


package_sat-pyjamas(){
        provides=('sat-pyjamas')
        conflicts=('sat-pyjamas')
	pkgdesc="Pyjamas is a toolkit and applications framework, for the Web."
	echo "Building Libervia depends on pyjamas."
	echo "We use a special version of pyjamas provided by SàT"
}





package_sat-libervia-hg(){
         pkgdesc="Salut à Toi, multi-frontends multi-purposes XMPP client (Web interface)"
         depends=('dbus' )
         provides=('sat-libervia')
         conflicts=('sat-libervia')
	 cd "$pkgdir"
	 install -dm755 usr/bin
	 install -dm755 usr/lib/python2.7/site-packages
	 install -dm755 usr/share/doc
	 install -dm755 usr/share/libervia
	 install -dm755 usr/lib/python2.7/site-packages/twisted/plugins
	 # HTML destination
	 install -dm755 usr/share/libervia/html
	 
	 cd "$srcdir/fakeinstall"

         cp "$srcdir/libervia/src/libervia.sh" "$pkgdir/usr/bin/libervia"
	 mv -v usr/share/doc/libervia "$pkgdir/usr/share/doc/"
         mv -v usr/share/libervia "$pkgdir/usr/share/libervia/"
	 mv -v usr/lib/python2.7/site-packages/libervia "$pkgdir/usr/lib/python2.7/site-packages/"
	 mv -v usr/lib/python2.7/site-packages/libervia-0.6.1.1-py2.7.egg-info "$pkgdir/usr/lib/python2.7/site-packages/"
	 mv -v usr/lib/python2.7/site-packages/twisted/plugins/* "$pkgdir/usr/lib/python2.7/site-packages/twisted/plugins/"
	 mv -v "$srcdir/libervia/html" "$pkgdir/usr/share/libervia/"
	 mv -v "$srcdir/libervia/themes" "$pkgdir/usr/share/libervia"
 
	 
 }





