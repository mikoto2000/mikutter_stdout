# -*- coding: utf-8 -*-

Plugin.create(:stdout) do
    on_update do |service, messages|
        sorted_message = messages.sort_by{ |item| item['timestamp'] }
        sorted_message.each do |message|
            message_body = message.body.gsub(/\n/, "\n\t")
            puts "【#{message.user}】#{message_body}"
        end
        STDOUT.flush
    end
end
