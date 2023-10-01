//
//  toDosKayitViewModel.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 29.09.2023.
//

import Foundation

class ToDosKayitViewModel {
    var toDosDaoRepository = ToDosDaoRepository()
    
    func toDosKaydet(toDos_name: String) {
        toDosDaoRepository.toDosKaydet(toDos_name: toDos_name)
    }
     
}
