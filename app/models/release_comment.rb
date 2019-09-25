class ReleaseComment < ApplicationRecord
  belongs_to :user ,optional: true
  belongs_to :release ,optional: true
end
