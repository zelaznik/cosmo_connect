class SetCloudinaryUrlsToHttps < ActiveRecord::Migration
  def up
    execute """
    UPDATE photos
    SET url = replace(url, 'http://', 'https://'),
    thumb_url = replace(thumb_url, 'http://', 'https://');
    """
  end

  def down
  end
end
