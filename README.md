# ContentfuleroFacts

This is an iOS application example which shows different facts from a [Contentful][1] space based on iBeacon proximity.

[Contentful][1] is a content management platform for web applications, mobile apps and connected devices. It allows you to create, edit & manage content in the cloud and publish it anywhere via powerful API. Contentful offers tools for managing editorial teams and enabling cooperation between organizations.

## Usage

- Create a space with two content types, "Fact" which provides some textual content and "Beacon" with UUID, major and minor number. A Fact should be linked to a specific Beacon. You will need to put their IDs into the
`ContentfulDataManager`.
- Clone this repo and setup [CocoaPods][2] for it:

```
$ make setup
```

You will be asked to provide a space key and access token for accessing your data.

## License

Copyright (c) 2015 Contentful GmbH. See LICENSE for further details.


[1]: https://www.contentful.com
[2]: http://cocoapods.org
