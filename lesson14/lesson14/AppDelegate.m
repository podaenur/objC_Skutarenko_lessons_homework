//
//  AppDelegate.m
//  lesson14
//
//  Created by Evgeniy Akhmerov on 30/08/15.
//  Copyright (c) 2015 us.L-develop. All rights reserved.
//

#import "AppDelegate.h"

static NSString *const sourceText = @"Mysterious murders occur in Libertyville. One by one, members of Buddy's gang are killed by Christine. Others who were hostile to Arnie or Christine also die. The police investigate the murders and become suspicious of Arnie. However, Arnie has an airtight alibi for each of the murders, since the car apparently acts on its own. Although the police find paint chips at the crime scenes that match Christine's color, they find no damage, bloodstains, or other evidence on the car, since Christine supernaturally repairs herself after each attack. Dennis and Leigh become suspicious not of Arnie, but of Christine. They try to find out as much as they can about the car and its previous owner. As their suspicions grow, they try to destroy the supernatural forces that appear to be in control of Christine and Arnie. The novel ends on an ambiguous note. Arnie's father is found dead in Christine, apparently from exhaust fumes. Arnie and his mother die in an auto accident: witnesses to the accident saw three people in the car before the crash, but only two bodies were found. In the meantime, Dennis and Leigh manage to destroy Christine in Darnell's using a huge, pink-coloured septic tanker truck, named Petunia, and Dennis is informed by a police detective that the remains were fed into the crusher in the back of the garage by two police officers, adding that one received a bad cut that needed stitches, and said \"it bit him\". Dennis ends the story proper with a salutation to his friend: In the epilogue, set about four years later, Dennis reports that he and Leigh attended college together, consummated their relationship (\"very satisfactorily\"), but ultimately went their separate ways. Dennis is a teacher in New Jersey, Leigh a housewife in New Mexico. The last page details that, in Los Angeles, Sandy Galton (one of Buddy's gang) has died a mysterious death when a car burst through the wall of the theater where he was working, instantly killing him. The final words of the book convey Dennis' horror as he contemplates the possibility that Christine repaired herself and pursued him, and now may be working her way east, targeting Leigh and LeBay's brother and sister, saving Dennis for last.";

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  NSUInteger lenght = sourceText.length;
  
  NSRange firstPart = NSMakeRange(0, lenght / 2);
  NSRange secondPart = NSMakeRange(firstPart.length,
                                   lenght - firstPart.length - 1);
  
  [self displayString:[sourceText substringWithRange:firstPart] metaInfo:@"first"];
  [self displayString:[sourceText substringWithRange:secondPart] metaInfo:@"second"];
  
  NSArray *breaked = [self breakStringBySentences:sourceText];
  NSArray *separated = [self separateArray:breaked byString:@"Christine"];
  
  NSMutableArray *separatedAndInverted = [NSMutableArray new];
  for (id obj in separated) {
    if ([self isItNotString:obj]) {
      continue;
    }
    
    [separatedAndInverted addObject:[self invertStringByWords:obj]];
  }
  
  NSString *changedCapitalisation = [self changeCapitalisationForString:sourceText];
  
  NSLog(@"%@\n", changedCapitalisation);
  
  return YES;
}

#pragma mark - Private

- (BOOL)isItNotString:(id)obj {
  return ![obj isKindOfClass:[NSString class]];
}

- (void)displayString:(NSString *)string metaInfo:(NSString *)header {
  NSLog(@"%@ part: \n%@\n", header, string);
  NSLog(@"symbols in %@ part: %d", header, string.length);
}

- (NSArray *)breakStringBySentences:(NSString *)source {
  return [[source componentsSeparatedByString:@". "] copy];
}

- (NSArray *)separateArray:(NSArray *)sourceArray byString:(NSString *)separator {
  NSMutableArray *result = [[NSMutableArray alloc] init];
  for (id obj in sourceArray) {
    if ([self isItNotString:obj]) {
      continue;
    }
    
    NSString *current = [NSString stringWithString:obj];
    NSRange range = [current rangeOfString:separator];
    if (range.length != 0) {
      [result addObject:current];
    }
  }
  return [result copy];
}

- (NSString *)invertStringByWords:(NSString *)source {
  NSMutableArray *sourceComponents = [[source componentsSeparatedByString:@" "] mutableCopy];
  NSInteger firstIndex = 0;
  NSUInteger lastIndex = sourceComponents.count - 1;
  while (lastIndex - firstIndex > 1) {
    [sourceComponents exchangeObjectAtIndex:firstIndex withObjectAtIndex:lastIndex];
    firstIndex++;
    lastIndex--;
  }
  
  NSMutableString *result = [NSMutableString new];
  for (id obj in sourceComponents) {
    if ([self isItNotString:obj]) {
      continue;
    }
    [result appendFormat:@"%@ ", obj];
  }
  
  NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
  return [result stringByTrimmingCharactersInSet:set];
}

- (NSString *)changeCapitalisationForString:(NSString *)source {
  NSMutableString *sourceCopy = [source mutableCopy];
  NSCharacterSet *set = [[NSCharacterSet letterCharacterSet] invertedSet];
  NSArray *components = [sourceCopy componentsSeparatedByCharactersInSet:set];
  
  for (id obj in components) {
    if ([self isItNotString:obj]) {
      continue;
    }
    
    if ([obj length] < 2) {
      continue;
    }
    
    NSRange rangeOfWordInSentence = [sourceCopy rangeOfString:obj];
    
    NSMutableString *currentWord = [[sourceCopy substringWithRange:rangeOfWordInSentence] mutableCopy];
    currentWord = [[currentWord lowercaseString] mutableCopy];
    
    NSString *lastSymbolInWord = [currentWord substringFromIndex:currentWord.length - 1];
    lastSymbolInWord = [lastSymbolInWord capitalizedString];
    
    NSRange lastSimbolRange = NSMakeRange(currentWord.length - 1, 1);
    
    [currentWord replaceCharactersInRange:lastSimbolRange withString:lastSymbolInWord];
    
    [sourceCopy replaceCharactersInRange:rangeOfWordInSentence withString:currentWord];
  }
  
  return [sourceCopy copy];
}

@end




