require 'test_helper'

class DatasetHelperTest < ActiveSupport::TestCase
  include DatasetHelper

  test "should allow HTML br tag" do
    initial = "hi <br /> hello <br>"
    modified = sanitize_markup(initial)
    assert modified == "hi <br/> hello <br/>", modified
  end

  test "should allow HTML strong tag" do
    initial = "<strong>Strong</strong> tags are for bold words!"
    modified = sanitize_markup(initial)
    assert modified == "<strong>Strong</strong> tags are for bold words!"
  end

  test "should allow HTML p tag" do
    initial = "Well... this is a <p> paragraph </p>..."
    modified = sanitize_markup(initial)
    assert modified == "Well... this is a <p> paragraph </p>..."
  end

  test "should allow HTML em tag" do
    initial = "We'll emphasize this sentence for some <em>emphasis</em>"
    modified = sanitize_markup(initial)
    assert modified == "We'll emphasize this sentence for some <em>emphasis</em>"
  end

  test "should not allow HTML tags img, script, a, etc..." do
    initial = "This is a dirty sentence with potential for XSS hacking <img src='questionable-link' /> <a href=\"hackers-hide-away\">enter your banking info</a> <script>document.onload = function() { alert('hacked'); };</script>"
    modified = sanitize_markup(initial)

    assert modified == "This is a dirty sentence with potential for XSS hacking enter your banking info document.onload = function() { alert('hacked'); };", modified
  end
  
end
