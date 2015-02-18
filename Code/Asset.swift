//
//  Asset.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import Foundation
import CoreData

class Asset: NSManagedObject, CDAPersistedAsset {

    @NSManaged var height: NSNumber
    @NSManaged var identifier: String
    @NSManaged var internetMediaType: String
    @NSManaged var url: String
    @NSManaged var width: NSNumber

}
