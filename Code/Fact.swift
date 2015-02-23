//
//  Fact.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import Foundation
import CoreData

class Fact: NSManagedObject, CDAPersistedEntry {

    @NSManaged var fact: String
    @NSManaged var identifier: String
    @NSManaged var title: String
    @NSManaged var beacon: Beacon
    @NSManaged var backgroundImage: Asset

}
