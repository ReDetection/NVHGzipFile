//
//  NVHViewController.m
//  NVHTarGzipExample
//
//  Created by Niels van Hoorn on 26/03/14.
//  Copyright (c) 2014 Niels van Hoorn. All rights reserved.
//

#import "NVHViewController.h"
#import "NVHGzipFile.h"


@interface NVHViewController ()

@property (weak, nonatomic) IBOutlet UILabel *progressLabel;

@property (weak, nonatomic) IBOutlet UIButton *unGzipButton;
@property (weak, nonatomic) IBOutlet UIButton *gzipButton;

@end


@implementation NVHViewController

- (void)setButtonsEnabled:(BOOL)enabled
{
    self.unGzipButton.enabled = enabled;
    self.gzipButton.enabled = enabled;
}

- (void)completeActionWithError:(NSError *)error
{
    [self setButtonsEnabled:YES];
    
    if (error != nil) {
        self.progressLabel.text = error.localizedDescription;
    }
    else
    {
        self.progressLabel.text = @"Done!";
    }
}

- (IBAction)unGzipFile:(UIButton*)sender
{
    [[[NVHGzipFile alloc]
        initWithPath:self.demoSourceTarGzipFilePath]
        inflateToPath:self.demoDestinationUnGzipPath completion:^(NSError *error) {
            [self completeActionWithError:error];
        }];
}

- (IBAction)gzipFile:(UIButton*)sender
{
    [[[NVHGzipFile alloc]
        initWithPath:self.demoDestinationGzipPath]
        deflateFromPath:self.demoDestinationUnGzipPath completion:^(NSError *error) {
            [self completeActionWithError:error];
        }];
}

- (NSString *)demoSourceTarGzipFilePath {
    return [[NSBundle mainBundle] pathForResource:@"misc.forsale.tar" ofType:@"gz"];
}

- (NSString*)demoDestinationUnGzipPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath = paths[0];
    NSString* destinationPath = [documentPath stringByAppendingPathComponent:@"misc-forsale-ungzipped.tar"];
    return destinationPath;
}

- (NSString*)demoDestinationGzipPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentPath = paths[0];
    NSString* destinationPath = [documentPath stringByAppendingPathComponent:@"misc-forsale-gzipped.tar.gz"];
    return destinationPath;
}

@end
