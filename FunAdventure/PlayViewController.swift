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

        var timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveBall1), userInfo: nil, repeats: true)
        var timerIntersect = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkIntersect), userInfo: nil, repeats: true)
        
    }
    
    func checkIntersect(){
        if(imageHero.frame.intersects(imageBlackBall1.frame)){
            UIView.animate(withDuration: 0.5, animations: {
                var frameHero = self.imageHero.frame
                if(frameHero.origin.x < 180){
                    frameHero.origin.y = frameHero.origin.y + 200
                }
                self.imageHero.frame = frameHero
            })
        }
    }
    
    func moveBall1(){
        UIView.animate(withDuration: 0.5, animations: {
            var frameHero = self.imageBlackBall1.frame
            frameHero.origin.y = frameHero.origin.y + 20
            self.imageBlackBall1.frame = frameHero
        },completion:nil
//            {
//            (value: Bool) in
//            UIView.animate(withDuration: 0.5, animations: {
//                var frameHero = self.imageBlackBall1.frame
//                frameHero.origin.y = frameHero.origin.y - 1
//                self.imageBlackBall1.frame = frameHero
//        })
//        }
        )
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
