//
//  StoryboardManger.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//


import Foundation
import UIKit

class StoryboardManger: NSObject {

    struct Storyboards {
        static let MAIN : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    }
    struct StoryboardIdentifier {
        static let ViewController:String = "ViewController"
    }
}
