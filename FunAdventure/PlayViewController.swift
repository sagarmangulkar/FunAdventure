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
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        
//    }

    @IBAction func pushButtonUp(_ sender: Any) {
        UIView.animate(withDuration: 1, animations: {
            var frameHero = self.imageHero.frame
            frameHero.origin.y = frameHero.origin.y - 30
            self.imageHero.frame = frameHero
        })
    }
    
    override func viewDidLoad() {
        UIView.animate(withDuration: 3, animations: {
            var frameHero = self.imageHero.frame
            frameHero.origin.y = frameHero.origin.y - 10
            self.imageHero.frame = frameHero
        })
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
