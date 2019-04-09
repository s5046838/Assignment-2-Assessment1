//
//  DetailViewController.swift
//  GUIApp
//
//  Created by Kayn Critchley on 4/3/19.
//  Copyright © 2019 Kayn Critchley. All rights reserved.
//

import UIKit

protocol DetailViewControllerDelegate: class {
    func okayPressed()
    func cancelPressed()
    
}

class DetailViewController: UIViewController {
    var copyOfOriginalExpense: Location?
    var location: Location?
    weak var delegate: DetailViewControllerDelegate?
    

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveInModel()
        delegate?.okayPressed()
    }
    
    func configureView(){
        //guard let variable = variable else {return} is a method of dealing with this error --- Value of optional type 'String?' must be unwrapped to a value of type 'String'
        guard let location = location else { return }
        nameField?.text = location.name
        weightField?.text = "\(location.address)"
        latitudeField?.text = "\(location.latitude)"
        longitudeField?.text = "\(location.longitude)"
        guard copyOfOriginalExpense == nil else { return }
        copyOfOriginalExpense = Location(name: location.name, address: location.address, latitude: location.latitude, longitude: location.longitude)
    }
    
 
    func saveInModel(){
        // this is another way of dealing with the error above. delete the ?? "" to see error
        location?.name = nameField.text ?? ""
        location?.address = weightField.text ?? ""
        
        guard let latitudeText = latitudeField.text,
        let latitude = Double(latitudeText) else { return }
        location?.latitude = latitude
        
        guard let longitudeText = longitudeField.text,
            let longitude = Double(longitudeText) else { return }
        location?.longitude = longitude
        
        
        // how to deal with a data type is too ambigious
    }
    
    @IBAction func okayPressed(_ sender: Any) {
        if let d = delegate{
            d.okayPressed()
        }
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        guard let copy = copyOfOriginalExpense else { return }
        location?.name = copy.name
        location?.address = copy.address
        location?.latitude = copy.latitude
        location?.longitude = copy.longitude

        configureView()
        guard let d = delegate else { return }
        d.cancelPressed()
    }
    

}

