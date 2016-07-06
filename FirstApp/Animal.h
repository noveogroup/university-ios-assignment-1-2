//
//  Animal.h
//  FirstApp
//
//  Created by admin on 05/07/16.
//  Copyright © 2016 tanya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Life.h"

@protocol Animal <NSObject>

//добывает еду
-(void)eat:(Life *)food;

@end