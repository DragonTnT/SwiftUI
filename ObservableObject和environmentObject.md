# ObservableObject和environmentObject

本文中用例的代码引自：SwiftUI中的InterfacingWithUIKit

ObservableObject是需要被观察的对象类型，如:

```swi
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}
```

当landmarks发生改变时，接收landmarks的相关视图也会更新到最新数据，而数据是通过`environmentObject(_:)`这个modifier向下传递

在View中，用`@EnvironmentObject`来声明该对象属性，如：

```swift
@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
          /// modelData在app的声明周期中只生成了一次，虽然ContentView代码中并没有用到modelData，但是ContentView的两个子视图都有用到，因此在ContentView实例化时，引入modelData
        }
    }
}

struct LandmarkList: View {
  /// Landmark属于LandmarksApp的子视图的子视图的子视图，依然可以使用@EnvironmentObject接收到该数据
    @EnvironmentObject var modelData: ModelData
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()     
            .environmentObject(ModelData())
       /// 这里new一个ModelData的原因是，而不能使用@EnvironmentObject是因为这里是预览视图，不参与真实的生命周期，并且static var 中无法引入正常前文中的var
    }
}
```

记住，哪个视图需要使用modelData，哪个视图就需要用@EnvironmentObject引入data；

哪个预览需要使用modelData，哪个预览就需要new一个modelData