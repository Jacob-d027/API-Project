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
        errorLabel.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dogButtonTapped(_ sender: UIButton) {
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
