//
//  ViewController.swift
//  Classmate-fitch
//
//  Created by MATTHEW FITCH on 10/1/24.
//

import UIKit

class AppData {
    static var curIndex = 0
    static var classmates = [Classmate]()
    static func sortByName(p1: Classmate, p2: Classmate) -> Bool
    {
        return p1.name < p2.name
    }
    
    static func sortByYear(p1: Classmate, p2: Classmate) -> Bool
    {
        return p1.year > p2.year
    }
    
    static func sortByPickles(p1: Classmate, p2: Classmate) -> Bool
    {
        return p1.pickles.rawValue > p2.pickles.rawValue
    }
}

class ViewController: UIViewController {
    let sortTypes = ["name", "year", "pickles"]

    @IBOutlet weak var newButtonOutlet: UIButton!
    
    @IBOutlet weak var editButtonOutlet: UIButton!
    
    @IBOutlet weak var nicknameLabelOutlet: UILabel!
    @IBOutlet weak var nameLabelOutlet: UILabel!
    @IBOutlet weak var yearLabelOutlet: UILabel!
    @IBOutlet weak var picklesLabelOutlet: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hi")
        
//        newButtonOutlet.layer.cornerRadius = 10
        editButtonOutlet.layer.cornerRadius = 10
        
        var peter = Classmate(name: "Peter", nickname: "Peter kickle", year: 3, pickles: .ALittleBit)
        
        var ryan = Classmate(name: "Ryan", nickname: "Rat Ryan", year: 3, pickles: .No)
        
        var cameron = Classmate(name: "Cameron", nickname: "Chef Cam", year: 4, pickles: .ALittleBit)
        
        var evan = Classmate(name: "Evan", nickname: "Flute-in' Evan", year: 3, pickles: .No)
        
        var matthew = Classmate(name: "Matthew", nickname: "Glitch Fitch", year: 3, pickles: .No)
        
        var daniel = Classmate(name: "Daniel", nickname: "Bananiel", year: 3, pickles: .Yes)
        
        var justin = Classmate(name: "Justin", nickname: "Wicked Weber", year: 4, pickles: .Yes)
        
        var ava = Classmate(name: "Ava", nickname: "ABBA Ava", year: 4, pickles: .ALittleBit)
        
        var eva = Classmate(name: "Eva", nickname: "No pickles Noftz", year: 4, pickles: .No)
        
        var brennan = Classmate(name: "Brennan", nickname: "Breaking Brennan", year: 2, pickles: .Yes)
        
        var jayden = Classmate(name: "Jayden", nickname: "Sleepy Sawyer", year: 4, pickles: .ALittleBit)
        
        var john = Classmate(name: "John", nickname: "Jimmy John", year: 4, pickles: .Yes)
        
        var shaun = Classmate(name: "Shaun", nickname: "Boat gone Shaun", year: 3, pickles: .No)
        
        var ryan2 = Classmate(name: "Ryan", nickname: "Rainbow Ryan", year: 3, pickles: .ALittleBit)
        
        var googan = Classmate(name: "Googan", nickname: "Googball googan", year: 4, pickles: .Yes)
        
        var micheal = Classmate(name: "Micheal", nickname: "Micheal Micheal Motorcycle", year: 3, pickles: .No)
        
        AppData.classmates.append(peter)
        AppData.classmates.append(ryan)
        AppData.classmates.append(cameron)
        AppData.classmates.append(evan)
        AppData.classmates.append(matthew)
        AppData.classmates.append(daniel)
        
        let classmates = [
            peter,
            ryan,
            cameron,
            evan,
            matthew,
            daniel,
            justin,
            ava,
            eva,
            brennan,
            jayden,
            john,
            shaun,
            ryan2,
            googan,
            micheal
        ]

        AppData.classmates.append(contentsOf: classmates)
        updateInformation(incStudent: 0)
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    func updateInformation(incStudent: Int)
    {
        AppData.curIndex = (AppData.curIndex + incStudent) % AppData.classmates.count;

        if (AppData.curIndex < 0)
        {
            AppData.curIndex += AppData.classmates.count;
        }
        
//        print(AppData.curIndex)
        
        let curStudent = AppData.classmates[AppData.curIndex]
        
        nameLabelOutlet.text = "Name: \(curStudent.name)"
        nicknameLabelOutlet.text = "Nickname: \(curStudent.nickname)"
        yearLabelOutlet.text = "Year: \(curStudent.year)"
        picklesLabelOutlet.text = "Likes pickles: \(curStudent.pickles == .Yes ? "Yes" : curStudent.pickles == .No ? "No" : "A Little Bit")"
        
    }
    
    @IBAction func nextButtonAction(_ sender: Any) {
        updateInformation(incStudent: 1)
    }
    
    @IBAction func prevButtonAction(_ sender: Any) {
        updateInformation(incStudent: -1)
    }
    @IBAction func sortAction(_ sender: UISegmentedControl) {
        let sortType = sortTypes[sender.selectedSegmentIndex]
        
        switch sortType {
        case "name":
            AppData.classmates = AppData.classmates.sorted(by: AppData.sortByName)
        case "year":
            AppData.classmates = AppData.classmates.sorted(by: AppData.sortByYear)
        case "pickles":
            AppData.classmates = AppData.classmates.sorted(by: AppData.sortByPickles)
        default:
            break
        }
        updateInformation(incStudent: 0)
    }
    
    
    @IBAction func refreshAction(_ sender: Any) {
        updateInformation(incStudent: 0)
    }
    
    

}

