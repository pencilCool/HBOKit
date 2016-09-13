//
//  HBBaseMJProtocal.m
//  demo
//
//  Created by boob on 16/9/13.
//  Copyright © 2016年 nonato. All rights reserved.
//

#import "HBBaseMJProtocal.h"
#import <MJRefresh/MJRefresh.h>
#import <objc/runtime.h>

static char key_hbbasemjrefresh_header;
static char key_hbbasemjrefresh_footer;

@implementation HBBaseTableViewController(HBBaseMJProtocal)

/**
 *  集成刷新控件
 */
- (void)setupRefresh
{
    // 1.下拉刷新(进入刷新状态就会调用self的refreshView)
    self.noHeaderFreshView = YES;
    [self.tableView.header beginRefreshing];
    self.noFooterView = YES;
}

-(void)setNoHeaderFreshView:(BOOL)noHeaderFreshView
{
    objc_setAssociatedObject(self, &key_hbbasemjrefresh_header, @(noHeaderFreshView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (noHeaderFreshView) {
        [self.tableView.header removeFromSuperview];
    }
    else
    {
        self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshView)];
        //        [self.tableView addHeaderWithTarget:self action:@selector(refreshView)];
    }
}

-(void)setNoFooterView:(BOOL)noFooterView
{
    
    objc_setAssociatedObject(self, &key_hbbasemjrefresh_footer, @(noFooterView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (noFooterView) {
        [self.tableView.footer removeFromSuperview];
    }
    else
    {
        self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getNextPageView)];
    }
}

-(void)refreshView
{
}
-(void)removeFooterView{
}

-(void)setFooterView{
}

//调用上下拉需要的

//加载调用的方法
-(void)getNextPageView
{
    
}

-(void)startHeaderLoading
{
    [self.tableView.header beginRefreshing];
}
-(void)FinishedLoadData
{
    [self.tableView.header  endRefreshing];
    [self.tableView.footer endRefreshing];
}

-(void)noMore
{
    [self.tableView removeFromSuperview];
}

-(void)finishReloadingData
{
    [self.tableView.header endRefreshing];
    [self.tableView.footer endRefreshing];
}
@end


@implementation HBBaseCollectionViewController(HBBaseMJProtocal)

-(void)setNoHeaderFreshView:(BOOL)_noHeaderFreshView
{
    objc_setAssociatedObject(self, &key_hbbasemjrefresh_header, @(_noHeaderFreshView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (!_noHeaderFreshView) {// @weakify(self);
        self.collectionView.header =  [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            // 进入刷新状态后会自动调用这个block
            //@strongify(self)
            [self refreshView];
        }];
    }
}

-(void)setNoFooterView:(BOOL)noFooterView
{
    objc_setAssociatedObject(self, &key_hbbasemjrefresh_footer, @(noFooterView), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!noFooterView) {
        //@weakify(self);
        self.collectionView.footer  = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{ //@strongify(self)
            [self getNextPageView];
        }];
    }
    else
    {
        self.collectionView.footer = nil;
    }
}


-(void)FinishedLoadData{
    [self.collectionView.header endRefreshing];
    [self.collectionView.footer endRefreshing];
}

@end



@implementation HBBaseViewController(HBBaseMJProtocal)
@dynamic noHeaderFreshView;
@dynamic noFooterView;

-(BOOL)noFooterView{
    NSNumber * nofooter = objc_getAssociatedObject(self, &key_hbbasemjrefresh_footer);
    return nofooter.boolValue;
}

-(BOOL)noHeaderFreshView{
    NSNumber * noheader = objc_getAssociatedObject(self, &key_hbbasemjrefresh_header);
    return noheader.boolValue;
}

-(void)removeFooterView{}
-(void)finishReloadingData{}
-(void)setFooterView{}
-(void)startHeaderLoading{}

//调用上下拉需要的
-(void)refreshView{}
-(void)getNextPageView{}
-(void)FinishedLoadData{}
@end
