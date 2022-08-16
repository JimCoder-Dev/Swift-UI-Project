import Foundation
import UIKit
fileprivate final class HapticsManager{
    static let shared = HapticsManager()
    
    private let feedback = UINotificationFeedbackGenerator()
    
    private init() {}
    
    func trigger(_ notification: UINotificationFeedbackGenerator.FeedbackType){
        feedback.notificationOccurred(notification)
    }
}

func haptic(_ notifaction: UINotificationFeedbackGenerator.FeedbackType){
    if UserDefaults.standard.bool(forKey: UserDefaultKeys.hapticsEnabled){
        HapticsManager.shared.trigger(notifaction)
    }
    
}
