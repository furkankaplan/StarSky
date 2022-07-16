//
//  SkyViewController.m
//  StarSky
//
//  Created by Furkan Kaplan on 16.07.2022.
//

#import "SkyViewController.h"
#import "StarProducer.h"
#import <WebKit/WebKit.h>

@interface SkyViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *skyWebView;
@property (weak, nonatomic) IBOutlet UIButton *smallStarButton;
@property (weak, nonatomic) IBOutlet UIButton *bigStarButton;
@end

@implementation SkyViewController

StarProducer *starProcuder = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self setup];
}

- (void)setup {
    starProcuder = [[StarProducer alloc] init];
    
    [self configureScene];
    [self configureWebView];
    [self configuraStarButtons];
}

- (IBAction)smallButtonTapped:(id)sender {
    [starProcuder addStarInterface:StarSizeSmall];
}

- (IBAction)bigButtonTapped:(id)sender {
    [starProcuder addStarInterface:StarSizeBig];
}

// MARK: - UI Configuration Method

- (void)configureScene {
    self.view.backgroundColor = UIColor.blackColor;
}

- (void)configureWebView {
    NSURL *targetURL = [NSURL URLWithString:@"https://img.etimg.com/thumb/msid-72948091,width-650,imgsize-95069,,resizemode-4,quality-100/star_istock.jpg"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    _skyWebView.opaque = NO;
    _skyWebView.backgroundColor = UIColor.clearColor;
    [_skyWebView loadRequest:request];
}

- (void)configuraStarButtons {
    [_smallStarButton setTitle:@"Small Star" forState:UIControlStateNormal];
    [_smallStarButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
    _smallStarButton.backgroundColor = UIColor.whiteColor;
    _smallStarButton.layer.cornerRadius = 6;
    
    [_bigStarButton setTitle:@"Big Star" forState: UIControlStateNormal];
    [_bigStarButton setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    _bigStarButton.backgroundColor = UIColor.whiteColor;
    _bigStarButton.layer.cornerRadius = 6;
}

@end
