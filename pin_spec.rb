require 'spec_helper'
RSpec.describe Pin do
  it { should have_attached_file(:image) }
  it { should validate_attachment_content_type(:image).
                allowing("image/jpg", "image/jpeg", "image/png", "image/gif")}
end