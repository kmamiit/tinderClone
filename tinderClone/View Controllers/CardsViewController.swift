//
//  CardsViewController.swift
//  tinderClone
//
//  Created by Kyle Mamiit (New) on 11/25/18.
//  Copyright © 2018 Kyle Mamiit. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    var cardInitialCenter: CGPoint!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.transform = CGAffineTransform(rotationAngle: CGFloat(45 * M_PI / 180))
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didPanCard(_ sender: UIPanGestureRecognizer) {
        // Add code to run when card is panned
//        view.transform = CGAffineTransform(translationX: 50, y: 50)

//        view.transform = CGAffineTransform(rotationAngle: CGFloat(45 * Double.pi / 180))
        
//        let imageHalf = (imageView.image?.size.height)! / 2;

        print("LOCATION")
        print(sender.location(in: imageView));
        print(sender.translation(in: imageView));
        
        if sender.state == .began {
            cardInitialCenter = imageView.center;
        } else if sender.state == .changed {
            if sender.translation(in: imageView).x < 0 { // rotate counterclockwise
                print("works")
//                imageView.transform = CGAffineTransform(rotationAngle: CGFloat( -50 * M_PI / 180 ))
                imageView.center = CGPoint(x: cardInitialCenter.x + sender.translation(in: imageView).x, y: cardInitialCenter.y)
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat( -50 * M_PI / 180 ))

            } else if sender.translation(in: imageView).x > 0 {// rotate clockwise
                imageView.transform = CGAffineTransform(rotationAngle: CGFloat( 50 * M_PI / 180 ))
                imageView.center = CGPoint(x: cardInitialCenter.x + sender.translation(in: imageView).x, y: cardInitialCenter.y )
            }
        } else if sender.state == .ended {
            print("Ended");
            if sender.translation(in: imageView).x > 50 {
                UIView.animate(withDuration:1.5, animations: {
                    // This causes first view to fade in and second view to fade out
//                    imageView.center = CGPoint(x: self.profileImageView.center.x + 200, y: self.profileImageView.center.y + 80 )
                    self.imageView.transform = CGAffineTransform(translationX: sender.translation(in: self.imageView).x, y:-25)
                    self.imageView.center = CGPoint(x: self.cardInitialCenter.x + 500, y: self.cardInitialCenter.y + 500 )

                })
            }

            else if sender.translation(in: imageView).x < -50 {
                UIView.animate(withDuration:1.5, animations: {
                    // This causes first view to fade in and second view to fade out
                    //                    imageView.center = CGPoint(x: self.profileImageView.center.x + 200, y: self.profileImageView.center.y + 80 )
                    self.imageView.transform = CGAffineTransform(translationX: sender.translation(in: self.imageView).x, y: -25)
                    self.imageView.center = CGPoint(x: self.cardInitialCenter.x - 500, y: self.cardInitialCenter.y + 500 )
                })
//                UIView.animate(withDuration:3.0, animations: {
//                    self.imageView.transform = CGAffineTransformIdentity
//                })
            }
            imageView.transform = CGAffineTransform.identity
        }
        
        
//        if sender.location(in: imageView).y <= imageHalf {
//            if sender.translation(in: imageView).x < 0 { // rotate counterclockwise
//
//                view.transform = CGAffineTransform(rotationAngle: CGFloat(sender.translation(in: imageView).x) * Double.pi / 180))
//
////                imageView.transform = view.transform.rotated(by: CGFloat(45 * Double.pi / 180))
//
//            } else if sender.translation(in: imageView).x > 0 { //rotate clockwise
//            }
//        } else {
//            if sender.translation(in: imageView).x > 0 { // rotate counterclockwise
////                imageView.transform = view.transform.rotated(by: CGFloat(45 * Double.pi / 180))
//
//            } else if sender.translation(in: imageView).x < 0 { //rotate clockwise
//            }
        

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
