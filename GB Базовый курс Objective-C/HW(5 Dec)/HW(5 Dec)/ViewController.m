//
//  ViewController.m
//  HW(5 Dec)
//
//  Created by Kirill Titov on 05/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)checkSymbol:(UIButton *)sender {
    const char *symbol = [_textField.text cStringUsingEncoding: [NSString defaultCStringEncoding]];
    ( ((int)'A' <= (int)*symbol && (int)*symbol <= (int)'Z') || \
      ((int)'a' <= (int)*symbol && (int)*symbol <= (int)'z') ) ? \
      ([_textField setBackgroundColor:[UIColor greenColor]]) : ([_textField setBackgroundColor:[UIColor redColor]]);
}



@end
