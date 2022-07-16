//
//  StarModel.h
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import <UIKit/UIKit.h>
#import "StarBrightness.h"
#import "StarSize.h"

@interface StarModel : NSObject

@property StarSize size;
@property UIColor* color;
@property StarBrightness brightness;

- (NSString *)hexStringFromColor:(UIColor *)color;

@end
