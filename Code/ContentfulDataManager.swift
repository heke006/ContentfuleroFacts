//
//  ContentfulDataManager.swift
//  Gallery
//
//  Created by Boris Bügling on 04/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import CoreData

class ContentfulDataManager: NSObject {
    class var BeaconContentTypeId: String { return "xAAPGk7V3qy8qyqi6co0i" }
    class var FactContentTypeId: String { return "3Fu5J8b6JOKkgkY2CwIo6E" }

    var client: CDAClient { return manager.client }
    var manager: CoreDataManager

    override init() {
        let configuration = CDAConfiguration.defaultConfiguration()
        configuration.userAgent = "Contentfulero Facts/1.0";

        let keys = ContentfuleroFactsKeys()
        let client = CDAClient(spaceKey: keys.cFactsSpaceKey(), accessToken: keys.cFactsAccessToken(), configuration:configuration)
        manager = CoreDataManager(client: client, dataModelName: "ContentfuleroFacts")

        manager.classForAssets = Asset.self
        manager.classForSpaces = SyncInfo.self

        manager.setClass(Beacon.self, forEntriesOfContentTypeWithIdentifier: ContentfulDataManager.BeaconContentTypeId)
        manager.setClass(Fact.self, forEntriesOfContentTypeWithIdentifier: ContentfulDataManager.FactContentTypeId)

        super.init()
    }

    func performSynchronization(completion: (NSError!) -> Void) {
        manager.performSynchronizationWithSuccess({ () -> Void in
            completion(nil)
            }, failure: { (response, error) -> Void in
                completion(error)
        })
    }
}
