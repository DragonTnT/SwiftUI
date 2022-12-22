# Preview

##### 1.多个PreView的问题

```swift
struct FinderPageView: View {
    var body: some View {
        FinderPageNavView()
        Spacer()
        Spacer()
    }
}	
```

SwiftUI会默认为body下的每个节点创建一个preview，如果会有一个Preview代表`FinderPageNavView`，两个Preview代表`Spacer`。正常的显示逻辑，是将3个View包裹在VStack中，只会有一个Preview.

