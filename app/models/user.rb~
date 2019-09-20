class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
   #validates_uniqueness_of :unique_code

   ROLES = %w[admin moderator]


  def roles=(roles)
  self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  
  after_create :upcode
  def upcode
    update_column(:unique_code,  $r)
   
   # self.assign_attributes(unique_code: $r)
    
  end

 $r = ''


end
