//
//  AddViewController.swift
//  Classmate-fitch
//
//  Created by MATTHEW FITCH on 10/4/24.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var picklesThing: UISegmentedControl!
    @IBOutlet weak var yearTextOutlet: UITextField!
    @IBOutlet weak var nicknameTextOutlet: UITextField!
    @IBOutlet weak var nameTextOutlet: UITextField!
    @IBOutlet weak var butinOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        butinOutlet.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitButtonAction(_ sender: Any) {
        var curStudent = Classmate()
        
        let year = Int(yearTextOutlet.text ?? "")
        if year == nil
        {
            createAlert(alertName: "You FOOL. put in an INTEGER or i will rip off your skin.")
            return
        }
        
        
        curStudent.name = nameTextOutlet.text ?? ""
        curStudent.nickname = nicknameTextOutlet.text ?? ""
        curStudent.pickles = picklesThing.selectedSegmentIndex == 0 ? .Yes : picklesThing.selectedSegmentIndex == 1 ? .No : .ALittleBit
        
        AppData.classmates.append(curStudent)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
