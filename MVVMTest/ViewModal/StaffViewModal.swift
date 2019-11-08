//
//  StaffViewModal.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import Foundation

struct StaffViewModal{
    
    var name: String?
    var hobby: String?
    var age: Int?
    var picture: String?
    var rank: String?
    
    // Dependancy Injection (DI)
    init(staff: Staff) {
        self.name = staff.name
        self.hobby = staff.hobby
        self.age = staff.age
        self.picture = staff.avatar
        
        if staff.title == "Senior Associate" {
            self.rank = "Slave"
        }else if staff.title == "AVP" || staff.title == "VP"{
            self.rank = "Boss"
        }else{
            self.rank = "N/A"
        }
    }
}
