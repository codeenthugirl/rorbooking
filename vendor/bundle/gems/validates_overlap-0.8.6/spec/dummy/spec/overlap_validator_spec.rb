require 'spec_helper'

describe OverlapValidator do
  context 'validation message' do
    it 'should have default message' do
      subject = OverlapValidator.new(attributes: [:starts_at, :ends_at])
      meeting = Meeting.new
      expect(subject).to receive(:overlapped_exists?) { true }
      subject.validate(meeting)
      expect(meeting.errors[:starts_at]).to eq ['overlaps with another record']
    end

    it 'should be possible to configure message' do
      subject = OverlapValidator.new(attributes: [:starts_at, :ends_at])
      meeting = Meeting.new
      expect(subject).to receive(:overlapped_exists?) { true }
      allow(subject).to receive(:options) { { message_title: :optional_key, message_content: 'Message content' } }
      subject.validate(meeting)
      expect(meeting.errors[:optional_key]).to eq ['Message content']
    end

    it 'should be possible to configure multiple keys for message' do
      subject = OverlapValidator.new(attributes: [:starts_at, :ends_at])
      meeting = Meeting.new
      expect(subject).to receive(:overlapped_exists?) { true }
      allow(subject).to receive(:options) { { message_title: [:optional_key_1, 'optional_key_2'], message_content: 'Message content' } }
      subject.validate(meeting)
      expect(meeting.errors[:optional_key_1]).to eq ['Message content']
      expect(meeting.errors[:optional_key_2]).to eq ['Message content']
    end
  end
end
