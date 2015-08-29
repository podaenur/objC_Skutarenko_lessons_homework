//
//  EVADoctorDelegate.h
//  lesson9
//
//  Created by Eugeny on 21/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EVADoctor;

@protocol EVADoctorDelegate <NSObject>

- (void)patientFeelsBad:(id<EVADoctorDelegate>)aPatient;

@optional
- (void)doctor:(EVADoctor *)aDoctor treatmentDidRecommended:(NSDictionary *)userInfo;
@end
