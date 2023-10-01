//
//  ToDosModel.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import Foundation

class ToDosModel {
    var toDos_id : Int?
    var toDos_name : String?
    
    init(toDos_id: Int, toDos_name: String) {
        self.toDos_id = toDos_id
        self.toDos_name = toDos_name
    }
}
