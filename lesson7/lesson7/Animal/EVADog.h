//
//  EVADog.h
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAAnimal.h"
#import "EVAJumpersProtocol.h"
#import "EVASwimmersProtocol.h"

@interface EVADog : EVAAnimal <EVAJumpersProtocol>

@end

@interface EVADog () <EVASwimmersProtocol>

@end