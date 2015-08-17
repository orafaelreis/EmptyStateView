# EmptyStateView
It is a custom view for empty state from the UX perspective. It means, instead show some alertView or block the menu entries you should delight users. It will be useful when there's no data yet to show, after users clears out their content, or runs into an issue.


![EmptyStateView](https://www.dropbox.com/s/2dth3irrh8voage/emptyState.png?dl=1)


## Manual Installation

This repository contains a demonstration. So, copy only 'EmptyStateView' folder into your Xcode project. It contains the EmptyStateView.h and EmptyStateView.m files.

## How To Use

`EmptyStateView` is a custom UIView with an image, title and description text.
It will look as simple as this:

```objective-c
emptyView = [[EmptyStateView alloc] initWithFrame:self.view.frame];
[emptyView addTitle:@"There is no Users"];
[emptyView addImage:[UIImage imageNamed:@"empty-state-users"] withDistance:10.f];
[emptyView addDescription:@"There's no Content!" withDistance:20.f];

[self.view addSubview: emptyView];
```

It is possible customize the layer of the imageView:

```objective-c
emptyView.stateImageViewlayer.cornerRadius = 64.f;
emptyView.stateImageViewlayer.borderColor = [UIColor blackColor].CGColor;
emptyView.stateImageViewlayer.borderWidth = 2.f;
```

You can, additionaly, add action target when user touch the view:

```objective-c
[emptyView addOneTapGestureWithTarget:self action:@selector(loadNextViewController)];
```

## Credits

the intent of this class is to follow good practices observed in the article [Why empty states deserve more design time](https://medium.com/@InVisionApp/why-empty-states-deserve-more-design-time-44b5adc7eb52).
It was written by Dina Chaiffetz and was shared with me by Pedro Guedes, @guedesign.