//
//
//  Created by JackieHoo on 3/10/14.
//  Copyright (c) 2015 JackieHoo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern const CGFloat kBROptionsItemDefaultItemHeight;


@interface HooFlowerItem : UIButton

@property (nonatomic, readonly) NSInteger index;
@property (nonatomic, assign) CGPoint defaultLocation;
- (instancetype)initWithIndex:(NSInteger)index;

@end
