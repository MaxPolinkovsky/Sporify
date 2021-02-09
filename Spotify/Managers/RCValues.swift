//
//  RCValues.swift
//  Spotify
//
//  Created by Max Polinkovsky on 03.02.21.
//

import UIKit
import Firebase

enum ValueKey: String {
    case azureColor
    case whiteColor
}

//https://www.raywenderlich.com/17323848-firebase-remote-config-tutorial-for-ios
class RCValues {
    
    static let shared = RCValues()
    private var convertedColor: UIColor!
    private init()  {
        loadDefaultValues()
        fetchCloudValues()
    }
    //Singleton
    func loadDefaultValues() {
        let appDefaults: [String : Any?] = [
            ValueKey.azureColor.rawValue : azureColor,
            ValueKey.whiteColor.rawValue: whiteColor
        ]
        RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String : NSObject])
    }
    
    func fetchCloudValues() {
        //1 Включив режим отладки, вы говорите Remote Config обойти дроссель на стороне клиента. Для целей разработки или тестирования с вашей командой из 10 человек, это нормально. Но если вы запустите это приложение для публики с вашими миллионами поклонников, вы довольно быстро нажмете на дроссель на стороне сервера, и Remote Config перестанет работать. В этом вся причина того, что у вас дроссель на стороне клиента. Перед тем, как запустить это приложение по-настоящему, убедитесь, что вы отключили режим отладки и установили ваш минимальныйFetchInterval на что-то более разумное, например, 43200 - это 12 часов для нас с вами
        activateDebugMode()
        //2 Если Remote Config встретит ошибку во время процесса извлечения, он выйдет из процесса, прежде чем применить полученные значения. Не беспокойтесь о предупреждении для weak self. Вы добавите код для адресации предупреждения позже в этом учебном пособии.
        RemoteConfig.remoteConfig().fetch { [weak self] _, error in
            if let error = error {
                print("Got an error fetching remote values \(error)")
                // В реальном приложении вы, вероятно, захотите вызвать загрузку все равно сделал обратный вызов и просто перейдите к значениям по умолчанию. Я не буду делать это здесь, поэтому мы можем привлечь внимание к тому факту, что Remote Config не загружается.
                return
            } 
        }
        //3 Если значения успешно загружены из облака, то Remote Config будет использовать новые значения вместо значений по умолчанию, жестко запрограммированных в приложении.
        RemoteConfig.remoteConfig().activate { [weak self] _, _ in
            print("Retrived values from cloud")
            
            let appAzureColor = RemoteConfig.remoteConfig()
                .configValue(forKey: "\(azureColor)")
                .stringValue ?? "undefindet"
            let appWhiteColor = RemoteConfig.remoteConfig()
                .configValue(forKey: "\(whiteColor)")
            print("Our app's primary color is: \(appAzureColor)")
            print("Our app's primary color is: \(appWhiteColor)")
        }
    }
    
    func color(forKey key: ValueKey) -> UIColor {
        let colorAsHexString = RemoteConfig.remoteConfig()[key.rawValue].stringValue ?? "#FFFFFF"
        convertedColor = UIColor(colorAsHexString)
        return convertedColor
    }
    
    //MARK: Fetching Values from Cloud
    //По умолчанию Remote Config будет кэшировать любые значения, которые он получит из облака примерно на 12 часов. Дроссель на стороне клиента гарантирует, что вы не будете пинговать службу слишком часто. В производственном приложении это, вероятно, нормально. Но когда вы занимаетесь разработкой - или следуете онлайн-учебнику Firebase Remote Config - это может сделать тестирование новых значений действительно сложным. Поэтому вместо этого вы указываете минимальное значениеFetchInterval, равное 0, чтобы гарантировать, что вы никогда не будете использовать кэшированные данные.
    
    func activateDebugMode() {
        let settings = RemoteConfigSettings()
        // ПРЕДУПРЕЖДЕНИЕ: На самом деле не делайте этого в производстве!
        settings.minimumFetchInterval = 0
        RemoteConfig.remoteConfig().configSettings = settings
    }
}
