import SwiftUI


@available(iOS 13.0, *)
extension Image {

    init(systemName: String, fill: Bool) {
        let name = systemName.replacingOccurrences(of: ".fill", with: "")
        self.init(systemName: fill ? name + ".fill" : name)
    }

}


struct Image_Fill_Previews: PreviewProvider {
    
    static var previews: some View {
        Image(systemName: "star.fill", fill: false)
    }
    
}
