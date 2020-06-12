require 'rails_helper'

RSpec.describe Post, type: :model do

  subject = Post.new { "hello, world!" }

  it { is_expected.to be }

  it "is not valid without a message" do
    subject.message = nil
    expect(subject).to_not be_valid
  end

end
