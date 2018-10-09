//
//  ViewController.swift
//  user-walk-through-demo
//
//  Created by ADELU ABIDEEN ADELEYE on 10/9/18.
//  Copyright © 2018 Spantom Technologies Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let image = UIImage(named: "bear_first")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Join us today at Prepa and be part of our network!"
        textView.textColor = .black
        textView.font = UIFont.boldSystemFont(ofSize: 18)
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
        view.addSubview(bearImageView)
        view.addSubview(descriptionTextView)
        
        bearImageView.setAnchor(top: view.topAnchor, topPad: 100, bottom: nil, bottomPad: 0, left: nil, leftPad: 0, right: nil, rightPad: 0, height: 200, width: 200)
        
        bearImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionTextView.setAnchor(top: bearImageView.bottomAnchor, topPad: 100, bottom: nil, bottomPad: 0, left: view.leftAnchor, leftPad: 16, right: view.rightAnchor, rightPad: 16, height: 100, width: 0)
        
    }


}

