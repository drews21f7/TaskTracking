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
    var dueDateValue: Date?
    
    @IBOutlet var dueDatePicker: UIDatePicker!
    
    @IBOutlet weak var nameTextField: UITextField!

    @IBOutlet weak var dateDueField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateDueField.inputView = dueDatePicker
        updateViews()

    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        self.dateDueField.text = sender.date.stringValue()
        //I don't get this v
        self.dueDateValue = sender.date
    }
    
    @IBAction func userTappedView(_ sender: Any) {
        self.nameTextField.resignFirstResponder()
        self.dateDueField.resignFirstResponder()
        self.notesTextView.resignFirstResponder()
    }
    
    func updateViews() {
        
        guard let task = task else { return }
        nameTextField.text = task.name
        dateDueField.text = task.due?.stringValue()
        notesTextView.text = task.notes
    }
    
    //I don't get this
    
}
