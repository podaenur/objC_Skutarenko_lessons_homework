//
//  EVARunner.h
//  lesson5
//
//  Created by Eugeny on 21/06/15.
//  Copyright (c) 2015 Eugeny Akhmerov. All rights reserved.
//

#import "EVAPerson.h"
#import "EVARunnersProtocol.h"
#import "EVAJumpersProtocol.h"

@interface EVARunner : EVAPerson <EVARunnersProtocol>

@end

@interface EVARunner () <EVAJumpersProtocol>

@end