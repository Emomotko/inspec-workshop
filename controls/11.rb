control "C-1.5.3" do
  impact 1.0
  title "Set Boot Loader Password"
  desc "Setting the boot loader password will require that the person who is rebooting the must enter a password before being able to set command line boot parameters"
  describe command('grep "^password" /etc/grub.conf') do
    its('stdout') { should match 'password --md5' }
  end
end

control "C-1.5.4" do
  impact 1.0
  title "Require Authentication for Single-User Mode"
  desc "Since /etc/init determines what run state the system is in, setting the entry in /etc/sysconfig/init will force single user authentication"
  describe command('grep SINGLE /etc/sysconfig/init') do
    its('content') { should match 'SINGLE=/sbin/sulogin' }
  end
  describe command('grep "PROMPT" /etc/sysconfig/init') do
    its('content') { should match 'PROMPT=no' }
  end
end
