# DRYUtilities

[![CI Status](http://img.shields.io/travis/Michael Seghers/DRYUtilities.svg?style=flat)](https://travis-ci.org/Michael Seghers/DRYUtilities)
[![Version](https://img.shields.io/cocoapods/v/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)
[![License](https://img.shields.io/cocoapods/l/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)
[![Platform](https://img.shields.io/cocoapods/p/DRYUtilities.svg?style=flat)](http://cocoadocs.org/docsets/DRYUtilities)

DRYUtilies is designed to offer some common functionality used in iOS development.
It allows you to quickly get up and running without needing to write the same functionality over and over again on different projects.
Using DRYUtilities will make your code even more DRY than it already is.

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.
This project contains example usages for all the utilities provided in DRYUtilities.

Once you've started the app, you'll see a table containing a row for each example.
Click on it to see the example in action and read about it below.

### Configuration utilities
These utilities provide the functionality to easily gain access to properties read from different types of resource files.

**Example usage:** `ExampleConfigurationViewController.m`

#### DRYResourceReader 
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

### Foundation utilities
Foundation utilities provides utility methods on different Foundation classes.

#### NSString DRYHex
`dryStringFromHexWithData:` will return a hexadecimal string representing a NSData object.

```objective-c
char bytes[3] = {0, 1, 2};
NSData *data = [NSData dataWithBytes:bytes length:3];
NSString *hexString = [NSString dryStringWithHexFromData:data];

NSLog(@"Hex string: %@", hexString); //Hex string: 000102
```

#### NSString DRYTemplateReplacement
`dryStringByReplacingTemplatesWithValuesFromDictionary:` can be used to replace placeholders in a string. It will return a new string containing the result after replacing the placeholders.

```objective-c
NSString *text = @"Hello {name}, you live in {country}";
NSDictionary *values = @{@"name" : @"Jos", @"country": @"Belgium"};
NSString *resolvedText = [text dryStringByReplacingTemplatesWithValuesFromDictionary:values];

   NSLog(@"Resolved text: %@", resolvedText); //Resolved text: Hello Jos, you live in Belgium
```

In order to use a different template notation you can use the following:
```objective-c
NSString *text = @"Hello __name%, you live in __country%";
NSDictionary *values = @{@"name" : @"Jos", @"country": @"Belgium"};
NSString *resolvedText = [text dryStringByReplacingTemplatesWithValuesFromDictionary:values withTemplatePrefix:@"__" templateSuffix:@"%"];

NSLog(@"Resolved text: %@", resolvedText); //Resolved text: Hello Jos, you live in Belgium
```

#### NSString DRYUtil
`dryIsNotBlank` does what you think. It will return `YES` if the string isn't blank, it will return `NO` if the string is blank.

```objective-c
NSLog(@"Is not blank: %d", [@"test" dryIsNotBlank]); //Is not blank: 1 
NSLog(@"Is not blank: %d", [@"" dryIsNotBlank]); //Is not blank: 0 
NSLog(@"Is not blank: %d", [@" " dryIsNotBlank]); //Is not blank: 0
NSLog(@"Is not blank: %d", [nil dryIsNotBlank]); //Is not blank: 0
NSLog(@"Is not blank: %d", [@"\t\n" dryIsNotBlank]); //Is not blank: 0
```

#### NSObject/NSNull DRYNSNullSupport
`dryValueOrNil` can be used to convert an `[NSNull null]` value to `nil`. This can be useful for example when storing a NSDictionary with NSNull values to a Core Data object.

```objective-c
NSString *string = [[NSNull null] dryValueOrNil]; // string = nil
NSString *string = [@"value" dryValueOrNil]; // string = @"value"
```

You can also test if a value is `[NSNull null]`. It wil return `NO` in case of nil or anything else besides `[NSNull null]`

```objective-c
NSLog(@"Result: %d", [@"" dryIsNSNull]); //Result: 0
NSLog(@"Result: %d", [[NSNull null] dryIsNSNull]); //Result: 1
```

`[NSNull dryNullOrValue]` can be used 

### UIKit utilities
#### UIColor DRYUtil

`dryColorFromRGBHexString:` provides the ability the create UIColor objects based on a RGB hex representation of a color.

```objective-c
UIColor *redColor = [UIColor dryColorFromRGBHexString:@"#FF0000"];
```

#### UIImage ColorPixel
#### UIView DRYLoadFromNib

### Security utilities
### CoreData utilities
### Networking utilities

## Requirements

## Installation

DRYUtilities is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "DRYUtilities"

## Author

Mike Seghers, mike@appfoundry.be

## License

DRYUtilities is available under the MIT license. See the LICENSE file for more info.

