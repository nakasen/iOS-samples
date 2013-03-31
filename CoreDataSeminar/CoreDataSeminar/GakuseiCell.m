//
//  GakuseiCell.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "GakuseiCell.h"


@implementation GakuseiCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.gakusekiNoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.gakusekiNoLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        self.gakusekiNoLabel.textColor = [UIColor blackColor];
        //self.gakusekiNoLabel.highlightedTextColor = [UIColor blueColor];
        [self.contentView addSubview:self.gakusekiNoLabel];
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        self.nameLabel.textColor = [UIColor blackColor];
        //self.nameLabel.highlightedTextColor = [UIColor blueColor];
        [self.contentView addSubview:self.nameLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.gakusekiNoLabel.frame = CGRectMake(10, 0, 100, 40);
    self.nameLabel.frame = CGRectMake(120, 0, 100, 40);
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.gakusekiNoLabel.highlighted = highlighted;
    self.nameLabel.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    self.gakusekiNoLabel.highlighted = selected;
    self.nameLabel.highlighted = selected;
}

@end
