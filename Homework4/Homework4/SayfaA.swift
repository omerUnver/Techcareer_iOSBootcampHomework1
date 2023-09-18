//
//  SayfaA.swift
//  Homework4
//
//  Created by M.Ömer Ünver on 17.09.2023.
//

import UIKit

class SayfaA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sayfaBButton(_ sender: Any) {
        performSegue(withIdentifier: "sayfaBSegue", sender: nil)
    }
    
    

}
