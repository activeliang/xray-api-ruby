# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: app/stats/command/command.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file("app/stats/command/command.proto", :syntax => :proto3) do
    add_message "xray.app.stats.command.GetStatsRequest" do
      optional :name, :string, 1
      optional :reset, :bool, 2
    end
    add_message "xray.app.stats.command.Stat" do
      optional :name, :string, 1
      optional :value, :int64, 2
    end
    add_message "xray.app.stats.command.GetStatsResponse" do
      optional :stat, :message, 1, "xray.app.stats.command.Stat"
    end
    add_message "xray.app.stats.command.QueryStatsRequest" do
      optional :pattern, :string, 1
      optional :reset, :bool, 2
    end
    add_message "xray.app.stats.command.QueryStatsResponse" do
      repeated :stat, :message, 1, "xray.app.stats.command.Stat"
    end
    add_message "xray.app.stats.command.SysStatsRequest" do
    end
    add_message "xray.app.stats.command.SysStatsResponse" do
      optional :NumGoroutine, :uint32, 1
      optional :NumGC, :uint32, 2
      optional :Alloc, :uint64, 3
      optional :TotalAlloc, :uint64, 4
      optional :Sys, :uint64, 5
      optional :Mallocs, :uint64, 6
      optional :Frees, :uint64, 7
      optional :LiveObjects, :uint64, 8
      optional :PauseTotalNs, :uint64, 9
      optional :Uptime, :uint32, 10
    end
    add_message "xray.app.stats.command.Config" do
    end
  end
end

module Xray
  module App
    module Stats
      module Command
        GetStatsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.GetStatsRequest").msgclass
        Stat = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.Stat").msgclass
        GetStatsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.GetStatsResponse").msgclass
        QueryStatsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.QueryStatsRequest").msgclass
        QueryStatsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.QueryStatsResponse").msgclass
        SysStatsRequest = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.SysStatsRequest").msgclass
        SysStatsResponse = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.SysStatsResponse").msgclass
        Config = ::Google::Protobuf::DescriptorPool.generated_pool.lookup("xray.app.stats.command.Config").msgclass
      end
    end
  end
end