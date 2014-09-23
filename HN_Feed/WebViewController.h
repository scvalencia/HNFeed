//
//  WebViewController.h
//  HN_Feed
//
//  Created by Sebastián Valencia on 7/17/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *sourceTitle;
@property (strong, nonatomic) NSURL *linkToRealResource;

@end
