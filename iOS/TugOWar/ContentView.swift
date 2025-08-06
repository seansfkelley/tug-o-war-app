import SwiftUI

struct ContentView: View {
    @State var offset: CGSize = .zero
    @State var scale: CGFloat = 1
    @State var shouldUpdate: Bool = false
    
    var body: some View {
        let gesture = DragGesture()
            .onChanged { value in
                // Adapted from https://stackoverflow.com/a/62269752 because I couldn't be bothered
                // to figure out the math on my own.
                let limit: CGFloat = 400
                let xTranslation = value.translation.width
                let yTranslation = value.translation.height
                let distance = sqrt(xTranslation * xTranslation + yTranslation * yTranslation)
                let factor = 1 / (distance / limit + 1)
                offset = CGSize(width: xTranslation * factor, height: yTranslation * factor)
                
                if distance > limit * 3/4 {
                    if !shouldUpdate {
                        // do some kind of animation
                    }
                    shouldUpdate = true
                }
                
                withAnimation(.easeIn(duration: 0.2)) {
                    scale = 2
                }
            }
            .onEnded { _ in
                withAnimation(.spring(duration: 0.4, bounce: 0.4)) {
                    offset = .zero
                    scale = 1
                }
                
                if shouldUpdate {
                    // talk to the server I guess
                }
            }
        
        VStack {
            Text("😀")
                .font(.system(size: 50))
                .scaleEffect(scale)
                .offset(offset)
                .gesture(gesture)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
