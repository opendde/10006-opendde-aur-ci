# Maintainer: Que Quotion <quequotion@bugmenot.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-lite
pkgver=5
pkgrel=2
pkgdesc='Pantheon Lite Session (Gala replaced with openbox & picom)'
arch=('any')
url='https://bbs.archlinux.org/viewtopic.php?pid=1402016#p1402016'
license=('GPL3')
groups=('pantheon-qq')
depends=('openbox' 'picom' pantheon-{workarounds,session}
         'wingpanel-standalone-git')
optdepends=("obconf: openbox configuration utility"
            "elementary-os-openbox: Elementary theme for Openbox"
            "hsetroot: Set X11 background"
            "xorg-xwininfo: set mousewheel transparency scrolling like compiz with picom-trans"
            "dbus: set window color inversion with picom-inverter")
source=(pantheon-openbox.{desktop,session} 
        picom-{dbus.desktop,inverter}
        openbox-session.desktop
        {rc,menu}.xml autostart)
sha512sums=('1f950c641343e766cdd5b222dcac8f596e197fd5a9e3659a2bfce9da7020cf8575b0a64b9b7a0d810054303f03bb65f095222297682a5419eb6581517eb36e81'
            '452248551571ab5de2cce1e1220a2f9593a8d145b341ef6eab466be8b6396f0fbf312952b6ad0028934fc6ad4d1bf4213c8e222635aa47e39c7171f252ed7eb1'
            'bff6d45fc78471ed9312d7be6381b541fa9a93adedef58f6ce7e09c2740e07c2a3fcf076dcaf25dd480a9164764933ba7850c7332e173acac161f36597d2786d'
            '3f1e515717bca482f4250645845baf73fadee81219684a6f3c5490f1cce48c129c5e0a32df55f26b556298e41545eca4b7d4bdea96556ca42380ff6d79acafbb'
            '79d4c9f13fde13e31dbacd9f93de66278f35932367e32493d39cb99475ae638f706701e743f3796df4ac36913c91424170fb2053bd55036af0a23764d234b22b'
            'd93a0d7ddf70ee10d14b7f1e46257fb432cbfd9fcce7ab3b6bc3443876e0dad6453e0bcda3cf148e0dab47ce5d1d79ae22ef2921bbde46ff7f555a25a1e7bbae'
            '809ba5d0637a0ffbd0506b1b5d7e0500d5e53f06aae27d8180202c4d89d86d43661aac1dd78a3ecc5395385358c61da0b7e82857e41ab2e9be8dc6b56ba81dce'
            '01070c3553605e0148cfe67b4f02401c8b8d43084f785f141ccf3735d9a0d56c856c286693f535f3635ce68fb29ea625b9f302fb9c33402a8f7f6a3b2e359244')

package() {
  install -Dm644 {,"${pkgdir}"/usr/share/xsessions/}pantheon-openbox.desktop
  install -Dm644 {,"${pkgdir}"/usr/share/gnome-session/sessions/}pantheon-openbox.session
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}picom-dbus.desktop
  install -Dm755 {,"${pkgdir}"/usr/bin/}picom-inverter
  install -Dm644 {,"${pkgdir}"/usr/share/applications/}openbox-session.desktop
}
