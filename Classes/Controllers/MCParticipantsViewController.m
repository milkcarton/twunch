//
//  MCParticipantsController.m
//  Twunch
//
//  Created by Simon Schoeters on 20/08/09.
//  Creative commons milkcarton 2009. Some rights reserved.
//

#import "MCParticipantsViewController.h"
#import "MCOverviewTwunchTableView.h"
#import "MCParticipantsView.h"
#import "MCParticipantWithNameButton.h"

@implementation MCParticipantsViewController

@synthesize twunch;
@synthesize webController;

#pragma mark Overridden methods

- (void)loadView {
	[super loadView];
	self.title = @"Participants";
	
	MCOverviewTwunchTableView *tableView = [[MCOverviewTwunchTableView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame] style:UITableViewStylePlain];
	tableView.delegate = self;
	tableView.backgroundColor = [UIColor clearColor];
	tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = tableView;
	[tableView release];
}

#pragma mark Delegation methods for the UITableViewController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 416;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	MCParticipantsView *view = [[MCParticipantsView alloc] initWithFrame:CGRectZero twunch:twunch];
	view.backgroundColor = [UIColor clearColor];
	view.controller = self;
	return view;
}

#pragma mark Personal methods

- (void)goToWebView:(id)sender {
	webController.participant = ((MCParticipantWithNameButton *) sender).participant;
	[self.navigationController pushViewController:webController animated:YES];
}

@end
