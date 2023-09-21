//
//  ViewController.swift
//  Homework5
//
//  Created by M.Ömer Ünver on 20.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var sayi = String()
    var hesaplamaIslemi = String()
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var zeroNumber: UIButton!
    @IBOutlet weak var oneNumber: UIButton!
    @IBOutlet weak var twoNumber: UIButton!
    @IBOutlet weak var threeNumber: UIButton!
    @IBOutlet weak var fourNumber: UIButton!
    @IBOutlet weak var fiveNumber: UIButton!
    @IBOutlet weak var sixNumber: UIButton!
    @IBOutlet weak var sevenNumber: UIButton!
    @IBOutlet weak var eightNumber: UIButton!
    @IBOutlet weak var nineNumber: UIButton!
    @IBOutlet weak var equal: UIButton!
    @IBOutlet weak var plus: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = "0"
        oneNumber.layer.cornerRadius = 23
        oneNumber.clipsToBounds = true
        twoNumber.layer.cornerRadius = 23
        twoNumber.clipsToBounds = true
        threeNumber.layer.cornerRadius = 23
        threeNumber.clipsToBounds = true
        fourNumber.layer.cornerRadius = 23
        fourNumber.clipsToBounds = true
        fiveNumber.layer.cornerRadius = 23
        fiveNumber.clipsToBounds = true
        sixNumber.layer.cornerRadius = 23
        sixNumber.clipsToBounds = true
        sevenNumber.layer.cornerRadius = 23
        sevenNumber.clipsToBounds = true
        eightNumber.layer.cornerRadius = 23
        eightNumber.clipsToBounds = true
        nineNumber.layer.cornerRadius = 23
        nineNumber.clipsToBounds = true
        zeroNumber.layer.cornerRadius = 23
        zeroNumber.clipsToBounds = true
        plus.layer.cornerRadius = 23
        plus.clipsToBounds = true
        equal.layer.cornerRadius = 23
        equal.clipsToBounds = true
        
    }
    
    @IBAction func oneNumberButton(_ sender: Any) {
        guard let buttonIsim1 = oneNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim1)
        textField.text = sayi
        
    }
    @IBAction func twoNumberButton(_ sender: Any) {
        guard let buttonIsim2 = twoNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim2)
        textField.text = sayi
    }
    
    @IBAction func threeNumberButton(_ sender: Any) {
        guard let buttonIsim3 = threeNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim3)
        textField.text = sayi
    }
    
    @IBAction func fourNumberButton(_ sender: Any) {
        guard let buttonIsim4 = fourNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim4)
        textField.text = sayi
    }
    
    @IBAction func fiveNumberButton(_ sender: Any) {
        guard let buttonIsim5 = fiveNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim5)
        textField.text = sayi
    }
    
    @IBAction func sixNumberButton(_ sender: Any) {
        guard let buttonIsim6 = sixNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim6)
        textField.text = sayi
    }
    
    @IBAction func sevenNumberButton(_ sender: Any) {
        guard let buttonIsim7 = sevenNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim7)
        textField.text = sayi
    }
    
    @IBAction func eightNumberButton(_ sender: Any) {
        guard let buttonIsim8 = eightNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim8)
        textField.text = sayi
    }
    @IBAction func nineNumberButton(_ sender: Any) {
        guard let buttonIsim9 = nineNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim9)
        textField.text = sayi
       
    }
    @IBAction func zeroNumberButton(_ sender: Any) {
        guard let buttonIsim0 = zeroNumber.titleLabel?.text else {
            return textField.text = "Error"
        }
        sayi.append(buttonIsim0)
        textField.text = sayi
    }
    
    
    @IBAction func plusButton(_ sender: Any) {
            sayiEkle(sayi: sayi)
            sayi = ""
            textField.text = "0"
            
       
    }
    
    func sayiEkle(sayi: String){
        guard hesaplamaIslemi.isEmpty else {
            hesaplamaIslemi.append("+\(sayi)")
            return
        }
        hesaplamaIslemi.append("\(sayi)")
      
    }
    
    @IBAction func equalButton(_ sender: Any) {
        sayiEkle(sayi: sayi)
        let splitString = hesaplamaIslemi.split(separator: "+")
        var toplam = 0
        for sayi0 in splitString {
            toplam += Int(sayi0)!
        }
        
        textField.text = String(toplam)
        sayi = ""
        hesaplamaIslemi = ""
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        clearFunc()
    }
    
    func clearFunc(){
        sayi = ""
        hesaplamaIslemi = ""
        textField.text = "0"
        
    }
    
}

