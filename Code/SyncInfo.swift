//
//  SyncInfo.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import Foundation
import CoreData

class SyncInfo: NSManagedObject, CDAPersistedSpace {

    @NSManaged var lastSyncTimestamp: NSDate
    @NSManaged var syncToken: String

}
