//
//  CustomCell.h
//  RunLoop加载大图
//
//  Created by Gao on 17/4/25.
//  Copyright © 2017年 Gao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell

@property(nonatomic,strong) NSIndexPath *currentIndexPath;

-(void)removeImageView;

-(void)addImageViewOne;
-(void)addImageViewTwo;
-(void)addImageViewThree;

@end
