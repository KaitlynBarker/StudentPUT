//
//  StudentsTableViewController.swift
//  StudentPut_iOS14
//
//  Created by Kaitlyn Barker on 8/2/17.
//  Copyright © 2017 Kaitlyn Barker. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        StudentController.fetchStudents {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    //MARK: - Actions
    
    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        guard let name = nameTextField.text, name != "" else { return }
        
        StudentController.putStudentWith(name: name) { (success) in
            guard success else { return } // checking to see that success is true
            
            DispatchQueue.main.async {
                self.nameTextField.text = ""
                self.nameTextField.resignFirstResponder() // tells the keyboard to GTFO
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentController.students.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        let student = StudentController.students[indexPath.row]
        
        cell.textLabel?.text = student.name

        return cell
    }
}
