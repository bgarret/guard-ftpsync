require 'net/ftp'
require 'guard'
require 'guard/guard'

module Guard
  class Plopbox < Guard

    attr_reader :ftp_session, :remote, :pwd

    def initialize(watchers = [], options = {})
      @ftp_session = Net::FTP.new(options[:hostname], options[:user], options[:password])
      @remote       = options[:remote]
      @debug        = options[:debug]
      @pwd          = Dir.pwd
      
      log "Initialized with watchers = #{watchers.inspect}"
      log "Initialized with options  = #{options.inspect}"
      
      super
    end

    def run_on_change(paths)
      paths.each do |path|
        local_file  = File.join(pwd, path)
        remote_file = File.join(remote, path)
        
        attempts = 0
        begin
          log "Upload #{local_file} => #{remote_file}"
          ftp_session.puttextfile(local_file, remote_file)

        rescue Net::FTPPermError => ex
          log "Exception on upload #{path} - directory likely doesn't exist"

          attempts += 1
          remote_dir = File.dirname(remote_file)
          recursively_create_dirs(remote_dir)

          retry if (attempts < 3)
          log "Exceeded 3 attempts to upload #{path}"
        end
      end
    end

    private

    def debug?
      @debug || false
    end

    def log(mesg)
      return unless debug?

      puts "[#{Time.now}] #{mesg}"
    end

    def recursively_create_dirs(remote_dir)
      new_dir = remote
      remote_dir.gsub(remote, "").split("/").each do |dir|
        
        new_dir = File.join(new_dir, dir)
        
        begin
          log "Creating #{new_dir}"
          ftp_session.mkdir(new_dir)
        rescue Net::FTPPermError => ex
        end
      end
    end
  end
end
