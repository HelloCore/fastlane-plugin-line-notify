require 'fastlane/action'
require_relative '../helper/line_notify_helper'

module Fastlane
  module Actions
    class LineNotifyAction < Action
      def self.run(params)
        
        access_token = options[:access_token]
        message = options[:message]

        cmd = ['curl']
        cmd << 'https://notify-api.line.me/api/notify'
        cmd << '-X POST'
        cmd << "-H 'Content-Type: application/x-www-form-urlencoded'"
        cmd << "-H 'Authorization: Bearer #{access_token}'"
        cmd << "-d message='#{message}'"
        sh cmd.join(' ')      end

      def self.description
        "You can use this action to send message via Line Notify"
      end

      def self.authors
        ["AKKHARAWAT CHAYAPIWAT"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Just send message to Line Notify"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :access_token,
                                       env_name: "LINE_NOTIFY_ACCESS_TOKEN", # The name of the environment variable
                                       description: "Access Token for LineNotify", # a short description of this parameter
                                       verify_block: proc do |value|
                                          UI.user_error!("No API token for Line Notify given, pass using `access_token: 'token'`") unless (value and not value.empty?)
                                          # UI.user_error!("Couldn't find file at path '#{value}'") unless File.exist?(value)
                                       end),
           FastlaneCore::ConfigItem.new(key: :message,
                                       env_name: "LINE_NOTIFY_MESSAGE",
                                       description: "The message that should be displayed on Line Notify"),
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
