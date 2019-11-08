//
//  Api.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireSwiftyJSON

typealias staffDataSuccessClasure = (_ staffList: [Staff]) -> Void
typealias serviceError = (_ error: Error) -> Void

class Api: NSObject {
    
    private static var _api = Api()
    var sessionManager:SessionManager
    
    // Shared instance
    class var sharedInstance : Api{
        return _api
    }
    
    override init() {
        // Create default headers
        var defaultHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        defaultHeaders[Constants.HeaderKeys.Accept] = Constants.APIKeys.ContentType
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = defaultHeaders
        self.sessionManager = SessionManager(configuration: configuration)
        super.init()
    }
    
    deinit {
        // deinit
    }
    
    
    func fetchStaffData(success: @escaping staffDataSuccessClasure,failed: @escaping serviceError){
        
        self.sessionManager.request(Constants.API_BASE_URL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            
            if response.response == nil {
                failed(Error.init(code: 0, message: "Please check your internet connection"))
            }else if response.error != nil{
                failed(Error.init(code: 0, message: "Server Error"))
            }else{
                
                if response.response?.statusCode == 200 {
                    
                    var staffList:[Staff] = [Staff]()
                    
                    let jsonData:JSON = self.ParseJSON(data: response.data)!
                    for jsonObj in jsonData.array! {
                        let staffObj = Staff.init(fromJson: jsonObj)
                        staffList.append(staffObj)
                    }
                    
                    success(staffList)
                    
                }else{
                    failed(Error.init(code: response.response!.statusCode, message: "Error Occured"))
                }
            }
        }
        
    }
    
    
    func ParseJSON(data : Data?) -> JSON? {
        do{
            let json = try JSON(data: data!)
            return json
        } catch let error as NSError {
            print(error.description)
            return nil
        }
    }
    
    
}
