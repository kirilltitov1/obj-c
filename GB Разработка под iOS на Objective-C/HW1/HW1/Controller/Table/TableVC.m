//
//  TableVC.m
//  HW1
//
//  Created by Кирилл Титов on 28.02.2020.
//  Copyright © 2020 Kirill Titov. All rights reserved.
//

#import "TableVC.h"

@interface TableVC ()

//@property (strong, nonatomic) NSMutableDictionary<NSString *, CheapestTicket *>* cheapestTickets;
@property (strong, nonatomic) NSMutableArray<CheapestTicket *>* cheapestTickets;
@property (strong, nonatomic) Airports *airports;

@end

NSInteger alphabeticSort(id string1, id string2, void *reverse)
{
    if (*(BOOL *)reverse == YES) {
        return [string2 localizedStandardCompare:string1];
    }
    return [string1 localizedStandardCompare:string2];
}

@implementation TableVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.airports = Airports.new;
    
    _images = [NSArray arrayWithObjects: @"image1", @"image2", @"image3", @"image4", nil];
    
    [self setTitle: [NSString stringWithFormat:@"%@%@", @"to ", self.airports.HKT]];
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
    
//    [cell.leftLable setText:];
    
    return cell;
}

- (NSInteger)alphabeticSort: (id)string1 string2: (id) string2 isReverse: (void *) reverse {
    
    if (*(BOOL *)reverse == YES) {
        return [string2 localizedStandardCompare:string1];
    }
    return [string1 localizedStandardCompare:string2];
}

- (void) fetchNewsUsingJSON {
    NSString* apiKey = @"7e22896b9b8af259d2879e0ab6911c42";
    NSString* urlString = [NSString stringWithFormat:@"%@%@%@%@",@"https://api.travelpayouts.com/v1/prices/cheap?origin=MOW&destination=", self.airports.HKT, @"&depart_date=2020-03&return_date=2020-03&token=", apiKey];
    NSURL* url = [NSURL URLWithString:urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError* err = error;
        if (err) {
            NSLog(@"%@", err);
            return;
        }
        
        NSMutableArray *cheapestTickets = NSMutableArray.new;

        NSDictionary *dataJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        NSDictionary *airportsDict = dataJSON[@"data"];
        
        NSDictionary *airportDict = airportsDict[@"HKT"];
        
        BOOL reverseSort = NO;
        NSArray *keys = [airportDict.allKeys sortedArrayUsingFunction:alphabeticSort context:&reverseSort];
        
//        TODO: - сделать проходку ключам которые я отсортировал выше, спросить не костыль ли это и как стоило сделать лучше.
        for (NSString *key in keys) {
            NSDateFormatter *isoFormat = NSDateFormatter.new;
            [isoFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
            
            NSDictionary *ticketDict = airportDict[key];
            CheapestTicket *cheapestTicket = CheapestTicket.new;
            cheapestTicket.price = ticketDict[@"price"];
            cheapestTicket.airline = ticketDict[@"airline"];
            cheapestTicket.flight_number = ticketDict[@"flight_number"];
            
            NSDate *parsedDate = [isoFormat dateFromString:ticketDict[@"departure_at"]];
            cheapestTicket.departure_at = parsedDate;
            parsedDate = [isoFormat dateFromString:ticketDict[@"return_at"]];
            cheapestTicket.return_at = parsedDate;
            parsedDate = [isoFormat dateFromString:ticketDict[@"expires_at"]];
            cheapestTicket.expires_at = parsedDate;
            
            [cheapestTickets addObject:cheapestTicket];
        }
        
        self.cheapestTickets = cheapestTickets;
        
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
