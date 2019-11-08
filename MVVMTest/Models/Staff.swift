//
//  Staff.swift
//  MVVMTest
//
//  Created by Shashi Nishantha on 11/8/19.
//  Copyright © 2019 Shashi Nishantha. All rights reserved.
//

import Foundation
import SwiftyJSON


class Staff : NSObject, NSCoding{

    var age : Int!
    var avatar : String!
    var hobby : String!
    var id : Int!
    var name : String!
    var title : String!

    /**
     * Instantiate the instance using the passed json values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        age = json["age"].intValue
        avatar = json["avatar"].stringValue
        hobby = json["hobby"].stringValue
        id = json["id"].intValue
        name = json["name"].stringValue
        title = json["title"].stringValue
    }
    
    init(id : Int,name : String!,title : String, age : Int, avatar : String,hobby : String) {
        self.id = id
        self.name = name
        self.title = title
        self.age = age
        self.hobby = hobby
        self.avatar = avatar
    }

    /**
     * Returns all the available property values in the form of [String:Any] object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> [String:Any]
    {
        var dictionary = [String:Any]()
        if age != nil{
            dictionary["age"] = age
        }
        if avatar != nil{
            dictionary["avatar"] = avatar
        }
        if hobby != nil{
            dictionary["hobby"] = hobby
        }
        if id != nil{
            dictionary["id"] = id
        }
        if name != nil{
            dictionary["name"] = name
        }
        if title != nil{
            dictionary["title"] = title
        }
        return dictionary
    }

    /**
    * NSCoding required initializer.
    * Fills the data from the passed decoder
    */
    @objc required init(coder aDecoder: NSCoder)
    {
        age = aDecoder.decodeObject(forKey: "age") as? Int
        avatar = aDecoder.decodeObject(forKey: "avatar") as? String
        hobby = aDecoder.decodeObject(forKey: "hobby") as? String
        id = aDecoder.decodeObject(forKey: "id") as? Int
        name = aDecoder.decodeObject(forKey: "name") as? String
        title = aDecoder.decodeObject(forKey: "title") as? String
    }

    /**
    * NSCoding required method.
    * Encodes mode properties into the decoder
    */
    func encode(with aCoder: NSCoder)
    {
        if age != nil{
            aCoder.encode(age, forKey: "age")
        }
        if avatar != nil{
            aCoder.encode(avatar, forKey: "avatar")
        }
        if hobby != nil{
            aCoder.encode(hobby, forKey: "hobby")
        }
        if id != nil{
            aCoder.encode(id, forKey: "id")
        }
        if name != nil{
            aCoder.encode(name, forKey: "name")
        }
        if title != nil{
            aCoder.encode(title, forKey: "title")
        }

    }

}
