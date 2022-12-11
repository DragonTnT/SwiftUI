# Animations

##### 1.自旋动画

```swift
struct LoadingView: View {
    @State private var degrees: Double = 0
    
    var body: some View {
        ZStack {
            Color.white
            Image("loading_color")
                .rotationEffect(Angle(degrees: degrees))
                .onAppear {
                    withAnimation(Animation
                        .linear(duration: 1)
                        .speed(2)
                        .repeatForever(autoreverses: false)) {
                        degrees = 360
                    }
                }
        }
    }
}
```

