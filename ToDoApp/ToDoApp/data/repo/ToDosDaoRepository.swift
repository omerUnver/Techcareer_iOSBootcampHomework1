//
//  ToDosDaoRepository.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import Foundation
import RxSwift
class ToDosDaoRepository {
    let db : FMDatabase?
    var toDosListesi = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDosApp.db")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func toDosKaydet(toDos_name: String){
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO toDos (toDos_name) VALUES (?)", values: [toDos_name])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    
    func guncelle(toDos_id: Int,toDos_name: String){
        
        db?.open()
        do {
            try db!.executeUpdate("UPDATE toDos SET toDos_name=? WHERE toDos_id=?", values: [toDos_name,toDos_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
    }
    func sil(toDos_id : Int){
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM toDos WHERE toDos_id=?", values: [toDos_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        
        
    }
    func toDosYukle(){
       
        db?.open()
        var toDosListe = [ToDosModel]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
            
            while result.next() {
                let toDos_id  = Int(result.string(forColumn: "toDos_id"))!
                let toDos_name  = result.string(forColumn: "toDos_name")!
                
                let toDos = ToDosModel(toDos_id: toDos_id, toDos_name: toDos_name)
                toDosListe.append(toDos)
            }
            toDosListesi.onNext(toDosListe)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    
    func ara(arama : String){
        db?.open()
        var toDosListe = [ToDosModel]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM toDos WHERE toDos_name like '%\(arama)%'", values: nil)
            
            while result.next() {
                let toDos_id  = Int(result.string(forColumn: "toDos_id"))!
                let toDos_name  = result.string(forColumn: "toDos_name")!
                
                
                let toDos = ToDosModel(toDos_id: toDos_id, toDos_name: toDos_name)
                toDosListe.append(toDos)
            }
            toDosListesi.onNext(toDosListe)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
        
    }
    
    
    func veritabaniKopyala(){
            let bundleYolu = Bundle.main.path(forResource: "toDosApp", ofType: ".db")
            let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
            let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDosApp.db")
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: kopyalanacakYer.path){
                print("Veritabanı zaten var")
            }else{
                do{
                    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
                }catch{}
            }
        }
    
    
    
}
