//
//  ViewController.h
//  Convertrix
//
//  Created by Adriana on 09/06/16.
//  Copyright © 2016 EPITA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConverterCore.h"

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate, UITextFieldDelegate>
{
    ConverterCore *conver;
}

@property (weak, nonatomic) IBOutlet UITextField *dataField;

@property (weak, nonatomic) IBOutlet UIPickerView *mesure;

@property (weak, nonatomic) IBOutlet UIPickerView *fromTo;

@property (weak, nonatomic) IBOutlet UILabel *result;


@end

