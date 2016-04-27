//
//  ViewController.m
//  RSSFeed
//
//  Created by Rajan Rajamani on 4/25/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "XMLReader.h"
#import "FullNews.h"
#import "TableViewCell.h"


@interface ViewController (){

    
    NSOperationQueue *queue;

}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRssFeed];
    queue=[NSOperationQueue new];
    
    // Do any additional setup after loading the view, typically from a nib.
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [_Title count];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier=@"Cell";
    
    
    TableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
     cell.title.text = [_Title objectAtIndex:indexPath.row];
  
    
    cell.pubDate.text=[_pubDate objectAtIndex:indexPath.row];
    
    NSBlockOperation *operation=[NSBlockOperation blockOperationWithBlock:^(void){
        
        
        NSString *image_url=nil;
        
        NSString *desc = [_descr objectAtIndex:indexPath.row];
        
        
        
        // NSString * aString = @"This is the #substring1 and #subString2 I want";
        
        
        
        NSScanner *scanner = [NSScanner scannerWithString:desc];
        
        [scanner scanUpToString:@"<img src" intoString:nil]; // Scan all characters before #
        
        while(![scanner isAtEnd]) {
            
            //NSString *substring = nil;
            
            [scanner scanString:@"<img src=" intoString:nil]; // Scan the # character
            
            if([scanner scanUpToString:@"alt" intoString:&image_url]) {
                
                // If the space immediately followed the #, this will be skipped
                
                
                
                image_url = [image_url substringFromIndex:1];
                
                image_url = [image_url substringToIndex:[image_url length] - 2];
                
                
                
                [image_url stringByReplacingOccurrencesOfString:@"\"" withString:@""];
                
                
                
                NSString *Http = @"http:";
                
                
                
                image_url = [Http stringByAppendingString:image_url];
                
                
                
                //substring = [NSString stringWithFormat:@"http:%@",substring];
                
                
                
                NSLog(@"ImageURL %@",image_url);
                
                
                
                break;
                
                // [substrings addObject:substring];
                
            }
            
            // [scanner scanUpToString:@">" intoString:nil]; // Scan all characters before next #
            
        }
        
        
        
        [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:image_url]] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
            
            
            
            cell.imageLabel.image = [UIImage imageWithData:data];
            
            
            
        }];
        

        
     
        
        

    
    
    }];
    
    [queue addOperation:operation];

   
    return cell;
    
    


}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FullNews *next=[self.storyboard instantiateViewControllerWithIdentifier:@"fullnews"];
    
    next.link=[_link objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:next animated:YES];
    
    
    


}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (IBAction)RefreshData:(id)sender {
    
    [self getRssFeed];
    
    [_tableView reloadData];
}





//Get data from the feed provided and store the elemnts into arrays

-(void)getRssFeed{
    
    NSString* path = @"http://news.google.com/news?pz=1&cf=all&ned=uk&hl=en&output=rss";
    
    NSURL *url = [NSURL URLWithString:path];
    
    
    NSString *xmlString=[NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSError *parseError = nil;
    
    NSDictionary *xmlDictionary = [XMLReader dictionaryForXMLString:xmlString error:&parseError];
    

    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:xmlDictionary
                        
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                        
                                                         error:&error];
    
    NSDictionary *responseDictionary = [NSJSONSerialization
                                        
                                        JSONObjectWithData:jsonData
                                        
                                        options:kNilOptions
                                        
                                        error:&error];
    
    NSLog(@"Response Dictionary :: %@",responseDictionary);
    
    
    
    _Title=[[NSMutableArray alloc] init];
    
    responseDictionary=[responseDictionary  valueForKey:@"rss"];

    responseDictionary = [responseDictionary valueForKey:@"channel"];
    
    
    responseDictionary = [responseDictionary valueForKey:@"item"];
    
    NSMutableDictionary *titleDictionary=[[NSMutableDictionary alloc]init];
    
    titleDictionary=[responseDictionary valueForKey:@"title"];
    
    NSMutableDictionary *pubDateDictionary=[[NSMutableDictionary alloc]init];
    
    pubDateDictionary=[responseDictionary valueForKey:@"pubDate"];
    NSMutableDictionary *linkDictionary=[[NSMutableDictionary alloc]init];
    
    linkDictionary=[responseDictionary valueForKey:@"link"];
    
    NSMutableDictionary *descriptionDictionary=[[NSMutableDictionary alloc]init];
    
    descriptionDictionary=[responseDictionary valueForKey:@"description"];
    
    //Storiig the tilte, link, images and published date into arrays
    
    
    _Title = [titleDictionary valueForKey:@"text"];
    _pubDate = [pubDateDictionary valueForKey:@"text"];
    _link = [linkDictionary valueForKey:@"text"];
     _descr= [descriptionDictionary valueForKey:@"text"];



    }




@end
