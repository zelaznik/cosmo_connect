class RequireSendReceiveValuesToBeDifferent < ActiveRecord::Migration
  def up
    execute 'ALTER TABLE matches ADD CONSTRAINT check_matches_sender_neq_receiver CHECK (sender_id != receiver_id)'
    execute 'ALTER TABLE messages ADD CONSTRAINT check_messages_sender_neq_receiver CHECK (sender_id != receiver_id)'
  end

  def down
    execute 'ALTER TABLE matches DROP CONSTRAINT IF EXISTS check_matches_sender_neq_receiver'
    execute 'ALTER TABLE messages DROP CONSTRAINT IF EXISTS check_messages_sender_neq_receiver'
  end
end
