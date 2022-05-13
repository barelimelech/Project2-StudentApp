//
//  AddStudentViewController.swift
//  Project2-StudentApp
//
//  Created by Kely Sotsky on 07/05/2022.
//

import UIKit

class AddStudentViewController: UIViewController {

    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var idText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
        
    @IBAction func saveBtn(_ sender: Any) {
        let student = Student()
        student.name = nameText.text!
        student.id = idText.text!
        student.phone = phoneText.text!
        student.address = addressText.text!
        Model.instance.addStudent(student: student)
        
        //Notify that there is one more student.
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        removeSubview()
    }
  
    @IBAction func cancelBtn(_ sender: Any) {
        removeSubview()
    }
    
    func removeSubview(){
        nameText.text = ""
        idText.text = ""
        phoneText.text = ""
        addressText.text = ""
        if let viewWithTag = self.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }else{
            print("No!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
