class User < ApplicationRecord
  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i[create update]

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  
  private
    def add_default_avatar
      unless avatar.attached? # This checks whether the avatar is already associated with the user.
        avatar.attach(
          io: File.open( # it opens the file located at: "app/assets/images/default_profile.png"
            Rails.root.join(
              "app", "assets", "images", "default_profile.png"
            )
          ), 
          filename: "default_profile.png", # sets the filename for the attached avatar
          content_type: "image/png" || "image/jpg" # specifies the content type of the attached file (either PNG or JPG)
        )
      end
    end
end
