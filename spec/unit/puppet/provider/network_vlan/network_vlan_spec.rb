require 'spec_helper'

module Puppet::Provider::NetworkVlan; end
require 'puppet/provider/network_vlan/ios'

RSpec.describe Puppet::Provider::NetworkVlan::NetworkVlan do
  def self.load_test_data
    Puppet::Utility.load_yaml(File.expand_path(__dir__) + '/test_data.yaml', false)
  end

  let(:provider) { described_class.new }
  let(:context) { instance_double('Puppet::ResourceApi::BaseContext', 'context') }

  context 'Read tests:' do
    load_test_data['default']['read_tests'].each do |test_name, test|
      it test_name.to_s do
        expect(described_class.instances_from_cli(test['cli'])).to eq test['expectations']
      end
    end
  end

  context 'Create tests:' do
    load_test_data['default']['create_tests'].each do |test_name, test|
      it test_name.to_s do
        expect(described_class.commands_from_is_should(test['is'], test['should'])).to eq test['cli']
      end
    end
  end

  context 'Update tests:' do
    load_test_data['default']['update_tests'].each do |test_name, test|
      it test_name.to_s do
        expect(described_class.commands_from_is_should(test['is'], test['should'])).to eq test['cli']
      end
    end
  end

  context 'Delete tests:' do
    load_test_data['default']['delete_tests'].each do |test_name, test|
      it test_name.to_s do
        expect(described_class.commands_from_is_should(test['is'], test['should'])).to eq test['cli']
      end
    end
  end
end