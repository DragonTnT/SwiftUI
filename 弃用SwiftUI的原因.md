弃用SwiftUI的原因

1.SwiftUI最低支持iOS13，而SwiftUI中的很多API，最低只支持iOS14。例如Navigationbar中的关键API等。如果对iOS13适配，会多做很多额外的工作，并且iOS13可用的API，后面可能会废弃，也相当于给项目留坑。并且许多关键视图如TextView，List都是对UITextView，UITableView的封装，对并没有暴露出和UIKit对等的API。因此，一些特殊需求，还需要重新去将UIKit控件，封装成SwiftUI控件，这也需要额外做大量的工作

2.Preview的模式并不合适，相比于RN,Flutter中先运行APP,再预览的模式。SwiftUI的预览模式与App的生命周期是剥离的，因此缺乏运行时的配置。例如在原有UIKit项目中加入SwiftUI，预览是无法读取到appdelegate中的相关配置。例如，如果在页面中，先请求网络，再加载数据，那么在appdelegate中设置的网络配置，无法在preview中被读取。

3.大型项目中，preview的加载速度会比较慢，并且不保存就自动编译的方式，时常会打断开发思路。并且preview也会有很多莫名其妙的报错，无法显示

因此，如果要在现有大型项目中加入SwiftUI，建议app最低支持swiftUI，并且只做一些简单的展示页面，例如系统设置页。

针对第2点，我的描述不一定准确，需要测试以下代码：

```swift
@main
struct MySwiftUIApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("AppDelegate: application did finish launching")
        return true
    }
}

```

