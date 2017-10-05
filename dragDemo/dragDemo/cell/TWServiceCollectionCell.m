//
//  TWServiceCollectionCell.m
//  Telework
//
//  Created by mist on 12/09/2017.
//  Copyright © 2017 tsta. All rights reserved.
//

#import "TWServiceCollectionCell.h"

@implementation TWServiceCollectionCell

#pragma mark - 数据源赋值
- (void)setData:(MKModel *)data{
    _data = data;
    self.title.text = data.title;
    self.contentView.backgroundColor = data.backGroundColor;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

#pragma mark - 设置按钮
- (void)setTag:(NSInteger)tag{
    [super setTag:tag];
    if (tag == 103) {
        //首页应用
        [self.button setBackgroundImage:[UIImage imageNamed:@"icon-del"] forState:UIControlStateNormal];
    }else if(tag == 104){
        //更多应用
        [self.button setBackgroundImage:[UIImage imageNamed:@"icon-add"] forState:UIControlStateNormal];
    }else{
        //更多
        
    }
}

#pragma mark - 设置界面
- (void)setupUI{
    self.contentView.backgroundColor = [UIColor whiteColor];
    //图标
    self.image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-taxServer"]];
    [self.contentView addSubview:self.image];
    //文字
    self.title = [[UILabel alloc] init];
    self.title.text = @"订办公室";
    self.title.font = [UIFont systemFontOfSize:14];
    self.title.textColor = [UIColor colorWithRed:117 / 255.f green:117 / 255.f blue:117 / 255.f alpha:1];
    [self.contentView addSubview:self.title];
    //按钮
    self.button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.button];
    //图标布局
    [self.image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView).offset(-10);
    }];
    //文字布局
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.image.mas_bottom).offset(10);
        make.centerX.equalTo(self.image);
    }];
    //按钮布局
    [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(13);
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(10);
    }];
}

#pragma mark - 按钮点击事件
- (void)buttonClicked:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(didClickedButtonOnCollectionCell:)]) {
        [self.delegate didClickedButtonOnCollectionCell:self];
    }
}

@end
