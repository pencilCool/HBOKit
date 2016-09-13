//
//  TestPlistCollectionViewController.m
//  demo
//
//  Created by BooB on 16/3/19.
//  Copyright © 2016年 nonato. All rights reserved.
//
#import "SGDirWatchdog.h"
#import "TestPlistCollectionViewController.h" 
@interface TestPlistCollectionViewController ()
{
    SGDirWatchdog * watchDog;
}
@end

@implementation TestPlistCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    COLLECTIONVIEW_REGISTER_XIB_CELLCLASS(self.collectionView, @"BaseXIBCollectionViewCell");
  
    
    NSString *rootPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"projectPath"];
    
    NSString *scriptRootPath = [rootPath stringByAppendingPathComponent:@"resource"];
    NSString *mainScriptPath = [NSString stringWithFormat:@"%@/%@", scriptRootPath, @"TestPlistViewCollection.plist"];
    
    [self loadjsonfileConfig:@"TestPlistViewCollection" filepath:mainScriptPath];
    watchDog = [[SGDirWatchdog alloc] initWithPath:scriptRootPath update:^{
        [self loadplistConfig:@"TestPlistViewCollection" filepath:mainScriptPath];
        [self.collectionView reloadData];
    }];
    [watchDog start];

    [self loadplistConfig:@"TestPlistViewCollection" filepath:mainScriptPath];
    [self.collectionView reloadData];
}

-(void)dealloc{

    [watchDog stop];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
