//
//  TableVC.m
//  HW1
//
//  Created by Кирилл Титов on 28.02.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "TableVC.h"

@interface TableVC ()

@property (strong, nonatomic) NSMutableArray<Weather*> *weathers;

@end

@implementation TableVC



- (void)viewDidLoad {
    [super viewDidLoad];
    
    _images = [NSArray arrayWithObjects: @"image1", @"image2", @"image3", @"image4", nil];
//    [self setTitle: @"Using https://newsapi.org"];
    [self fetchNewsUsingJSON];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [_images count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    if (!cell) {
        cell = [[TableVCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"CellID"];
    }
    [cell.leftLable setText:    self.weathers[indexPath.row].dt_txt];
    [cell.rightLable setText:   self.weathers[indexPath.row].desc];
    
    return cell;
}

- (void) fetchNewsUsingJSON {
    NSString* apiKey = @"8fa8b982c653552d0011316c25185d7f";
    NSString* urlString = [NSString stringWithFormat:@"%@%@",@"http://api.openweathermap.org/data/2.5/forecast?q=Moscow&cnt=10&appid=", apiKey];
    NSURL* url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError* err = error;
        if (err) {
            NSLog(@"%@", err);
            return;
        }
        
        NSMutableArray<Weather*> *weathers = NSMutableArray.new;

        NSDictionary* weatherJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];        
        for (NSDictionary* weatherDict in weatherJSON[@"list"]) {
            Weather* weather = Weather.new;
            weather.windSpeed = weatherDict[@"wind"][@"speed"];
            
            weather.dt_txt = weatherDict[@"dt_txt"];
            NSDateFormatter* isoFormat = NSDateFormatter.new;
            [isoFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            NSDate* parsedDate = [isoFormat dateFromString:weather.dt_txt];
            
            NSDictionary* weatherMain = weatherDict[@"main"];
            weather.temp = weatherMain[@"temp"];
            weather.feels_like = weatherMain[@"feels_like"];
            weather.temp_min = weatherMain[@"temp_min"];
            weather.temp_max = weatherMain[@"temp_max"];
            weather.pressure = weatherMain[@"pressure"];
            weather.humidity = weatherMain[@"humidity"];
            
            NSDictionary* weatherWeather = weatherDict[@"weather"];
            for (NSDictionary* weatherElem in weatherWeather) {
                weather.desc = weatherElem[@"description"];
            }
            [weathers addObject:weather];
        }
        
        self.weathers = weathers;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }] resume];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
