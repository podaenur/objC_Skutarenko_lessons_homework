//
//  EVADisease.h
//  lesson9
//
//  Created by Eugeny on 21/07/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_OPTIONS(NSUInteger, EVADiseaseSymptom) {
  EVADiseaseSymptomTemperature,
  EVADiseaseSymptomUnknown
};

typedef NS_OPTIONS(NSUInteger, EVABodyPart) {
  EVABodyPartHead,
  EVABodyPartNeck,
  EVABodyPartBreast,
  EVABodyPartStomach,
  EVABodyPartLeg,
  EVABodyPartArm
};

@interface EVADisease : NSObject

@end
