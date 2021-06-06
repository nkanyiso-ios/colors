
import UIKit
extension UIColor {
    func rgbString() -> String? {
        var fRed : CGFloat = 0
        var fGreen : CGFloat = 0
        var fBlue : CGFloat = 0
        var fAlpha: CGFloat = 0
        if self.getRed(&fRed, green: &fGreen, blue: &fBlue, alpha: &fAlpha) {
            let iRed = Int(fRed * 255.0)
            let iGreen = Int(fGreen * 255.0)
            let iBlue = Int(fBlue * 255.0)
            let iAlpha = Int(fAlpha * 255.0)

            return "\(iRed),\(iGreen),\(iBlue),\(iAlpha)"
        } else {
            // Could not extract RGBA components:
            return nil
        }
    }
}
