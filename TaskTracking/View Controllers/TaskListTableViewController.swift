//
//  TaskListTableViewController.swift
//  TaskTracking
//
//  Created by Drew Seeholzer on 6/19/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit
import CoreData


class TaskListTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return TaskController.sharedInstance.tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ButtonTableViewCell! = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath) as? ButtonTableViewCell
        if cell == nil {cell = ButtonTableViewCell() }
        let task = TaskController.sharedInstance.tasks[indexPath.row]
        
        //cell.textLabel?.text = task.name
        cell.update(withTask: task)
        // Configure the cell...

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let task = TaskController.sharedInstance.tasks[indexPath.row] //else { return }
            
            TaskController.sharedInstance.delete(task: task)
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailListView" {
            
            guard let index = tableView.indexPathForSelectedRow,
                let destinationVC = segue.destination as? TaskDetailTableViewController else { return }
            
            let task = TaskController.sharedInstance.tasks[index.row]
            
            let dueDateValue = TaskController.sharedInstance.tasks[index.row].due
            
            destinationVC.task = task
            destinationVC.dueDateValue = dueDateValue
        }
        
    }

}

extension TaskListTableViewController: NSFetchedResultsControllerDelegate {
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
            
        case .delete:
            guard let indexPath = indexPath else {return}
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        case .insert:
            guard let newIndexPath = newIndexPath else {return}
            tableView.insertRows(at: [newIndexPath], with: .automatic)
            
        case .move:
            guard let oldIndexPath = indexPath, let newIndexPath = newIndexPath else {return}
            tableView.moveRow(at: oldIndexPath, to: newIndexPath)
            
        case .update:
            guard let indexPath = indexPath else {return}
            tableView.reloadRows(at: [indexPath], with: .automatic)
        @unknown default:
            fatalError()
        }
    }
}
