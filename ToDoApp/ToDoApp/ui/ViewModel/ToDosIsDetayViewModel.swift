//
//  toDosIsDetayViewModel.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import Foundation
class ToDosIsDetayViewModel {
    
    var toDosDaoRepo = ToDosDaoRepository()
    
    func guncelle(toDos_id : Int, toDos_name : String){
        toDosDaoRepo.guncelle(toDos_id: toDos_id, toDos_name: toDos_name)
    }
    
}
