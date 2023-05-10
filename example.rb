require './app/proxyman/command/command_pb'
require './app/proxyman/command/command_services_pb'
require './app/stats/command/command_pb'
require './app/stats/command/command_services_pb'
require './common/protocol/headers_pb'
require './common/protocol/server_spec_pb'
require './common/protocol/user_pb'
require './common/serial/typed_message_pb'
require './proxy/shadowsocks/config_pb'
require './proxy/vmess/account_pb'

class XrayApi

  attr_accessor :address

  def initialize host: '127.0.0.1', port: 10085
    @address = "#{host}:#{port}"
  end
  
  def state_stub
    Xray::App::Stats::Command::StatsService::Stub.new @address, :this_channel_is_insecure 
  end

  def handle_stub
    Xray::App::Proxyman::Command::HandlerService::Stub.new @address, :this_channel_is_insecure
  end

  def to_typed_message message
    Xray::Common::Serial::TypedMessage.new type: message.class.descriptor.name, value: message.class.encode(message)
  end

  # 查询流量
  def query_traffic
    req = Xray::App::Stats::Command::QueryStatsRequest.new pattern: '', reset: true
    res = state_stub.query_stats req
    h = Hash.new 0
    res.stat.each{|item| h[item.name.split('>>>')[1]] += item.value }
    h
  end

  # 添加ss用户 
  def add_ss_user tag="ss-inbound", password, email
    account = Xray::Proxy::Shadowsocks::Account.new password: password, cipher_type: Xray::Proxy::Shadowsocks::CipherType::AES_128_GCM, iv_check: false
    user = Xray::Common::Protocol::User.new level: 1, email: email, account: to_typed_message(account)
    add_message = Xray::App::Proxyman::Command::AddUserOperation.new(user: user)
    req = Xray::App::Proxyman::Command::AlterInboundRequest.new(tag: tag.to_s, operation: to_typed_message(add_message))
    begin
      res = handle_stub.alter_inbound(req)
    rescue => e
      puts "---> add_ss_user error: #{e.details}"
    end
  end

  # 添加vmess用户 
  def add_vmess_user tag="vmess-inbound", id, email 
    account = Xray::Proxy::Vmess::Account.new id: id, alter_id: 0, security_settings: Xray::Common::Protocol::SecurityConfig.new(type: Xray::Common::Protocol::SecurityType::NONE)
    user = Xray::Common::Protocol::User.new level: 1, email: email, account: Xray::Common::Serial::TypedMessage.new(type: account.class.descriptor.name, value: account.class.encode(account))
    add_message = Xray::App::Proxyman::Command::AddUserOperation.new user: user
    operation = Xray::Common::Serial::TypedMessage.new type: add_message.class.descriptor.name, value: add_message.class.encode(add_message)
    req = Xray::App::Proxyman::Command::AlterInboundRequest.new tag: tag.to_s, operation: operation
    begin 
      res = handle_stub.alter_inbound(req)
    rescue => e
      puts "---> add_vmess_user error: #{e.details}"
    end
  end

  # 移除用户
  def remove_user tag, email
    remove_message = Xray::App::Proxyman::Command::RemoveUserOperation.new(email: email)
    operation = Xray::Common::Serial::TypedMessage.new(type: remove_message.class.descriptor.name, value: remove_message.class.encode(remove_message))
    req = Xray::App::Proxyman::Command::AlterInboundRequest.new(tag: tag.to_s, operation: operation)
    begin 
      res = handle_stub.alter_inbound(req)
    rescue => e
      puts "---> remove_user error: #{e.details}"
    end
  end
end

# 调用示例：
client = XrayApi.new host: '127.0.0.1', port: 9001
puts client.query_traffic
puts client.add_ss_user 'ss-inbound', 'password1', 'myemail'
puts client.add_vmess_user 'vmess-inbound', '756c0b6f-a5c5-4d6b-bbb0-a2197dce9f1e', 'myemail'
puts client.remove_user 'ss-inbound', 'myemail'
puts client.remove_user 'vmess-inbound', 'myemail'