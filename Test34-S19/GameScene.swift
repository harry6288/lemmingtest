//
//  GameScene.swift
//  Test34-S19
//
//  Created by MacStudent on 2019-06-19.
//  Copyright © 2019 rabbit. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var nextLevelButton:SKLabelNode!
    
    let dino = SKSpriteNode(imageNamed: "dino")
    var timeOfLastUpdate:TimeInterval = 0
    var dt: TimeInterval = 0
    var wall:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        print("This is level 1")
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
        self.wall?.physicsBody?.collisionBitMask = 0
    }
    func spawndino() {
        let dino = SKSpriteNode(imageNamed:"frame-1")
        
        // put sand at a random (x,y) position
        let x = self.size.width/2
        let y = self.size.height - 100
        dino.position.x = x
        dino.position.y = y
        
        // add physics
        dino.physicsBody = SKPhysicsBody(circleOfRadius: dino.size.width / 2)
        self.dino.physicsBody?.affectedByGravity = false
        var dinoTextures:[SKTexture] = []
        for i in 1...4 {
            let fileName = "frame-\(i)"
            print("Adding: \(fileName) to array")
            dinoTextures.append(SKTexture(imageNamed: fileName))
        }
        
        let walkingAnimation = SKAction.animate(
            with: dinoTextures,
            timePerFrame: 0.1)
        
        // 3. Repeat the animation forever
        addChild(dino)
        self.dino.run(SKAction.repeatForever(walkingAnimation))
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        self.dt = currentTime - timeOfLastUpdate
        if (self.dt >= 2.5) {
            timeOfLastUpdate = currentTime
            self.spawndino()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"Level2")
            if (scene == nil) {
                print("Error loading level")
                return
            }
            else {
                scene!.scaleMode = .aspectFill
                view?.presentScene(scene!)
            }
        }
        
    }
}

