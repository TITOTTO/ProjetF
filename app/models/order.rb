class Order < ApplicationRecord
    # after_create :odermail

    has_many :articles
    belongs_to :user

    def ordermail
        UserMailer.order(self).deliver_now
    end
end
