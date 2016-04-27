//
//  TableViewCell.h
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/26/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *pubDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageLabel;

@end
