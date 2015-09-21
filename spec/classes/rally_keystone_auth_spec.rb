#
# Unit tests for rally::keystone::auth
#

require 'spec_helper'

describe 'rally::keystone::auth' do

  let :facts do
    { :osfamily => 'Debian' }
  end

  describe 'with default class parameters' do
    let :params do
      { :password => 'rally_password',
        :tenant   => 'foobar' }
    end

    it { is_expected.to contain_keystone_user('rally').with(
      :ensure   => 'present',
      :password => 'rally_password',
      :tenant   => 'foobar'
    ) }

    it { is_expected.to contain_keystone_user_role('rally@foobar').with(
      :ensure  => 'present',
      :roles   => ['admin']
    )}

    it { is_expected.to contain_keystone_service('rally').with(
      :ensure      => 'present',
      :type        => 'FIXME',
      :description => 'rally FIXME Service'
    ) }

    it { is_expected.to contain_keystone_endpoint('RegionOne/rally').with(
      :ensure       => 'present',
      :public_url   => "http://127.0.0.1:FIXME/",
      :admin_url    => "http://127.0.0.1:FIXME/",
      :internal_url => "http://127.0.0.1:FIXME/"
    ) }
  end

  describe 'when overriding public_protocol, public_port and public address' do
    let :params do
      { :password         => 'rally_password',
        :public_protocol  => 'https',
        :public_port      => '80',
        :public_address   => '10.10.10.10',
        :port             => '81',
        :internal_address => '10.10.10.11',
        :admin_address    => '10.10.10.12' }
    end

    it { is_expected.to contain_keystone_endpoint('RegionOne/rally').with(
      :ensure       => 'present',
      :public_url   => "https://10.10.10.10:80/",
      :internal_url => "http://10.10.10.11:81/",
      :admin_url    => "http://10.10.10.12:81/"
    ) }
  end

  describe 'when overriding auth name' do
    let :params do
      { :password => 'foo',
        :auth_name => 'rallyy' }
    end

    it { is_expected.to contain_keystone_user('rallyy') }
    it { is_expected.to contain_keystone_user_role('rallyy@services') }
    it { is_expected.to contain_keystone_service('rallyy') }
    it { is_expected.to contain_keystone_endpoint('RegionOne/rallyy') }
  end

  describe 'when overriding service name' do
    let :params do
      { :service_name => 'rally_service',
        :auth_name    => 'rally',
        :password     => 'rally_password' }
    end

    it { is_expected.to contain_keystone_user('rally') }
    it { is_expected.to contain_keystone_user_role('rally@services') }
    it { is_expected.to contain_keystone_service('rally_service') }
    it { is_expected.to contain_keystone_endpoint('RegionOne/rally_service') }
  end

  describe 'when disabling user configuration' do

    let :params do
      {
        :password       => 'rally_password',
        :configure_user => false
      }
    end

    it { is_expected.not_to contain_keystone_user('rally') }
    it { is_expected.to contain_keystone_user_role('rally@services') }
    it { is_expected.to contain_keystone_service('rally').with(
      :ensure      => 'present',
      :type        => 'FIXME',
      :description => 'rally FIXME Service'
    ) }

  end

  describe 'when disabling user and user role configuration' do

    let :params do
      {
        :password            => 'rally_password',
        :configure_user      => false,
        :configure_user_role => false
      }
    end

    it { is_expected.not_to contain_keystone_user('rally') }
    it { is_expected.not_to contain_keystone_user_role('rally@services') }
    it { is_expected.to contain_keystone_service('rally').with(
      :ensure      => 'present',
      :type        => 'FIXME',
      :description => 'rally FIXME Service'
    ) }

  end

end
