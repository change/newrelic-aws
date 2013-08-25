# encoding: utf-8
require 'new_relic/agent/method_tracer'

DependencyDetection.defer do
  @name = :aws

  executes do
    ::NewRelic::Agent.logger.info 'Installing AWS SDK instrumentation'
  end

  depends_on do
    # Enough to differentiate it from the namespace-conflicting AWS::S3 commonly in use
    defined?(AWS::Core)
  end

  executes do
    AWS::S3::Bucket.class_eval do
      add_method_tracer :clear!
      add_method_tracer :delete
      add_method_tracer :delete!
      add_method_tracer :objects
      add_method_tracer :versions
    end

    AWS::S3::S3Object.class_eval do
      add_method_tracer :read
      add_method_tracer :write
      add_method_tracer :delete
      add_method_tracer :head
    end

    AWS::SimpleEmailService.class_eval do
      add_method_tracer :send_email
      add_method_tracer :send_raw_email
    end
  end
end
