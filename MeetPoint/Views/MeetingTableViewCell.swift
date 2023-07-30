//
//  MeetingTableViewCell.swift
//  MeetPoint
//
//  Created by Alisher Zinullayev on 17.07.2023.
//

import UIKit

final class MeetingTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: MeetingTableViewCell.self)
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(descriptionLabel)
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
    
    func configure(with todo: ToDoModel) {
        nameLabel.text = todo.name
        addressLabel.text = todo.address
                
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        descriptionLabel.text = dateFormatter.string(from: todo.date)
    }
    
}
