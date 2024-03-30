import SwiftUI

public extension UIWindow {
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            NotificationCenter.default.post(name: .shakeEnded, object: nil)
        }
        super.motionEnded(motion, with: event)
    }
}
