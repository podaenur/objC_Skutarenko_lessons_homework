//
//  EVAAnimal.h
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EVAAnimal : NSObject

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) NSString *nickname;

+ (instancetype)createAnimalWithNickname:(NSString *)aNickname color:(UIColor *)aColor;

- (void)movement;
- (void)displaySelf;
@end
