//
//  AnasayfaViewModel.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import Foundation
import RxSwift
class AnasayfaViewModel {
    var toDosListesi = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    var toDosDaoRepository = ToDosDaoRepository()
    init(){
        toDosDaoRepository.veritabaniKopyala()
        toDosListesi = toDosDaoRepository.toDosListesi
    }
    
    func arama(arananKelime : String){
        toDosDaoRepository.ara(arama: arananKelime)
    
    }
    func sil(toDos_id : Int){
        toDosDaoRepository.sil(toDos_id: toDos_id)
        toDosYukle()
    }
    
    func toDosYukle(){
        toDosDaoRepository.toDosYukle()
    }
    
    
    
    
    
    
}
