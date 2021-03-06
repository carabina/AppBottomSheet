//
//  BottomPopupPresentationController.swift
//  PresentationController
//
//  Created by Emre on 11.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit

class BottomPopupPresentationController: UIPresentationController {
    
    fileprivate var dimmingView: UIView!
    fileprivate var popupHeight: CGFloat
    fileprivate var dimmingViewVisibleAlpha: CGFloat
    
    override var frameOfPresentedViewInContainerView: CGRect {
        get {
            return CGRect(origin: CGPoint(x: 0, y: UIScreen.main.bounds.size.height - popupHeight), size: CGSize(width: presentedViewController.view.frame.size.width, height: popupHeight))
        }
    }
    
    private func changeDimmingViewAlphaAlongWithAnimation(to alpha: CGFloat) {
        guard let coordinator = presentedViewController.transitionCoordinator else {
            dimmingView.alpha = alpha
            return
        }
        
        coordinator.animate(alongsideTransition: { _ in
            self.dimmingView.alpha = alpha
        })
    }
    
    init(presentedViewController: UIViewController,
         presenting presentingViewController: UIViewController?,
         usingHeight height: CGFloat, withDimmingAlpha alpha: CGFloat) {
        self.popupHeight = height
        self.dimmingViewVisibleAlpha = alpha
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        setupDimmingView()
    }
    
    override func containerViewWillLayoutSubviews() {
        presentedView?.frame = frameOfPresentedViewInContainerView
    }
    
    override func presentationTransitionWillBegin() {
        containerView?.insertSubview(dimmingView, at: 0)
        changeDimmingViewAlphaAlongWithAnimation(to: dimmingViewVisibleAlpha)
    }
    
    override func dismissalTransitionWillBegin() {
        changeDimmingViewAlphaAlongWithAnimation(to: 0)
    }
    
    @objc fileprivate func handleTap(_ tap: UITapGestureRecognizer) {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}

private extension BottomPopupPresentationController {
    func setupDimmingView() {
        dimmingView = UIView()
        dimmingView.frame = CGRect(origin: .zero, size: UIScreen.main.bounds.size)
        dimmingView.backgroundColor = UIColor(white: 0.0, alpha: dimmingViewVisibleAlpha)
        dimmingView.alpha = 0.0
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        dimmingView.isUserInteractionEnabled = true
        dimmingView.addGestureRecognizer(tapGesture)
    }
}
