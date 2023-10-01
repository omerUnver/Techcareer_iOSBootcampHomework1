//
//  YapilacakIsDetay.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import UIKit

class YapilacakIsDetay: UIViewController {

    @IBOutlet weak var yapilacakIsDetayLabel: UITextField!
    var toDos : ToDosModel?
    var detailsViewModel = ToDosIsDetayViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDos = toDos {
            yapilacakIsDetayLabel.text = toDos.toDos_name
            
        }
       
    }
    
    @IBAction func guncelleButton(_ sender: Any) {
        if let yapilacakIs = yapilacakIsDetayLabel.text, let toDos = toDos {
            detailsViewModel.guncelle(toDos_id: toDos.toDos_id!, toDos_name: yapilacakIs)
        }
    }
    
}
