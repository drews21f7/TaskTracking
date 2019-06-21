//
//  ButtonTableViewCell.swift
//  TaskTracking
//
//  Created by Drew Seeholzer on 6/20/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    
    func updateButton(_ isComplete: Bool) {
        if isComplete == true {
            completeButton.setImage(UIImage(contentsOfFile: "complete"), for: .normal)
        } else {
            completeButton.setImage(UIImage(contentsOfFile: "incomplete"), for: .normal)
        }
    }
    

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var completeButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func buttonTapped(_ sender: Any) {
        //I don't get this
        delegate?.buttonCellButtonTapped(self)
    }
    
    //I don't get this
    var delegate: ButtonTableViewCellDelegate?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension ButtonTableViewCell {
    func update(withTask task: Task) {
        primaryLabel.text = task.name
        updateButton(task.isComplete)
    }
}

protocol ButtonTableViewCellDelegate {
    func buttonCellButtonTapped(_ sender: ButtonTableViewCell)
    var delegate: ButtonTableViewCellDelegate? {get set}
}
