//
//  AddToDoItemViewController.m
//  ToDoListApp
//
//  Created by Aasare on 24/08/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "AddToDoItemViewController.h"


@interface AddToDoItemViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@end

@implementation AddToDoItemViewController



- (void)viewDidLoad {
    [super viewDidLoad];
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if (sender != self.saveButton) return;
    if (self.textField.text.length > 0) {
        self.toDoItems = [[ToDoItem alloc] init];
        self.toDoItems.itemName = self.textField.text;
        self.toDoItems.completed = NO;
    }
}


@end
