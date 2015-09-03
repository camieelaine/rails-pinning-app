require 'rails_helper'

it { should validate_presence_of(:first_name) }

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
