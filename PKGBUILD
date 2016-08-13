# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: 
#_pkgver_minor=-rc3
_pkgver_minor=
_python2_ver_major=$(pacman -Qi python2|gawk '$1~/Version/{split($3,v,".");print v[1] "." v[2]}')
pkgname=mesos
pkgver=1.0.0
pkgrel=1
pkgdesc="A cluster manager that simplifies the complexity of running applications on a shared pool of servers"
arch=('i686' 'x86_64')
url=http://mesos.apache.org/
license=('Apache')
groups=('science')
install=$pkgname.install
depends=('python2' 'curl' 'leveldb' 'java-environment' 'libunwind' 'google-glog'
         'libnl>=3.2.26' 'apr' 'subversion' 'protobuf' 'python2-protobuf' 'python2-boto' 
	 'python2-setuptools')
makedepends=('java-environment' 'maven' 'http-parser' 'python2-http-parser' 'google-glog'
             'gperftools' 'apr' 'subversion' 'protobuf'
'python2-protobuf' 'python2-boto')
conflicts=('python2-shutilwhich')
source=("http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz"
  "$pkgname-master.service"
  "$pkgname-slave.service"
  "$pkgname.install")

# official signature file:
#  "http://www.apache.org/dist/$pkgname/$pkgver/$pkgname-${pkgver}.tar.gz.asc"
md5sums=('8b31a934ca19aabf2105d84df5ec5d9c'
         'f313fac94525bf770bafa2392c8147c6'
         '69df716316170056ff2a54c5299d8cb4'
         '1447c9572f4bb8fbc22d016e4483950a')

prepare() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"
  if [ ! -d build ]; then
    mkdir build
  fi
  if [ ! -d build/.m2 ]; then
    mkdir build/.m2
  fi
  if [ ! -f configure ]; then
    ./bootstrap
  fi
  # fix python path (/usr/bin/env python -> python2)
  find src/cli -type f -print | xargs sed --in-place -e "1 s/\(\/usr\/bin\/env python$\)/\12/"
}

build() {
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  PYTHON_VERSION=${_python2_ver_major} \
  LIBS='-lprotobuf -lglog' \
  ../configure \
   --enable-optimize \
   --prefix=/usr \
   --sysconfdir=/etc \
   --libexecdir=/usr/lib \
   --exec-prefix=/usr \
   --sbindir=/usr/bin \
   --with-glog=/usr \
   --with-leveldb=/usr \
   --with-gperftools=/usr \
   --with-network-isolator

 make
}

check() {
  msg "Skipping 'make check'."
  msg2 "(Because it takes very long time to complete)"
  #cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
  #make -k check
}

package() {
  mkdir -p $pkgdir/usr/lib/$pkgname
  cd "$srcdir/$pkgname-$pkgver${_pkgver_minor}"/build
	make DESTDIR="$pkgdir/" install
  mkdir -p -m755 $pkgdir/usr/share/java/$pkgname 
  mkdir -p -m755 $pkgdir/var/{lib,log}/$pkgname
  install -m644 ./src/java/mesos.pom $pkgdir/usr/share/java/$pkgname/
  install -m644 ./src/java/target/*.jar $pkgdir/usr/share/java/$pkgname/
  mkdir -p -m755 $pkgdir/usr/lib/systemd/system
  install -m644 $srcdir/$pkgname-{master,slave}.service $pkgdir/usr/lib/systemd/system
  
  # python
  cd ./src/python
  python2 setup.py install --root="$pkgdir" --optimize=1
}
