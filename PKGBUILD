# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
# Co-Maintainer: Carlos Silva <r3pek@r3pek.org>

pkgname=autenticacao-gov-pt-pki
pkgver=20220331
pkgrel=1
pkgdesc="PKI Certificates for Cartao de Cidadao / Autenticacao.gov (Portugal eID)"
arch=('any')
license=('custom')
url="https://pki.cartaodecidadao.pt/"
conflicts=('cartaodecidadao-pki')
source=("autenticacao-gov-pt-pki.install"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20001.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20002.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20003.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20004.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20005.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao/Cartao%20de%20Cidadao%20006.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200001.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200002.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200003.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200004.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200005.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200006.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200007.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200008.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200009.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200010.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200011.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200012.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200013.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200014.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200015.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200016.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200017.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_assinatura/EC%20de%20Assinatura%20Digital%20Qualificada%20do%20Cartao%20de%20Cidadao%200018.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200001.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200002.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200003.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200004.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200005.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200006.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200007.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200008.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200009.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200010.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200011.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200012.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200013.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200014.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200015.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200016.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200017.cer"
		"https://pki.cartaodecidadao.pt/publico/certificado/cc_ec_cidadao_autenticacao/EC%20de%20Autenticacao%20do%20Cartao%20de%20Cidadao%200018.cer")

