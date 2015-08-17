//
//  EmptyStateViewController.h
//  EmptyStateView
//
//  Created by admin on 14/08/15.
//  Copyright (c) 2015 orafaelreis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EmptyStateView : UIView


#pragma mark - Customizations

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong, setter=addImage:) UIImage *image;

#pragma mark - set
- (void)addTitle:(NSString *)title;
- (void)addTitle:(NSString *)title withDistance:(CGFloat)padding;
- (void)addDescription:(NSString *)description;
- (void)addDescription:(NSString *)description withDistance:(CGFloat)padding;
- (void)addImage:(UIImage *)stateImage withDistance:(CGFloat)padding;

#pragma mark - get
- (CALayer *)stateImageViewlayer;

#pragma mark - Event

- (void)addOneTapGestureWithTarget:(id)target action:(SEL)selector;

@end
