//
//  EVAAbstractField.h
//  lesson40
//
//  Created by Evgeniy Akhmerov on 02/07/16.
//  Copyright © 2016 Evgeniy Akhmerov. All rights reserved.
//

@import UIKit;


@protocol EVAAbstractFieldConfigurable <NSObject>

- (void)setup;

@end


@interface EVAAbstractField : UITextField <EVAAbstractFieldConfigurable>

@end
