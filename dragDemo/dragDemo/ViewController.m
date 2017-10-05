//
//  ViewController.m
//  dragDemo
//
//  Created by mist on 30/09/2017.
//  Copyright © 2017 telework. All rights reserved.
//

#import "ViewController.h"

#import "XWDragCellCollectionView.h"

#import "TWServiceFlowLayout.h"

#import "TWServiceCollectionCell.h"

#import "MKReuseView.h"

#import "MKModel.h"

NSString *rid = @"reuseIdentity";

@interface ViewController () <XWDragCellCollectionViewDelegate, XWDragCellCollectionViewDataSource>

@property (nonatomic, strong) XWDragCellCollectionView *collectionView;

@property (nonatomic, strong) NSArray *moreApp;

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.collectionView getFirstPoints];
}

#pragma mark - 设置界面
- (void)setupUI{
    //假数据
    NSMutableArray *arrOutside = [NSMutableArray array];
    NSArray *colorArr = @[[UIColor redColor], [UIColor blueColor], [UIColor greenColor]];
    for (int i = 0; i < 3; ++i) {
        NSMutableArray *arrInside = [NSMutableArray array];
        for (int j = 0; j < 4; ++j) {
            MKModel *model = [MKModel new];
            model.title = [NSString stringWithFormat:@"淹没%d--%d", i, j];
            model.backGroundColor = colorArr[i];
            [arrInside addObject:model];
        }
        [arrOutside addObject:arrInside];
    }
    self.moreApp = arrOutside;
    
    
    //collecitonView
    self.collectionView = [[XWDragCellCollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[TWServiceFlowLayout new]];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[TWServiceCollectionCell class] forCellWithReuseIdentifier:rid];
    [self.collectionView registerClass:[MKReuseView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV"];
    [self.view addSubview:self.collectionView];
}

#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.moreApp.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.moreApp[section] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    TWServiceCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:rid forIndexPath:indexPath];
    cell.data = self.moreApp[indexPath.section][indexPath.item];
    return cell;
}

- (NSArray *)dataSourceArrayOfCollectionView:(XWDragCellCollectionView *)collectionView{
    return self.moreApp;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    MKReuseView *reuseV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headV" forIndexPath:indexPath];
    return reuseV;
}

#pragma mark - 代理方法
- (void)dragCellCollectionView:(XWDragCellCollectionView *)collectionView newDataArrayAfterMove:(NSArray *)newDataArray{
    self.moreApp = newDataArray;
}

//- (NSArray<NSIndexPath *> *)excludeIndexPathsWhenMoveDragCellCollectionView:(XWDragCellCollectionView *)collectionView{
//    return @[[NSIndexPath indexPathForItem:[self.moreApp[0] count] - 1 inSection:0], [NSIndexPath indexPathForItem:[self.moreApp[1] count] - 1 inSection:1], [NSIndexPath indexPathForItem:[self.moreApp[2] count] - 1 inSection:2]];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
