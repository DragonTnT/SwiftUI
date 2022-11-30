# SwiftUI基本原理

### Identity:

identity是SwiftUI在更新界面时识别相同或不同元素的方式，identity生成的方式有两种：

每一个视图都有Id，因此如何没有显示指定id，那么View就有隐式的id

- explicit identity：显示的id，例如`ForEach`方法中需要确定的id

- structural identity：结构化id，也是隐式id，是SwiftUI使用根据的视图层级结构自动为你生成隐式id。一个典型的例子就是在当你在代码中使用if语句或其他条件语句时。如：

  ```
  var body: some View {
      if someReason {
      		Dog()      
      } else {
          Cat()
      }
  }
  Dog和Cat各自被分配结构化id，以便于区分在这一层级中的两个视图
  ```

  

视图的更新针对的是同一个id的View，还是两个不同id的View，会影响到变化的方式。

```
// 动画方式为绿色直接切换到蓝色，因为这是两个PayView，拥有不同的id
VStack {
	if dog.isGood {
		PayView(tint: .green)
	} else {
		PayView(tint: .blue)
	}
}
2.动画方式为绿色渐变为蓝色，因为这是同一个PayView，拥有相同的id
VStack {
	PayView(tint: dog.isGood ? .green : .blue)
}
```

---



### ViewBuilder

```
var body: some View {
    if rescueDogs.isEmpty {
    //注意不能使用return，因为return要求返回类型一致
        AdoptionDirectory(selection: $rescueDogs)   
    } else {
        DogList(rescueDogs)
    }
}

```

1.之所以body能根据条件判断接受不同类型的view，是因为body属性会被`ViewBuilder`转化为`_ConditionalContent`，因此实际的返回类型是_ConditionalContent，上面的代码实际上会被转化为：

```
some View = _ConditionalContent<AdoptionDirectory,DogList>
```

2.在写函数要返回some View时，当要返回多种类型，那么函数中也不要写return，并且函数前加@ViewBuilder字段，即可用和body一样的方式，来返回。

---



### LifeTime

一旦视图的identity发生改变或视图被删除，它的生命周期就结束了。因此id应该是稳定的。

且SwiftUI通过identity来区分视图，因此同一层级中，id应该是唯一的。

每当我们说到视图的生命周期，我们指的是与该视图相关的身份(identity)的持续时间。
能够将视图的identity与其生命周期联系起来是理解SwiftUI如何持久化状态的基础。



### 参考文章：

https://www.jianshu.com/p/bab4d17ced85