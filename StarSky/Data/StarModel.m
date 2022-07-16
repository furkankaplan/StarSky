//
//  StarModel.m
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import "StarModel.h"

@implementation StarModel

- (NSString *)description {
    
    return [NSString stringWithFormat:@"%@ - %@ - %@", _size, [self hexStringFromColor:_color], _brightness];
}

- (NSString *)hexStringFromColor:(UIColor *)color
{
    CGColorSpaceModel colorSpace = CGColorSpaceGetModel(CGColorGetColorSpace(color.CGColor));
    const CGFloat *components = CGColorGetComponents(color.CGColor);

    CGFloat r, g, b, a;

    if (colorSpace == kCGColorSpaceModelMonochrome) {
        r = components[0];
        g = components[0];
        b = components[0];
        a = components[1];
    } else if (colorSpace == kCGColorSpaceModelRGB) {
        r = components[0];
        g = components[1];
        b = components[2];
        a = components[3];
    }

    return [NSString stringWithFormat:@"#%02lX%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255),
            lroundf(a * 255)];
}

@end

