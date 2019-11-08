//
//  Error.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import Foundation

class Error: NSObject {
    
    // Attributes
    var errorCode:Int?
    var errorMessage:String?
    
    // Constructor
    init(code : Int,message : String) {
        self.errorCode = code
        self.errorMessage = message
    }
}
