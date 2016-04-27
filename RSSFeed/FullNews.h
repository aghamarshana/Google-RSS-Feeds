//
//  FullNews.h
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/25/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FullNews : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic)NSString *link;

@end
