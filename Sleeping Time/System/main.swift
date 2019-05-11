//
//  main.swift
//  Sleeping Time
//
//  Created by Raphael Henrique on 11/05/19.
//  Copyright © 2019 TBD-patrichel. All rights reserved.
//

import Foundation

import UIKit

UIApplicationMain(
    CommandLine.argc,
    UnsafeMutableRawPointer(CommandLine.unsafeArgv)
        .bindMemory(
            to: UnsafeMutablePointer<Int8>.self,
            capacity: Int(CommandLine.argc)),
    NSStringFromClass(TimerControlApplication.self),
    NSStringFromClass(AppDelegate.self)
)
