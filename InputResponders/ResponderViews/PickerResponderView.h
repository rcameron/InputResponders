/*
 *  PickerResponderView.h
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

#import <UIKit/UIKit.h>


@interface PickerResponderView : UIView <UIPickerViewDelegate, UIPickerViewDataSource>
{}

/**
 *  Re-declare these UIResponder properties to allow write access
 */
@property (readwrite, retain) UIView          *inputView;
@property (readwrite, retain) UIView          *inputAccessoryView;

- (void)dismiss;

@end
