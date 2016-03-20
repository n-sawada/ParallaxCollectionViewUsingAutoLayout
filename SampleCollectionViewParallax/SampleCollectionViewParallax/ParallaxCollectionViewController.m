//
//  ParallaxCollectionViewController.m
//  SampleCollectionViewParallax
//
//  Created by Naoki_Sawada on 2016/03/20.
//  Copyright © 2016年 nsawada. All rights reserved.
//

#import "ParallaxCollectionViewController.h"
#import "ParallaxCollectionViewCell.h"

@interface ParallaxCollectionViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSMutableArray* images;


@end

@implementation ParallaxCollectionViewController

static NSString * const reuseIdentifier = @"ParallaxCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _images = [NSMutableArray new];

    for (NSUInteger index = 0; index < 14; ++index) {
        // Setup image name
        NSString *name = [NSString stringWithFormat:@"image%03ld.jpg", (unsigned long)index];
        [self.images addObject:name];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ParallaxCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.paraImageView.image = [UIImage imageNamed:self.images[indexPath.row]];
    cell.verticalCenter.constant = [self adjustParallaxConstraintWithCell:cell];
    return cell;
}


#pragma mark <UICollectionViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    for (ParallaxCollectionViewCell *cell in self.collectionView.visibleCells) {
        cell.verticalCenter.constant = [self adjustParallaxConstraintWithCell:cell];
    }
}

- (CGFloat)adjustParallaxConstraintWithCell:(ParallaxCollectionViewCell *)cell {
    return ((self.collectionView.contentOffset.y - cell.top) / cell.paraImageView.height) * ImageOffsetSpeed;
}

@end
