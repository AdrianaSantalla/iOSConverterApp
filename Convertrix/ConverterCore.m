//
//  ConverterCore.m
//  Convertrix
//
//  Created by Adriana on 10/06/16.
//  Copyright © 2016 EPITA. All rights reserved.
//

#import "ConverterCore.h"

@implementation ConverterCore

-(double) performConversion:(NSString *)toConvert from:(NSString *) from to:(NSString *) to {
    double result = [toConvert doubleValue];
    // Area
    if ([from isEqualToString:@"Square kilometer"]) {
        if ([to isEqualToString:@"Square meter"])
            result = [self squareKilometerToSquareMeter:result];
        if ([to isEqualToString:@"Square foot"])
            result = [self squareKilometerToSquareFoot:result];
    }
    if ([from isEqualToString:@"Square meter"]) {
        if ([to isEqualToString:@"Square kilometer"])
            result = [self squareMeterToSquareKilometre:result];
        if ([to isEqualToString:@"Square foot"])
            result = [self squareMeterToSquareFoot:result];
    }
    if ([from isEqualToString:@"Square foot"]) {
        if ([to isEqualToString:@"Square kilometer"])
            result = [self squareFootToSquareKilometre:result];
        if ([to isEqualToString:@"Square meter"])
            result = [self squareFootToSquareMeter:result];
    }
    //Length
    if ([from isEqualToString:@"Meter"]) {
        if ([to isEqualToString:@"Kilometer"])
            result = [self meterToKilometer:result];
        if ([to isEqualToString:@"Mile"])
            result = [self meterToMile:result];
        if ([to isEqualToString:@"Foot"])
            result = [self meterToFoot:result];
    }
    if ([from isEqualToString:@"Kilometer"]) {
        if ([to isEqualToString:@"Meter"])
            result = [self kilometerToMeter:result];
        if ([to isEqualToString:@"Mile"])
            result = [self kilometerToMile:result];
        if ([to isEqualToString:@"Foot"])
            result = [self kilometerToFoot:result];
    }
    if ([from isEqualToString:@"Mile"]) {
        if ([to isEqualToString:@"Meter"])
            result = [self mileToMeter:result];
        if ([to isEqualToString:@"Kilometer"])
            result = [self mileTokilometer:result];
        if ([to isEqualToString:@"Foot"])
            result = [self mileToFoot:result];
    }
    if ([from isEqualToString:@"Foot"]) {
        if ([to isEqualToString:@"Meter"])
            result = [self footToMeter:result];
        if ([to isEqualToString:@"Kilometer"])
            result = [self footTokilometer:result];
        if ([to isEqualToString:@"Mile"])
            result = [self footToMile:result];
    }
    //Temperature
    if ([from isEqualToString:@"Celsius"]) {
        if ([to isEqualToString:@"Fahrenheit"])
            result = [self celsiusToFahrenheit:result];
        if ([to isEqualToString:@"Kelvin"])
            result = [self celsiusToKelvin:result];
    }
    if ([from isEqualToString:@"Fahrenheit"]) {
        if ([to isEqualToString:@"Celsius"])
            result = [self fahrenheitToCelsius:result];
        if ([to isEqualToString:@"Kelvin"])
            result = [self fahrenheitToKelvin:result];
    }
    if ([from isEqualToString:@"Kelvin"]) {
        if ([to isEqualToString:@"Celsius"])
            result = [self kelvinToCelsius:result];
        if ([to isEqualToString:@"Fahrenheit"])
            result = [self kelvinToFahrenheit:result];
    }
        
    return result;
}

-(double) squareKilometerToSquareMeter:(double) toConvert {
    return toConvert * pow(1000,2);
}

-(double) squareKilometerToSquareFoot:(double) toConvert {
    return toConvert * pow(3280.84,2);
}

-(double) squareMeterToSquareKilometre:(double) toConvert {
    return toConvert / pow(1000,2);
}

-(double) squareMeterToSquareFoot:(double) toConvert {
    return toConvert * pow(3.28084,2);
}

-(double) squareFootToSquareKilometre:(double) toConvert {
    return toConvert / pow(3280.84,2);
}

-(double) squareFootToSquareMeter:(double) toConvert {
    return toConvert / pow(3.28084,2);
}

-(double) meterToKilometer:(double) toConvert {
    return toConvert / 1000;
}

-(double) meterToMile:(double) toConvert {
    return toConvert / 1609.34;
}

-(double) meterToFoot:(double) toConvert {
    return toConvert * 3.28084;
}

-(double) kilometerToMeter:(double) toConvert {
    return toConvert * 1000;
}

-(double) kilometerToMile:(double) toConvert {
    return toConvert / 1.60934;
}

-(double) kilometerToFoot:(double) toConvert {
    return toConvert * 3280.84;
}

-(double) mileToMeter:(double) toConvert {
    return toConvert * 1609.34;
}

-(double) mileTokilometer:(double) toConvert {
    return toConvert * 1.60934;
}

-(double) mileToFoot:(double) toConvert {
    return toConvert * 5280;
}

-(double) footToMeter:(double) toConvert {
    return toConvert / 3.28084;
}

-(double) footTokilometer:(double) toConvert {
    return toConvert / 3280.84;
}

-(double) footToMile:(double) toConvert {
    return toConvert / 5280;
}

-(double) celsiusToFahrenheit:(double) toConvert {
    return (toConvert * 9 / 5) + 32;
}

-(double) celsiusToKelvin:(double) toConvert {
    return toConvert + 273.15;
}

-(double) fahrenheitToCelsius:(double) toConvert {
    return (toConvert - 32) * 5 / 9;
}

-(double) kelvinToCelsius:(double) toConvert {
    return toConvert - 273.15;
}

-(double) kelvinToFahrenheit:(double) toConvert {
    return ((toConvert - 273.15) * 9 / 5) + 32;
}

-(double) fahrenheitToKelvin:(double) toConvert {
    return ((toConvert - 32) * 5 / 9) + 273.15;
}

@end
