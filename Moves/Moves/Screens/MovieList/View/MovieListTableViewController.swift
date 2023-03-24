//
//  MovieListTableViewController.swift
//  Moves
//
//  Created by Zaven Madoyan on 23.03.23.
//

import UIKit
import RxCocoa
import RxSwift

final class MovieListTableViewController: UITableViewController {
    // MARK: - Properties
    private let heightForRowAt: CGFloat = 200
    private let contentOffsetY: CGFloat = 50
    private let movieRefreshControl = UIRefreshControl()
    
    // MARK: - Dependencies
    let viewModel: MovieListViewModel
    
    // MARK: - Initialization
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupPageControl()
        registerTableView()
        bind()
        viewModel.loadMovieList()
    }
    
    @objc func refresh() {
        viewModel.reloadPage()
        movieRefreshControl.endRefreshing()
    }
    
    // MARK: UITableViewDataSource & UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesModel.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieListTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if let currentMovie = viewModel.moviesModel[safe: indexPath.row] {
            cell.setup(with: currentMovie)
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRowAt
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.pushToDetail(indexPath)
    }
    
    // MARK: - UIScrollViewDelegate
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        guard !decelerate else { return }
        
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        fetchDataWhileScrollingDown(for: scrollView)
    }
    
    // MARK: Private methods
    private func setupView() {
        title = viewModel.navigationTitle
    }
    
    private func setupPageControl() {
        movieRefreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    private func registerTableView() {
        tableView.register(MovieListTableViewCell.self)
        tableView.separatorStyle = .none
    }
    
    private func bind() {
        viewModel.updatedIndexPathBehaviorRelay
            .asDriver()
            .drive(onNext: { [weak self] indexPaths in
                guard let strongSelf = self,
                      let updatedIndexPaths = indexPaths
                else { return }
                if updatedIndexPaths.isEmpty {
                    strongSelf.tableView.reloadData()
                } else {
                    strongSelf.tableView.insertRows(
                        at: updatedIndexPaths,
                        with: .automatic
                    )
                }
            }).disposed(by: viewModel.disposeBag)
    }
    
    private func fetchDataWhileScrollingDown(for scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offsetY >= contentHeight - scrollView.frame.height {
            guard !Environment.isMock else { return }
            
            if viewModel.pageNotOffset && !viewModel.isLoading {
                viewModel.loadMovieList()
                UIView.animate(withDuration: 1) {
                    self.tableView.contentOffset.y += self.contentOffsetY
                }
            }
        }
    }
}
