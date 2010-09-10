require 'test_helper'

class AccountTest < ActiveSupport::TestCase

  test "jr model doesn't include sensitive stuff" do
    # This is redundant, but just want to make extra sure we don't send anything sensitive. 
    bob = Account.find_by_id(1)
    bob_json = bob.jr_bundle.to_json
    assert_no_match /password/i, bob_json
    assert_no_match /secret/i, bob_json
  end

  test "jr model builds correct json" do
    bob = Account.find_by_id(1)
    bob_json = bob.jr_bundle.to_json
    expected_json = '{"custom_message":"Hi Mom!","jr_updated":{"Comment":[{"updated_at":"2010-01-01T00:00:00Z","id":1,"message":"This comment 1 by bob on 1"},{"updated_at":"2010-01-01T00:00:00Z","id":3,"message":"This comment 3 by bob on 2"}],"Post":[{"updated_at":"2010-01-01T00:00:00Z","id":1,"message":"this is post_1"}],"Account":[{"name":"Bob Johnson","updated_at":"2010-01-01T00:00:00Z","id":1,"login":"bob","email":"bob@example.com"}]}}'
    assert_equal ActiveSupport::JSON.decode(expected_json), ActiveSupport::JSON.decode(bob_json)
  end
  
end
