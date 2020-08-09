//
//  ResponseStatusCode.swift
//  Jet2TT-Demo
//
//  Created by Tejas on 09/08/20.
//  Copyright © 2020 Tejas Patelia. All rights reserved.
//

import Foundation


public enum ResponseStatusCode : Int{
    case success = 200
    case internalServerError = 500
    case badRequest = 400
    case unauthorized = 401
}
