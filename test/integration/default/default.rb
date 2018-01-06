describe os_env('LANG') do
  its('content') { should eq 'C' }
end

describe os_env('LC_ALL') do
  its('content') { should eq 'C' }
end
