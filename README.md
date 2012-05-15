# guard-ftpsync

Ftpsync is a simple guard library that syncs local and remote directories via FTP as files are changed, a bit like Dreamweaver does.

# Usage

This is a sample guardfile

    opts = {
      :hostname    => "postercloud.com",    # remote host 
      :user        => "my_username",        # remote user
      :password    => "my_password",        # remote password
      :remote      => "test",               # remote directory
      :debug       => true                  # output debug information
    }

    group 'ftp' do
      guard 'ftpsync', opts do
        watch(/.*/)
      end
    end

# Available options

`:hostname` **(required)** the ftp host

`:user` the ftp username, defaults to `anonymous`

`:password` the ftp password, defaults to `anonymous`

`:remote` the remote base directory, defaults to `nil`

`:debug` whether to log debug essages in the console, defaults to `false`

`:notify` whether to send a notification on a successful sync, defaults to `true`

# Dependencies

 - guard

# Author

Ftpsync was written by Benoit Garret, based on [Flopbox](http://github.com/vincentchu/guard-flopbox) by Vincent Chu.
