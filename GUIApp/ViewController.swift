//
//  ViewController.swift
//  GUIApp
//
//  Created by Kayn Critchley on 4/3/19.
//  Copyright © 2019 Kayn Critchley. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITextFieldDelegate, DetailViewControllerDelegate {
    
    var objects = [Location]()
    var newLocation = false
    override func viewDidLoad() {
        navigationItem.leftBarButtonItem = editButtonItem
        super.viewDidLoad()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        guard let vc = segue.destination as?
            DetailViewController else { return }
        vc.delegate = self
        let indexPath: IndexPath
        if let i = sender as? IndexPath{
            indexPath = i
            let location = objects[indexPath.row]
            vc.location = location
        } else if let cell = sender as? UITableViewCell,
            let i = tableView.indexPath(for: cell) {
            indexPath = i
        } else { return }
        let location = objects[indexPath.row]
        vc.location = location
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    
    func okayPressed(){
        //print("okay")
        tableView.reloadData()
        newLocation = false
    }
    
    func cancelPressed(){
        if newLocation {
            objects.removeLast()
        }
        newLocation = false
        navigationController?.popViewController(animated: true)
        tableView.reloadData()
    }
    
    
    @IBAction func addObject(_ sender: Any) {
        let n = objects.count
        let location = Location(name: "", address: "", latitude: 0, longitude: 0)
        objects.append(location)
        //tableView.reloadData() refreshes the table screen
        let indexPath = IndexPath(row: n, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        performSegue(withIdentifier: "showDetail", sender: indexPath)
        newLocation = true
    }
    
    
    // MARK: Table View Data Source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath)
        let i = indexPath.row
        cell.textLabel?.text = "Name: \(objects[i].name)"
        cell.detailTextLabel?.text = "Address: :\(objects[i].address)"
        print(objects[i].name, objects[i].address, objects[i].latitude, objects[i].longitude)
        
        return cell
        
    }
    //deletes rows
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert { addObject(self) ; return }
        guard editingStyle == .delete else { return }
        objects.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    //Moves rows
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let object = objects.remove(at: sourceIndexPath.row)
        objects.insert(object, at: destinationIndexPath.row)
    }
}
