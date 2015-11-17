require_dependency 'project'
require_dependency 'principal'
require_dependency 'user'
module UserStupidCaptchaPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
    base.class_eval do
      unloadable
    end
  end

  module InstanceMethods
    def stupid_captcha_answer
      nil
    end
  end
end

User.send(:include, UserStupidCaptchaPatch)
