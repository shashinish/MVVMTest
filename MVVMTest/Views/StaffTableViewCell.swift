//
//  StaffTableViewCell.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import UIKit

class StaffTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    
    var staffViewModal:StaffViewModal! {
        didSet{
            self.nameLabel.text = staffViewModal.name
            self.hobbyLabel.text = staffViewModal.hobby
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
