require 'rails_helper'

describe Player do
  it { should have_many :player_quantities }
  it { should have_many(:quantities).through :player_quantities }
  it { should belong_to(:location).optional }
  it { should belong_to(:destination).class_name(Location).optional }
  it { should have_one_attached(:avatar) }

  let!(:player) { create(:player, avatar: avatar, state: state) }
  let(:state) { 'normal' }
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
  
  describe 'avatar' do
    it 'works right' do
      expect { player.update(avatar: avatar) }.not_to raise_error
      expect(player.avatar.attachment.blob).to eq avatar
    end
  end
  
  describe 'avatar_urls' do
    it 'works right' do
      expect(player.avatar_urls.keys).to include(
        :xsmall,
        :small,
        :medium,
        :large,
        :xlarge,
        :xxlarge
      )
    end 
  end
  
  describe 'state_machine' do
    xit 'has a default value of normal' do
      expect(player.state).to eq(:normal)
    end

    context 'when player is in normal mode' do
      let(:state) { :normal }

      describe 'start_travel' do
        let(:action) { :start_travel! }

        it 'changes state to travel' do
          expect do
            player.send(action)
            player.reload
          end.to change(player, :state).to('travel')
        end
      end

      describe 'finish_travel' do
        let(:action) { :finish_travel! }

        it "raises an exception" do
          expect do
            player.send(action)
            player.reload
          end.to raise_error(AASM::InvalidTransition)
        end
      end
    end

    context 'when player is in travel mode' do
      let(:state) { :travel }

      describe 'start_travel' do
        let(:action) { :start_travel! }

        it "raises an exception" do
          expect do
            player.send(action)
            player.reload
          end.to raise_error(AASM::InvalidTransition)
        end
      end

      describe 'finish_travel' do
        let(:action) { :finish_travel! }

        it 'changes state to normal' do
          expect do
            player.send(action)
            player.reload
          end.to change(player, :state).to('normal')
        end
      end
    end
  end
end
