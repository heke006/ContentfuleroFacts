//
//  Beacon.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import Foundation
import CoreData

class Beacon: NSManagedObject, CDAPersistedEntry {

    @NSManaged var identifier: String
    @NSManaged var major: NSNumber
    @NSManaged var minor: NSNumber
    @NSManaged var name: String
    @NSManaged var uuid: String
    @NSManaged var beaconInverse: NSSet

}
