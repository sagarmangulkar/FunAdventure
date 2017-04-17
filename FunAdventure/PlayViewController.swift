//
//  PlayViewController.swift
//  FunAdventure
//
//  Created by Mac on 4/15/17.
//  Copyright © 2017 Sagar. All rights reserved.
//

import UIKit

class PlayViewController: UIViewController {
    
    var location = CGPoint(x: 0, y: 0)
    
    @IBOutlet var imageHero: UIImageView!
    @IBOutlet var buttonUp: UIButton!
    @IBOutlet var buttonRight: UIButton!
    @IBOutlet var buttonLeft: UIButton!
    @IBOutlet var buttonDown: UIButton!
    @IBOutlet var imageBlackBall1: UIImageView!
    @IBOutlet var buttonExit: UIButton!
    @IBOutlet var imageBlackBall2: UIImageView!

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
    
    override func viewDidLoad() {
        startingState()
        var timerIntersect = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkIntersect), userInfo: nil, repeats: true)
        var timerMoveBall1 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall1), userInfo: nil, repeats: true)
        var timerMoveBall2 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(moveBall2), userInfo: nil, repeats: true)
        
    }
    
    func startingState(){
        imageHero.image = UIImage(named:"image_hero.png")
        imageHero.frame.origin.x = 162
        imageHero.frame.origin.y = 227
        
        imageBlackBall1.frame.origin.x = 160
        imageBlackBall1.frame.origin.y = 0
        
        imageBlackBall2.frame.origin.x = 0
        imageBlackBall2.frame.origin.y = 160
    }
    
    func checkIntersect(){
        if((imageHero.layer.frame.intersects(imageBlackBall1.layer.frame)) ||
            (imageHero.layer.frame.intersects(imageBlackBall2.layer.frame))){
            imageHero.image = UIImage(named:"image_hero_gameover.jpg")
        }
    }
    
    func moveBall1(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall1.frame
            frameTemp.origin.y = frameTemp.origin.y + 5
            self.imageBlackBall1.frame = frameTemp
        },completion:nil)
    }
    func moveBall2(){
        UIView.animate(withDuration: 0.05, animations: {
            var frameTemp = self.imageBlackBall2.frame
            frameTemp.origin.x = frameTemp.origin.x + 5
            self.imageBlackBall2.frame = frameTemp
        },completion:nil)
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
