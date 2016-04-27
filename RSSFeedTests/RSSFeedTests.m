//
//  RSSFeedTests.m
//  RSSFeedTests
//
//  Created by Rajan Rajamani on 4/25/16.
//  Copyright © 2016 Rajan Rajamani. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "FullNews.h"

@interface RSSFeedTests : XCTestCase{

    ViewController *vc;
    FullNews *fc;
    
}


@end

@implementation RSSFeedTests

- (void)setUp {
    [super setUp];
    
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    vc=[storyboard instantiateViewControllerWithIdentifier:@"View"];
    fc=[storyboard instantiateViewControllerWithIdentifier:@"fullnews"];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//Test the View Controllers and its subviews
//
//

- (void)testViewController {
    
    
    XCTAssertNotNil(vc.view,@"Viewcontroller is not initiated properly");
    
    
    
}
-(void)testFullNewsViewController{
    
    XCTAssertNotNil(fc.view,@"Viewcontroller is not initiated properly");


}

-(void)testForTableViewExistence{
    
    NSArray *subviews=vc.view.subviews;
    XCTAssertTrue([subviews containsObject:vc.tableView],@"View does not have a table view");


}

-(void)testForWebViewExistence{
    
    NSArray *subviews=fc.view.subviews;
    XCTAssertTrue([subviews containsObject:fc.webView],@"View does not have a table view");

}







//UITable View Tests
//
//

-(void)testViewConformsToUITableViewDataSource{
    
    XCTAssertTrue([vc conformsToProtocol:@protocol(UITableViewDataSource)],@"View Does not confirm to UITableView Datasource Protocol");


}

-(void)testConformstoUITableViewDelegate{
    
    XCTAssertTrue([vc conformsToProtocol:@protocol(UITableViewDelegate)],@"View Does not confirm to UITableView Delegate Protocol");


}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
