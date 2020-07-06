class ReportTag < ApplicationRecord
  belongs_to :tag
  belongs_to :report
end
