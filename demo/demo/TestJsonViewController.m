//
//  TestJsonViewController.m
//  demo
//
//  Created by boob on 16/5/24.
//  Copyright © 2016年 nonato. All rights reserved.
//

#import "TestJsonViewController.h"
#import <HBOKit/HBOKit.h>
#import "SGDirWatchdog.h"
@interface TestJsonViewController ()
{
    SGDirWatchdog *watchDog ;
}
@end

@implementation TestJsonViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"%@",[self jsonstring]);
    NSString * jsonstring = [self jsonstring];
    
    CELL_STRUCT_ARRAY * array = [[CELL_STRUCT_ARRAY alloc] hb_initWithJSONData:[jsonstring dataUsingEncoding:NSUTF8StringEncoding]];
//    NSArray * cellstruct = [[NSMutableArray alloc] initWith:jsonstring];
//    NSLog(@"%@",cellstruct);
    NSLog(@"%@",array);
    NSString *rootPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"projectPath"];
    
    NSString *scriptRootPath = [rootPath stringByAppendingPathComponent:@"resource"];
    NSString *mainScriptPath = [NSString stringWithFormat:@"%@/%@", scriptRootPath, @"/TestJson.js"];
    
    [self loadjsonfileConfig:@"TestJson" filepath:mainScriptPath];
    watchDog = [[SGDirWatchdog alloc] initWithPath:scriptRootPath update:^{
        [self loadjsonfileConfig:@"TestJson" filepath:mainScriptPath];
        [self.tableView reloadData];
    }];
    [watchDog start];
}

-(void)dealloc{

    [watchDog stop];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(NSString *)jsonstring
{
    NSString * filepath = [[NSBundle mainBundle] pathForResource:@"TestJson" ofType:@"json"];
    NSError * error;
    NSString * string = [NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    if(error) { // If error object was instantiated, handle it.
        NSLog(@"ERROR while loading from file: %@", error);
        // …
    }
    return string;
    
//    NSString *ps = [[NSString alloc] stringWithContentsOfFile:qs encoding:NSUTF8StringEncoding error: &error];

}
@end
