//
//  PhysicsScene.swift
//  Newtonian Playgrounds
//
//  Created by Michael DeWitt on 10/5/14.
//  Copyright (c) 2014 DeWitt.PHYS141.Playgrouds. All rights reserved.
//

import SpriteKit
import AppKit

public func addEarthToSolarSystem(scene: SKScene) {
    
    let sprite = SKSpriteNode(imageNamed:"earth")
    
    sprite.xScale = 0.3
    sprite.yScale = 0.3
    
    let center = CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame))
    
    //Actions
    let rotate = SKAction.rotateByAngle(CGFloat(-M_PI*2), duration:10)

    let circlularPath = CGPathCreateWithEllipseInRect(CGRectMake(center.x-250, center.y-250, 500, 500), nil)
    let orbit = SKAction.followPath(circlularPath, asOffset: false, orientToPath: true, duration: 10)
    
    let actionGroup = SKAction.group([rotate, orbit])
    
    sprite.runAction(SKAction.repeatActionForever(actionGroup))
    scene.addChild(sprite)
}

public func addSunToSolarSystem(scene: SKScene) {
    
    let sprite = SKSpriteNode(imageNamed:"sun")
    
    sprite.xScale = 0.5
    sprite.yScale = 0.5
    
    let center = CGPoint(x:CGRectGetMidX(scene.frame), y:CGRectGetMidY(scene.frame))
    sprite.position = center;
    
    //Actions
//    let rotate = SKAction.rotateByAngle(CGFloat(M_PI), duration:3)
//    
//    let circlularPath = CGPathCreateWithEllipseInRect(CGRectMake(-425, -319, 400, 400), nil)
//    let orbit = SKAction.followPath(circlularPath, asOffset: false, orientToPath: true, duration: 10)
//    
//    let actionGroup = SKAction.group([rotate, orbit])
//    
//    sprite.runAction(SKAction.repeatActionForever(actionGroup))
    scene.addChild(sprite)
}

public func addBallon(scene: SKScene) {
    let texture = SKTexture(imageNamed: "balloon-blue")
    var balloon = SKSpriteNode(texture: texture)
    balloon.position = CGPoint(x:10, y:1)
    scene.addChild(balloon)
}