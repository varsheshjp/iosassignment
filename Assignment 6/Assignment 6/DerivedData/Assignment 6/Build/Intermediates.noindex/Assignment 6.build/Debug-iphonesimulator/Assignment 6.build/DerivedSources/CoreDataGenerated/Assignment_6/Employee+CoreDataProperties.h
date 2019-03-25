//
//  Employee+CoreDataProperties.h
//  
//
//  Created by Varshesh on 3/24/19.
//
//  This file was automatically generated and should not be edited.
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *address;
@property (nullable, nonatomic, copy) NSString *employeeid;
@property (nullable, nonatomic, copy) NSString *gender;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *position;

@end

NS_ASSUME_NONNULL_END
