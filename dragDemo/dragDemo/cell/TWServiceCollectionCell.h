//
//  TWServiceCollectionCell.h
//  Telework
//
//  Created by mist on 12/09/2017.
//  Copyright © 2017 tsta. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MKModel.h"

@class TWServiceCollectionCell;

@protocol TWServiceCollectionCellDelegate <NSObject>

- (void)didClickedButtonOnCollectionCell:(TWServiceCollectionCell *)cell;

@end

@interface TWServiceCollectionCell : UICollectionViewCell
//数据源
@property (nonatomic, strong) MKModel *data;

@property (nonatomic, strong) UIImageView *image;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, weak) id<TWServiceCollectionCellDelegate> delegate;

@end
