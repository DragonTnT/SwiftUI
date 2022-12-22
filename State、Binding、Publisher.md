# @State与@Binding

- State用于记录数据，Binding用于子视图获取该记录的数据

- State属性应该总是设为private，因为其他视图不应该直接访问到它，而是通过Binding传递，获取它的值

- 可以通过.constant(value)的方式直接获取一个Binding值

  ```swift
  struct FavoriteButton_Previews: PreviewProvider {
      static var previews: some View {
          FavoriteButton(isSet: .constant(true))
      }
  }
  ```

- 在子视图中修改Binding的值，state值也会跟随改变，因为@state和@Binding都是对同一个值的引用



# Publisher

控件可在OnReceive方法中直接观察绑定值的修改

```swift
import SwiftUI

struct ContentView: View {
    @StateObject private var state: ContentViewState = .init()
    var body: some View {
        VStack {
            Text(state.count.description)
            Button("Count Up") { state.countUp() }
            Button("Reset") { state.reset() }
        }
      // 注意$符号是加在count上，而不是state上
        .onReceive(state.$count) { count in
            print(count)
        }
    }
}

final class ContentViewState: ObservableObject {
    @Published private(set) var count: Int = 0
    
    func countUp() {
        count += 1
    }
    
    func reset() {
        count = 0
    }
}
```



# Binding

1.重写Binding值的get与set方法

```swift
/// 试下searchContent改变后，调用search方法
UIKitTextField("",  text: Binding<String>(
                            get: { vm.searchContent },
                                set: {
                                    vm.searchContent = $0
                                    vm.search($0)
                                }))
```

