//
//  PhysicsBody.swift
//  NewtonianPlaygrounds
//
//  Created by Michael DeWitt on 10/12/14.
//  Copyright (c) 2014 DeWitt.PHYSICS.Playgrounds. All rights reserved.
//

import SpriteKit
import AppKit

public class PhysicsBody: SKSpriteNode {
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
    
    // MARK: Initializers
    
    public init(imageNamed: String) {
        
        //Only designated initilizer for SKSpriteNode
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: NSColor.clearColor(), size: texture.size())
        
        //Add Physics Body
        physicsBody = SKPhysicsBody(texture: texture, size: size)
        physicsBody!.linearDamping = 0.5
        physicsBody!.mass = 0.1
        physicsBody!.affectedByGravity = false
    }
    
    required public init(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    func addActions() {
        fatalError("addActions has not been implemented")
    }
}