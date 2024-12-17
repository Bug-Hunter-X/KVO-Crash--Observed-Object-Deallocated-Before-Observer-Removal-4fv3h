To fix this, ensure that observers are always removed before the observed object is deallocated.  This is typically done in the observer's `dealloc` method.  Here's how you can modify the code:

```objectivec
@interface MyObserver : NSObject
@property (nonatomic, weak) ObservedObject *observedObject;

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // Handle KVO notification
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:@