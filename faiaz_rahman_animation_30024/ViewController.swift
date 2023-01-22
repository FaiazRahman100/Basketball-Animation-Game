//
//  ViewController.swift
//  faiaz_rahman_animation_30024
//
//  Created by bjit on 3/1/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topImageConstrain: NSLayoutConstraint!

    @IBOutlet weak var ballContrain: NSLayoutConstraint!
    
    @IBOutlet weak var ballImage: UIImageView!
    
    @IBOutlet weak var ballConstrainHorizontal: NSLayoutConstraint!
    
    @IBOutlet weak var basketImage: UIImageView!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    var ballPosition = 0
    var ballPlace = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ballImage.isUserInteractionEnabled = true
        ballImage.addGestureRecognizer(tapGestureRecognizer)
        
       // backgroundImage.loadGif(name: "ballspinning")
        

    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        
        let options: UIView.AnimationOptions = [.curveEaseInOut]
//                                                .repeat,
//                                                .autoreverse]

        UIView.animate(withDuration: 2,delay: 0,options: options, animations: { [weak self] in
            
            self?.ballPlace = -350
            self?.ballConstrainHorizontal.constant = CGFloat(self!.ballPlace)
            self?.ballImage.transform = (self?.ballImage.transform.rotated(by: 179))!
            
          //  print(self!.ballImage.frame.intersects(self!.basketImage.frame))
            if self!.ballImage.frame.intersects(self!.basketImage.frame){
                print("yoo")
            }
           ///
            
            ///
            self?.view.layoutIfNeeded()
            print(self!.ballImage.frame.intersects(self!.basketImage.frame))
        }, completion: {[weak self] _ in

            self?.ballConstrainHorizontal.constant = 350
        })
        
       // ballConstrainHorizontal.constant = 350
        

        print("clicked")
    }
    

    
    override func viewDidAppear(_ animated: Bool) {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut,
                                                .repeat,
                                                .autoreverse]

        UIView.animate(withDuration: 3,delay: 0.5,options: options, animations: { [weak self] in
            self?.topImageConstrain.constant = 132
            self?.view.layoutIfNeeded()
          }, completion: nil)
        
    }
    
  let options: UIView.AnimationOptions = [.curveEaseInOut]
////                                                .repeat,
////                                                .autoreverse]
//
//        UIView.animate(withDuration: 2,delay: 0.5,options: options, animations: { [weak self] in
//           // self?.ballPosition += 50
//            self?.ballContrain.constant = 120
//            self?.view.layoutIfNeeded()
//          }, completion: nil)
//    }
    

    
    @IBAction func leftBall(_ sender: Any) {
                let options: UIView.AnimationOptions = [.curveEaseInOut]
        //                                                .repeat,
        //                                                .autoreverse]
        
        UIView.animate(withDuration: 0.4,delay: 0,options: options, animations: { [weak self] in
            self?.ballPosition -= 50
            
            let position =  self?.ballPosition
            self?.ballContrain.constant = CGFloat(position!)
            self?.ballImage.transform = (self?.ballImage.transform.rotated(by: -45))!
                    self?.view.layoutIfNeeded()
                  }, completion: nil)
            }
    
    
    
    @IBAction func rightBall(_ sender: Any) {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut]
        
        UIView.animate(withDuration: 0.4,delay: 0,options: options, animations: { [weak self] in
            self?.ballPosition += 50
            
            let position =  self?.ballPosition
            self?.ballContrain.constant = CGFloat(position!)
            
            self?.ballImage.transform = (self?.ballImage.transform.rotated(by: CGFloat.pi/4))!
            
                    self?.view.layoutIfNeeded()
                  }, completion: nil)
            }
    
    
    }
    

                       
                           

