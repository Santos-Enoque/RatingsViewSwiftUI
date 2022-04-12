
import SwiftUI

public struct RatingsView: View {
    var maxRating: Int
    @Binding var currentRating: Int
    var width:Int = 30
    var openSFSymbol:String = "star"
    var fillSFSymbol:String = "star.fill"
    public init(maxRating: Int, currentRating: Binding<Int>, width: Int = 30,openSFSymbol:String = "star",fillSFSymbol:String = "star.fill" ){
        self.maxRating = maxRating
        self._currentRating = currentRating
        self.width = width
        self.openSFSymbol = openSFSymbol
        self.fillSFSymbol = fillSFSymbol
        
    }
    public var body: some View {
        HStack {
            ForEach(0..<maxRating) { rating in
                Image(systemName: rating < self.currentRating ? self.fillSFSymbol : self.openSFSymbol)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(Color(UIColor.systemYellow))
                    .onTapGesture {
                        self.currentRating = rating+1
                }
            }
        }.frame(width: CGFloat(maxRating * width))
    }
}


struct RatingsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingsView(maxRating: 5, currentRating: .constant(3))
                .environment(\.colorScheme, .light)
                .previewLayout(.sizeThatFits)
                .padding(10)
    }
}
