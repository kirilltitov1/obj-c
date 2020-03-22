//
//  TableVCell.m
//  HW1
//
//  Created by Кирилл Титов on 28.02.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "TableVCell.h"

@implementation TableVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftLable = [[UILabel alloc] initWithFrame: CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width/2.0, 60.0)];
        self.leftLable.textAlignment = NSTextAlignmentCenter;
        self.leftLable.numberOfLines = 4;
        [self.contentView addSubview:self.leftLable];
        
        self.rightLable = [[UILabel alloc] initWithFrame: CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 60)];
        self.rightLable.textAlignment = NSTextAlignmentCenter;
        self.rightLable.numberOfLines = 4;
//        _rightLable.backgroundColor = [UIColor cyanColor];
//        _leftLable.backgroundColor = [UIColor blueColor];
        
        [self.contentView addSubview:self.rightLable];
    }
    
    return self;
}

- (void)setRightLableText:(NSString*) text {
    self.rightLable.text = text;
    self.rightLable.textColor = [UIColor greenColor];
}

@end
