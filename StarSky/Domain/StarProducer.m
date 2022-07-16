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
        colors = [[NSArray alloc] initWithObjects:UIColor.yellowColor,UIColor.purpleColor,UIColor.grayColor, nil];
        brightness = [[NSArray alloc] initWithObjects:StarBrightnessBright,StarBrightnessBright, nil];
    }
    return self;
}

+ (void)addStarInterface:(StarSize)size {
    StarModel *model = [[StarModel alloc] init];
    
    int colorRandomIndex = arc4random_uniform([colors count]);
    int brightnessRandomIndex = arc4random_uniform([brightness count]);
    
    model.size = size;
    model.color = [colors objectAtIndex:colorRandomIndex];
    model.brightness = [brightness objectAtIndex:brightnessRandomIndex];
    
    [dataSource addObject:model];
    
    __block StarProducer *blocksafeSelf = self;
    
    [blocksafeSelf logDataSource];
    [blocksafeSelf logBrightStars];
}

- (void)logDataSource {
    NSLog(@"%@", dataSource);
}

- (void)logBrightStars {
    NSMutableArray *filteredArray = nil;
    
    for (StarModel *item in dataSource) {
        if (item.brightness == StarBrightnessBright) {
            [filteredArray addObject:item];
        }
    }
    
    NSLog(@"%@", filteredArray);
}
@end
