


//
//  CustomCell.m
//  RunLoop加载大图
//
//  Created by Gao on 17/4/25.
//  Copyright © 2017年 Gao. All rights reserved.
//

#import "CustomCell.h"

@interface CustomCell()

@property(nonatomic,strong) UIImageView *imageView1;

@property(nonatomic,strong) UIImageView *imageView2;

@property(nonatomic,strong) UIImageView *imageView3;

@end

@implementation CustomCell

-(UIImage *)getImage
{
   NSString *imageUrl = [[NSBundle mainBundle] pathForResource:@"spaceship" ofType:@"jpg"];
   UIImage *image = [UIImage imageWithContentsOfFile:imageUrl];
    
   return image;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

-(void)removeImageView
{
    for (int i = 1 ; i <= 3; ++i)
    {
        [[self.contentView viewWithTag:i] removeFromSuperview];
    }
}


-(void)addImageViewOne
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 85, 85)];
    
    imageView.tag = 1;
    
    imageView.image = [self getImage];
    
    [UIView transitionWithView:self.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

-(void)addImageViewTwo
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(95, 5, 85, 85)];
    
    imageView.tag = 2;
    
    imageView.image = [self getImage];
    
    [UIView transitionWithView:self.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

-(void)addImageViewThree
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(185, 5, 85, 85)];
    
    imageView.tag = 3;
    
    imageView.image = [self getImage];
    
    [UIView transitionWithView:self.contentView duration:0.3 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionTransitionCrossDissolve animations:^{
        [self.contentView addSubview:imageView];
    } completion:^(BOOL finished) {
    }];
}

@end
