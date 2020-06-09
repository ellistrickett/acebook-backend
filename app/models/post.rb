class Post < ApplicationRecord
  belongs_to :user

  def as_json(_options = {})
    super(only: [:id, :message, :created_at, :user_id],
    include: [user: { only: [:username] }]
      )
  end

end
