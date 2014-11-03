//
//  PresentationController.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/6/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

import SpriteKit

public typealias Point = CGPoint
public typealias Vector = CGVector

//You can check for protocol conformance only if your protocol is marked with the @objc attribute
protocol UpdateBodyPropertiesDelegate {
    var whenPropertiesUpdate: (Void -> Void)? { get set }
}

public class PhysicsWorld: NSObject, SKSceneDelegate {
    
    struct ResourceIdentifiers {
        static let physicsScene = "PhysicsScene"
        struct ImageAssets {
            static let starBackground = "star_background"
        }
    }
    
    //MARK - Public Properties
    
    public let view: SKView
    public let scene: SKScene
    
    public var physics: SKPhysicsWorld {
        return scene.physicsWorld
    }
    
    public var center: CGPoint {
        return CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame))
    }
    
    public var field: SKFieldNode = SKFieldNode.radialGravityField()
    
    public var gravity: CGVector {
        get {
            return scene.physicsWorld.gravity
        }
        set {
            scene.physicsWorld.gravity = newValue
        }
    }
    
    //MARK - Private Properties
    var observationCount = 0
    
    override public init() {
        view = SKView(frame: CGRect(x: 0, y: 0, width: 850, height: 638))
        
        scene = SKScene(fileNamed: ResourceIdentifiers.physicsScene)
        scene.scaleMode = .AspectFill
        scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let backgroundTexture = SKTexture(imageNamed: ResourceIdentifiers.ImageAssets.starBackground)
        let background = SKSpriteNode(texture:backgroundTexture, size: view.bounds.size)
        scene.addChild(background)

        super.init()
        scene.delegate = self
        
        view.presentScene(scene)
    }
    
    //MARK - Physics Body delegate
    public func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
//        println("update")
    }
    
    public func didSimulatePhysicsForScene(scene: SKScene) {
        let maxCount = 500
        let observationRate = 5
        observationCount++

        for child in scene.children {
            if let node = child as? ExposedPhysicsBody {
                if (observationCount % observationRate) == 0
                    && observationCount < maxCount {
                    node.whenPropertiesUpdate?()
                }
            }
        }
    }
    
    //MARK - Helper methods
    
    public func addBody(node: ExposedPhysicsBody) {
        node.position = center
        
        scene.addChild(node)
    }
    
    public func activateGravityField() {
        //Setup RadialGravityField
//        field.strength = 2.0
//        field.exclusive = true
        field.position = center
        field.falloff = 0.5

        scene.addChild(field)
    }
}