import SpriteKit
import GameplayKit

class Level3: SKScene {
    
    var nextLevelButton:SKLabelNode!
    
    
    override func didMove(to view: SKView) {
        print("Loaded level 3")
        
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as! SKLabelNode
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if (touch == nil) {
            return
        }
        
        let location = touch!.location(in:self)
        let node = self.atPoint(location)
        
        
        
        
        // MARK: Switch Levels
        // This is level 3, so i made it go back to level 1
        // Change it if you want
        if (node.name == "nextLevelButton") {
            let scene = SKScene(fileNamed:"GameScene")
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
