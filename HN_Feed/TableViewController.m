//
//  TableViewController.m
//  HN_Feed
//
//  Created by Sebastián Valencia on 7/17/14.
//  Copyright (c) 2014 scvalencia. All rights reserved.
//

#import "TableViewController.h"
#import "WebViewController.h"
#import "NewPost.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    self.currentCell = 0;
    
    self.navigationItem.title = @"HN_Feed (Beta)";
    
    UIColor *color1  = [UIColor colorWithRed:26.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    UIColor *color2  = [UIColor colorWithRed:46.0/255.0 green:204.0/255.0 blue:113.0/255.0 alpha:1];
    UIColor *color3  = [UIColor colorWithRed:52.0/255.0 green:152.0/255.0 blue:219.0/255.0 alpha:1];
    UIColor *color4  = [UIColor colorWithRed:155.0/255.0 green:89.0/255.0 blue:182.0/255.0 alpha:1];
    UIColor *color5  = [UIColor colorWithRed:52.0/255.0 green:73.0/255.0 blue:94.0/255.0 alpha:1];
    
    UIColor *color6  = [UIColor colorWithRed:22.0/255.0 green:160.0/255.0 blue:133.0/255.0 alpha:1];
    UIColor *color7  = [UIColor colorWithRed:39.0/255.0 green:174.0/255.0 blue:96.0/255.0 alpha:1];
    UIColor *color8  = [UIColor colorWithRed:41.0/255.0 green:128.0/255.0 blue:185.0/255.0 alpha:1];
    UIColor *color9  = [UIColor colorWithRed:142.0/255.0 green:68.0/255.0 blue:173.0/255.0 alpha:1];
    UIColor *color10 = [UIColor colorWithRed:44.0/255.0 green:62.0/255.0 blue:80.0/255.0 alpha:1];
    
    UIColor *color11 = [UIColor colorWithRed:241.0/255.0 green:196.0/255.0 blue:15.0/255.0 alpha:1];
    UIColor *color12 = [UIColor colorWithRed:230.0/255.0 green:126.0/255.0 blue:34.0/255.0 alpha:1];
    UIColor *color13 = [UIColor colorWithRed:231.0/255.0 green:188.0/255.0 blue:156.0/255.0 alpha:1];
    UIColor *color14 = [UIColor colorWithRed:236.0/255.0 green:240.0/255.0 blue:241.0/255.0 alpha:1];
    UIColor *color15 = [UIColor colorWithRed:149.0/255.0 green:165.0/255.0 blue:166.0/255.0 alpha:1];
    
    UIColor *color16 = [UIColor colorWithRed:243.0/255.0 green:156.0/255.0 blue:18.0/255.0 alpha:1];
    UIColor *color17 = [UIColor colorWithRed:211.0/255.0 green:84.0/255.0 blue:0.0/255.0 alpha:1];
    UIColor *color18 = [UIColor colorWithRed:192.0/255.0 green:57.0/255.0 blue:43.0/255.0 alpha:1];
    UIColor *color19 = [UIColor colorWithRed:189.0/255.0 green:195.0/255.0 blue:199.0/255.0 alpha:1];
    UIColor *color20 = [UIColor colorWithRed:127.0/255.0 green:140.0/255.0 blue:141.0/255.0 alpha:1];
    
    
    
    self.flatColors = [NSArray arrayWithObjects:
                       color1, color2, color3, color4, color5,
                       color6, color7, color8, color9, color10,
                       color11, color12, color13, color14, color15,
                       color16, color17, color18, color19, color20,
                       nil];
    
    UIColor *cellColor1 = [UIColor colorWithRed:255/255.0f green:219/255.0f blue:164/255.0f alpha:1.0f];
    UIColor *cellColor2 = [UIColor colorWithRed:255/255.0f green:165/255.0f blue:60/255.0f alpha:1.0f];;
    
    self.cellColors = [NSArray arrayWithObjects:
                       cellColor1, cellColor2, nil];
    
    
    NSURL *mainURL = [NSURL URLWithString:@"http://hn-feed.appspot.com/"];
    NSData *jsonData = [NSData dataWithContentsOfURL:mainURL];
    NSError *error = nil;
    NSDictionary *prettyJSON = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    self.news = [NSMutableArray array];
    
    for(NSDictionary *item in prettyJSON) {
        //NSLog(@"++++++++++++++++++++++++++++++++++++++++++++");
     
        NSString *title = [item objectForKey:@"title"];
        //NSLog(@"%@", title);
        
        NSString *linkToUser = [item objectForKey:@"linkToUser"];
        //NSLog(@"%@", linkToUser);
        
        NSString *linkToComments = [item objectForKey:@"linkToComments"];
        //NSLog(@"%@", linkToComments);
        
        NSString *number = [item objectForKey:@"number"];
        //NSLog(@"%@", number);
        
        NSString *numberOfComments = [item objectForKey:@"comments"];
        //NSLog(@"%@", numberOfComments);
        
        
        NSString *sourceName = [item objectForKey:@"source"];
        //NSLog(@"%@", sourceName);
        
        
        NSString *points = [item objectForKey:@"points"];
        //NSLog(@"%@", points);
        
        
        NSString *linkToSource = [item objectForKey:@"link"];
        //NSLog(@"%@", linkToSource);
        
        
        NSString *user = [item objectForKey:@"user"];
        //NSLog(@"%@", user);
        
        NSString *time = [item objectForKey:@"time"];
        //NSLog(@"%@", time);
        
        NSString *ID = [[NSString alloc] init];
     
        NSString *auxToFindID = [item objectForKey:@"voteIdUp"];
        if([auxToFindID isKindOfClass:[NSString class]]) {
            int flagposition = [auxToFindID rangeOfString:@"_"].location;
            if(flagposition != NSNotFound) {
                ID = [auxToFindID substringWithRange:NSMakeRange(flagposition, [auxToFindID length] - flagposition)];
                //NSLog(@"%@", ID);
            }            
        }
        
        NewPost *object = [NewPost newPostAndTitle:title];
        object.linkToUser = [NSURL URLWithString:linkToUser];
        object.linkToComments = [NSURL URLWithString:linkToComments];
        object.number = number;
        object.numberOfComments = numberOfComments;
        object.sourceName = sourceName;
        object.points = points;
        object.linkToSource = [NSURL URLWithString:linkToSource];
        object.user = user;
        object.time = time;
        object.ID = ID;
        if([object.user isEqualToString:@""]) {
            object.hiringPost = YES;
        }
        else {
            object.hiringPost = NO;
        }
        //NSLog(@"%@", [object faviconURL]);
       
        //NSLog(@"%@", object);
        [self.news addObject:object];
    }
    
    //NSArray *familyNames = [UIFont familyNames];
    //NSLog(@"%@", familyNames);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Number of section in the TableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Rows per section, length of the array

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.news count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NewPost *selectedObject = [self.news objectAtIndex:indexPath.row];
    UIFont *myFontForTitle = [UIFont fontWithName: @"Courier" size: 11.0];
    UIFont *myFontForSubtitle = [UIFont fontWithName: @"Courier" size: 8.0];
    NSData *imageData = [NSData dataWithContentsOfURL:[selectedObject faviconURL]];
    UIImage *image = [UIImage imageWithData:imageData];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 15, 15)];
    imageView.backgroundColor = [UIColor clearColor];
    [imageView.layer setCornerRadius:2.0f];
    [imageView.layer setMasksToBounds:YES];
    [imageView setImage:image];
    cell.indentationLevel = 5;
    cell.indentationWidth = 5;
    CGRect frame = cell.frame;
    frame.size.width = 200;
    cell.frame = frame;
    [cell.contentView addSubview:imageView];
    cell.backgroundColor = [self.cellColors objectAtIndex:(self.currentCell % [self.cellColors count])];
    self.currentCell += 1;
    cell.textLabel.font = myFontForTitle;
    cell.textLabel.numberOfLines = 4;
    //[cell.textLabel sizeToFit];
    cell.textLabel.text = [selectedObject generateTitle];
    cell.detailTextLabel.font = myFontForSubtitle;
    cell.detailTextLabel.numberOfLines = 1;
    //[cell.textLabel sizeToFit];
    cell.detailTextLabel.text = [selectedObject generateSubtitle];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showNewsPost"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NewPost *thisNewsPost = [self.news objectAtIndex:indexPath.row];
        NSURL *resource = thisNewsPost.linkToSource;
        [segue.destinationViewController setSourceTitle:thisNewsPost.title];
        [segue.destinationViewController setLinkToRealResource:resource];
        
    }
}
@end
