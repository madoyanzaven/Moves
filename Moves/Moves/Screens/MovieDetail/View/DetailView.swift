//
//  DetailView.swift
//  Moves
//
//  Created by Zaven Madoyan on 24.03.23.
//

import UIKit

final class DetailView: UIView {
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .systemGray6
    }
}

extension DetailView: Setupable {
    typealias SetupModel = MovieModel
    
    func setup(with model: SetupModel) {
        titleLabel.text = model.title
        dateLabel.text = model.yearValue
        overviewLabel.text = model.overview
        
        guard let imageUrl = model.imageUrl else { return }
        
        movieImageView.af.setImage(
            withURL: imageUrl,
            placeholderImage: Constants.Images.noImage)
    }
}
