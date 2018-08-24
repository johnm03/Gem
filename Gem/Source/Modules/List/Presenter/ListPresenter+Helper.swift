//
//  ListPresenter+Helper.swift
//  FruitViewer

import UIKit

extension ListPresenter {

    /// Call this method to obtain a loading view.
    ///
    /// - Returns: Loading View.
    func loadingView() -> UIView {
        return UIView.loadViewFromNib(as: LoadingView.self)
    }

    /// Call this method to obtain a No Data Error View.
    ///
    /// - Returns: An Error View with appropriate label text.
    func noDataView() -> UIView {
        let errorView = errorStatusView()
        errorView.label.text = Strings.noFruitsToShow
        errorView.onRetryButtonSelect = self.viewController?.reloadFruitList

        return errorView
    }

    /// Call this method to obtain an Error view for a given Error.
    ///
    /// - Parameter error: Error to use, to construct Error View.
    /// - Returns: Error View with appropriate label text.
    func errorView(forError error: Error) -> UIView {

        let errorView = errorStatusView()
        
        errorView.onRetryButtonSelect = self.viewController?.reloadFruitList
        
        let errorLabel: String

        if let fruitDataNetworkError = error as? ListNetworkService.ListNetworkingError {
            errorLabel = errorMessage(forError: fruitDataNetworkError)
        } else if let networkError = error as? NetworkServiceError {
            errorLabel = errorMessage(forError: networkError)
        } else {
            errorLabel = Strings.unexpectedError
        }

        errorView.label.text = errorLabel

        return errorView

    }
    
    func errorMessage(forError error: ListNetworkService.ListNetworkingError) -> String {
        
        switch error {
        case .noData:
            return Strings.noDataFromAPI
        case .unableToParseData:
            return Strings.badResponseFromAPI
        }
    }
    
    func errorMessage(forError error: NetworkServiceError) -> String {
        
        switch error {
        case .noConnection:
            return Strings.noNetworkConnection
        case .couldNotBuildURL, .HTTPError:
            return Strings.unexpectedError

        }
    }

    private func errorStatusView() -> ErrorView {
        return UIView.loadViewFromNib(as: ErrorView.self)
    }
    
}
