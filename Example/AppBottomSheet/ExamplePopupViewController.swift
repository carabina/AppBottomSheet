//
//  ExamplePopupViewController.swift
//  BottomPopup
//
//  Created by Emre on 16.09.2018.
//  Copyright © 2018 Emre. All rights reserved.
//

import UIKit
import AppBottomSheet


class ExamplePopupViewController: BottomPopupViewController {

    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // Bottom popup delegate methods
    // You can override the desired method to change appearance
    
    override func getPopupHeight() -> CGFloat {
        return height ?? CGFloat(300)
    }
    
    override func getPopupTopCornerRadius() -> CGFloat {
        return topCornerRadius ?? 2
    }
    
    override func getPopupPresentDuration() -> Double {
        return presentDuration ?? 1.0
    }
    
    override func getPopupDismissDuration() -> Double {
        return dismissDuration ?? 1.0
    }
    
    override func shouldPopupDismissInteractivelty() -> Bool {
        return shouldDismissInteractivelty ?? true
    }
    
    override func canEnableSpringAnimation() -> Bool {
        return true
    }
    
    override func getOverlayAlpha() -> CGFloat {
        return 0.5
    }
}
