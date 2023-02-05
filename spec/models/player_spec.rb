require 'rails_helper'

describe Player do
  it { should have_many :player_quantities }
  it { should have_many(:quantities).through :player_quantities }
  it { should belong_to(:location).optional }
  it { should belong_to(:destination).class_name(Location).optional }
  it { should have_one_attached(:avatar) }

  let(:player) { create(:player) }

  describe 'avatar' do
    let(:test_file_path) { Rails.application.root + "spec/fixtures/files/test_image.jpg" }
    let(:test_file) { File.open(test_file_path) }
    let(:test_file_name) { File.basename(test_file_path) }
    let(:io) { test_file.to_io }
    let(:avatar) do
      ActiveStorage::Blob.create_and_upload!(
        io: io,
        filename: test_file_name
      )
    end
    
    it 'works right' do
      expect { player.update(avatar: avatar) }.not_to raise_error
      expect(player.avatar.attachment.blob).to eq avatar
    end
  end
end
