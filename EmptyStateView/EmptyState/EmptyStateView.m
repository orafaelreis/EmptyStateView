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

@end

const CGFloat paddingFromImageToTitle = 25.f;
const CGFloat paddingFromTitleToDescription = 12.f;


@implementation EmptyStateView

- (id)initWithFrame:(CGRect)frame  {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor clearColor];
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
        self.titleLabel.textColor = [UIColor grayColor];
        
        self.titleLabel.text = @"Title";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.numberOfLines = 2;
        [self addSubview:self.titleLabel];
        
        self.descriptionLabel = [[UILabel alloc] init];
        self.descriptionLabel.backgroundColor = [UIColor clearColor];
        self.descriptionLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
        self.descriptionLabel.textColor = [UIColor lightGrayColor];
        
        self.descriptionLabel.text = @"Put your description here";
        self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
        self.descriptionLabel.numberOfLines = 3;
        [self addSubview:self.descriptionLabel];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGRect rectOne = [self boundsForLabel:self.titleLabel];
    CGRect rectTwo = [self boundsForLabel:self.descriptionLabel];
    
    self.stateImageView.center = CGPointMake(self.frame.size.width/2, (self.frame.size.height/2) - self.stateImageView.frame.size.height/2);
    
    rectOne.origin.y = self.frame.size.height/2 - rectOne.size.height/2 + paddingFromImageToTitle;
    self.titleLabel.frame = CGRectMake(0.f,  rectOne.origin.y, self.frame.size.width, rectOne.size.height);

    self.descriptionLabel.frame = CGRectMake(0.f, CGRectGetMaxY(self.titleLabel.frame) + paddingFromTitleToDescription, self.frame.size.width, rectTwo.size.height);
    
}

#pragma mark - Customizations

- (void)setTitle:(NSString *)title{
    self.titleLabel.text = title;
}

- (void)setDescription:(NSString *)description{
    self.descriptionLabel.text = description;
}

- (void)setStateImage:(UIImage *)image{
    _stateImage = image;
    if (!_stateImageView) {
        CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
        _stateImageView = [[UIImageView alloc] initWithFrame:rect];
    }
    _stateImageView.image = image;
    _stateImageView.clipsToBounds = YES;
    [self addSubview:_stateImageView];
}

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

@end
