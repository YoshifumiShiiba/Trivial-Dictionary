//
//  History.h
//  InDict
//
//  Created by Yoshifumi Shiiba on 12/10/12.
//  Copyright (c) 2012 Yoshifumi Shiiba.
//

#import <Foundation/Foundation.h>

@interface History : NSObject

@property NSArray* terms;

-(id)init;
-(void) add:(NSString*)term;

-(NSArray*) reversedTerm;

@end
