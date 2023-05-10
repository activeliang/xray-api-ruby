# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: proxy/vmess/inbound/config.proto

require 'google/protobuf'

require_relative Dir.pwd + '/' + 'common/protocol/user_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("proxy/vmess/inbound/config.proto", :syntax => :proto3) do
    add_message "xray.proxy.vmess.inbound.DetourConfig" do
      optional :to, :string, 1
    end
    add_message "xray.proxy.vmess.inbound.DefaultConfig" do
      optional :alter_id, :uint32, 1
      optional :level, :uint32, 2
    end
    add_message "xray.proxy.vmess.inbound.Config" do
      repeated :user, :message, 1, "xray.common.protocol.User"
      optional :default, :message, 2, "xray.proxy.vmess.inbound.DefaultConfig"
      optional :detour, :message, 3, "xray.proxy.vmess.inbound.DetourConfig"
      optional :secure_encryption_only, :bool, 4
    end
  end
end

module Xray
  module Proxy
    module Vmess
      module Inbound
        DetourConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.proxy.vmess.inbound.DetourConfig").msgclass
        DefaultConfig = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.proxy.vmess.inbound.DefaultConfig").msgclass
        Config = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.proxy.vmess.inbound.Config").msgclass
      end
    end
  end
end