//
//  ShikakuCell.m
//  CoreDataSeminar
//
//  Created by 中川 聡 on 2013/03/23.
//  Copyright (c) 2013年 nakasen.com. All rights reserved.
//

#import "ShikakuCell.h"


@implementation ShikakuCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.seqNoLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.seqNoLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        self.seqNoLabel.textColor = [UIColor blackColor];
        //self.seqNoLabel.highlightedTextColor = [UIColor blueColor];
        [self.contentView addSubview:self.seqNoLabel];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16.0f];
        self.titleLabel.textColor = [UIColor blackColor];
        //self.titleLabel.highlightedTextColor = [UIColor blueColor];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.seqNoLabel.frame = CGRectMake(10, 0, 100, 40);
    self.titleLabel.frame = CGRectMake(120, 0, 100, 40);
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.seqNoLabel.highlighted = highlighted;
    self.titleLabel.highlighted = highlighted;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
    self.seqNoLabel.highlighted = selected;
    self.titleLabel.highlighted = selected;
}

@end
