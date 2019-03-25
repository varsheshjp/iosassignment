//
//  Employee+CoreDataProperties.m
//  
//
//  Created by Varshesh on 3/24/19.
//
//  This file was automatically generated and should not be edited.
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Employee"];
}

@dynamic address;
@dynamic employeeid;
@dynamic gender;
@dynamic name;
@dynamic position;

@end
