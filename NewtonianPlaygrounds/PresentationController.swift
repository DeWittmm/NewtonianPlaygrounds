//
//  PresentationController.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/6/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

import UIKit
import SpriteKit

public extension SKNode {
    class func unarchiveFromFile(file : NSString) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData.dataWithContentsOfFile(path, options: .DataReadingMappedIfSafe, error: nil)
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as PhysicsScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

public func presentScene() {
    let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 850, height: 638))
    let scene = SKScene(fileNamed: "GameScene")
    scene.scaleMode = .AspectFill
    sceneView.presentScene(scene)
    scene.physicsWorld.gravity = CGVector(0, -10)
}