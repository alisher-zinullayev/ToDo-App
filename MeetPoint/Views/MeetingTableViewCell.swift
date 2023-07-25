//
//  MeetingTableViewCell.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 17.07.2023.
//

import UIKit

final class MeetingTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MeetingTableViewCell.self)
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(descriptionLabel)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let nameLabelConstraints = [
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let addressLabelConstraints = [
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 30),
            addressLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        let descriptionLabelConstraints = [
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        
        NSLayoutConstraint.activate(nameLabelConstraints)
        NSLayoutConstraint.activate(addressLabelConstraints)
        NSLayoutConstraint.activate(descriptionLabelConstraints)
    }
    
}
