//
//  PlayViewController.swift
//  FunAdventure
//
//  Created by Mac on 4/15/17.
//  Copyright © 2017 Sagar. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    var yourScore = 0
    var isGameOvered = false
    var location = CGPoint(x: 0, y: 0)
    @IBOutlet var imageGameOver: UIImageView!
    
    @IBOutlet var imageHero: UIImageView!
    @IBOutlet var buttonUp: UIButton!
    @IBOutlet var buttonRight: UIButton!
    @IBOutlet var buttonLeft: UIButton!
    @IBOutlet var buttonDown: UIButton!
    @IBOutlet var imageBlackBall1: UIImageView!
    @IBOutlet var buttonExit: UIButton!
    @IBOutlet var imageBlackBall2: UIImageView!
    @IBOutlet var imageBlackBall3: UIImageView!
    @IBOutlet var imageBlackBall4: UIImageView!
    @IBOutlet var labelYourScore: UILabel!
    @IBOutlet var labelHighScore: UILabel!
    
    
    //Exit button
    @IBAction func pushButtonExit(_ sender: Any) {
        exit(0)
    }
    
    @IBAction func pushButtonUp(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            var frameHero = self.imageHero.frame
            if(frameHero.origin.y > 216){
                frameHero.origin.y = frameHero.origin.y - 70
            }
            self.imageHero.frame = frameHero
        })
    }
    
    @IBAction func pushButtonLeft(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            var frameHero = self.imageHero.frame
            if(frameHero.origin.x > 120){
                frameHero.origin.x = frameHero.origin.x - 70
            }
            self.imageHero.frame = frameHero
        })
    }
    
    @IBAction func pushButtonDown(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            var frameHero = self.imageHero.frame
            if(frameHero.origin.y < 290){
                frameHero.origin.y = frameHero.origin.y + 70
            }
            self.imageHero.frame = frameHero
        })
    }
    
    @IBAction func pushButtonRight(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            var frameHero = self.imageHero.frame
            if(frameHero.origin.x < 180){
                frameHero.origin.x = frameHero.origin.x + 70
            }
            self.imageHero.frame = frameHero
        })
    }
    
    func draw1() -> UIBezierPath {
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
        return aPath
    }
    
    
    
    
    override func viewDidLoad() {
        startingState()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = draw1().cgPath
        shapeLayer.fillColor = nil
        //shapeLayer.fillColor = UIColor(red: 0.5, green: 1, blue: 0.5, alpha: 1).cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 1.0
        view.layer.addSublayer(shapeLayer)
        var timerIntersect = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkIntersect), userInfo: nil, repeats: true)
        var timerMoveBall1 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall1), userInfo: nil, repeats: true)
        var timerMoveBall2 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall2), userInfo: nil, repeats: true)
        var timerMoveBall3 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall3), userInfo: nil, repeats: true)
        var timerMoveBall4 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall4), userInfo: nil, repeats: true)
        var timerIncreamentScore = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(increamentScore), userInfo: nil, repeats: true)
    }
    
    func startingState(){
        imageHero.image = UIImage(named:"image_hero.png")
        imageGameOver.isHidden = true
        isGameOvered = false
        imageHero.frame.origin.x = 162
        imageHero.frame.origin.y = 227
        
        imageBlackBall1.frame.origin.x = 160
        imageBlackBall1.frame.origin.y = -200
        
        imageBlackBall2.frame.origin.x = -200
        imageBlackBall2.frame.origin.y = 160
        
        imageBlackBall3.frame.origin.x = 90
        imageBlackBall3.frame.origin.y = 450
        
        imageBlackBall4.frame.origin.x = 700
        imageBlackBall4.frame.origin.y = 290
    }
    
    func gameOver(){
        isGameOvered = true
        imageHero.image = UIImage(named:"image_hero_gameover.jpg")
        imageGameOver.isHidden = false
    }
    
    func checkIntersect(){
        if((imageHero.layer.frame.intersects(imageBlackBall1.layer.frame)) ||
            (imageHero.layer.frame.intersects(imageBlackBall2.layer.frame)) ||
            (imageHero.layer.frame.intersects(imageBlackBall3.layer.frame)) ||
            (imageHero.layer.frame.intersects(imageBlackBall4.layer.frame))){
            gameOver()
        }
    }
    
    //generates a random x value
    func generateXRandomPosition()->CGFloat{
        let randomNumber = arc4random_uniform(3)
        var position = 160
        if(randomNumber == 0){
            position = 90
        }
        else if(randomNumber == 1){
            position = 160
        }
        else if(randomNumber == 2){
            position = 240
        }
        return CGFloat(position)
    }
    
    //generates a random y value
    func generateYRandomPosition()->CGFloat{
        let randomNumber = arc4random_uniform(3)
        var position = 160
        if(randomNumber == 0){
            position = 160
        }
        else if(randomNumber == 1){
            position = 225
        }
        else if(randomNumber == 2){
            position = 290
        }
        return CGFloat(position)
    }
    
    func moveBall1(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall1.frame
            frameTemp.origin.y = frameTemp.origin.y + 3
            self.imageBlackBall1.frame = frameTemp
        },completion:{
            (finished: Bool) in
            if(self.imageBlackBall1.frame.origin.y > 800){
                UIView.animate(withDuration: 0, animations: {
                    var frameTemp = self.imageBlackBall1.frame
                    frameTemp.origin.x = self.generateXRandomPosition()
                    frameTemp.origin.y = -200
                    self.imageBlackBall1.frame = frameTemp
                })
            }
        })
    }
    func moveBall2(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall2.frame
            frameTemp.origin.x = frameTemp.origin.x + 3
            self.imageBlackBall2.frame = frameTemp
        },completion:{
            (finished: Bool) in
            if(self.imageBlackBall2.frame.origin.x > 500){
                UIView.animate(withDuration: 0, animations: {
                    var frameTemp = self.imageBlackBall2.frame
                    frameTemp.origin.x = -200
                    frameTemp.origin.y = self.generateYRandomPosition()
                    self.imageBlackBall2.frame = frameTemp
                })
            }
        })
    }
    func moveBall3(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall3.frame
            frameTemp.origin.y = frameTemp.origin.y - 3
            self.imageBlackBall3.frame = frameTemp
        },completion:{
            (finished: Bool) in
            if(self.imageBlackBall3.frame.origin.y < -50){
                UIView.animate(withDuration: 0, animations: {
                    var frameTemp = self.imageBlackBall3.frame
                    frameTemp.origin.x = self.generateXRandomPosition()
                    frameTemp.origin.y = 450
                    self.imageBlackBall3.frame = frameTemp
                })
            }
        })
    }
    func moveBall4(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall4.frame
            frameTemp.origin.x = frameTemp.origin.x - 3
            self.imageBlackBall4.frame = frameTemp
        },completion:{
            (finished: Bool) in
            if(self.imageBlackBall4.frame.origin.x < -200){
                UIView.animate(withDuration: 0, animations: {
                    var frameTemp = self.imageBlackBall4.frame
                    frameTemp.origin.x = 500
                    frameTemp.origin.y = self.generateYRandomPosition()
                    self.imageBlackBall4.frame = frameTemp
                })
            }
        })
    }
    
    func increamentScore(){
        if(!isGameOvered){
            yourScore = yourScore + 10
            //  print(yourScore)
            let yourScoreString: Int = yourScore
            labelYourScore.text = String(yourScoreString)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
