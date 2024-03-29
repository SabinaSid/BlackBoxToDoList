//
//  EverythingIsDoneViewController.swift
//  BlackBoxToDoList
//
//  Created by Sabina Grinenko on 02.10.2023.
//

import UIKit

class EverythingIsDoneViewController: UIViewController {
    
    let congratulationsLabel = UILabel()
    let gif = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        congratulationsLabel.text = "That's all! You did all of your tasks!"
        congratulationsLabel.textAlignment = .center
        congratulationsLabel.shadowOffset = CGSize(width: 0, height: -1)
        congratulationsLabel.alpha = 1
        congratulationsLabel.numberOfLines = 6
        congratulationsLabel.font = UIFont(name: "STIX Two Text", size: 25)
        congratulationsLabel.textColor = .black
        congratulationsLabel.frame = CGRect()
        view.addSubview(congratulationsLabel)
        
        view.backgroundColor = .white
        
        gif.frame = CGRect(x: 50, y: 100, width: 50, height: 50)
        if let gifURL = Bundle.main.url(forResource: "box-animated", withExtension: "gif") {
            if let gifData = try? Data(contentsOf: gifURL) {
                if let gifImage = UIImage.gifImageWithData(gifData) {
                    gif.image = gifImage
                }
            }
        }
    
        view.addSubview(gif)
    
        congratulationsLabel.translatesAutoresizingMaskIntoConstraints = false
        gif.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            congratulationsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            congratulationsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            congratulationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            congratulationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            gif.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gif.topAnchor.constraint(equalTo: congratulationsLabel.bottomAnchor, constant: 50),
            gif.widthAnchor.constraint(equalToConstant: 50),
            gif.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UIImage {
    class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            return nil
        }
        
        let frameCount = CGImageSourceGetCount(source)
        var images: [UIImage] = []
        
        for i in 0..<frameCount {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                let image = UIImage(cgImage: cgImage)
                images.append(image)
            }
        }
        
        return UIImage.animatedImage(with: images, duration: -0.5)
    }
}
