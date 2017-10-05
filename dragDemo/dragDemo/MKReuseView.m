//
//  MKReuseView.m
//  dragDemo
//
//  Created by MIST on 01/10/2017.
//  Copyright © 2017 telework. All rights reserved.
//

#import "MKReuseView.h"

@implementation MKReuseView

-  (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    self.backgroundColor = [UIColor yellowColor];
}

@end
