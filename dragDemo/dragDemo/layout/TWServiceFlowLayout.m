//
//  TWServiceFlowLayout.m
//  Telework
//
//  Created by mist on 12/09/2017.
//  Copyright © 2017 tsta. All rights reserved.
//

#import "TWServiceFlowLayout.h"

@implementation TWServiceFlowLayout

- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置布局
- (void)setupUI{
    CGFloat length = [UIScreen mainScreen].bounds.size.width / 4 - 1;
    self.itemSize = CGSizeMake(length, 72);
    self.sectionInset = UIEdgeInsetsZero;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.headerReferenceSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
    //self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
}

@end
