//
//  TaskDetailTableViewController.swift
//  TaskTracking
//
//  Created by Drew Seeholzer on 6/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class TaskDetailTableViewController: UITableViewController {
    
    var task: Task?{
        didSet{
            loadViewIfNeeded()
            self.updateViews()
        }
    }
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var dateDueField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()

    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    func updateViews() {
        
        guard let task = task else { return }
        nameTextField.text = task.name
        dateDueField.text = task.due
        notesTextView.text = task.notes
    }
}
