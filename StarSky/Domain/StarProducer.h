//
//  StarProducer.h
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import <Foundation/Foundation.h>
#import "StarModel.h"

@interface StarProducer : NSObject

+ (void)addStarInterface:(StarSize)size;
- (void)logDataSource;
- (void)logBrightStars;

@end
