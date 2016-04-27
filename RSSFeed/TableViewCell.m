//
//  TableViewCell.m
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/26/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return  self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
