//
//  HBBaseMJProtocal.h
//  demo
//
//  Created by boob on 16/9/13.
//  Copyright © 2016年 nonato. All rights reserved.
//

#import <HBOKit/HBOKit.h>

@protocol HBBaseMJProtocal <NSObject>
@property (nonatomic, assign) BOOL                       noFooterView;
@property (nonatomic, assign) BOOL                       noHeaderFreshView;
-(void)removeFooterView;
-(void)finishReloadingData;
-(void)setFooterView;
-(void)startHeaderLoading;

//调用上下拉需要的
-(void)refreshView;
-(void)getNextPageView;
-(void)FinishedLoadData;
@end

@interface HBBaseViewController(HBBaseMJProtocal)<HBBaseMJProtocal>

@end
