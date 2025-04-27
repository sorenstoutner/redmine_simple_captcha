# SPDX-License-Identifier: MIT
# SPDX-FileCopyrightText: 2025 Soren Stoutner <soren@stoutner.com>
#
# This file is part of Redmine Simple Captcha.  <https://github.com/sorenstoutner/redmine_simple_captcha>
# See LICENSE for more information.

require_dependency 'project'
require_dependency 'principal'
require_dependency 'user'
module UserPatch
  def self.included(base)
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def simple_captcha_answer
      nil
    end
  end
end

User.send(:include, UserPatch)
