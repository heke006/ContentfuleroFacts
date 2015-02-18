//
//  ViewController.swift
//  ContentfuleroFacts
//
//  Created by Boris Bügling on 18/02/15.
//  Copyright (c) 2015 Contentful GmbH. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    lazy var dataManager = ContentfulDataManager()
    lazy var locationManager = CLLocationManager()

    var beacons = [Beacon]()
    var regions: [CLBeaconRegion] = [CLBeaconRegion]() {
        didSet {
            self.locationManager.delegate = self
            self.locationManager.requestAlwaysAuthorization()
            
            self.regions.map({ (region) -> Void in self.locationManager.startRangingBeaconsInRegion(region) })
        }
    }

    func refresh() {
        dataManager.performSynchronization({ (error) -> Void in
            if error != nil && error.code != NSURLErrorNotConnectedToInternet {
                let alert = UIAlertView(title: NSLocalizedString("Error", comment: ""), message: error.localizedDescription, delegate: nil, cancelButtonTitle: NSLocalizedString("OK", comment: ""))
                alert.show()
            }

            let asset = self.dataManager.manager.fetchAssetsFromDataStore().first as Asset
            let scale = UIScreen.mainScreen().nativeScale
            let size = CGSize(width: self.imageView.frame.size.width * scale, height: self.imageView.frame.size.height * scale)

            self.imageView.offlineCaching_cda = true
            self.imageView.cda_setImageWithPersistedAsset(asset, client: self.dataManager.client, size: size, placeholderImage: nil)

            self.beacons = (self.dataManager.manager.fetchEntriesOfContentTypeWithIdentifier(ContentfulDataManager.BeaconContentTypeId, matchingPredicate: nil) as [Beacon])
            self.regions = self.beacons.map({ (beacon) -> CLBeaconRegion in
                    //NSLog("Will range beacon %@ with major %@, minor %@", beacon.name, beacon.major, beacon.minor)
                    return CLBeaconRegion(proximityUUID: NSUUID(UUIDString: beacon.uuid), major: CLBeaconMajorValue(beacon.major.integerValue), minor: CLBeaconMinorValue(beacon.minor.integerValue), identifier: beacon.identifier)
                })
        })
    }

    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)

        regions.map({ (region) -> Void in self.locationManager.stopRangingBeaconsInRegion(region) })
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        refresh()
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(manager: CLLocationManager!, didRangeBeacons beacons: [AnyObject]!,
        inRegion region: CLBeaconRegion!) {
            let beacon = self.beacons[find(regions, region)!]
            let content = self.dataManager.manager.fetchEntriesOfContentTypeWithIdentifier(ContentfulDataManager.FactContentTypeId, matchingPredicate: String(format: "beacon.identifier == '%@'", beacon.identifier)) as [Fact]

            let filteredBeacons = (beacons as [CLBeacon]).filter({ (beacon) -> Bool in return beacon.proximity == .Immediate })

            //NSLog("Ranged beacon %@ as Immediate, %d fact(s) available", beacon.name, content.count)

            if (filteredBeacons.count > 0 && content.count > 0) {
                let randomIndex = Int(arc4random_uniform(UInt32(content.count)))
                factLabel.text = content[randomIndex].fact
            }
    }
}
