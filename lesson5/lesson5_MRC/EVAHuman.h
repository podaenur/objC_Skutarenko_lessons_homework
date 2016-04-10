//
//  EVAHuman.h
//  lesson5
//
//  Created by Evgeniy Akhmerov on 10/04/16.
//  Copyright © 2016 Eugeny Akhmerov. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *NSStringFromSex(int sexIndex);

@interface EVAHuman : NSObject

//"имя", "рост", "вес", "пол", а также будет иметь метод "передвижение".

@property (copy) NSString *name;
@property float height;
@property float weight;
@property int sex;

- (void)moving;
@end
