//
//  ViewController.h
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/25/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,NSXMLParserDelegate>

@property (nonatomic,strong)NSMutableArray *Title;
@property (nonatomic,strong)NSMutableArray *pubDate;
@property (nonatomic,strong)NSMutableArray *link;
@property (nonatomic,strong)NSMutableArray *descr;
@property (nonatomic,strong)NSXMLParser *parser;
@property (nonatomic,strong)NSMutableString *foundValue;
@property (nonatomic,strong)NSString *currentElement;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)RefreshData:(id)sender;

-(void)getRssFeed;


@end

