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
@property (nonatomic, strong) UIImage *stateImage;

- (void)setTitle:(NSString *)title;
- (void)setDescription:(NSString *)description;
- (CALayer *)stateImageViewlayer;

#pragma mark - Event

- (void)addOneTapGestureWithTarget:(id)target action:(SEL)selector;

@end
