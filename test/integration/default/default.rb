describe os_env('LANG') do
  its('content') { should eq 'C' }
end

if (os[:name] == 'debian' && os.release.to_i == 7) ||
   (os[:name] == 'ubuntu' && os.release.to_f == 14.04) ||
   (os[:name] == 'centos' && os.release.to_i == 6)
  describe os_env('LC_ALL') do
    its('content') { should eq 'C' }
  end
end
