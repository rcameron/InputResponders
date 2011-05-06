/*
 *  PickerResponderView.m
 *  InputResponders
 *
 *  Copyright 2011 Rich Cameron
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

#import "PickerResponderView.h"

static const CGFloat kToolbarHeight = 40.0f;

@implementation PickerResponderView

@synthesize inputView=_inputView;
@synthesize inputAccessoryView=_inputAccessoryView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // Make our view act as a transparent overlay
        [self setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.0f]];
        
        [UIView animateWithDuration:0.3f 
                         animations:^(void) {
                             [self setBackgroundColor:[UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.5f]]; 
                         }];
                
        // Point the newly writeable inputView at a UIPickerView
        UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:frame];
        [pickerView setShowsSelectionIndicator:YES];
        [self setInputView:pickerView];
        
        [pickerView setDelegate:self];
        [pickerView setDataSource:self];
        
        [pickerView release];
        
        // Assemble a UIToolbar to place on top of the picker view
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, frame.size.width, kToolbarHeight)];
        
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" 
                                                                       style:UIBarButtonItemStyleDone 
                                                                      target:self 
                                                                      action:@selector(dismiss)];
        
        [toolbar setItems:[NSArray arrayWithObject:doneButton]];
        
        [self setInputAccessoryView:toolbar];
        [toolbar release];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

#pragma mark - UIResponder override
// Allow this view to become first responder
- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - Action methods
- (void)dismiss {
    // Set delegate and data source to nil
    UIPickerView *pickerView = (UIPickerView *)self.inputView;
    [pickerView setDelegate:nil];
    [pickerView setDataSource:nil];
    
    // remove ourselves
    [self removeFromSuperview];
}

#pragma mark - UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 20;
}

#pragma mark - UIPickerViewDelegate methods
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 40.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return 100.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [NSString stringWithFormat:@"%i", row];
}

@end
