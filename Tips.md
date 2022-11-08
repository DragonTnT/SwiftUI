# Tips

#### View

- .frame(width:height:)可以将View的大小固定
- view的很多方法中，都可以传递aligment参数，对子视图进行对齐

#### Divder

- 变化分割线颜色：.overlay(Color.yellow)

#### Stack：VStack,HStack

- 默认会有子视图之间的spacing，不需要时，设置spacing为0

#### View_Previews

- 可以对预览视图重新进行layout

  ```swift
  struct ContentView_Previews: PreviewProvider {
      static var previews: some View {
          ContentView().previewLayout(PreviewLayout.fixed(width: 100, height: 200))
      }
  }
  ```

  

#### 快捷键：

- 代码自动对齐：^+I