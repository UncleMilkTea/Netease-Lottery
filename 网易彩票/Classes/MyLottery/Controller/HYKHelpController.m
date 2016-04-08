
//
//  HYKHelpController.m
//  网易彩票
//
//  Created by 侯玉昆 on 16/1/21.
//  Copyright © 2016年 侯玉昆. All rights reserved.
//

#import "HYKHelpController.h"
#import "HYKHelp.h"
#import "HYKWebController.h"
#import "HYKNavigationController.h"

@interface HYKHelpController ()

@property (strong,nonatomic) NSArray *dataArray;

@end

@implementation HYKHelpController

//懒加载
- (NSArray *)dataArray {
    
    if (nil == _dataArray) {
        
        NSData *data = [NSData dataWithContentsOfFile:
                              
                              [[NSBundle mainBundle]
                               
                               pathForResource:@"help.json"
                               
                               ofType:nil]];
        
        NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (NSDictionary *object in tempArray) {
            
            HYKHelp *model= [HYKHelp modelWithDict:object];
            
            [mutableArray addObject:model];
        }
        
        _dataArray =mutableArray;
    }
    
    return _dataArray;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"常见问题";
    
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (nil == cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        
        cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"arrow_right"]];
    }
    
    HYKHelp *help = self.dataArray[indexPath.row];
    
    cell.textLabel.text = help.title;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HYKWebController *web  =[[HYKWebController alloc]init];
    
    web.selectHelp = self.dataArray[indexPath.row];
    
    HYKNavigationController *nav = [[HYKNavigationController alloc]initWithRootViewController:web];

    UIBarButtonItem *closeItem  =[[UIBarButtonItem alloc]initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(close)];

    web.navigationItem.leftBarButtonItem  =closeItem;
    
    [self presentViewController:nav animated:YES completion:nil];

}


- (void)close {

    [self dismissViewControllerAnimated:YES completion:nil];

}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
