//
//  ViewController.swift
//  UIView_bird
//
//  Created by do duy hung on 23/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var au = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawBg()
        addBird()
        Move()
        playSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func drawBg(){
        let bg = UIImageView(image: UIImage(named: "jungle.jpg"))
        bg.frame = self.view.bounds
        bg.contentMode = .ScaleAspectFill
        self.view.addSubview(bg)
    }
    func addBird(){
        bird = UIImageView(frame:CGRectMake(0, 0,110, 68))
        bird.animationImages = [
        UIImage(named: "bird0.png")!,
        UIImage(named: "bird1.png")!,
        UIImage(named: "bird2.png")!,
        UIImage(named: "bird3.png")!,
        UIImage(named: "bird4.png")!,
        UIImage(named: "bird5.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func Move(){
        UIView.animateWithDuration(4, animations:
        {
            self.bird.center = CGPointMake(self.view.bounds.size.width-50, self.view.bounds.size.height-50)
            
        }){(finished) in
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(0))
            
            UIView.animateWithDuration(4,animations: {
                self.bird.center = CGPointMake(50, self.view.bounds.size.height-50)
            }){(finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(175))
                
                UIView.animateWithDuration(4, animations: {
                    self.bird.center = CGPointMake(self.view.bounds.size.width-50, 50)
                }){(finished) in
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, -1),CGAffineTransformMakeRotation(180))
                    
                    UIView.animateWithDuration(4, animations: {
                    self.bird.center = CGPointMake(50, 50)
                    }){(finished) in
                        self.bird.transform = CGAffineTransformIdentity
                    self.Move()
                    }
                }
            }
        }
    }
    func playSong(){
    let file = NSBundle.mainBundle().pathForResource("song", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: file!)
        au = try! AVAudioPlayer(contentsOfURL: url)
        au.prepareToPlay()
        au.play()
    }

}

