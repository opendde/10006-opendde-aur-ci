# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Yen Chi Hsuan <yan12125 at gmail.com>
_pkgname=SimpleITK
pkgname=simpleitk
pkgver=1.1.0
pkgrel=3
pkgdesc="A simplified layer built on top of ITK"
arch=('x86_64')
url="http://www.simpleitk.org/"
license=('Apache')
depends=('gcc-libs' 'insight-toolkit>=4.13')
makedepends=(
    'clang' 'cmake' 'git' 'swig'
    'java-environment'
    'lua51'
    'mono'
    'python' 'python-pip' 'python-virtualenv' 'python-numpy'
    'r'
    'ruby'
    'tcl' 'tk')
optdepends=(
    'java-runtime: Java bindings'
    'lua51: Lua bindings'
    'mono: C# bindings'
    'python: Python bindings'
    'python-numpy: Python bindings'
    'r: R bindings'
    'ruby: Ruby bindings'
    'tcl: Tcl/TK bindings'
    'tk: Tcl/TK bindings'
)
source=("git+https://github.com/$_pkgname/$_pkgname#tag=v$pkgver")
md5sums=('SKIP')

prepare() {
    cd "$_pkgname"
    mkdir -p build
}

build() {
    cd "$_pkgname/build"

	_java_home=$(find '/usr/lib/jvm/' -name `archlinux-java get`)
	_lua51_version=$(pacman -Qi lua51 | grep '^Version' | egrep -o '[0-9]\.[0-9]\.[0-9]')

    CC=clang CXX=clang++ \
		JAVA_HOME=$_java_home \
		cmake \
			-DCMAKE_INSTALL_PREFIX=/usr \
			-DCMAKE_CXX_FLAGS:STRING="-std=c++14" \
			-DLUA_VERSION_STRING:STRING="$_lua51_version" \
			-DLUA_EXECUTABLE:FILEPATH="/usr/bin/lua5.1" \
			-DLUA_INCLUDE_DIR:FILEPATH="/usr/include/lua5.1" \
			-DCMAKE_SKIP_RPATH:BOOL=ON \
			-DBUILD_SHARED_LIBS:BOOL=ON \
			-DBUILD_TESTING:BOOL=OFF \
			-DBUILD_EXAMPLES:BOOL=OFF \
			-DBUILD_DOXYGEN:BOOL=OFF \
			-DSimpleITK_PYTHON_WHEEL:BOOL=ON \
			-DWRAP_DEFAULT:BOOL=ON \
			-DWRAP_CSHARP:BOOL=ON \
			-DWRAP_JAVA:BOOL=ON \
			-DWRAP_LUA:BOOL=ON \
			-DWRAP_PYTHON:BOOL=ON \
			-DWRAP_R:BOOL=ON \
			-DWRAP_RUBY:BOOL=ON \
			-DWRAP_TCL:BOOL=ON \
			..

    make all PythonVirtualEnv dist
}

package() {
    _builddir="$srcdir/$_pkgname/build"

    cd $_builddir

    make DESTDIR="$pkgdir/" install

    pip install --root="$pkgdir/" --ignore-installed \
        "$_builddir/Wrapping/Python/dist/$_pkgname-$pypkgver"*"-linux_$CARCH.whl"

    install -d -Dm755 "$pkgdir/usr/lib/lua/5.1/"
    install -Dm755 "$_builddir/Wrapping/Lua/lib/$_pkgname.so" "$pkgdir/usr/lib/lua/5.1/$_pkgname.so"
    install -Dm755 "$_builddir/Wrapping/Tcl/bin/SimpleITKTclsh" "$pkgdir/usr/bin/SimpleITKTclsh"
    install -Dm755 "$_builddir/Wrapping/CSharp/CSharpBinaries/libSimpleITKCSharpNative.so" "$pkgdir/usr/lib/libSimpleITKCSharpNative.so"
    install -Dm755 "$_builddir/Wrapping/CSharp/CSharpBinaries/SimpleITKCSharpManaged.dll" "$pkgdir/usr/lib/SimpleITKCSharpManaged.dll"

    install -d -Dm755 "$pkgdir/usr/lib/R/library/"
    cp -dr --no-preserve=ownership "$_builddir/Wrapping/R/Packaging/$_pkgname" "$pkgdir/usr/lib/R/library/"

    install -d -Dm755 "$pkgdir/usr/share/java/SimpleITK/"
    cp -dr --no-preserve=ownership "$_builddir/Wrapping/Java/dist/SimpleITK-$pkgver"*/* "$pkgdir/usr/share/java/SimpleITK/"
}
