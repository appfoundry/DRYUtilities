# DRYUtilities

[![CI Status](http://img.shields.io/travis/Michael Seghers/DRYUtilities.svg?style=flat)](https://travis-ci.org/Michael Seghers/DRYUtilities)
[![Version](https://img.shields.io/cocoapods/v/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)
[![License](https://img.shields.io/cocoapods/l/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)
[![Platform](https://img.shields.io/cocoapods/p/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.
This project contains example usages for all the utilities provided in DRUUtilities.

Once you've started the app, you'll see a table containing a row for each example.
Click on it to see the example in action.

### Configuration utilities
#### DRYResourceReader 
**Example usage:** `ExampleDRYResourceReaderV`iewController.m

A `DRYResourceReader` exposes an operation to read a property from a resource based on a specified key.
First of all you need to create a `DRYResourceReader`.
DRYUtilities contains a `DRYPlistResourceReader` which can read .plist files. It also offers the ability to supply a fallback resource. 
This fallback resource will be used if the property can't be resolved using the original resource file.

```objective-c
//without using fallback
id <DRYResourceReader> reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"Configuration"];

//using fallback
id <DRYResourceReader> reader = [[DRYPlistResourceReader alloc] initWithPlistNamed:@"Configuration" andFallbackPlistNamed:@"DefaultConfiguration"];
```

#### DRYBaseDynamicPropertyProvider 
Using the `DRYBaseDynamicPropertyProvider` you can create dynamic properties to retrieve the values from your resource files.
Extend the `DRYBaseDynamicPropertyProvider` with properties matching the keys used in the resource file:

```objective-c
@interface ExampleDynamicPropertyProvider : DRYBaseDynamicPropertyProvider

@property (nonatomic, readonly) NSString *firstProperty;

@end

@implementation ExampleDynamicPropertyProvider 
@dynamic firstProperty;
@end
```

From now on you can target the properties from your resource file:
```objective-c
id<DRYResourceReader> reader = ...;
ExampleDynamicPropertyProvider *propertyProvider = [[ExampleDynamicPropertyProvider alloc] initWithResourceReader:reader];
NSLog(@"Property value: %@", propertyProvider.firstProperty);
```

## Requirements

## Installation

DRYUtilities is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "DRYUtilities"

## Author

Mike Seghers, mike@appfoundry.be

## License

DRYUtilities is available under the MIT license. See the LICENSE file for more info.

