//
//  ViewController.m
//  ASJCollectionViewFillLayoutExample
//
//  Created by sudeep on 25/11/15.
//  Copyright © 2015 sudeep. All rights reserved.
//

#import "ViewController.h"
#import "ASJCollectionViewFillLayout.h"

static NSInteger const kNoOfItems = 5;
static NSString *const reuseIdentifier = @"cell";

@interface ViewController () <ASJCollectionViewFillLayoutDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *aCollectionView;
@property (strong, nonatomic) ASJCollectionViewFillLayout *aLayout;
@property (copy, nonatomic) NSArray *objects;
@property (weak, nonatomic) IBOutlet UISegmentedControl *directionSegmentedControl;

- (void)setup;
- (void)setupCollectionViewData;
- (void)setupLayout;
- (IBAction)directionChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self setup];
}

#pragma mark - Setup

- (void)setup
{
  [self setupCollectionViewData];
  [self setupLayout];
}

- (void)setupLayout
{
  _aLayout = [[ASJCollectionViewFillLayout alloc] init];
  _aLayout.delegate = self;
  _aLayout.direction = ASJCollectionViewFillLayoutVertical;
    _aLayout.setItemLengthType = YES;
  _aCollectionView.collectionViewLayout = _aLayout;
}

- (void)setupCollectionViewData
{
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  for (int i=0; i<kNoOfItems; i++)
  {
    [temp addObject:[NSString stringWithFormat:@"Item %d", i+1]];
  }
  _objects = [NSArray arrayWithArray:temp];
}

- (IBAction)directionChanged:(id)sender
{
  NSInteger selectedSegmentIndex = _directionSegmentedControl.selectedSegmentIndex;
  _aLayout.direction = (ASJCollectionViewFillLayoutDirection)selectedSegmentIndex;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
  return _objects.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
  UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
  cell.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
  UILabel *lbl = (UILabel *)[cell viewWithTag:1];
  lbl.text = _objects[indexPath.row];
  return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *message = [NSString stringWithFormat:@"Item %ld tapped", (long)indexPath.row + 1];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Tap" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
  [alert show];
}

#pragma mark - ASJCollectionViewFillLayoutDelegate

- (NSInteger)numberOfItemsInSide
{
  return 1;
}

- (CGFloat)itemLength
{
  return 100.0f;
}

- (NSArray *)itemArrayLength
{
    
    NSMutableArray *arrayMLength = [NSMutableArray new];
    
    //NSMutableArray *mulArr = [NSMutableArray new];
    //[mulArr addObject:[NSDecimalNumber numberWithInt:number]];
    
    for (int i = 0; i < 5; i++) {
        
        //CGFloat length = [self heightForText:[[objectMuseumsWithTags[i] objectForKey:@"basic_info"] objectForKey:@"description"]];
        float dlength = (float)262.0f;
        float dlengthAndFix = dlength  + 262.0f;
        //[arrayMLength addObject:@"200"];
        [arrayMLength addObject:[NSString stringWithFormat:@"%f", dlengthAndFix]];
        
    }
    
    return [arrayMLength copy];
    
    //NSArray  *obj = @[@"100", @"200", @"120", @"400", @"90"];
    //return obj;
}

- (CGFloat)itemSpacing
{
  return 5.0f;
}

@end
