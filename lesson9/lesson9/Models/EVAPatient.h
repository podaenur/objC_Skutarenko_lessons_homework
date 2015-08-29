//
//  EVAPatient.h
//  lesson9
//
//  Created by Eugeny on 21/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EVADoctorDelegate.h"

@interface EVAPatient : NSObject <EVADoctorDelegate>

@property (nonatomic, weak) id<EVADoctorDelegate> delegate;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSInteger doctorScore;
@end
