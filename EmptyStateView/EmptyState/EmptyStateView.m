//
//  EmptyStateViewController.m
//  EmptyStateView
//
//  Created by admin on 14/08/15.
//  Copyright (c) 2015 orafaelreis. All rights reserved.
//

#import "EmptyStateView.h"

@interface EmptyStateView()
@property (nonatomic, strong) UIImageView *stateImageView;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, assign) CGFloat height;
@end

const CGFloat paddingFromImageToTitle = 25.f;
const CGFloat paddingFromTitleToDescription = 12.f;

@implementation EmptyStateView

@synthesize height;

- (id)initWithFrame:(CGRect)frame  {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        height = 0.f;
        self.backgroundColor = [UIColor clearColor];
        self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.contentView];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        self.titleLabel.textColor = [UIColor grayColor];
        
        self.titleLabel.text = @"Title";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 2;
        [self.contentView addSubview:self.titleLabel]; //[self addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        self.descriptionLabel.backgroundColor = [UIColor clearColor];
        self.descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        self.descriptionLabel.textColor = [UIColor lightGrayColor];
        
        self.descriptionLabel.text = @"Put your description here";
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.numberOfLines = 3;
        [self.contentView addSubview:self.descriptionLabel]; //[self addSubview:self.descriptionLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    self.contentView.frame = CGRectMake(0.f, self.frame.size.height - height, self.frame.size.width, height);
    self.contentView.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height/2));
    self.stateImageView.center = CGPointMake(self.contentView.frame.size.width/2, self.stateImageView.center.y);
    return;    
}

#pragma mark - set Customizations

- (void)addTitle:(NSString *)title{
    self.titleLabel.text = title;
    
    CGRect rect = [self boundsForLabel:self.titleLabel];
    rect.size.width = self.frame.size.width;
    [self appendView:self.titleLabel withSize:rect.size];
}

- (void)addTitle:(NSString *)title withDistance:(CGFloat)padding{
    height += padding;
    [self addTitle:title];
}

- (void)addDescription:(NSString *)description{
    self.descriptionLabel.text = description;
    
    CGRect rect = [self boundsForLabel:self.descriptionLabel];
    rect.size.width = self.frame.size.width;
    [self appendView:self.descriptionLabel withSize:rect.size];
}

- (void)addDescription:(NSString *)description withDistance:(CGFloat)padding{
    height += padding;
    [self addDescription:description];
}

- (void)addImage:(UIImage *)image{
    _image = image;
    if (!_stateImageView) {
        _stateImageView = [[UIImageView alloc] init];
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        [self appendView:_stateImageView withSize:rect.size];
    }
    _stateImageView.image = image;
    _stateImageView.clipsToBounds = YES;
    [self.contentView addSubview:_stateImageView];
}

- (void)addImage:(UIImage *)image withDistance:(CGFloat)padding{
    height += padding;
    [self addImage:image];
}

#pragma mark - get

- (CALayer *)stateImageViewlayer{
    return self.stateImageView.layer;
}


#pragma mark - Events

- (void)addOneTapGestureWithTarget:(id)target action:(SEL)selector{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [self addGestureRecognizer:tapGesture];
}

#pragma mark - Util

- (CGRect) boundsForLabel:(UILabel *)label{
    NSDictionary *attributes = @{NSFontAttributeName: label.font};
    return [label.text boundingRectWithSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)
                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                  attributes:attributes
                                                     context:nil];
}

- (void) appendView: (UIView *)view withSize:(CGSize) size{
    CGRect rect = view.frame;
    rect.origin.y = height;
    rect.size = size;
    view.frame = rect;
    height += CGRectGetHeight(view.frame);
}

@end
