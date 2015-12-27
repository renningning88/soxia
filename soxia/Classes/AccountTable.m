//
//  AccountTable.m
//  soxia
//
//  Created by ningning on 15/12/26.
//  Copyright © 2015年 ningning. All rights reserved.
//

#import "AccountTable.h"

@implementation AccountTable
- (PYStructure *)structure{
    PYStructure *st = [[PYStructure alloc] init];
    [st addWithField:@"id" andType:PYStructureTypeAutoInc];
    [st addWithField:@"account" andType:PYStructureTypeNormalText];
    [st addWithField:@"mail" andType:PYStructureTypeNormalText];
    [st addWithField:@"pwd" andType:PYStructureTypeNormalText];
    [st addWithField:@"icon" andType:PYStructureTypeNormalText];

    return st;
}

- (NSString *)tableName{
return @"account";

}
@end
