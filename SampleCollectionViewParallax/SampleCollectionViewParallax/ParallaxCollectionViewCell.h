//
//  ParallaxCollectionViewCell.h
//  SampleCollectionViewParallax
//
//  Created by Naoki_Sawada on 2016/03/20.
//  Copyright © 2016年 nsawada. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Nib.h"
#import "UIView+Frame.h"

#pragma mark - Const

extern const NSInteger ImageOffsetSpeed;

@interface ParallaxCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *paraImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalCenter;

@end
