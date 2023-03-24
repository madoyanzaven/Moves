//
//  MovieListTableViewCell.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit
import RxSwift
import AlamofireImage

protocol Setupable {
    associatedtype SetupModel
    
    func setup(with model: SetupModel)
}

final class MovieListTableViewCell: UITableViewCell, ReusableNibLoadableView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var movieImageView: UIImageView!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    
    var disposeBag = DisposeBag()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        disposeBag = DisposeBag()
    }
}

extension MovieListTableViewCell: Setupable {
    typealias SetupModel = MovieModel
    
    func setup(with model: SetupModel) {
        titleLabel.text = model.title
        dateLabel.text = model.yearValue
        voteLabel.text = model.voteValue
        
        guard let imageUrl = model.imageUrl else { return }
        
        movieImageView.af.setImage(
            withURL: imageUrl,
            placeholderImage: Constants.Images.noImage)
    }
}
