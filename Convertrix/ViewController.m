//
//  ViewController.m
//  Convertrix
//
//  Created by Adriana on 09/06/16.
//  Copyright © 2016 EPITA. All rights reserved.
//

#import "ViewController.h"
#import "ConverterCore.h"

@interface ViewController () {
    NSArray *mesures;
    NSArray *area;
    NSArray *length;
    NSArray *temperature;
    NSArray *fromToData;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // TextField keyboard type numeric
    // COMMENT NEXT LINE IF NORMAL KEYBOARD IS REQUIRED
    _dataField.keyboardType = UIKeyboardTypeDecimalPad;
    // Keyboard dismiss
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
    
    // Data mesures initialization
    mesures = @[@"Area", @"Lenght", @"Temperature"];
    // Data area initialization
    area = @[@"Square kilometer", @"Square meter", @"Square foot"];
    // Data length initialization
    length = @[@"Meter", @"Kilometer", @"Mile", @"Foot"];
    // Data temperature initialization
    temperature = @[@"Celsius", @"Fahrenheit", @"Kelvin"];
    
    // Initial value for second picker
    fromToData = area;

    // Mesure picker connect data
    _mesure.dataSource = self;
    _mesure.delegate = self;
    // FromTo picker connect data
    _fromTo.dataSource = self;
    _fromTo.delegate = self;
    // Identification of each data picker
    _mesure.tag = 0;
    _fromTo.tag = 1;
    
    // Data textField delegate
    _dataField.delegate = self;
    
    // Initializing converter
    conver = [[ConverterCore alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissKeyboard {
    [_dataField resignFirstResponder];
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if (pickerView.tag == 0)
        return 1;
    else
        return 2;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView.tag == 0)
        return [mesures count];
    else
        return [fromToData count];
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView.tag == 0)
        return [mesures objectAtIndex:row];
    else
        return [fromToData objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self dismissKeyboard];
    if(pickerView.tag == 0) {
        switch (row) {
            case 0:
                fromToData = area;
                break;
            case 1:
                fromToData = length;
                break;
            case 2:
                fromToData = temperature;
                break;
        }
        [_fromTo reloadAllComponents];
        _result.textColor = [UIColor blackColor];
        if ([self validateInput:_dataField.text])
            _result.text = _dataField.text;
        else
            [self displayError];
    }
    [self convert];
    
}

- (void) convert {
    _result.textColor = [UIColor blackColor];
    if ([self validateInput:_dataField.text]) {
        NSInteger from = [_fromTo selectedRowInComponent:0];
        NSInteger to = [_fromTo selectedRowInComponent:1];
        if (from == to)
            _result.text = _dataField.text;
        else {
            double result = [conver performConversion:_dataField.text from:[fromToData objectAtIndex:from] to:[fromToData objectAtIndex:to]];
            _result.text = [NSString stringWithFormat:@"%.4f",result];
        }
    }
    else
        [self displayError];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [self convert];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self convert];
}

- (BOOL) validateInput:(NSString *)data {
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '^[-+]?[0-9]*.?[0-9]+$'"];
    return [predicate evaluateWithObject:data];
}

- (void) displayError {
    _result.text = @"ERROR";
    _result.textColor = [UIColor redColor];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

@end
