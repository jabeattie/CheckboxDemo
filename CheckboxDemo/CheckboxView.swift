//
//  CheckboxView.swift
//  CheckboxDemo
//
//  Created by James Beattie on 04/05/2017.
//  Copyright © 2017 James Beattie. All rights reserved.
//

import UIKit

class CheckboxView: UIView {
    
    enum State: String {
        case unselected = "checkbox"
        case selected = "tick"
    }
    
    var state: State
    let imageView: UIImageView

    init(frame: CGRect, state: State) {
        self.state = state
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        imageView.translatesAutoresizingMaskIntoConstraints = true
        imageView.image = UIImage(named: state.rawValue)
        imageView.contentMode = .center
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func toggleState() {
        switch state {
        case .unselected:
            state = .selected
        case .selected:
            state = .unselected
        }
        
        CATransaction.begin()
        let scaleDown = CABasicAnimation(keyPath: "transform.scale")
        scaleDown.fromValue = imageView.layer.presentation()?.value(forKeyPath: "transform.scale")
        scaleDown.toValue = 0.1
        scaleDown.duration = 0.15
        scaleDown.isRemovedOnCompletion = false
        scaleDown.fillMode = kCAFillModeForwards
        CATransaction.setCompletionBlock {
            self.imageView.image = UIImage(named: self.state.rawValue)
            
            let scaleUp = CASpringAnimation(keyPath: "transform.scale")
            
            scaleUp.fromValue = self.imageView.layer.presentation()?.value(forKeyPath: "transform.scale")
            scaleUp.toValue = 1
            scaleUp.damping = 9
            scaleUp.duration = scaleUp.settlingDuration
            scaleUp.isRemovedOnCompletion = false
            scaleUp.fillMode = kCAFillModeForwards
            
            self.imageView.layer.add(scaleUp, forKey: "transform.scale")
            
        }
        imageView.layer.add(scaleDown, forKey: "transform.scale")
        CATransaction.commit()
        
    }

}
