//
//  EditViewController.swift
//  Classmate-fitch
//
//  Created by MATTHEW FITCH on 10/3/24.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var nameTextOutlet: UITextField!
    @IBOutlet weak var yearTextOutlet: UITextField!
    @IBOutlet weak var nicknameTextOutlet: UITextField!
    
    @IBOutlet weak var picklesThing: UISegmentedControl!
    
    @IBOutlet weak var butinOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var curStudent = AppData.classmates[AppData.curIndex]
        
        butinOutlet.layer.cornerRadius = 10
        nameTextOutlet.text = "\(curStudent.name)"
        
        yearTextOutlet.text = "\(curStudent.year)"
        
        picklesThing.selectedSegmentIndex = curStudent.pickles == .Yes ? 0 : curStudent.pickles == .No ? 1 : 2
        
        nicknameTextOutlet.text = "\(curStudent.nickname)"
    }

    @IBAction func submitButtonAction(_ sender: Any) {
        var curStudent = AppData.classmates[AppData.curIndex]
        
        let year = Int(yearTextOutlet.text ?? "")
        if year == nil
        {
            createAlert(alertName: "You FOOL. put in an INTEGER or i will rip off your skin.")
            return
        }
        
        
        curStudent.name = nameTextOutlet.text ?? ""
        curStudent.nickname = nicknameTextOutlet.text ?? ""
        curStudent.pickles = picklesThing.selectedSegmentIndex == 0 ? .Yes : picklesThing.selectedSegmentIndex == 1 ? .No : .ALittleBit
        AppData.classmates = AppData.classmates.sorted(by: AppData.sortByName)
        if let bob = self.navigationController {
            bob.popViewController(animated: true)
        }
    }
    
    func createAlert(alertName: String)
    {
        let alert = UIAlertController(title: "Error", message: alertName, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true)
        
    }
}
