class Backtrace
  def initialize(pid)
    @pid = pid
    @resource_folder = File.join(File.dirname(File.expand_path(__FILE__)), '../../resources')
  end

  def take_traces
    prepare_commands
    traces = []
    # start gdb with our commands, attached to a given PID
    (1..5).each do |i|
      output = `gdb \`which ruby\` #{@pid} -x /tmp/gdb_commands | grep '^#'`
      traces << `cat /tmp/stdout`
      puts "--> took trace #{i}"

      sleep 1
    end
    return traces
  end

  def prepare_commands
    commands_file = File.join(@resource_folder, 'gdb_commands')
    commands = File.open(commands_file)
    command_string = commands.read.gsub("PID",@pid.to_s)
    File.open('/tmp/gdb_commands', 'w'){|f| f.write(command_string)}
  end
end
