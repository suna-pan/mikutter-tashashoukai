# -*- coding: utf-8 -*-

Plugin.create(:tashashoukai) do
    
    command(:tashashoukai,
        name: "他者紹介",
        condition: Plugin::Command[:CanReplyAll],
        visible: true,
        role: :timeline) do |m|
            m.messages.map do |msg|
                tashashoukai(msg) 
            end
        end

    def tashashoukai(tm)
        id = tm.idname
        widget = Gtk::PostBox.list.first.widget_post
        widget.buffer.text = " #{UserConfig[:tashashoukai_f]} @#{id} #{UserConfig[:tashashoukai_e]}"
        widget.sensitive = true
    end

    settings("他者紹介") do
        input("囲い文字（先頭）",:tashashoukai_f)
        input("囲い文字（末尾）",:tashashoukai_e)
    end
        
end
