//
//  StudentsTableViewController.swift
//  StudentPut_iOS14
//
//  Created by Kaitlyn Barker on 8/2/17.
//  Copyright © 2017 Kaitlyn Barker. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudentCell", for: indexPath)

        

        return cell
    }
}
