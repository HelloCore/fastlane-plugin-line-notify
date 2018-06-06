describe Fastlane::Actions::LineNotifyAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The line_notify plugin is working!")

      Fastlane::Actions::LineNotifyAction.run(nil)
    end
  end
end
