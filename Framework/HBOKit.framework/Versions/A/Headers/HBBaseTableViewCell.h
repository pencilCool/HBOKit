

//       _      ______
//	/\ _\ \    /\  __ \
//	\   _  \   \ \  __<
//	 \ \  \ \   \ \_____\
//	  \/   \/    \/_____/
//
//
//  Created by nonato on 14-11-25.
//  Copyright (c) 2014年 Nonato. All rights reserved.
//


#define PROTOCOL_OBJECT_DELEGATE(__OBJ,__MOTHOD) @protocol __OBJ##Delegate <NSObject>\
__MOTHOD\
@end

#define NO_DEFAULT_TITLE_PROFILE -(void)setcellProfile:(NSString *)profile{}
#define NO_DEFAULT_TITLE -(void)setcellTitle:(NSString *)title{}
#define NO_DEFAULT_PLACEHOLDER  -(void)setcelldetailtitle:(NSString *)detailtitle{}

#define HBLOG(SS) NSLog(@"%@",SS);

#import <UIKit/UIKit.h>
#import "CELL_STRUCT_KEY.h"
//使用 imageWithName 降低内存压力
//#import "UIImage+LocalImage.h"

@interface HBBaseTableViewCell : UITableViewCell


@property (nonatomic,assign ) BOOL showNewMsg;
@property (nonatomic,assign ) BOOL showTopLine;
@property (nonatomic,assign ) BOOL showBottomLine;
@property (nonatomic,assign ) BOOL canAnimate;
@property (nonatomic,assign ) BOOL RoundCircleType;
@property (nonatomic,assign ) BOOL imageRight;
@property (nonatomic,assign ) BOOL CornerRadius;
@property (nonatomic,assign ) SEL  selector;
@property (nonatomic,weak   ) id   delegate;
@property (nonatomic,strong ) id   object;
@property (nonatomic,strong ) id   object2;
@property (nonatomic,assign) NSInteger           numberOfLines;
@property (nonatomic,strong) NSIndexPath         * indexPath;
@property (nonatomic,strong) NSString            * subvalue2;
@property (nonatomic,strong) NSMutableDictionary * dictionary;

-(void)setcelldictionary:(NSMutableDictionary *)dictionary;
-(void)setcellimageRight:(BOOL)imageRight;
-(void)setcellpicturecolor:(NSString *)picturecolor;
-(void)setcellobject:(id)object;
-(void)setcellobject2:(id)object;
-(void)setcelldelegate:(id)delegate;
-(void)setcellProfile:(NSString *)profile;
-(void)setcellTitle:(NSString *)title;
-(void)setcellTitleFont:(UIFont *)titleFont;
-(void)setcellAttributeTitle:(NSAttributedString *)attributeTitle;
-(void)setcellTitleColor:(NSString *)color;
-(void)setcellValue:(NSString *)value;
-(void)setcellValue2:(NSString *)value;
-(void)setcellRightValue:(NSString *)value;
-(void)setcellplaceholder:(NSString *)placeholder;
-(void)setcellArray:(NSMutableArray *)array;
-(void)setinputAccessoryView:(NSString *)inputAccessoryView;
-(void)setinputView:(NSString *)inputView;
-(void)setcelldetailtitle:(NSString *)detailtitle;
-(void)setcellimageCornerRadius:(BOOL)CornerRadius;
-(void)setcellTitleLabelNumberOfLines:(NSInteger)numberOfLines;
-(void)setcellTitleFontsize:(NSNumber *)titleFontsize;

//-(void)setcellAction:(SEL)action;
/**
 *  返回cell的高度 子类需要覆盖此方法
 *
 *  @param size
 *
 *  @return cell的size
 */
-(CGSize)sizeThatFits:(CGSize)size;
//protocol 自己定制化cell 不用里面的控件
-(BOOL)customizedStyle;
@end



@interface UIView(HBBASECELL)
@property(nonatomic,retain) UIView * toplayer;
@property(nonatomic,retain) UIView * bottomlayer;

-(void)clearTopLayer;
-(void)clearBottomLayer;
-(void)drawBottomlinelayer;
-(void)drawToplinelayer;
@end