import UIKit

class DrawRectangle: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        let aPath = UIBezierPath()
        
        aPath.move(to: CGPoint(x:50, y:150))
        
        aPath.addLine(to: CGPoint(x:275, y:150))
        aPath.addLine(to: CGPoint(x:275, y:350))
        aPath.addLine(to: CGPoint(x:50, y:350))
        
        //Keep using the method addLineToPoint until you get to the one where about to close the path
        
        aPath.close()
        
        //If you want to stroke it with a red color
        UIColor.red.set()
        aPath.stroke()
        //If you want to fill it as well
        //aPath.fill()
    }

}
