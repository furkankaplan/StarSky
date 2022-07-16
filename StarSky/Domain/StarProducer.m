//
//  StarProducer.m
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import "StarProducer.h"

@implementation StarProducer

NSMutableArray<StarModel *> *dataSource;
NSArray *colors = nil;
NSArray *brightness = nil;

- (instancetype)init
{
    self = [super init];
    if (self) {
        dataSource = [[NSMutableArray alloc] init];
        colors = [[NSArray alloc] initWithObjects:UIColor.yellowColor,UIColor.purpleColor,UIColor.grayColor, nil];
        brightness = [[NSArray alloc] initWithObjects:StarBrightnessNotSoMuch,StarBrightnessBright, nil];
    }
    return self;
}

- (void)addStarInterface:(StarSize)size {
    __block StarProducer *blocksafeSelf = self;
    
    if ([blocksafeSelf isSkyFull]) {
        return;
    }
    
    StarModel *model = [[StarModel alloc] init];
    
    int colorRandomIndex = arc4random_uniform([colors count]);
    int brightnessRandomIndex = arc4random_uniform([brightness count]);
    
    model.size = size;
    model.color = [colors objectAtIndex:colorRandomIndex];
    model.brightness = [brightness objectAtIndex:brightnessRandomIndex];
    
    [dataSource addObject:model];
    
    
    [blocksafeSelf logDataSource];
    [blocksafeSelf logBrightStars];
}

- (BOOL)isSkyFull {
    if (dataSource.count == 10) {
        NSLog(@"Sky is full with 10 stars");
        return true;
    }
    
    return false;
}

- (void)logDataSource {
    NSLog(@"All DataSource is given below.");
    NSLog(@"%@", [dataSource description]);
}

- (void)logBrightStars {
    NSLog(@"All stars which are bright.");
    
    NSMutableArray *filteredArray = [[NSMutableArray alloc] init];
    
    for (StarModel *item in dataSource) {
        if (item.brightness == StarBrightnessBright) {
            [filteredArray addObject:item];
        }
    }
    
    NSLog(@"%@", [filteredArray description]);
}
@end
