//
//  ViewController.swift
//  Homework4
//
//  Created by M.Ömer Ünver on 17.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func sayfaAButton(_ sender: Any) {
       performSegue(withIdentifier: "sayfaBSegue", sender: nil)
    }
    
    @IBAction func sayfaXButton(_ sender: Any) {
        performSegue(withIdentifier: "sayfaXButton", sender: nil)
    }
    
}

