import UIKit

class Fonksiyonlar{
    func soru1(derece : Double) -> Double {
        let fahre = derece * 1.8 + 32
        return fahre
    }
    func soru2(kısaKenar: Int, uzunKenar: Int){
        let dikdortgenCevre = (kısaKenar + uzunKenar) * 2
        print("Dikdörtgenin Çevresi: \(dikdortgenCevre)")
    }
    func soru3(sayi: Int) -> Int{
        if sayi == 0 || sayi == 1 {
                return 1
            } else {
                return sayi * soru3(sayi: sayi - 1)
            }

    }
    func soru4(girilenMetin: String) {
        let kelime = girilenMetin.lowercased()
        var sayac = 0
        for harf in kelime {
            if harf == "a"{
                sayac += 1
                
            }
        }
        print("Girdiğiniz Kelime de 'a' harfi sayısı: \(sayac) tanedir.")
        
    }
    
    func soru5(kenarSayisi : Int) -> Int{
        let icAcilarToplami = (kenarSayisi - 2) * 180
        return icAcilarToplami
    }
    func soru6(calisilanGun: Int) -> Int{
        let calismaSuresiGunluk = 8
        let normalUcret = 10
        let mesaiUcret = 20
        let mesaiSure = 160
        var maas = 0
        for gun in 1...calisilanGun {
            
            if gun <= mesaiSure {
                maas += calismaSuresiGunluk * normalUcret
            } else {
                maas += (calismaSuresiGunluk * normalUcret) + mesaiUcret
            }
            
        }

        return maas
    }
    
    func soru7(kullanilanGB : Int) -> Int {
        let sabitUcret = 100
        let sabitKota = 50
        let ekUcret = 4
        if kullanilanGB <= sabitKota {
            return sabitUcret
        } else {
            let kullanilanAsimMiktari = kullanilanGB - sabitKota
            let ekKullanim = kullanilanAsimMiktari * ekUcret
            return sabitUcret + ekKullanim
        }
        
    }
}

let f = Fonksiyonlar()
//Soru1
let gelenSonuc1 = f.soru1(derece: 30)
print("Sıcaklık: \(gelenSonuc1) ℉ dır")
//Soru2
f.soru2(kısaKenar: 12, uzunKenar: 18)
//Soru3
let gelenSonuc2 = f.soru3(sayi: 5)
print("Girdiğiniz Değerin Faktoriyeli : \(gelenSonuc2)")
//soru4
f.soru4(girilenMetin: "Kasım Adalan")
f.soru4(girilenMetin: "Ömer Ünver")

//soru5
let gelenSonuc5 = f.soru5(kenarSayisi: 4)
print("İç Açıları Toplamı: \(gelenSonuc5)")

//soru6
let gelenSonuc6 = f.soru6(calisilanGun: 11)
print("Maaşınız: \(gelenSonuc6) ₺")


//soru7
let gelenSonuc7 = f.soru7(kullanilanGB: 52)
print("İnternet Kullanımı İçin Ödemeniz Gereken Ücret: \(gelenSonuc7) ₺")
