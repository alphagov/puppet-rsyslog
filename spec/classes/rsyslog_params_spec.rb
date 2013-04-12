require 'spec_helper'

describe 'rsyslog::params', :type => :class do
  context "when OS is unsupported" do

    context "osfamily = RedHat, lsbmajdistrelease = 4" do
      let :facts do
        {
          :osfamily          => 'RedHat',
          :operatingsystem   => 'CentOS',
          :lsbmajdistrelease => 4,
        }
      end

      it do
        expect {
          should be_true
        }.to raise_error(Puppet::Error, /^Unsupported platform: CentOS/)
      end
    end

    context "osfamily = Solaris" do
      let :facts do
        {
          :osfamily        => 'Solaris',
          :operatingsystem => 'Nexenta',
        }
      end

      it do
        expect {
          should be_true
        }.to raise_error(Puppet::Error, /^Unsupported platform: Nexenta/)
      end
    end

    context "osfamily = nil, operatingsystem = HP-UX" do
      let :facts do
        {
          :operatingsystem => 'HP-UX',
        }
      end

      it do
        expect {
          should be_true
        }.to raise_error(Puppet::Error, /^Unsupported platform: HP-UX/)
      end
    end
  end
end
