//
//
//
//
//  Created by Simon Cubalevski on 6/20/19.
//  Copyright © 2019 Simon Cubalevski. All rights reserved.



import UIKit

class PopAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let duration = 0.7
  var presenting = true
  var originFrame = CGRect.zero

  var dismissCompletion: (()->Void)?

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let toView = transitionContext.view(forKey: .to)!
    let herbView = presenting ? toView : transitionContext.view(forKey: .from)!
   herbView.layer.cornerRadius = 10
    let initialFrame = presenting ? originFrame : herbView.frame
    let finalFrame = presenting ? herbView.frame : originFrame

    let xScaleFactor = presenting ?
      initialFrame.width / finalFrame.width :
      finalFrame.width / initialFrame.width

    let yScaleFactor = presenting ?
      initialFrame.height / finalFrame.height :
      finalFrame.height / initialFrame.height

    let scaleTransform = CGAffineTransform(scaleX: xScaleFactor, y: yScaleFactor)

    if presenting {
      herbView.transform = scaleTransform
      herbView.center = CGPoint(
        x: initialFrame.midX,
        y: initialFrame.midY)
      herbView.clipsToBounds = true
    }

    containerView.addSubview(toView)
    containerView.bringSubview(toFront: herbView)

    UIView.animate(withDuration: duration, delay:0.0,
                   usingSpringWithDamping: 0.6, initialSpringVelocity: 0.0,
                   animations: {
                    herbView.transform = self.presenting ? CGAffineTransform.identity : scaleTransform
                    herbView.center = CGPoint(x: finalFrame.midX, y: finalFrame.midY)
    }, completion: { _ in
        transitionContext.completeTransition(true)

     
    })
  }
}
