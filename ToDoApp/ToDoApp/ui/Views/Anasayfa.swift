//
//  ViewController.swift
//  ToDoApp
//
//  Created by M.Ömer Ünver on 28.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    var toDosModel = [ToDosModel]()
    var anasayfaViewModel = AnasayfaViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
        
        _ = anasayfaViewModel.toDosListesi.subscribe(onNext: { toDosListe in
            self.toDosModel = toDosListe
            self.tableView.reloadData()
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaViewModel.toDosYukle()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsSegue" {
            if let toDos = sender as? ToDosModel {
                let gidilecekVC = segue.destination as! YapilacakIsDetay
                gidilecekVC.toDos = toDos
            }
        }
    }


}

extension Anasayfa : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
        let toDosListe = toDosModel[indexPath.row]
        cell.toDoLabel.text = toDosListe.toDos_name
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosModel.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDosListe = toDosModel[indexPath.row]
        performSegue(withIdentifier: "detailsSegue", sender: toDosListe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { contextualAction, view, bool in
            let toDosListe = self.toDosModel[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(toDosListe.toDos_name!) Silmeyi Onaylıyormusunuz ?", preferredStyle: .alert)
            let iptal = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptal)
            let silButton = UIAlertAction(title: "Sil", style: .destructive) { sil in
                self.anasayfaViewModel.sil(toDos_id: toDosListe.toDos_id!)
                
            }
            alert.addAction(silButton)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaViewModel.arama(arananKelime: searchText)
    }
}
