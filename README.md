# guard-plopbox

Plopbox is a simple guard library that syncs local and remote directories via FTP as files are changed. 

# Usage

This is a sample guardfile

    opts = {
      :hostname    => "postercloud.com",    # remote host 
      :user        => "my_username",        # remote user
      :password    => "my_password",        # remote password
      :remote      => "test",               # remote directory
      :debug       => true                  # output debug information
    }

    group 'plopbox' do
      guard 'plopbox', opts do
        watch(/.*/)
      end
    end

# Dependencies

 - guard

# Author

Plopbox was written by Benoit Garret, based on [Flopbox](http://github.com/vincentchu/guard-flopbox) by Vincent Chu.
