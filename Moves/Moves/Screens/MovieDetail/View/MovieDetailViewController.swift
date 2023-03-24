//
//  MovieDetailViewController.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit

final class MovieDetailViewController: UIViewController {
    let detailView: DetailView = DetailView.loadFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        bind()
        viewModel.loadDetail()
    }
    
    // MARK: - Dependencies
    let viewModel: MovieDetailViewModel
    
    // MARK: - Initialization
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(detailView)
    }
    
    private func setupConstraints() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    private func bind() {
        viewModel.displayPublishRelay.bind { [weak self] model in
            self?.detailView.setup(with: model)
        }.disposed(by: viewModel.disposeBag)
    }
}
