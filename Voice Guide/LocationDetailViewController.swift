//
//  LocationDetailViewController.swift
//  Voice Guide
//
//  Created by YU FU YAM on 13/1/2022.
//

import UIKit
import AVFoundation
import CoreLocation
import MapKit

class LocationDetailViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var voiceBtn: UIButton?
    @IBOutlet weak var textView: UITextView?
    var locationNumber:Int?
    var locationInfo = ""
    let synthesizer = AVSpeechSynthesizer()
    let menuButton = UIButton()
    var latitude: CLLocationDegrees = 0.0
    var longitude: CLLocationDegrees = 0.0
    var locationName = ""
    @IBOutlet weak var backBarBtn: UINavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load()
        getLocationGPS()
        locationText()
        locationDetail()
    }
    
    func load() {
        let locationPath = "location\(locationNumber!)"
        imageView?.image = UIImage(named: locationPath)
    }
    
    func locationDetail() {
        self.textView?.text = locationInfo;
        locationLabel.text = locationName;
    }
    
    @IBAction func textToSpeech(_ sender: Any) {
        if synthesizer.isSpeaking {
            if synthesizer.isPaused {
                synthesizer.continueSpeaking()
                voiceBtn?.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            }else {
                synthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
                voiceBtn?.setImage(UIImage(systemName: "play.circle"), for: .normal)
            }
        }else{
            let Outsiders = AVSpeechUtterance(string: locationInfo)
            voiceBtn?.setImage(UIImage(systemName: "pause.circle"), for: .normal)
            Outsiders.voice = AVSpeechSynthesisVoice(language: "en-US")
            synthesizer.speak(Outsiders)
        }
        
    }
    
    @IBAction func mapNavigation(_ sender: Any) {
        let targetLocation=CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let targetPlacemark=MKPlacemark(coordinate: targetLocation)
        let targetItem=MKMapItem(placemark: targetPlacemark)
        let userMapItem=MKMapItem.forCurrentLocation()
        let routes=[userMapItem,targetItem]
        let options = [MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving]
        targetItem.name = locationName
        MKMapItem.openMaps(with: routes, launchOptions: options)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    func locationText() {
        //var locationText = ""
        switch locationNumber {
        case 1 :
            locationInfo = "Chungking Mansions is a building located in Tsim Sha Tsui, Kowloon. It consists of many independent low-cost hotels, shops and other services. Most of the shops in the house are opened for non-Asian ethnicity, and the currency exchange shops in the interior are the first choice for Hong Kong people to exchange currency."
            break
        case 2 :
            locationInfo = "The Tsim Sha Tsui Clock Tower is a Declared Monument building in Hong Kong in the Edwardian Classical Revival style, completed in 1915. The bell tower is 44 meters high, built of red brick and granite, and the roof is equipped with a 7-meter-high lightning rod. The bell tower was originally part of the Tsim Sha Tsui Terminus building of the Kowloon-Canton Railway."
            break
        case 3 :
            locationInfo = "Tian Tan Buddha is one of the largest Buddha statues of its kind in the world and took 12 years to complete. Underneath the Buddha statue, there are three levels of exhibition halls, displaying precious religious artefacts including the relics of the Buddha's real body. Also, people can climb 268 stone steps to the third floor altar to worship the Buddha and enter the area of the Buddha, you can see the \"Six Heavenly Mothers\"surrounding the Buddha."
            break
        case 4 :
            
            locationInfo = "Wong Tai Sin Temple was built in 1945 and is one of the most famous temples in Hong Kong. Every year, on the first day of the Lunar New Year, people have to fight for the first incense. It is said that the Wong Tai Sin Temple is dedicated to a \"grant whatever is asked for\"."
            break
        case 5 :
            
            locationInfo = "Hong Kong Disneyland is a fantasy world full of wonder. The park is divided into seven zones: Adventureland; Fantasyland; Toy Story Land; Tomorrowland; Grizzly Gulch; Mystic Point; and Main Street, U.S.A.. Also, Hong Kong Disneyland has a Performances: Parades / Musicals / Evening fireworks."
            break
        case 6 :
            locationInfo = "Lan Kwai Fong is a narrow street with a long history in Hong Kong, lined with restaurants, nightclubs and bars. Popular with expatriates and tourists alike, Lan Kwai Fong is one of Hong Kong's signature tourist attractions.Lan Kwai Fong have a may Activity e.g Halloween street party, Christmas and New Year Celebrations, Lan Kwai Fong Carnival and Lan Kwai Fong Beer & Music Fest."
            break
        case 7 :
            locationInfo = "Tai O Village offers visitors a different experience. Even though it is a popular tourist attraction, the atmosphere in Tai O is more tranquil and comfortable than that of urban attractions and theme parks, where people can experience a quiet and slower pace of life away from the hustle and bustle of the city."
            break
        case 8 :
            locationInfo = "The Avenue of Stars is a tribute to some of Hong Kong's most famous movie stars, displaying the handprints of famous stars, arranged in chronological order on the Avenue of Stars. Modeled after the Hollywood Walk of Fame, the Hong Kong Walk of Fame is dedicated to Chinese performers. There is also a great view of Hong Kong and Victoria Harbour."
            break
        case 9 :
            locationInfo = "Cheung Son Ancient Temple is a two-step temple building located on the Temple Trail of Toshih Ho Trail in Fanling Ping, formerly known as Changsheng An, built in 1789 and listed as a Hong Kong Monument in 1998. Changshan Ancient Temple was once a must for travelers to Shenzhen."
            break
        case 10 :
            locationInfo = "The Tang Kwong U Ancestral Hall was built in 1701 and was built in honor of Deng Guangyu like the Six Future. The ancestral hall was used for shop and factory purposes and was listed as a Hong Kong Monument in 2010 after a restoration project in 1996."
            break
        case 11 :
            locationInfo = " Built in 1906, Island House is a typical colonial-style building, originally used as a new territories clerk's residence at the time, and later converted into the residence of the Secretary of State, and is now the Natural Environment Conservation Research Center of the World Nature (Hong Kong) Foundation. Island House was listed as a Hong Kong Monument in 1983."
            break
        case 12 :
            locationInfo = "Rock Carving on Kau Sai Chau is a horological carving found in 1976 on the northwest coast of JiaoxiZhou, about two meters above the highest water level. The Jiao Xi Chau stone carving was listed as a Hong Kong monument in 1979."
            break
        default:
            break
        }
        
        
    }
    func getLocationGPS(){
        if locationNumber == 1 {
            locationName = "Chungking Mansions"
            latitude = 22.2969211
            longitude = 114.1698332
        }else if locationNumber == 2{
            locationName = "Hong Kong Clock Tower"
            latitude = 22.2935624
            longitude = 114.1673641
        }else if locationNumber == 3{
            locationName = "Tian Tan Buddha"
            latitude = 22.2539834
            longitude = 113.8874744
        }else if locationNumber == 4{
            locationName = "Wong Tai Sin Temple"
            latitude = 22.3427257
            longitude = 114.1910695
        }else if locationNumber == 5{
            locationName = "Hong Kong Disneyland"
            latitude = 22.3169741
            longitude = 114.0264959
        }else if locationNumber == 6{
            locationName = "Lan Kwai Fong"
            latitude = 22.2810697
            longitude = 114.1543833
        }else if locationNumber == 7{
            locationName = "Tai O Fishing Village"
            latitude = 22.2536082
            longitude = 113.8461248
        }else if locationNumber == 8{
            locationName = "Avenue Of Stars"
            latitude = 22.2930147
            longitude = 114.1719604
        }else if locationNumber == 9{
            locationName = "Cheung Shan Monastery"
            latitude = 22.529142
            longitude = 114.1734192
        }else if locationNumber == 10{
            locationName = "Tang Kwong U Ancestral Hall"
            latitude = 22.446141
            longitude = 114.0587866
        }else if locationNumber == 11{
            locationName = "Island House"
            latitude = 22.4459458
            longitude = 114.1787409
        }else if locationNumber == 12{
            locationName = "Rock Carving on Kau Sai Chau"
            latitude = 22.3670911
            longitude = 114.300811
        }
    }
}
