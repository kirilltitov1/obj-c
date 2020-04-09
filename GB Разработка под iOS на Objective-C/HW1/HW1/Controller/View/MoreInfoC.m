//
//  MoreInfo.m
//  HW1
//
//  Created by Кирилл Титов on 16.03.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "MoreInfoC.h"


@interface MoreInfoC ()

//@property (nonatomic, strong) CheapestTicket *cheapestTicket;
- (void)initLabel;

@end


@implementation MoreInfoC

- (void)viewWillAppear:(BOOL)animated {
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createInterface];
}



// FIXME: я не смогу найти как работать c ииннициализацией выглядит оч непоняно и в наших методах тоже не нашел
- (instancetype)initWithTicket: (CheapestTicket *) ticket
{
    self = [super init];
    if (self) {
        self.cheapestTicket = ticket;
    }
    return self;
}


- (void)createInterface {
    [self initLabel];
    
}


//- (void)initwidow {
//    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
//
//    UIViewController *viewC = UIViewController.new;
//    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:viewC];
//
//
//
//}


- (void)initLabel {
//    CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //FIXME: я не понимаю как сделать так, что бы помещать что то во view и что бы оно не перекрывалось навигейшином
    self.navigationController.navigationBarHidden = false;
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat navHight = 88.;
    CGFloat diffY = 60;
    CGFloat currentY = 0.;
    
    currentY = currentY + navHight;
    _fromLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,currentY, width/2, 60)];
    _fromLabel.text = @"Moscow";
    [self.view addSubview:_fromLabel];
    _toLabel = [[UILabel alloc] initWithFrame:CGRectMake(width/2, currentY, width/2, 60)];
    _toLabel.text = @"Thailand Phuket";
    [self.view addSubview:_toLabel];
    
    currentY = currentY + diffY;
    _airlineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, currentY, width, 60)];
    _airlineLabel.text = [NSString stringWithFormat:@"%s%@", "Airline - ", _cheapestTicket.airline];
    [self.view addSubview:_airlineLabel];
    
    currentY = currentY + diffY;
    _flightNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, currentY, width, 60)];
    _flightNumberLabel.text = [NSString stringWithFormat:@"%s%@", "Flight number - ", _cheapestTicket.flight_number];
    [self.view addSubview:_flightNumberLabel];
    
    currentY = currentY + diffY;
    _departureLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, currentY, width, 60)];
    _departureLabel.text = [NSString stringWithFormat:@"%s%@", "Departure - ", _cheapestTicket.departure_at.description];
    [self.view addSubview:_departureLabel];
    
    currentY = currentY + diffY;
    _returnLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, currentY, width, 60)];
    _returnLabel.text = [NSString stringWithFormat:@"%s%@", "Return - ", _cheapestTicket.return_at.description];
    [self.view addSubview:_returnLabel];
    
    currentY = currentY + diffY;
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, currentY, width, 60)];
    _priceLabel.text = [NSString stringWithFormat:@"%s%@", "Coast - ", _cheapestTicket.price];
    [self.view addSubview:_priceLabel];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
