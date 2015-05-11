
#import "MyTableVC.h"
#import "MyTableCell.h"


@interface MYTableVC ()
@property (nonatomic, strong) NSArray *feedEntries;
@property (nonatomic, strong) MyTableCell *prototypeCell;

@end

static NSString *cellID = @"MessageCell";

@implementation MYTableVC

- (MyTableCell *)prototypeCell
{
    if (!_prototypeCell)
    {
        _prototypeCell = [self.tableView dequeueReusableCellWithIdentifier:cellID];
    }
    return _prototypeCell;
}

#pragma mark - Lifecycle Methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.feedEntries = @[@"Message one",
                         @"This is message two, larger",
                         @"This is message three.  It is a reasonable size.",
                         @"This is message four.  It is a much larger size because we needed to test the wrap around of large messages",
                         @"This is message four.  It is a much larger size because we needed to test the wrap around of large messages. This is message four.  It is a much larger size because we needed to test the wrap around of large messages. This is message four.  It is a much larger size because we needed to test the wrap around of large messages. This is message four.  It is a much larger size because we needed to test the wrap around of large messages. This is message four.  It is a much larger size because we needed to test the wrap around of large messages. This is message four.  It is a much larger size because we needed to test the wrap around of large messages.",
                         @"Message five"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.feedEntries.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableCell *cell = (MyTableCell *) [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[MyTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.lineLabel.text = self.feedEntries[indexPath.row];
    
    return cell;
}

#pragma mark - UITableview Delegate
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.prototypeCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.tableView.bounds), CGRectGetHeight(self.prototypeCell.bounds));
    self.prototypeCell.lineLabel.text = self.feedEntries[indexPath.row];

    [self.prototypeCell setNeedsLayout];
    [self.prototypeCell layoutIfNeeded];
    
    CGSize size = [self.prototypeCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    NSLog(@"size of %.0ld is %.0f", (long)indexPath.row, size.height);
    return size.height+1;
}

@end
