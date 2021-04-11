//
//  ActivityIndicator.swift
//  MedicalApplication
//
//  Created by Hala on 11/04/2021.
//

import Foundation
import UIKit
import NVActivityIndicatorView

class ActivityIndicator {
    
    var view : UIView?
    var activityIndicator : NVActivityIndicatorView?
    
    init(view:UIView) {
        self.view = view
        activityIndicator = NVActivityIndicatorView(frame: .zero, type: .ballPulse, color: MainColors.instance.secondaryColor, padding: 0)
    }
    fileprivate func buildIndicator() {
        activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
        view?.addSubview(activityIndicator!)
        NSLayoutConstraint.activate([
            activityIndicator!.widthAnchor.constraint(equalToConstant: (view?.frame.width)! * 0.2),
            activityIndicator!.heightAnchor.constraint(equalToConstant: (view?.frame.width)! * 0.1),
            activityIndicator!.centerXAnchor.constraint(equalTo: view!.centerXAnchor),
            activityIndicator!.centerYAnchor.constraint(equalTo: view!.centerYAnchor)
        ])
    }
    
    func startAnimating() {
        buildIndicator()
        activityIndicator?.startAnimating()
    }
    func stopAnimating() {
        activityIndicator?.stopAnimating()
    }
}
