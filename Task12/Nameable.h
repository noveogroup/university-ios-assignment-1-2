//
//  Nameable.h
//  Task12
//
//  Created by Sergey Plotnikov on 08.07.16.
//  Copyright © 2016 Sergey Plotnikov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Nameable <NSObject>

@property (nonatomic, readonly, copy) NSString *name;

@end
