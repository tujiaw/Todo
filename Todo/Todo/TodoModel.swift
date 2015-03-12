//
//  TodoModel.swift
//  Todo
//
//  Created by tutujiaw on 15/3/9.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import UIKit

class TodoModel : NSObject {
    var id: String
    var imageName: String
    var title: String!
    var date: NSDate
    
    init(id: String, imageName: String, title: String, date: NSDate) {
        self.id = id
        self.imageName = imageName
        self.title = title
        self.date = date
    }
}
