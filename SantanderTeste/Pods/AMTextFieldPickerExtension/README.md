# AMTextFieldPickerExtension
A `UITextField` extension written in Swift that makes it easy to use a `UIPickerView` for selection.

## Installation

`AMTextFieldPickerExtension` is available through CocoaPods. Just add this line to your `Podfile`:
    pod 'AMTextFieldPickerExtension'

## Usage

`AMTextFieldPickerExtension` adds `pickerView` and `datePicker` properties to `UITextField`. When these properties are set, the `UITextField`'s `inputView` is set and a `UIToolbar`, containing a "Done" button, is also set to the `inputAccessoryView` property.

When the "Done" button is pressed, the text field's text is set to the selected title in the `pickerView` for the first component or the date selected. Setting the `dateFormat` property on `UITextField` allows you to configure how the selected date will display in the text field.

## Example

First, create a `UIPickerView`. You'll need to implement the `UIPickerViewDataSource` and `UIPickerViewDelegate`.

    let pickerView = UIPickerView
    pickerView.dataSource = self
    pickerView.delegate = self

Then, just set your `UIPickerView` to the `pickerView` property on a `UITextField`.

    myTextField.pickerView = pickerView

And you're done!

## Coming Soon:

- Support for titles using `NSAttributedString`
- Support for multiple `UIPickerView` components
