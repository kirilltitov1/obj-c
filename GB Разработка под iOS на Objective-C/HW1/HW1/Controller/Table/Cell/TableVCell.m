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
        _leftLable = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, [UIScreen mainScreen].bounds.size.width/2.0, 44.0)];
        _leftLable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_leftLable];
        
        _rightLable = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2, 0, [UIScreen mainScreen].bounds.size.width/2, 44)];
        _rightLable.textAlignment = NSTextAlignmentCenter;
        
        _rightLable.backgroundColor = [UIColor cyanColor];
//        _leftLable.backgroundColor = [UIColor blueColor];
        
        [self.contentView addSubview:_rightLable];
    }
    
    return self;
}

- (void)setRightLableText:(NSString*) text {
    _rightLable.text = text;
    _rightLable.textColor = [UIColor greenColor];
}

@end
