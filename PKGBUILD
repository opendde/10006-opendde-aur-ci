#maintainer jaydendev
pkgname="pclish"
pkgver="0.0.1"
pkgrel="0.0"
pkgdesc="Python Command-Line Shell"
arch=("x86_64" "arm")
depends=("python" "bash")
license=("MIT")

package() { 
    sudo pacman -S python-psutil
    rm -rf /home/$USER/pclish/src/pclish
	sudo pip install pyinstaller
	git clone https://github.com/JaydenDev/pclish $srcdir/pclish
    rm -rf /home/$USER/.local/bin/pclish_dir
	mkdir -p /home/$USER/.local/bin/pclish_dir
    mkdir -p /home/$USER/.local/bin
	pyinstaller $srcdir/pclish/pclish.py --distpath=$srcdir/pclish_dir
	mv $srcdir/pclish_dir/pclish /home/$USER/.local/bin/pclish_dir
    ln -sf /home/$USER/.local/bin/pclish_dir/pclish/pclish /home/$USER/.local/bin/pclish
}
