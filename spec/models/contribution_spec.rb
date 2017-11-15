require 'rails_helper'
describe Contribution do
  it { should validate_presence_of :username }
  it{ should belong_to :story}
end
