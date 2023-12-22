//
//  DogViewController.swift
//  API Project
//
//  Created by Jacob Davis on 12/6/23.
//

import UIKit

class DogViewController: UIViewController {

    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var dogImageView: UIImageView!
    
    let dogController = DogController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchNewDog()
        errorLabel.isHidden = true
    }
    
    @IBAction func dogButtonTapped(_ sender: UIButton) {
        fetchNewDog()
    }
    
    func fetchNewDog() {
        Task {
            do {
                let dog = try await dogController.fetchRandomDog()
                let dogImageData = try await dogController.fetchRandomImage(for: dog.imageURL)
                dogImageView.image = UIImage(data: dogImageData)
            } catch {
                errorLabel.text = "There was an error! Try again later."
                dogImageView.isHidden = true
            }
        }
    }

}
