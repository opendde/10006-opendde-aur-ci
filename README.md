

#### Creating the `swcdb-lib-fs-hadoop-jvm` Package

* Clone the package from AUR:
```
git clone https://aur.archlinux.org/swcdb-lib-fs-hadoop-jvm.git;
```


* Configure, Build and Create the Package:
```
# while at the folder of `PKGBUILD`
cd swcdb-lib-fs-hadoop-jvm;
chmod -R 777 ./;

sudo -u swcdb_builder makepkg --printsrcinfo > .SRCINFO;
sudo -u swcdb_builder makepkg -s -r;

# Install
sudo -u swcdb_builder makepkg -i;
```
