//
//  PhysicsBody.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

import SpriteKit
import AppKit

public class ExposedPhysicsBody: SKSpriteNode, UpdateBodyPropertiesDelegate {
    // MARK: Public Properties
    
    public var mass: CGFloat {
        get {
            return physicsBody!.mass
        }
        set {
            physicsBody!.mass = newValue
        }
    }
    
    public var velocity: CGVector {
        return physicsBody!.velocity
    }
    
    public var angularVelocity: CGFloat {
        return physicsBody!.angularVelocity
    }
    
    // MARK - UpdateBodyPropertiesDelegate

    public var whenPropertiesUpdate: (Void -> Void)?
    
    // MARK: Initializers
    
    public init(imageNamed: String) {
        
        //Only designated initilizer for SKSpriteNode
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: NSColor.clearColor(), size: texture.size())
        
        //Add Physics Body
        physicsBody = SKPhysicsBody(texture: texture, size: size)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK - Functions

    public func applyForce(force: CGVector) {
        physicsBody!.applyForce(force)
    }
    
    public func applyImpulse(impulse: CGVector) {
        physicsBody!.applyImpulse(impulse)
    }
    
    public func applyAngularImpulse(impulse: CGFloat) {
        physicsBody!.applyAngularImpulse(impulse)
    }
}