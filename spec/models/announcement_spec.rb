# == Schema Information
#
# Table name: announcements
#
#  id                :uuid             not null, primary key
#  announcement_type :string
#  description       :text
#  name              :string
#  published_at      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require 'rails_helper'

RSpec.describe Announcement, type: :model do

end
