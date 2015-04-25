//
//  main.swift
//  ss
//
//  Created by tutujiaw on 15/4/20.
//  Copyright (c) 2015年 tutujiaw. All rights reserved.
//

import Foundation

class Widget {
    func say() {
        println("this is widget")
    }
}

class Button : Widget {
    override func say() {
        println("this is button")
    }
}

var b = Button()
var w = Widget()
w = b
w.say()