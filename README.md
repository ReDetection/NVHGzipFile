# NVHGzipFile

This is an *ObjC* library for *gzipping*/*ungzipping* that directly manipulates files. It isn't implemented as a category on `NSData` (unlike [GZIP](https://github.com/nicklockwood/GZIP) or [Godzippa](https://github.com/mattt/Godzippa)) so the full file doesn't have to be first loaded into memory.

Version 1.1.1 is the latest supporting iOS 7.

## Usage

### Asynchronous

#### Extract Gzip file

```objective-c
    [[[NVHGzipFile alloc]
        initWithPath:gzipFilePath]
        inflateToPath:destinationFilePath completion:^(NSError *error) {
            [self completeActionWithError:error];
        }];
```

#### Gzip file

```objective-c
    [[[NVHGzipFile alloc]
        initWithPath:sourceFilePath]
        deflateFromPath:destinationGzipFilePath completion:^(NSError *error) {
            [self completeActionWithError:error];
        }];
```


### Synchronous

#### Extract Gzip file

```objective-c
    NSError *error = nil;
    BOOL success = [[[NVHGzipFile alloc]
        initWithPath:gzipFilePath]
        inflateToPath:destinationFilePath error:&error];
```

#### Gzip file

```objective-c
    NSError *error = nil;
    BOOL success = [[[NVHGzipFile alloc]
        initWithPath:sourceFilePath]
        deflateFromPath:destinationGzipFilePath error:&error];
```

## Installation

*NVHGzipFile* is available through [CocoaPods](http://cocoapods.org), to install
it simply add the following line to your `Podfile`:

```ruby
pod "NVHGzipFile", :git => 'https://github.com/ReDetection/NVHGzipFile.git'
```

## Author

Niels van Hoorn, nvh@nvh.io

ReDetection just cutted out everyithing except gzip 

Pull requests are welcome!

## License

*NVHGzipFile* is available under the *MIT license*. See the `LICENSE` file for more info.
