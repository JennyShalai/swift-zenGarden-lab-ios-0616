//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imgRake: UIImageView!
    @IBOutlet weak var imgRock: UIImageView!
    @IBOutlet weak var imgShrub: UIImageView!
    @IBOutlet weak var imgSwordInRock: UIImageView!
    var topRockConstraint: NSLayoutConstraint?
    var topRakeConstraint: NSLayoutConstraint?
    var topSwordConstraint: NSLayoutConstraint?
    var topShrubConstraint: NSLayoutConstraint?
    var leftRockConstraint: NSLayoutConstraint?
    var leftRakeConstraint: NSLayoutConstraint?
    var leftSwordConstraint: NSLayoutConstraint?
    var leftShrubConstraint: NSLayoutConstraint?
    var differenceRockPoint: CGPoint?
    var differenceRakePoint: CGPoint?
    var differenceSwordPoint: CGPoint?
    var differenceShrubPoint: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // turning off all constraints from storyboard
        self.view.removeConstraints(self.view.constraints)
        self.view.translatesAutoresizingMaskIntoConstraints = false
        self.imgRake.removeConstraints(self.imgRake.constraints)
        self.imgRake.translatesAutoresizingMaskIntoConstraints = false
        self.imgRock.removeConstraints(self.imgRock.constraints)
        self.imgRock.translatesAutoresizingMaskIntoConstraints = false
        self.imgShrub.removeConstraints(self.imgShrub.constraints)
        self.imgShrub.translatesAutoresizingMaskIntoConstraints = false
        self.imgSwordInRock.removeConstraints(self.imgSwordInRock.constraints)
        self.imgSwordInRock.translatesAutoresizingMaskIntoConstraints = false
        
        // setting constraints programmaticly
        // for RAKE
        self.leftRakeConstraint = self.imgRake.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftRakeConstraint?.active = true
        self.topRakeConstraint = self.imgRake.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topRakeConstraint?.active=true
        self.imgRake.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active=true
        self.imgRake.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active=true
        
        // for ROCK
        self.leftRockConstraint = self.imgRock.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftRockConstraint?.active = true
        self.topRockConstraint = self.imgRock.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topRockConstraint?.active=true
        self.imgRock.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active=true
        self.imgRock.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active=true
        self.topRockConstraint?.constant = 150
        
        // for SHRUB
        self.leftShrubConstraint = self.imgShrub.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftShrubConstraint?.active = true
        self.topShrubConstraint = self.imgShrub.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topShrubConstraint?.active=true
        self.imgShrub.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active=true
        self.imgShrub.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active=true
        self.topShrubConstraint?.constant = 300
        
        // for SWORD
        self.leftSwordConstraint = self.imgSwordInRock.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor)
        self.leftSwordConstraint?.active = true
        self.topSwordConstraint = self.imgSwordInRock.topAnchor.constraintEqualToAnchor(self.view.topAnchor)
        self.topSwordConstraint?.active=true
        self.imgSwordInRock.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.3).active=true
        self.imgSwordInRock.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.3).active=true
        self.topSwordConstraint?.constant = 450
        
        // listners of touches
        let dragImgRockRecognizer = UIPanGestureRecognizer.init(target:self, action: #selector(self.draggingImgRock))
        let dragImgRakeRecognizer = UIPanGestureRecognizer.init(target:self, action: #selector(self.draggingImgRake))
        let dragImgSwordInRockRecognizer = UIPanGestureRecognizer.init(target:self, action: #selector(self.draggingImgSwordInRock))
        let dragImgShrubRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(self.draggingImgShrub))
        
        // links items with listners
        self.imgRock.addGestureRecognizer(dragImgRockRecognizer)
        self.imgRake.addGestureRecognizer(dragImgRakeRecognizer)
        self.imgSwordInRock.addGestureRecognizer(dragImgSwordInRockRecognizer)
        self.imgShrub.addGestureRecognizer(dragImgShrubRecognizer)
    }
    
    
    // if rock dragged
    func draggingImgRock(recognizer:UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.imgRock)
        if recognizer.state == .Began {
            self.differenceRockPoint = coordinates
        } else {
            if let differencePoint = self.differenceRockPoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topRockConstraint?.constant += diffY
                self.leftRockConstraint?.constant += diffX
                self.differenceRockPoint = coordinates
            }
        }
        
    }
    
    // if rake dragged
    func draggingImgRake(recognizer:UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.imgRake)
        if recognizer.state == .Began {
            self.differenceRakePoint = coordinates
        } else {
            if let differencePoint = self.differenceRakePoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topRakeConstraint?.constant += diffY
                self.leftRakeConstraint?.constant += diffX
                self.differenceRakePoint = coordinates
            }
        }
        
    }
    
    // if sword dragged
    func draggingImgSwordInRock(recognizer:UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.imgSwordInRock)
        if recognizer.state == .Began {
            self.differenceSwordPoint = coordinates
        } else {
            if let differencePoint = self.differenceSwordPoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topSwordConstraint?.constant += diffY
                self.leftSwordConstraint?.constant += diffX
                self.differenceSwordPoint = coordinates
            }
        }
        
    }
    
    // if shrub dragged
    func draggingImgShrub(recognizer:UIPanGestureRecognizer) {
        let coordinates = recognizer.translationInView(self.imgShrub)
        if recognizer.state == .Began {
            self.differenceShrubPoint = coordinates
        } else {
            if let differencePoint = self.differenceShrubPoint {
                let diffY = coordinates.y - differencePoint.y
                let diffX = coordinates.x - differencePoint.x
                
                self.topShrubConstraint?.constant += diffY
                self.leftShrubConstraint?.constant += diffX
                self.differenceShrubPoint = coordinates
            }
        }
        
    }
    
    
}

