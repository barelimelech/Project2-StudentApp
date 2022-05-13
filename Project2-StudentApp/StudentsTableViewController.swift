//
//  StudentsTableViewController.swift
//  Project2-StudentApp
//
//  Created by Kely Sotsky on 07/05/2022.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Model.instance.addStudent(student: Student(name: "Bar", id: "123456", avatarUrl: "", phone: "0525556677", address: "Rishon LeZion"))
        Model.instance.addStudent(student: Student(name: "Kely", id: "234344", avatarUrl: "", phone: "0538334544", address: "Tel Aviv"))
        Model.instance.addStudent(student: Student(name: "Gal", id: "345434", avatarUrl: "", phone: "0508346344", address: "Bat Yam"))
        Model.instance.addStudent(student: Student(name: "Amit", id: "4434356", avatarUrl: "", phone: "0528395644", address: "Rehovot"))
        Model.instance.addStudent(student: Student(name: "Adam", id: "565457", avatarUrl: "", phone: "0508396374", address: "Ashdod"))
        Model.instance.addStudent(student: Student(name: "Oshrat", id: "783339", avatarUrl: "", phone: "0508392334", address: "Eilat"))
        Model.instance.addStudent(student: Student(name: "Talya", id: "895540", avatarUrl: "", phone: "0548392354", address: "Ashkelon"))
        Model.instance.addStudent(student: Student(name: "Avia", id: "90661", avatarUrl: "", phone: "0528392454", address: "Rishon LeZion"))
        Model.instance.addStudent(student: Student(name: "Shalom", id: "90881", avatarUrl: "", phone: "0528392454", address: "Rishon LeZion"))
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myTableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.instance.getAllStudents()!.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! StudentTableViewCell
        
        let st = Model.instance.getStudent(index: indexPath.row)
        cell.nameLabel.text = st.name
        cell.id = st.id

        return cell
    }
    
    var selectedRow = 0
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        NSLog("Selcted row at \(indexPath.row)")
        selectedRow = indexPath.row
        performSegue(withIdentifier: "openStudentDetails", sender: self)
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "openStudentDetails"){
            let dvc = segue.destination as! StudentDetailsViewController
            let st = Model.instance.getStudent(index: selectedRow)
            dvc.student = st
        }
    }
    
    @objc func loadList(notification: NSNotification){
        //load data here after add student.
        self.tableView.reloadData()
    }
}
