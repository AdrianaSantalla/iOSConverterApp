# iOSConverterApp
Application to conver units of area, lenght and temperature

Application usage:

1. Enter the data to convert in the text field.
2. Tap outside the textfield to dismiss the keyboard.
3. Select the type of measurement.
4. Select the units of conversion.

The application converts the input data while typing on the text field and also when selectin different units of conversion and type of mesurement. If the data has an incorrect format, the application show a error message.

In the ViewController, the decimal keyboard is selected for the input. If a normal keyboard is needed, this line should be commented.

> // COMMENT NEXT LINE IF NORMAL KEYBOARD IS REQUIRED
> _dataField.keyboardType = UIKeyboardTypeDecimalPad;
