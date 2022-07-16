//
//  SkyViewController.h
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import <UIKit/UIKit.h>
#import "StarProducer.h"

NS_ASSUME_NONNULL_BEGIN

@interface SkyViewController : UIViewController

@property StarProducer* starProcuder;

- (void)addStarInterface:(StarSize)size;
+ (void)setup;
+ (void)configureWebView;
+ (void)configuraStarButtons;

@end

NS_ASSUME_NONNULL_END
