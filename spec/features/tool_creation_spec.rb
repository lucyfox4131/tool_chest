require 'rails_helper'

RSpec.feature "Tool management", type: :feature do

  scenario "user creates a new tool" do
    visit new_tool_path #'tools/new'
    #visit a page with form to create a new tool
    fill_in "tool[name]", with: "Screwdriver"
    fill_in "tool[price]", with: 10.99
    fill_in "tool[quantity]", with: 10
    #fill in the tool's attributes, name, price and quantity
    find(:button, "Create Tool").click #new preffered way of doing this.
    #click button create tool and submit the form
    expect(current_path).to eq(tool_path(Tool.last.id))
    #check we are on show page
    within(".tool_info li:nth-child(1)") do
      expect(page).to have_content("Screwdriver")
    end

    within(".tool_info li:nth-child(2)") do
      expect(page).to have_content("$10.99")
    end

    within(".tool_info li:nth-child(3)") do
      expect(page).to have_content("InStock: 10")
    end
    #scope down by checking that this is all within an html class .tool_info
    #check and make sure each attribute that was filled in has saved and are being displayed on page

  end
end
