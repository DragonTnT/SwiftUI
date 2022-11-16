# Tips

#### View

- .frame(width:height:)可以将View的大小固定

- view的很多方法中，都可以传递aligment参数，对子视图进行对齐

- 通过clip，clipShape来裁剪样式，例如对图片进行圆形设置，当然也可以直接使用CornerRadius，区别在于clipShape更加灵活，因为直接传入Shape

  ```
  image.clipShape(Circle())
  or
  image.cornerRadius = 5
  ```

- 链式方法的调用顺序会影响到结果，例如：

  ```swift
  Text("Turtle")
  // 先圆角，再覆盖
      .cornerRadius(5)
      .overlay(Color.yellow)
  
  Text("Turtle")
  // 先覆盖，再圆角
      .overlay(Color.yellow)
      .cornerRadius(5)    
  
  // 结果为上面的视图，无圆角，因为设置圆角后，被正方形overlay覆盖
  // 下面的视图，有圆角，因为先设置的overlay，再对整体进行圆角，因此overlay也被圆角
  ```

- 添加边框

  ```
  Text("Turtle Rockadajsdksajdklsajkld")
      .border(.blue, width: 0.5)
  ```

- ShapeStyle

  - Color等等

- 画圆直接用Circle()

- SafeArea

  - 使用.edgesIgnoringSafeArea()来忽略安全区,默认为全部。
  - 应该在整个页面的body里添加此句


- 背景色：

  ```swift
  .background(Color.blue)
  ```

- 点击事件：

  ```swift
  /// 1.按钮点击
  Button(action: {
    ... // 点击事件触发的代码
  }, label: {
  	Image("back")
  })
  /// 2.手势点击
  Image(systemName: "plus")
    .onTapGesture {
      ... // 点击事件触发的代码
    }
  ```

  

#### Spacer

- 用来占用Stack主轴上的剩余方向

  ```swift
  VStack {
  	Text("haha")
  	Spacer()
  	Text("xixi")
  }
  /// "haha"会处于stack最顶部，"xixi"会处于Stack最底部
  ```

  

#### Divder

- 变化分割线颜色：.overlay(Color.yellow)

#### Stack：VStack,HStack

- 默认会有子视图之间的spacing，不需要时，设置spacing为0，frame靠内容撑开

  ```swift
  VStack(alignment: .trailing, spacing: 20) {
  }
  ```

#### View_Previews

- 可以对预览视图重新进行layout

  ```swift
  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView().previewLayout(PreviewLayout.fixed(width: 100, height: 200))
      }
  }
  ```

- 对预览视图设定特别的设备

  ```swift
  /// 设定单个设备
  struct LandmarkList_Previews: PreviewProvider {
      static var previews: some View {
          LandmarkList()
              .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
      }
  }
  /// 设定多个设备
  struct LandmarkList_Previews: PreviewProvider {
      static var previews: some View {
          ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
              LandmarkList()
                  .previewDevice(PreviewDevice(rawValue: deviceName))
          }
      }
  }
  ```

  

#### Group

- 在Preview中，可以使用Group来展示多份视图，例如两个Cell，对cell的修饰器也可以提出来交给Group

```swift
struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
```

#### List

- list会默认撑满屏幕剩余的空间

- list中的子视图需要满足以下两个条件中的一个：

  - 遵循`Identifiable`协议
  - 直接指定id,如：

  ```
  List(landmarks, id: \.id) { landmark in
  	// subView
  }
  ```



#### Navigation

- 通过NavigationView包裹全视图获得系统Navigatio的样式和跳转能力
- 通过NavigationLink来进行跳转区域和目的地的设置

```swift
var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 20) {
                Text("Turtle Rockadajsdksajdklsajkld")
                    .font(.title)
                    .frame(width: 100, height: 100)
                Divider()
                    .overlay(Color.yellow, alignment: .trailing)
                HStack {
                    Text("Joshua Tree National Park")
                        .font(.subheadline)
                    Spacer()
                    Text("California")
                        .font(.subheadline)
                }
                NavigationLink {
                  /// 跳转的目的地为ContentView
                    ContentView()
                } label: {
                  /// 跳转的点击响应区域为List
                    List {
                        
                    }.overlay(Color.blue)
                }

            }
            .padding()
            .navigationTitle("haha")
        }
    }
```



#### ScrollView

- scrollView包括视图，提供滑动效果，内容超出屏幕，则可滑动到底；内容未超出屏幕，则会弹性收回
- scrollView的直接子视图里不要加spacer，因为spacer无法起到撑开的作用



#### 获取屏幕宽高

```swift
GeometryReader { geo in
   // 安全区高度
   geo.safeAreaInsets.top
	 // 屏幕宽度
	 geo.size.width
}
```



#### 快捷键：

- 代码自动对齐：^+I
- typora设置代码语言：```swift
- 立即刷新Preview：option+cmd+P



#### 书写规则：

- 视图之间最好空出一行
- 链式方法换行，但方法之间不空行



#### 方法：

- forEach：在拥有子视图的地方，都可以用forEach，例如在some View、stack、list、groups等里面，如果数据是简单值类型，那么可以直接就数据作为id，例如下面的例子中，数据是字符串类型，因此可以用`\.self`作为id

  ```swift
  struct LandmarkList_Previews: PreviewProvider {
      static var previews: some View {
          ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
              LandmarkList()
                  .previewDevice(PreviewDevice(rawValue: deviceName))
          }
      }
  }
  
  ///ForEach operates on collections the same way as the list, which means you can use it anywhere you can use a child view, such as in stacks, lists, groups, and more. When the elements of your data are simple value types — like the strings you’re using here — you can use \.self as key path to the identifier.
  ```

  

