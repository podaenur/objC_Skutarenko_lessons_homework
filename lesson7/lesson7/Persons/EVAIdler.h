//
//  EVAIdler.h
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAPerson.h"

@interface EVAIdler : EVAPerson

@property (nonatomic, assign) CGFloat fatness;
@property (nonatomic, assign) CGFloat idleTimeInHours;

- (void)displaySelfAdditionalInfo;

@end
