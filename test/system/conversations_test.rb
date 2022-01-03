require "application_system_test_case" 

class ConversationTest <ApplicationSystemTestCase 
    setup do 
        @conversation = conversations(:one) 
    end 
    test "visiting the index" do 
        visit conversations_url
    assert_selector "h1", text: "Conversations"
    end 
    test "creating a conversation" do 
        visit conversations_url
        click_on "New conversation" 
        
     fill_in "User" , with : @conversation.user_id
     click_on "Create Conversation" 
     assert_text "Conversation was successfully created "  
     click_on "Back" 
    end 
     test "destroying a conversation" do 
        visit conversations_url
        page.accept_confirm do 
            click_on "Destroy" ,match :: first 
        end 
        assert_text "Conversation was successfully destroyed" 
    end
end 
