Simple CAPTCHA Redmine plugin
=============================

This Redmine plugin adds a very simple CAPTCHA to the account registration page.  It lets you set a CAPTCHA question and answer.  The question and answer are the same for all people attempting to register on your site, and only allows registration for someone who fills out the CAPTCHA answer field with the same value you set in the plugin settings.

For example, you can set the CAPTCHA question to be a mathamatical equation requesting the user types the answer.  Or, you can set it to be a logical puzzle.  You can even instruct the user to simply type a specific word in the answer.

Obviously, this will not prevent sophisticated registration attacks.  But it gets rid of the low-hanging fruit of automatic registrations, particularly those who just want to flood a target email address with spam.

- Installation: Install to your plugins directory and restart Redmine.
- Configuration: On the plugin setting page, create your CAPTCHA question and answer.