sha512sums=('5b9605e353db6bdad497010a332e1bea516c8b3f136ddb8c06fb987ac5a59fce91880e9bba09b594da725228ffb14694321ac1fcb90431d7a28a2dea61ed47a6'
            '0f7f813723425b090cad4f9140c7f56b17b753fba9eb733c18c84b167bc214aa1dcc0df5fbecd5490b8cdbb546fd736e937abc3bbef5280ff4eb6dc852338ed1'
            '69f06ef7bc70dfce8fd11ca2335c51c3185f5b97d0778183142527d818f131939e27c002f9a52a06b7992a319e3ab04fd954caf7d6cde3dd08e1e782be9a19cd'
            '9569371e5a455923570ea77085e3b09a27d4c7353d4bfc8e0af0a3a30e9321c04c74bbb88c0f221b12efd2cbaa88c04c45e82f893844a5ce6a71ac4324f4eeb7'
            '38e7e667887152a0be24d24a15a1129c77af4cc531ec6d17d98d47053ad106cf3a743300833d9dd77533e3182d1ceeb0f73b2a85da516fef890001ee06be2466'
            '39d510cd572c418ff22a2609a0c0ceb025a0d8566349c431034b100aa248d97b8b012a84f2c071817e40398452f9ee559fb7b04b2ca77d130da57b1f8fe03db5'
            '426cbd5f5eff0c27444d0dd3d9ee7a521c71f68c666336d62a3cb9a82b18e4bc11edb2a7c9187fa788ad1fdefa6a4e72cf82a96a62622ade5d3b1fd35a9a3bbf'
            'aa20ed1148e31912e0b8e209ccb042a80175aeefd1ced3bab3981651f173f5873937861c48b6912dda931f029c19f9bc190357894f8a48c68184f4337ea0d29a'
            '8a9547becb7ad9a809b2827f85e7c3e4a9829073ff72ae32b43450f03db0aef2ce921cc3d26333e093d7ce7ae850c809f3d9bd368a5dd58fbae05a181d4b7e8e'
            '8a3a96d43dc1d75449836fd267af305543eac0b82e545ccbb406300930a3bdb83b5ce38c59a645081b1bf2b6800141f36576ad8ea0e7ad31cdd8f60ccda31475'
            '64c959955cfbb2651aba2a6398f4ed8b7c739bfee1d07d4db4a3b97e2197099225fd600354dd4bc74f9bce7cc5ab5ee899223c1b63c721fc175510e4a6891b5d'
            '6f6d504428b9fa87f4a7122e97780ed0d76cb4c13953f008737bed27fea7927d855b06896ff7975fc19f277d103024223ebf935b7c4035ed5ed0cdf8e265e887'
            'dcb7294d162dd143ba77bf75e2cd9e9236b905f51ebef4b1f8de50e3572002a5d1065bb6d5cc03b6757f161eb010b00d628b00837556406b5f7d0f267a58961d'
            'd2e2e4155bc616e718ad830120b7b7410c580199ca1f071a9dc33238a349c48ab88f7da6647da520ffeb02dee411253e97d4f296f73fac179771cc536744a256'
            'fcbe6bf03c933c43a7e3e003641a8e43bc0389a69c93e227b3e3503bd753be5ec38e85b22de745dd7acb68328d5680e7e0d53011ca58e1093049ff67decc4b16'
            'e43f600020a9649295854c24d71b374791439db150e928fffcd6c1bfbe2f4421c07fd284004becc172ce154e127caa5638ce67f08bdc5b374f6f443ad8c66d31'
            '2fc6cdbfe02080048f619ba31a7a02f1eccc56d0ee9367221793c78a7c3bf2be6493a8ede5fe80e8b87e666842952d853a5fd4304f69add1cf1d8db7dcb818c0'
            '5c794a45d8d767bee2b8592f3e76ce17541c0543bfa1e5878e7894475df78f100e737d2aa3ecbf736f07f46dea06d2a718c63df8ab693c5518a9dbe910eed808'
            'dc0dfa763880a6a832e6f1ac42358a09b2126e7872c1bb929751dc2101f0a4c9dd38cb0a2cbc615858eb84c29243dfa3d562ed4a68d76a3a1754bc42c8cd992b'
            '507f2c98ca848f2c89c3a4910bfd78875b3799659314ecd7f376dfcb1af68c02785e45323dcf6f4751b840b4ddbebd7a87fd1397a727c8712b6696b83d2e49d3'
            '723abc1042c6d057e2c0fa686b47f11215cdd533b3ce45167da0895898a59b9defae9d092bbfe8c3c8b5802afc5ef911f8b0af2d33b5b07f22b2c74b76e637fa'
            '3160d1def3358d9d8015b12e7a9e1212b87c732162e5f27882536bc951eae9f3bf160dd9c3fb1f2ead210b7cbe5d8806f2afa3826325778192a0e5d5034b4e9f'
            '0b31d089da3516a4315c92586ccb510c839ad5a0dfba9417368b118dbce08cd32b8ae3a15bfc0913eef61f4164e0fbf59ab48f265a476c7a6b5a82993d2738b9'
            '761faf707157650144ba6d2aa8262e3329c94f494d86bd1e1d422eb094f86718146b8ee449e046f07f4ebf7c9365142b2aca765f0a7a86d1287214913f198975'
            '03a1705cae73d3010ac9b9591efb6a10119690d44b07561c3e0d469ed792c8bd39e74d25fa59140db1bd6ff18f639f0c7973ed20e93d9557a69dd27f01eb21b1'
            '07d19fc9041e639577dd1da30937ebf89aaadf6ba4a5a05f9262f9b5f3e12614ab1bb2ad76aea87c810faffa7c65ecd4205e5151b1b965f570765759b26701a1'
            '0f6fa5e33fabcd3f5d33a9984c90dcdac6baa646c8477716101eaa58ed11a6ad91d68c835f947920d4f5133c8139e0747646bb94d28b8051e095a36e51d766a4'
            '1f0a8e2282fbe846119b4a187c87df8ef4c9978f80bb4acc58ec1d5cc35dc9b720479d5061d84ef37af205868f0f322829e9532a559c16f545a1ed422b4bcb2f'
            '96dfb35a8dd2058fb74d27d4630da1c239976d2d92e7fb2cdbf0c229d8081305102ad94b96bf5415ac8adfd560e915be4c3dc6de5843d683af9fc6efe7475bc9'
            'a3c842f67ec60ae0399e7e63aa64fb60b34904b880a7bd9619ce0369d6bcf00523738f4838eaafeefaf70558f244330313fc7df845e7296f4409367049738ae1'
            'ed8158211b133e89e9c26f7378b6828de810ec1ddc314baa7dac691abcb406564edaf06af2f9647e470d6df5d95c90c8aea648fb02ad5b362b1f58410445cc00'
            '5b6bfd3da7a3e0be2dfb00cfe2d2edebb58dfbc4e03b9c81ea45d406fc41d2402fb879de0d52d82fa5679de43d55d46045465f9de4da712ead5a700aed9e1db4'
            '082c4bd7457f6dc0836ff693c5e5dba1406d4f0faeb9e3af67b539cd2f4ec6cf304c38fca2e32f77b6991a04a2ece6ed08bb586521c0b963e9aa7a35e6510dd7'
            '711eec3f5bbe58f73c9b454356f62bc9c8703dc7d4dde4e55c00d8f0b4b88cb7778c2ad532f3ac4b402cbe83c2b51a48aa2ff4ee6572ef2117760bc6a3f9665f'
            '48a0d90074e36c27db8b6091000baa5d51871adac5bce1ac7f696a906bfc493d602c91a7778e2f826753924da8437ac6715ba7986240c67e01563670ec6e2472'
            'a7887b0f2bd2073c94805af6898d5f5cdfe3f7349b24cfa489ca63149dc3f77898a85c3a3a9ecc1eb670b77ca7acc6e855d5929a3284e816c9f79dff0eb21756'
            'f6d9d010b973be50da01592dce6fe30f32819eb7f4d8e7538cf8f903e750994cd4e5f750c8c76ba0291a9ea78d5934f6d42459e4fe33382245cb985fdb1f709c'
            '779a75facdd71bf014a3987df0c595244d3a9d173c5a28d68842261305bdc910177b4f8e3bbf27ee18b8b3c9744fb81e0c578f21fe390cf5dc959195f4ea7cd4'
            'f1f99cbf0f34b59335ca10124b7ff1bda96c93781c522edd7066a8681d693f99dd2c90b0f20494b1280fc408b3ee7b174c6e455ba5431142e7f5d2b70963820b'
            'ea13f5b3b443c76fc5d5811010869ad3b59f8df3095d02f139ed2aea3e67f0eeed32c320e60fc3857ff322b0adcf9f5ae2d10fb06154e9999ce624c49f0f6be2'
            '4405061f0167e827e21cda6e481c8fe7caa24353412e8be64897b18904a83144df580b965780e5b38981ce6926b28de2e202896ffdf95c1cb764b82346876677'
            'd225d5842d69e41490317e22d58d068d402e4d1d8cbea180346a845600e2a3e6cca3e281dd405cb6105bcff0c5ab01bc22b8b2c53a14c3cb11dd2d4cc390bcfc'
            '9876f721d57cde3cb64522c76fa63a3b462f5091ca46766caf3747eca71b824c933daf93565aeba55f1b0f9c416d7f3beec50e68e49ab361c0d9189917dee2ca')

install='autenticacao-gov-pt-pki.install'

package() {
	mkdir -p ${pkgdir}/etc/ca-certificates/trust-source/anchors
	install ${srcdir}/*.cer ${pkgdir}/etc/ca-certificates/trust-source/anchors/
}
