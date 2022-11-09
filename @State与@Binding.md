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