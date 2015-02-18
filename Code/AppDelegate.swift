//
//  AppDelegate.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        application.keyWindow?.rootViewController?.view.backgroundColor = UIColor.whiteColor()
        return true
    }
}
