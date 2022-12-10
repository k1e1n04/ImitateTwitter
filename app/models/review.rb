class Review < ApplicationRecord
  belongs_to :reviewer, class_name: "User"
  belongs_to :reviewing, class_name: "User"
end
