//
//  PresentationController.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/6/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

import SpriteKit

public class PhysicsWorld {
    
    struct ResourceIdentifiers {
        static let physicsScene = "PhysicsScene"
        struct ImageAssets {
            static let starBackground = "star_background"
        }
    }
    
    public let view: SKView
    public let scene: SKScene
    
    public var gravity: CGVector {
        get {
            return scene.physicsWorld.gravity
        }
        set {
            scene.physicsWorld.gravity = newValue
        }
    }
    
    public init() {
        view = SKView(frame: CGRect(x: 0, y: 0, width: 850, height: 638))
        
        scene = SKScene(fileNamed: ResourceIdentifiers.physicsScene)
        
        // Configure the view.
        //Does not display in playgrounds :(
//        view.showsFPS = true
//        view.showsNodeCount = true
        
        scene.scaleMode = .AspectFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let backgroundTexture = SKTexture(imageNamed: ResourceIdentifiers.ImageAssets.starBackground)
        let background = SKSpriteNode(texture:backgroundTexture, size: view.bounds.size)
        scene.addChild(background)

        /* Sprite Kit applies additional optimizations to improve rendering performance */
        //        sceneView.ignoresSiblingOrder = true
        
        
        view.presentScene(scene)
    }
}