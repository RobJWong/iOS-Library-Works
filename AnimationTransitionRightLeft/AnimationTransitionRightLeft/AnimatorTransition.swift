//
//  AnimatorTransition.swift
//  BeginnerCook
//
//  Created by Robert Wong on 1/25/18.
//  Copyright © 2018 Razeware LLC. All rights reserved.
//

import UIKit

class AnimatorTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var presenting = true
    var originFrame = CGRect.zero
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let toView = transitionContext.view(forKey: .to)!
        
        containerView.addSubview(toView)
        toView.frame.origin.x = 500
        UIView.animate(withDuration: duration,
                       animations: {
                        toView.frame.origin.x = 0
        },
                       completion: { _ in
                        transitionContext.completeTransition(true)
            }
        )
    }
}

