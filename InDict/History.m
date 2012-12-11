//
//  History.m
//  InDict
//
//  Created by Yoshifumi Shiiba on 12/10/12.
//  Copyright (c) 2012 Yoshifumi Shiiba.
//

#import "History.h"

@implementation History

static int const historySize = 100;
static NSString* const historyKeyForUserDefault = @"history";

-(id)init
{
    [self loadTerms];
    if(!self.terms)
    {
        self.terms = @[];
    }
    return self;
}

-(void)loadTerms
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    self.terms = [defs objectForKey:historyKeyForUserDefault];
}

-(void)saveTerms
{
    NSUserDefaults *defs = [NSUserDefaults standardUserDefaults];
    [defs setObject:self.terms forKey:historyKeyForUserDefault];
}

-(NSArray*) reversedTerm
{
    NSMutableArray *returnTerms = [NSMutableArray array];
    for (int i = self.terms.count-1; i >= 0; i -= 1)
    {
        [returnTerms addObject:[self.terms objectAtIndex:i]];
    }
    return [NSArray arrayWithArray:returnTerms];
}

-(void)add:(NSString*)term
{
    NSMutableArray *newTerms = [NSMutableArray array];
    for (NSString *val in self.terms)
    {
        if(![val isEqualToString:term])
        {
            [newTerms addObject:val];
        }
    }
    [newTerms addObject:term];
    
    if([newTerms count] > historySize)
    {
        [newTerms removeObjectAtIndex:0];
    }
    
    self.terms = [NSArray arrayWithArray:newTerms];
    [self saveTerms];
}

@end
