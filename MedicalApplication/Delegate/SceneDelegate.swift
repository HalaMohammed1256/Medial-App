//
//  SceneDelegate.swift
//  MedicalApplication
//
//  Created by Hala on 10/04/2021.
//

import UIKit
import MOLH
import IQKeyboardManagerSwift


class SceneDelegate: UIResponder, UIWindowSceneDelegate{//, MOLHResetable
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowsScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowsScene)
        IQKeyboardManager.shared.enable = true
    
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
        
        
        
        guard let rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RoshtaCodeVerificationViewController") as? UIViewController else{
            print("window is nil")
            return
        }
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }

    
}

extension SceneDelegate : MOLHResetable{

    func reset() {
        guard let rootViewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RoshtaCodeVerificationViewController") as? UIViewController else{
            print("window is nil")
            return
        }
        
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
}
