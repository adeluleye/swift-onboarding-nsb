//
//  ViewController.swift
//  user-walk-through-demo
//
//  Created by ADELU ABIDEEN ADELEYE on 10/9/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let topImageContainerView: UIView = {
        let view = UIView(frame: .zero)
        // view.backgroundColor = .blue
        return view
    }()
    
    let bearImageView: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "Join us today at Prepa and be part of our network", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.black])
        
        attributedText.append(NSAttributedString(string: "\n\n\nAre you ready for fun way of learning and pass your examination in one sitting using our platform", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.gray]))
        
        textView.attributedText = attributedText
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        
        return textView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        view.addSubview(topImageContainerView)
        view.addSubview(descriptionTextView)
        
        topImageContainerView.addSubview(bearImageView)
        
        
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.setAnchor(top: view.topAnchor, topPad: 0, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 0, right: view.rightAnchor, rightPad: 0, height: 0, width: 0)
        
        
        bearImageView.translatesAutoresizingMaskIntoConstraints = false
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        
        
        descriptionTextView.setAnchor(top: topImageContainerView.bottomAnchor, topPad: 20, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 0, width: 0)
    }


}

