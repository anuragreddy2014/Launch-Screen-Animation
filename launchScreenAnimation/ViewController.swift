//
//  ViewController.swift
//  launchScreenAnimation
//
//  Created by Anurag Reddy on 26/07/20.
//  Copyright © 2020 Anurag Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let imageView: UIImageView = {
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)
        view.backgroundColor = .black
      

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.center = view.center
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
            self.animate()
        })
    }
    private func animate() {
        UIView.animate(withDuration: 1, animations: {
            let size = self.view.frame.size.width * 3
            
            let diffX = size - self.view.frame.size.width
            let diffY =  self.view.frame.size.height - size
            
            
            self.imageView.frame = CGRect(x: -(diffX/2),
                                          y: diffY/2,
                                          width: size,
                                          height: size
            )
        })
        UIView.animate(withDuration: 1.5, animations: {
                   self.imageView.alpha = 0
        },completion: { done in
            if done{
                DispatchQueue.main.asyncAfter(deadline: .now()+0.5, execute: {
                    let viewController = HomeViewController()
                                          viewController.modalTransitionStyle = .crossDissolve
                                   viewController.modalPresentationStyle = .fullScreen
                                           self.present(viewController,animated: true)
                })
            }
        })
       
    }

}

