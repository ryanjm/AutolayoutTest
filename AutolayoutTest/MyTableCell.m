
#import "MyTableCell.h"

@implementation MyTableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.contentView layoutIfNeeded];
    
    NSLog(@"width: %.0f", CGRectGetWidth(self.lineLabel.frame));
    self.lineLabel.preferredMaxLayoutWidth = CGRectGetWidth(self.lineLabel.frame);
    
    if (self.buttonView.frame.size.height < 60) {
        [self.buttonView setBackgroundColor:[UIColor blueColor]];
    }
    else if (self.buttonView.frame.size.height == 60.0) {
        [self.buttonView setBackgroundColor:[UIColor whiteColor]];
    }
    else {
        [self.buttonView setBackgroundColor:[UIColor orangeColor]];
    }
    
    [super layoutSubviews]; // required for the labels to be multiple lines
}

@end
