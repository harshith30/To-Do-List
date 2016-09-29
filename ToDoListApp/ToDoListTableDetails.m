//
//  ToDoListTableDetails.m
//  ToDoListApp
//
//  Created by Harshith on 24/08/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "ToDoListTableDetails.h"
#import "ToDoItem.h"
#import "AddToDoItemViewController.h"

@interface ToDoListTableDetails ()
@property NSMutableArray *toDoItems;
@end

@implementation ToDoListTableDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc]init];
    [self loadInitialData];
}

- (void)loadInitialData {
    
    
    ToDoItem *item1 = [[ToDoItem alloc] init];
    item1.itemName = @"Buy milk";
    [self.toDoItems addObject:item1];
    ToDoItem *item2 = [[ToDoItem alloc] init];
    item2.itemName = @"Buy eggs";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.toDoItems count];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    // retrieve the source view controller—the controller you’re unwinding from
    AddToDoItemViewController *source = [segue sourceViewController];

    // Retrieve the value of the controller’s toDoItem property.
    ToDoItem *item = source.toDoItems;
    
    //  check whether the item exists.
    if (item != nil) {
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }

}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    cell.textLabel.text = toDoItem.itemName;
    
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    Add the following code to deselect the cell immediately after selection
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row];
    tappedItem.completed = !tappedItem.completed;
    
    //   Tell the table view to reload the row whose data you just updated.
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    
}

// To delete a perticular item

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Remove the row from data model
    [self.toDoItems  removeObjectAtIndex:indexPath.row];
    
    // Request table view to reload
    [tableView reloadData];
}

@end
