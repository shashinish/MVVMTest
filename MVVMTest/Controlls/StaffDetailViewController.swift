//
//  StaffDetailViewController.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import UIKit
import SDWebImage

class StaffDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var hobbyLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    
    
    var staffViewModal: StaffViewModal!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = self.staffViewModal?.name
        self.imageView.sd_setImage(with: URL.init(string: self.staffViewModal.picture!))
        self.ageLabel.text = "\(self.staffViewModal.age!) Years"
        self.hobbyLabel.text = self.staffViewModal.hobby
        self.rankLabel.text = self.staffViewModal.rank
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
