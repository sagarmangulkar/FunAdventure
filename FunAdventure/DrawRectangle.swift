import UIKit

class DrawRectangle: UIView {

    override func draw(_ rect: CGRect) {
        // Drawing code
        let aPath = UIBezierPath()
        let xRight = 300;
        let xLeft = 75;
        let yTop = 150;
        let yBottom = 350;
        let xMiddle1 = xLeft + ((xRight - xLeft)/3);
        let xMiddle2 = xRight - ((xRight - xLeft)/3);
        
        let yMiddle1 = yTop + ((yBottom - yTop)/3);
        let yMiddle2 = yBottom - ((yBottom - yTop)/3);
        
        aPath.move(to: CGPoint(x:xLeft, y:yTop))
        aPath.addLine(to: CGPoint(x:xRight, y:yTop))
        aPath.addLine(to: CGPoint(x:xRight, y:yBottom))
        aPath.addLine(to: CGPoint(x:xLeft, y:yBottom))
        aPath.addLine(to: CGPoint(x:xLeft, y:yTop))
        aPath.addLine(to: CGPoint(x:xMiddle1, y:yTop))
        aPath.addLine(to: CGPoint(x:xMiddle1, y:yBottom))
        aPath.addLine(to: CGPoint(x:xMiddle2, y:yBottom))
        aPath.addLine(to: CGPoint(x:xMiddle2, y:yTop))
        aPath.addLine(to: CGPoint(x:xRight, y:yTop))
        aPath.addLine(to: CGPoint(x:xRight, y:yMiddle1))
        aPath.addLine(to: CGPoint(x:xLeft, y:yMiddle1))
        aPath.addLine(to: CGPoint(x:xLeft, y:yMiddle2))
        aPath.addLine(to: CGPoint(x:xRight, y:yMiddle2))
        aPath.addLine(to: CGPoint(x:xRight, y:yTop))

        aPath.close()
        
        //Giving a red color
        UIColor.red.set()
        aPath.stroke()
    }

}
