//
//  UICollectionVIewClass.m
//  CustomUICollectionView
//
//  Created by lalaleelala on 3/13/16.
//  Copyright © 2016 lalaleelala. All rights reserved.
//

#import "UICollectionVIewClass.h"

@implementation UICollectionVIewClass

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)awakeFromNib {
    myArray = [NSArray arrayWithObjects:@"Evan",@"Tank",@"Sean",@"Eric", nil] ;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"UICollectionViewCustomizedCellXib" bundle:nil] forCellWithReuseIdentifier:@"UICollectionViewCustomizedCellXib"];
//    [_myCollectionView registerNib:[UINib nibWithNibName:@"CustomizedUICollectionReusableViewHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myCustomizedUICollectionReusableViewHeader"];
    
//Regular
    [_myCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];
//End Regular
}


//Create CollectionView
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return myArray.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return myArray.count;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCustomizedCell * cell = (UICollectionViewCustomizedCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCustomizedCellXib" forIndexPath:indexPath];
    [cell loadCell:myArray[indexPath.row]];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    UICollectionReusableView *reusableView = nil;
//    CustomizedUICollectionReusableViewHeader *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"myCustomizedUICollectionReusableViewHeader" forIndexPath:indexPath];
//    if (kind == UICollectionElementKindSectionHeader) {
//        NSString *headerTitle = [NSString stringWithFormat:@"%@ is cool",myArray[indexPath.section]];
//        [headerView loadHeader:headerTitle];
//        reusableView = headerView;
//    }
//    return reusableView;
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];

        for (UIView *subUIView in headerView.subviews) {
            [subUIView removeFromSuperview];
        }
        NSString *headerTItle = [NSString stringWithFormat:@"%@ is cool", myArray [indexPath.section]];
        NSLog(@"%@",myArray[indexPath.section]);
        UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
        headerView.backgroundColor = [UIColor whiteColor];
        headerLabel.text = headerTItle;
        [headerView addSubview:headerLabel];
        reusableview = headerView;
    }
    return reusableview;
}
@end
