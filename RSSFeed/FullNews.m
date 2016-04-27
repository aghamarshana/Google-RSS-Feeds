//
//  FullNews.m
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/25/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import "FullNews.h"

@implementation FullNews

-(void)viewDidLoad{


    [super viewDidLoad];
    NSURL *url=[NSURL URLWithString:_link];
    NSURLRequest *request=[NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];
    


}


@end
