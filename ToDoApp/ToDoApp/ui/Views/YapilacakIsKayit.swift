//
//  YapilacakIsKayit.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import UIKit

class YapilacakIsKayit: UIViewController {

    @IBOutlet weak var yapilacakIsKayit: UITextField!
    var toDosKayitViewModel = ToDosKayitViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func kaydetButton(_ sender: Any) {
        if let toDosKayit = yapilacakIsKayit.text {
            toDosKayitViewModel.toDosKaydet(toDos_name: toDosKayit)
        }
        
    }
    
}
