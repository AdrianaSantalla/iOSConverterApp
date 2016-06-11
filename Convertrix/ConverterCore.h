//
//  ConverterCore.h
//  Convertrix
//
//  Created by Adriana on 10/06/16.
//  Copyright © 2016 EPITA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConverterCore : NSObject

-(double) performConversion:(NSString *) toConvert from:(NSString *) from to:(NSString *) to;

@end
